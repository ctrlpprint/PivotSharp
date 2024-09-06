using System;
using System.Collections.Generic;
using System.Data;
using Microsoft.Data.SqlClient;
using System.Linq;

namespace PivotSharp
{
	public class PivotDbConnector
	{
		public string ConnectionString { get; set; }

		public PivotDbConnector(string connectionString) {
			ConnectionString = connectionString;
		}

		/// <summary>
		/// Returns the structure of the table or view
		/// </summary>
		/// <param name="tableName"></param>
		/// <returns></returns>
		public IEnumerable<Field> GetTableStructure(string tableName) {

			// See question at http://stackoverflow.com/questions/1054984/how-can-i-get-column-names-from-a-table-in-sql-server 
			// for other dbs

			var columns = new List<Field>();

			using (var connection = new SqlConnection(ConnectionString)) {

				var query = "select Ordinal_Position, Column_Name, Data_Type from INFORMATION_SCHEMA.Columns where Table_Name = @TableName";

				var command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@TableName", tableName);
				
				connection.Open();
				var reader = command.ExecuteReader();
				if (reader.HasRows) {
					while (reader.Read()) {
						columns.Add(new Field() {
							Position = reader.GetInt32(0),
							Name = reader.GetString(1),
							DataType = reader.GetString(2)
						});
					}
				}
				reader.Close();
			}

			return columns;
		}

		private void FixConfig(PivotConfig config, string tableName) {

			// If the config has been generated from strings, we may not have the correct db type on the filters.
			// Mvc Model Binding in particular will bind a property of type object as a string[].

			foreach (var filter in config.Filters.Where(f => f.DbType == DbType.Object)) {

				var column = GetTableStructure(tableName).Single(c => c.Name == filter.ColumnName);


				var parameterValue = filter.ParameterValue.GetType() == typeof(string[]) // Model Binding
					? ((string[])filter.ParameterValue)[0]
					: filter.ParameterValue;

				var dbType = DbTypeMap.DbTypeFor(column.DataType);

				filter.ParameterValue = Convert.ChangeType(
					value: parameterValue,
					conversionType: DbTypeMap.TypeFor(dbType));

			}

		}

		public IDictionary<string, int> GetColumnValues(string tableName, string columnName, int maxListSize) {

			var returnValues = new Dictionary<string, int>();

			var query = string.Format(@"select top {0} {1}, count(*) Occurences from {2} where {1} is not null and len({1})>0 group by {1} order by Occurences desc", 
				maxListSize, 
				columnName, 
				tableName);

			using (var connection = new SqlConnection(ConnectionString)) {

				var command = new SqlCommand(query, connection);

				connection.Open();
				var reader = command.ExecuteReader();
				if (reader.HasRows) {
					while (reader.Read()) {
						returnValues.Add(reader.GetValue(0).ToString(), reader.GetInt32(1));
					}
				}
				reader.Close();
			}

			return returnValues;
		}

		public string GetPivotSql(PivotConfig config, string tableName) {

			FixConfig(config, tableName);

			var sqlString = new PivotSqlString(config, tableName);

			return sqlString.ToString();
		}

		public IDataReader GetPivotData(PivotConfig config, string tableName) {

			FixConfig(config, tableName);

			var connection = new SqlConnection(ConnectionString);

			var query = GetPivotSql(config, tableName);

			// HACK: If we're using sql generation, we basically need Sum rather than Count.
			// Trouble with doing it this way is the config no longer represents the user's selection.
			// This won't work in general: SumInt => int, SumDecimal => decimal are incompatible.
			foreach (var aggregatorDef in config.Aggregators.Where(a => a.FunctionName == "Count")) {
				aggregatorDef.ColumnName = "Count";
				aggregatorDef.FunctionName = "SumInt";
			}

			// When using CommandBehavior.CloseConnection, the connection will be closed when the 
			// IDataReader is closed.
			// https://msdn.microsoft.com/en-us/library/Microsoft.Data.SqlClient.sqlcommand(v=vs.110).aspx
			using (var command = new SqlCommand(query, connection)) {
				foreach (var filter in config.Filters) {
					command.Parameters.AddWithValue("param" + config.Filters.IndexOf(filter), filter.ParameterValue);
				}

				connection.Open();
				return command.ExecuteReader(CommandBehavior.CloseConnection);				
			}


		}

		public DataTable GetDrillDownData(PivotConfig config, string tableName, string flattendedRowKeys, string flattenedColKeys) {

			//var filters = config.Rows.Union(config.Cols);

			var filters = config.Rows.Select(r => new { Key = r, Value = flattendedRowKeys.Split(',')[config.Rows.IndexOf(r)] })
				.Union(config.Cols.Select(c => new { Key = c, Value = flattenedColKeys.Split(',')[config.Cols.IndexOf(c)] }));

			var dataTable = new DataTable(tableName);

			using (var connection = new SqlConnection(ConnectionString)) {

				var sql = string.Format("select * from {0} where {1}", 
					tableName,
					string.Join(" and ", filters.Select(f => string.Format("{0} = @{0}", f.Key)))
					);

				var query = sql;

				var command = new SqlCommand(query, connection);
				foreach (var filter in filters) {
					command.Parameters.AddWithValue("@" + filter.Key, filter.Value);
				}

				connection.Open();

				using (var da = new SqlDataAdapter(command)) {
					da.Fill(dataTable);					
				}

				connection.Close();
			}

			return dataTable;


		}

	}

}