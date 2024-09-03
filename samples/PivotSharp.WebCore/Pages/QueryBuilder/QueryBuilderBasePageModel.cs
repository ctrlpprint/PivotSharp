using Microsoft.AspNetCore.Mvc.RazorPages;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class QueryBuilderBasePageModel : PageModel
{
	protected readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["sample-db"].ToString();

	public readonly IDictionary<int, PivotConfig> Configs = new Dictionary<int, PivotConfig> {
			{
				1, new PivotConfig() {
					Rows = new[] {"Region"},
					Cols = new[] {"CustomerClubType"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Count"}},
					FillTable = true
				}
			}, {
				2, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Count"}},
					FillTable = true

				}
			}, {
				3, new PivotConfig() {
					Rows = new[] {"Country"},
					Cols = new[] {"Year"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"}},
					FillTable = true

				}
			}, {
				4, new PivotConfig() {
					Rows = new[] {"Category", "Product"},
					Cols = new[] {"Year"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"}},
					FillTable = true

				}
			}, {
				5, new PivotConfig() {
					Rows = new[] {"Category", "Product"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"},
					},
					Filters = new Filter[] {
						new Filter("Year", ">=", "2015"),
					},
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, // HACK: Filters will break validation because they don't come through in the resultset.
					FillTable = true

				}
			}, {
				6, new PivotConfig() {
					Rows = new[] {"Year", "Month"},
					Cols = new List<string>() ,
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"},
						new AggregatorDef { FunctionName = "Ave", ColumnName = "RevenueNZ"},
						new AggregatorDef { FunctionName = "CountDistinct", ColumnName = "OrderID"},
						new AggregatorDef { FunctionName = "Count", ColumnName = ""}
					},
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, // HACK: Aggregators will now break validation because they don't come through in the resultset.
					FillTable = true

				}
			}, {
				7, new PivotConfig() {
					Rows = new[] {"Year"},
					Cols = new[] {"Week"},
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"},
					},
					Filters = new Filter[] {
						new Filter("Year", ">=", "2015"),
					},
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, // HACK: Aggregators will now break validation because they don't come through in the resultset.
					FillTable = true

				}
			}, {
				8, new PivotConfig() {
					Rows = new[] {"Country"},
					Cols = new[] {"Category"},
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"},
					},
					FillTable = true

				}
			}, {
				9, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"}},
					FillTable = true,
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, // HACK: Filters will break validation because they don't come through in the resultset.
					Filters = new Filter[] {
						new Filter("CustomerClubType", "=", "Auto-Ship"),
					}
				}
			}
		};

}
