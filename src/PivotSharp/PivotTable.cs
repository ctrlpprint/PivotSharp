using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Runtime.Remoting.Messaging;
using System.Web.UI.WebControls.WebParts;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp
{
	// Some classes to try make it easier to build up the headings.

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
	/// ------------------------------------------------------------------
	/// | shape \ color   |    blue      |     red     |    Totals       |
	/// ------------------------------------------------------------------
	/// | circle          |           2  |             |              2  |
	/// | triangle        |           1  |           3 |              4  | 
	/// ------------------------------------------------------------------
	/// | Totals          |           3  |           3 |              6  | 
	/// ------------------------------------------------------------------
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
		// Need to be able to group these.
		// sort by field1 then field2, etc.
		// 
		public RowOrColumns Rows { get; set; }
		public RowOrColumns Cols { get; set; }

		public IAggregator GrandTotal { get; set; }
		public Func<IAggregator> Aggregator { get; set; }

		public PivotValues Values { get; private set; }

		public PivotConfig Config { get; private set; }

		protected PivotTable(PivotConfig config) {
			Config = config;
		}

		private void Init() {
			Aggregator = Config.Aggregator;
			GrandTotal = Aggregator();

			Rows = new RowOrColumns(fields: Config.Rows, aggregator: Aggregator);
			Cols = new RowOrColumns(fields: Config.Cols, aggregator: Aggregator);
			Values = new PivotValues();
			
		}


		public IAggregator GetValue(string rowHeader, string colHeader) {

			return Values[rowHeader, colHeader];
		}


		private void ValidateConfigAgainst(IDataReader source) {

			var columnList = source.GetSchemaTable()
				.Rows.Cast<DataRow>()
				.Select(row => row.Field<string>("ColumnName")).ToList();

			InvalidColumns = Config.Filters.Select(c => c.FieldName)
				.Union(Config.Rows)
				.Union(Config.Cols)
				.Union(new List<string> {Config.Aggregator().ColumnName})
				.Except(new List<string> { null, ""})
				.Except(columnList)
				.ToList();


			if (InvalidColumns.Any()) {
				if (Config.ErrorMode == ConfigurationErrorHandlingMode.Throw) {
					throw new PivotConfigurationException(message: "Referenced ", invalidColumns: InvalidColumns);
				}
				Config = new PivotConfig {
					Aggregator = columnList.Contains(Config.Aggregator().ColumnName) ? Config.Aggregator : () => new Count(),
					Cols = Config.Cols.Intersect(columnList).ToList(),
					Rows = Config.Rows.Intersect(columnList).ToList(),
					FillTable = Config.FillTable,
					Filters = Config.Filters.Where(f => columnList.Contains(f.FieldName)).ToList()
				};

			}
		}

		public IList<string> InvalidColumns { get; set; }

		public void Pivot(IDataReader source) {
			ValidateConfigAgainst(source);
			Init();

			while(source.Read()){

				if(Config.Filters.Any(f => !f.Apply(source)))
					continue;
				
				GrandTotal.Push(source); // Update the Grand Total

				var row = Rows.AddRow(source);
				var col = Cols.AddRow(source);

				// Update the Cell Entry
				if (row != null && col != null) {
					var flatRowKey = row.FlattenedKey;
					var flatColKey = col.FlattenedKey;

					var aggregator = Values.FindOrAdd(flatRowKey, flatColKey, Aggregator());
					aggregator.Push(source);
				}

			}
			Rows.AssignGroups();
			Cols.AssignGroups();

			if (Config.FillTable) {
				foreach (var row in Rows) {
					foreach (var col in Cols) {
						Values.FindOrAdd(row.FlattenedKey, col.FlattenedKey, Aggregator());
					}
				}
			}
		}


		public static PivotTable Create(PivotConfig config) {
			return new PivotTable(config);
		}


		public DataTable DrillDown(IDataReader source, string flattendedRowKeys, string flattenedColKeys) {

			ValidateConfigAgainst(source);
	
			// Ideally we could simply extract an object from the IDataReader, but it doesn't support that.
			// Best bet is to use the GetSchemaTable to build up a DataTable.
			var schemaTable = source.GetSchemaTable();
			var data = new DataTable();

			foreach (DataRow row in schemaTable.Rows) {
				var colName = row.Field<string>("ColumnName");
				var t = row.Field<Type>("DataType");
				data.Columns.Add(colName, t);
			}

			while(source.Read()) {

				if (Config.Filters.Any(f => !f.Apply(source)))
					continue;

				// use the config to get the field names
				// use && clauses to combine with values.

				// This bit we need to extract from the pivot table building so we know how the table was built.
				var rowHeader = Config.Rows.Select(rowAttr => source[rowAttr] ?? "null").Select(x => x.ToString()).ToList();
				var flatRowKey = string.Join(",", rowHeader);

				var colHeader = Config.Cols.Select(colAttr => source[colAttr] ?? "null").Select(x => x.ToString()).ToList();
				var flatColKey = string.Join(",", colHeader);

				// Then we can match.
				if (flatRowKey == flattendedRowKeys && flatColKey == flattenedColKeys) {
					var newRow = data.Rows.Add();
					foreach (DataColumn col in data.Columns) {
						newRow[col.ColumnName] = source[col.ColumnName];
					}
				}
			}
			return data;
		}

	}
}