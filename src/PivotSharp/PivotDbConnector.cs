﻿using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using PivotSharp.Aggregators;

namespace PivotSharp
{
	public class PivotDbConnector
	{
		public string ConnectionString { get; set; }

		public PivotDbConnector(string connectionString) {
			ConnectionString = connectionString;
		}

		public IEnumerable<Column> GetTableStructure(string tableName) {

			// See question at http://stackoverflow.com/questions/1054984/how-can-i-get-column-names-from-a-table-in-sql-server 
			// for other dbs

			var columns = new List<Column>();

			using (var connection = new SqlConnection(ConnectionString)) {

				var query = "select Ordinal_Position, Name, Data_Type from INFORMATION_SCHEMA.Columns where Table_Name = @TableName";

				var command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@TableName", tableName);
				
				connection.Open();
				var reader = command.ExecuteReader();
				if (reader.HasRows) {
					while (reader.Read()) {
						columns.Add(new Column() {
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

		public string GetPivotSql(PivotConfig config, string tableName) {

			var sqlString = new PivotSqlString(config, tableName);

			return sqlString.ToString();
		}

		public IDataReader GetPivotData(PivotConfig config, string tableName) {


			var connection = new SqlConnection(ConnectionString);

			var query = GetPivotSql(config, tableName);

			// HACK: If we're using sql generation, we basically need Sum rather than Count.
			// Trouble with doing it this way is the config no longer represents the user's selection.
			// This won't work in general: SumInt => int, SumDecimal => decimal are incompatible.
			if (config.Aggregator().SqlFunctionName == "Count") {
				config.Aggregator = () => new SumInt("Count");			
			}

			// When using CommandBehavior.CloseConnection, the connection will be closed when the 
			// IDataReader is closed.
			// https://msdn.microsoft.com/en-us/library/system.data.sqlclient.sqlcommand(v=vs.110).aspx
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

	public class Column
	{
		public int Position { get; set; }
		public string Name { get; set; }

		public string DataType { get; set; }

		
	}
}