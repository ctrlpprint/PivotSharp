using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class IndexModel : DataBasePageModel
{
	public IEnumerable<CustomReport> CustomReports { get; set; } = [];

	public IndexModel(IConfiguration configuration) : base(configuration) { }

	public async void OnGet() {
		CustomReports = await GetCustomReports();
	}
}
