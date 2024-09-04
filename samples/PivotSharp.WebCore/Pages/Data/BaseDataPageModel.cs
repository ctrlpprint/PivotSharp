using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using System.Data;

namespace PivotSharp.WebCore.Pages.Data;

public class BaseDataPageModel : PageModel
{
	private readonly string connectionString;

	protected readonly IDictionary<int, PivotConfig> configs = new Dictionary<int, PivotConfig> {
			{
				1 , new PivotConfig() {
					Rows = ["Country_Name"],
					Cols = ["Year"],
					Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum"}]
				}},
			{
				2, new PivotConfig() {
					Rows = ["Region", "Country_Name"],
					Cols = ["Year"],
					Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum"}]
				}},
			{
				3, new PivotConfig() {
					Rows = ["Region", "Country_Name"],
					Cols = ["Income_Group"],
					Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum"}],
					Filters = [new Filter("Region", "=", "Europe")],
					ErrorMode = ConfigurationErrorHandlingMode.Ignore,
				}}
		};

	public BaseDataPageModel(IConfiguration configuration) {
		connectionString = configuration.GetConnectionString("DefaultConnection")!;
	}

	protected SqlDataReader GetReader() {
		var conn = new SqlConnection(connectionString);
		var cmd = new SqlCommand("select * from World_Data", conn);
		conn.Open();
		return cmd.ExecuteReader(CommandBehavior.CloseConnection);
	}
}
