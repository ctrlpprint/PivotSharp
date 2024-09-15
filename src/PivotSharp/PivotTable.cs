using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using PivotSharp.Aggregators;
using PivotSharp.Connectors;
using PivotSharp.Writers;

namespace PivotSharp;

/// <summary>
/// Generates a representation of a Pivot Table 
/// </summary>
/// <remarks>
/// ---------------------------------------------------------------------
/// |{RowField}\{ColField}|  {ColHeader} | {ColHeader} |        Totals   |
/// ----------------------------------------------------------------------
/// | {RowHeader}         |      {Value} |     {Value} |     {RowTotal}  |
/// | {RowHeader}         |      {Value} |     {Value} |     {RowTotal}  | 
/// ----------------------------------------------------------------------
/// | Totals              |   {ColTotal} |  {ColTotal} |   {GrandTotal}  | 
/// ----------------------------------------------------------------------
///
/// 
/// More complex version:
/// ----------------------------------------------------------------------
/// |         \{ColField1} |  {ColHeader} | {ColHeader} |                 |
/// |{RowField}\{ColField2}|  {ColHeader} | {ColHeader} |        Totals   |
/// ----------------------------------------------------------------------
/// | {RowHeader}          |      {Value} |     {Value} |     {RowTotal}  |
/// | {RowHeader}          |      {Value} |     {Value} |     {RowTotal}  | 
/// -----------------------------------------------------------------------
/// | Totals               |   {ColTotal} |  {ColTotal} |   {GrandTotal}  | 
/// -----------------------------------------------------------------------
/// 
/// No specific limit is set on the number of ColFields or RowFields supported.
/// 
/// The standard Pivot Table implementation displays row and column headers as trees:
/// ---------------------------------------------------------------------------------
/// | \{ColField1}  |                {ColHeader}                | {ColHeader} | ... |
/// |               |-------------------------------------------| ------------|     |
/// |  \{ColField2} |  {ColHeader} |        {ColHeader}         | {ColHeader} | ... |
/// |               |-------------------------------------------| ------------|     |
/// |   \{ColField3}|  {ColHeader} | {ColHeader} |  {ColHeader} | {ColHeader} | ... |
/// ---------------------------------------------------------------------------------
/// 
/// To enable this, we need a way of iterating as:
/// <code>
/// foreach (var colField in ColFields) {
///		// New Row
///		foreach (var colGroup in colField.HeaderGroups) {
///			// For a merged cell: th colspan=@colGroup.Columns.Count() text=@colGroup.Name
///			// For a cell per column:
///			foreach (var column in colGroup.Columns) {
///				// Write Header
///			}
///		}
/// }
/// </code>
/// 
/// For rows, the requirements are different. We need to be able to create an outer loop through each row.
///       ------------------------------------------------------------------------------
///       | {RowField1}//{RowField2}//{RowField3}}  | ... Col Headers ... | Totals     |
///       |-----------------------------------------------------------------------------
/// tr:   | {RowHeader} | {RowHeader} | {RowHeader} | ... values ....     | {RowTotal} | 
///       |             |             --------------------------------------------------
/// tr:   |             |             | {RowHeader} | ... values ....     | {RowTotal} | 
///       |             |---------------------------------------------------------------
/// tr:   |             | {RowHeader} | {RowHeader} | ... values ....     | {RowTotal} | 
///       ------------------------------------------------------------------------------
/// So we need to emit a tr for each row, and then deal with the groups. Either we defer writing until we get to the 
/// deepest field, or we need to match the grouping to the current row.
/// </remarks>
public class PivotTable
{
	private readonly IPivotDataSourceConnector connector;

	// Need to be able to group these.
	// sort by field1 then field2, etc.

	// PivotFieldList : List<PivotField>
	public RowOrColumns Rows { get; private set; }
    public RowOrColumns Cols { get; private set; }

    // PivotCell
    public PivotCell GrandTotal { get; private set; }

	// AggregatorDef -> Aggregator?
	// Cells
	public PivotBody Cells { get; private set; }

	public PivotConfig Config => connector.Config;
	public IList<string> InvalidColumns { get; set; } = [];


	public static PivotTable Create(PivotConfig config, string connectionString) =>
		new PivotTable(new PivotDbConnector(config, connectionString));

	public static PivotTable Create<T>(PivotConfig config, IEnumerable<T> source) => 
		new PivotTable(new PivotEnumerableConnector<T>(config, source));

	public PivotCell Cell (string rowHeader, string colHeader) => Cells[rowHeader, colHeader]!;

	protected PivotTable(IPivotDataSourceConnector connector) {
		this.connector = connector;
		ValidateConfig();
		GrandTotal = new PivotCell(Config.Aggregators.Select(a => a.Create()));
		Rows = new RowOrColumns(fields: Config.Rows, aggregators: Config.Aggregators);
		Cols = new RowOrColumns(fields: Config.Cols, aggregators: Config.Aggregators);
		Cells = [];
		Pivot();
	}

	private void Pivot() {
		var source = connector.GetPivotData();

		var aggregators = Config.Aggregators.Select(a => a.Create());

		while (source.Read()) {
			if (Config.Filters.Any(f => !f.Apply(source))) continue;
			GrandTotal.UpdateFrom(source);

			var row = Rows.AddRow(source);
			var col = Cols.AddRow(source);

			if (row == null || col == null) continue;

			Cells.FindOrAdd(
				flattenedRowKey: row.FlattenedKey,
				flattenedColKey: col.FlattenedKey,
				aggregators: aggregators).UpdateFrom(source);

		}
		Rows.AssignGroups();
        Cols.AssignGroups();
    }

    public DataTable DrillDown(string flattendedRowKeys, string flattenedColKeys) {
        return connector.GetDrillDownData(flattendedRowKeys, flattenedColKeys);
    }

	private void ValidateConfig() {
		var columnList = connector.GetTableStructure().Select(r => r.Name);

		InvalidColumns = Config.Filters.Select(c => c.ColumnName)
			.Union(Config.Rows)
			.Union(Config.Cols)
			.Union(Config.Aggregators.Select(a => a.ColumnName))
			.Except([null, ""])
			.Except(columnList)
			.ToList()!;

		if (InvalidColumns.Any()) {
			if (Config.ErrorMode == ConfigurationErrorHandlingMode.Throw) {
				throw new PivotConfigurationException(message: "Referenced ", invalidColumns: InvalidColumns);
			}
			var config = new PivotConfig
			{
				TableName = Config.TableName,
				Aggregators = Config.Aggregators.Where(a => columnList.Contains(a.ColumnName))
					.Union(Config.Aggregators.Where(a => columnList.Contains(a.Create().Alias)))
					.Distinct()
					.ToList(),
				Cols = Config.Cols.Intersect(columnList).ToList()!,
				Rows = Config.Rows.Intersect(columnList).ToList()!,
				Filters = Config.Filters.Where(f => columnList.Contains(f.ColumnName)).ToList()
			};

			if (!config.Aggregators.Any())
				config.Aggregators.Add(new AggregatorDef { FunctionName = "Count" });

			this.connector.UpdateConfig(config);
		}
	}

	// Tag Helper

	public string BuildHtmlTable(IHtmlTableMap? map = null) {
		var table = PivotTableGridBuilder.BuildTable(this);
		return (map ?? new BootstrapTableMap()).Map(table);
	}
}

