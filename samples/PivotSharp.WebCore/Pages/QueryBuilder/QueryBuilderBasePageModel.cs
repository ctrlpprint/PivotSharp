using Microsoft.AspNetCore.Mvc.RazorPages;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class QueryBuilderBasePageModel : PageModel
{
	protected readonly string connectionString;

	public QueryBuilderBasePageModel(IConfiguration configuration) {
		connectionString = configuration.GetConnectionString("DefaultConnection")!;
	}


	public readonly IDictionary<int, PivotConfig> Configs = new Dictionary<int, PivotConfig> {
		{
			1 , new PivotConfig() {
					Rows = ["Country_Name"],
					Cols = ["Year"],
					Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum"}] 
				}
		},{
			2, new PivotConfig() {
					Rows = ["Region", "Country_Name"],
					Cols = ["Year"],
					Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum" }]
				}
		},{
			3, new PivotConfig() {
					Rows = ["Region", "Country_Name"],
					Cols = ["Income_Group"],
					Aggregators = [new AggregatorDef { ColumnName = "Population", FunctionName = "Sum" }],
					Filters = [new Filter("Region", "=", "Europe")],
					// Filters will break validation because they don't come through in the resultset.
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, 
					FillTable = true
				}
		}
	};
}
