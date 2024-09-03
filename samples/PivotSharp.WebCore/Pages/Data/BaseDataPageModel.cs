using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using System.Data;

namespace PivotSharp.WebCore.Pages.Data;

public class BaseDataPageModel : PageModel
{
	protected readonly IDictionary<int, PivotConfig> configs = new Dictionary<int, PivotConfig> {
			{
				1 , new PivotConfig() {
					Rows = new[] { "Region" },
					Cols = new[] { "CustomerClubType" },
					Aggregators = new []{ new AggregatorDef { FunctionName = "Count"}}
				}},
			{
				2, new PivotConfig() {
					Rows = new[] { "Region", "Country" },
					Cols = new[] { "Year", "Month" },
					Aggregators = new []{ new AggregatorDef { FunctionName = "Count"}}

				}},
			{
				3, new PivotConfig() {
					Rows = new[] { "Region", "Country" },
					Cols = new[] { "Year", "Month" },
					Aggregators = new []{ new AggregatorDef { FunctionName = "Count"}},
					Filters = new Filter[] {
						new Filter("OrderType", "=", "Club"),
					}
				}}
		};

	protected SqlDataReader GetReader() {
		var conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["sample-db"].ToString());
		var cmd = new SqlCommand("select * from OrderLinesRevenueReport", conn);
		conn.Open();
		return cmd.ExecuteReader(CommandBehavior.CloseConnection);
	}
}
