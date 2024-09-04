using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class DrillDownModel : QueryBuilderBasePageModel
{
	public DrillDownModel(IConfiguration configuration) : base(configuration) { }

	public DataTable Table { get; private set; } = new();

	public IActionResult OnGet(int id, string rowKeys, string colKeys) {
		var config = Configs.Single(c => c.Key == id).Value;
		var pivot = PivotTable.Create(config);
		var reader = GetReader();
		Table = pivot.DrillDown(reader, rowKeys, colKeys);
		return Page();
	}
}
