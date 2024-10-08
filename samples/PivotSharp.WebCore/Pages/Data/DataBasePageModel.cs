﻿using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using System.Data;

namespace PivotSharp.WebCore.Pages.Data;

public class DataBasePageModel : PageModel
{
    protected readonly string connectionString;

    public DataBasePageModel(IConfiguration configuration) {
        connectionString = configuration.GetConnectionString("DefaultConnection")!;
    }

    protected SqlDataReader GetReader() {
        var conn = new SqlConnection(connectionString);
        var cmd = new SqlCommand("select * from World_Data", conn);
        conn.Open();
        return cmd.ExecuteReader(CommandBehavior.CloseConnection);
    }

    public readonly IDictionary<int, PivotConfig> Configs = new Dictionary<int, PivotConfig> {
        {
            1 , new PivotConfig() {
                    TableName = "World_Data",
                    Rows = ["Country_Name"],
                    Cols = ["Year"],
                    Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum"}]
                }
        },{
            2, new PivotConfig() {
                    TableName = "World_Data",
                    Rows = ["Region", "Country_Name"],
                    Cols = ["Year"],
                    Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum" }]
                }
        },{
            3, new PivotConfig() {
                    TableName = "World_Data",
                    Rows = ["Region", "Country_Name"],
                    Cols = ["Income_Group"],
                    Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum" }],
                    Filters = [new Filter("Region", "=", "Europe")],
					// Filters will break validation because they don't come through in the resultset.
					ErrorMode = ConfigurationErrorHandlingMode.Ignore
                }
        }
    };
}
