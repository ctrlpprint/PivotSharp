using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class AddModel : PageModel
{
	private readonly string connectionString;

	public AddModel(IConfiguration configuration) {
		connectionString = configuration.GetConnectionString("DefaultConnection")!;
	}


	public EditPivotConfigViewModel PivotConfig { get; private set; }

	public IActionResult OnGet() {
		var connector = new PivotDbConnector(connectionString);
		var columns = connector.GetTableStructure("World_Data");

		PivotConfig = new EditPivotConfigViewModel
		{
			Columns = columns,
			Config = new PivotConfig(),
			FilterOperators = FilterOperators.All().ToList(),
			Aggregators = AggregatorFunctions.Options

		};
		return Page();
	}
}
