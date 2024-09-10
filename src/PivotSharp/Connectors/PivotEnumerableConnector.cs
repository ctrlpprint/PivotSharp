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
	private readonly IDataReader reader;

	public PivotEnumerableConnector(PivotConfig config, IEnumerable<T> source) {
		this.config = config;
		this.source = source;
		this.reader = new EnumerableDataReader(source);
	}

	public DataTable GetDrillDownData(string flattendedRowKeys, string flattenedColKeys) {

		var schemaTable = reader.GetSchemaTable()!;
		var data = new DataTable();

		// Useful here to have Type rather than Typename.
		foreach (DataRow row in schemaTable.Rows) {
			var colName = row.Field<string>("ColumnName");
			var t = row.Field<Type>("DataType");
			data.Columns.Add(colName, t!);
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



	public IDataReader GetPivotData() => new EnumerableDataReader(source);

	public IEnumerable<Field> GetTableStructure() {
		IDataReader reader = new EnumerableDataReader(source);

		var schemaTable = reader.GetSchemaTable()!;
		var fields = new List<Field>();

		foreach (DataRow row in schemaTable.Rows) {
			fields.Add(new Field {
				Name = row.Field<string>("ColumnName")!,
				DataType = row.Field<Type>("DataType")!.Name,
			}); 
		}
		return fields;
	}

	//public IEnumerable<Field> GetTableStructure() => typeof(T).GetProperties()
	//	.Select(p => new Field
	//	{
	//		Name = p.Name,
	//		DataType = p.PropertyType.Name
	//	});

	public void UpdateConfig(PivotConfig config) {
		this.config = config;
	}

}
