using Microsoft.AspNetCore.Mvc;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class IndexModel : DataBasePageModel
{
	public IEnumerable<CustomReport> CustomReports { get; set; } = [];

	public IndexModel(IConfiguration configuration) : base(configuration) { }

	public async Task<IActionResult> OnGet() {
		CustomReports = await GetCustomReports();
		return Page();
	}
}
