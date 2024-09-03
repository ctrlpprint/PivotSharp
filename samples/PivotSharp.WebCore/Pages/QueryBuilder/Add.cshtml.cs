using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class AddModel : PageModel
{
	private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["sample-db"].ToString();

	public EditPivotConfigViewModel PivotConfig { get; private set; }

	public IActionResult OnGet() {
		var connector = new PivotDbConnector(connectionString);
		var columns = connector.GetTableStructure("OrderLinesRevenueNZReport");

		this.PivotConfig = new EditPivotConfigViewModel
		{
			Columns = columns,
			Config = new PivotConfig(),
			FilterOperators = FilterOperators.All().ToList(),
			Aggregators = AggregatorFunctions.Options

		};
		return Page();
	}
}
