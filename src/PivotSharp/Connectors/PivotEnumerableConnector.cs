using PivotSharp.Aggregators;
using PivotSharp.DataReader;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace PivotSharp.Connectors;
public class PivotEnumerableConnector<T> : IPivotDataSourceConnector
{
	private PivotConfig config;
	private readonly IEnumerable<T> source;

	public PivotEnumerableConnector(PivotConfig config, IEnumerable<T> source) {
		this.config = config;
		this.source = source;
	}

	public DataTable GetDrillDownData(string flattendedRowKeys, string flattenedColKeys) {
		IDataReader reader = new EnumerableDataReader(source);
		ValidateConfigAgainst(reader);

		var schemaTable = reader.GetSchemaTable()!;
		var data = new DataTable();

		foreach (DataRow row in schemaTable.Rows) {
			var colName = row.Field<string>("ColumnName");
			var t = row.Field<Type>("DataType");
			data.Columns.Add(colName, t);
		}

		while (reader.Read()) {

			if (config.Filters.Any(f => !f.Apply(reader)))
				continue;

			var rowHeader = config.Rows.Select(rowAttr => reader[rowAttr] ?? "null").Select(x => x.ToString()).ToList();
			var flatRowKey = string.Join(",", rowHeader);

			var colHeader = config.Cols.Select(colAttr => reader[colAttr] ?? "null").Select(x => x.ToString()).ToList();
			var flatColKey = string.Join(",", colHeader);

			if (flatRowKey == flattendedRowKeys && flatColKey == flattenedColKeys) {
				var newRow = data.Rows.Add();
				foreach (DataColumn col in data.Columns) {
					newRow[col.ColumnName] = reader[col.ColumnName];
				}
			}
		}
		return data;
	}

	public IList<string> InvalidColumns { get; set; } = [];


	private void ValidateConfigAgainst(IDataReader source) {
		var schema = source.GetSchemaTable()!
			.Rows.Cast<DataRow>();

		var columnList = schema
			.Select(row => row.Field<string>("ColumnName")).ToList();

		InvalidColumns = config.Filters.Select(c => c.ColumnName)
			.Union(config.Rows)
			.Union(config.Cols)
			.Union(config.Aggregators.Select(a => a.ColumnName))
			.Except([null, ""])
			.Except(columnList)
			.ToList()!;


		if (InvalidColumns.Any()) {
			if (config.ErrorMode == ConfigurationErrorHandlingMode.Throw) {
				throw new PivotConfigurationException(message: "Referenced ", invalidColumns: InvalidColumns);
			}
			var config2 = new PivotConfig
			{
				TableName = config.TableName,
				Aggregators = config.Aggregators.Where(a => columnList.Contains(a.ColumnName))
					.Union(config.Aggregators.Where(a => columnList.Contains(a.Create().Alias)))
					.Distinct()
					.ToList(),
				Cols = config.Cols.Intersect(columnList).ToList()!,
				Rows = config.Rows.Intersect(columnList).ToList()!,
				Filters = config.Filters.Where(f => columnList.Contains(f.ColumnName)).ToList()
			};

			if (!config2.Aggregators.Any())
				config2.Aggregators.Add(new AggregatorDef { FunctionName = "Count" });

			this.config = config2;
		}
	}

	public IDataReader GetPivotData() {
		return new EnumerableDataReader(source);
	}

	public IEnumerable<Field> GetTableStructure() {
		throw new NotImplementedException();
	}
}
