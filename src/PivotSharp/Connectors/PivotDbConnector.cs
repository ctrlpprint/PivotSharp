using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;

namespace PivotSharp.Connectors;

public class PivotDbConnector : IPivotDataSourceConnector
{
	private readonly string connectionString;

	public IList<string> InvalidColumns { get; private set; } = [];

	public PivotConfig Config { get; private set; }

	public PivotDbConnector(PivotConfig config, string connectionString) {
		this.Config = config;
		this.connectionString = connectionString;
	}

	/// <summary>
	/// Returns the structure of the table or view
	/// </summary>
	public IEnumerable<Field> GetTableStructure() {

		// See question at http://stackoverflow.com/questions/1054984/how-can-i-get-column-names-from-a-table-in-sql-server 
		// Postgres should be similar: https://dba.stackexchange.com/questions/22362/list-all-columns-for-a-specified-table
		// MySQL also: https://stackoverflow.com/questions/193780/how-can-i-find-all-the-tables-in-mysql-with-specific-column-names-in-them
		// Oracle: uses a 'USER_TAB_COLUMNS' table, but column names are the same: https://stackoverflow.com/questions/452464/how-can-i-get-column-names-from-a-table-in-oracle

		var columns = new List<Field>();

		using var connection = new SqlConnection(connectionString);
		var query = "select Ordinal_Position, Column_Name, Data_Type from INFORMATION_SCHEMA.Columns where Table_Name = @TableName";
		var command = new SqlCommand(query, connection);
		command.Parameters.AddWithValue("@TableName", Config.TableName);

		connection.Open();
		using var reader = command.ExecuteReader();
		if (reader.HasRows) {
			while (reader.Read()) {
				columns.Add(new Field()
				{
					// Position = reader.GetInt32(0),
					Name = reader.GetString(1),
					DataType = reader.GetString(2)
				});
			}
		}
		return columns;
	}



	public IDictionary<string, int> GetColumnValues(string columnName, int maxListSize) {

		var returnValues = new Dictionary<string, int>();

		var query = $"select top {maxListSize} {columnName}, count(*) Occurences " +
			$"from {Config.TableName} where {columnName} is not null and len({columnName})>0 " +
			$"group by {columnName} order by Occurences desc";

		using var connection = new SqlConnection(connectionString);
		var command = new SqlCommand(query, connection);
		connection.Open();
		var reader = command.ExecuteReader();
		if (reader.HasRows) {
			while (reader.Read()) {
				returnValues.Add(reader.GetValue(0).ToString()!, reader.GetInt32(1));
			}
		}
		// reader.Close();

		return returnValues;
	}

	public string GetPivotSql() {

		var sqlString = new PivotSqlString(Config);
		return sqlString.ToString();
	}

	public IDataReader GetPivotData() {
		var connection = new SqlConnection(connectionString);
		var query = GetPivotSql();

		// HACK: If we're using sql generation, we basically need Sum rather than Count.
		// Trouble with doing it this way is the config no longer represents the user's selection.
		// This won't work in general: SumInt => int, SumDecimal => decimal are incompatible.
		foreach (var aggregatorDef in Config.Aggregators.Where(a => a.FunctionName == "Count")) {
			aggregatorDef.ColumnName = "Count";
			aggregatorDef.FunctionName = "SumInt";
		}

		// When using CommandBehavior.CloseConnection, the connection will be closed when the 
		// IDataReader is closed.
		// https://msdn.microsoft.com/en-us/library/Microsoft.Data.SqlClient.sqlcommand(v=vs.110).aspx
		using var command = new SqlCommand(query, connection);
		foreach (var filter in Config.Filters) {
			command.Parameters.AddWithValue("param" + Config.Filters.IndexOf(filter), filter.ParameterValue);
		}

		connection.Open();
		return command.ExecuteReader(CommandBehavior.CloseConnection);
	}

	public DataTable GetDrillDownData(string flattendedRowKeys, string flattenedColKeys) {

		// TODO: Drill Down should also apply filters
		var filters = Config.Rows.Select(r => new { Key = r, Value = flattendedRowKeys.Split(',')[Config.Rows.IndexOf(r)] })
			.Union(Config.Cols.Select(c => new { Key = c, Value = flattenedColKeys.Split(',')[Config.Cols.IndexOf(c)] }));

		var dataTable = new DataTable(Config.TableName);

		using var connection = new SqlConnection(connectionString);

		var sql = $"select * from {Config.TableName} where " +
			$"{string.Join(" and ", filters.Select(f => string.Format("{0} = @{0}", f.Key)))}";

		var command = new SqlCommand(sql, connection);
		foreach (var filter in filters) {
			command.Parameters.AddWithValue("@" + filter.Key, filter.Value);
		}

		using var da = new SqlDataAdapter(command);
		da.Fill(dataTable);
		return dataTable;
	}

	public void UpdateConfig(PivotConfig config) {
		this.Config = config;
	}
}