using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace PivotSharp.WebCore.Pages;

public class DrillDownModel : BaseHomePageModel
{
	public DataTable Table { get; private set; } = new();

	public IActionResult OnGet(int id, string rowKeys, string colKeys) {

		var config = configs.Single(c => c.Key == id).Value;
		var pivot = PivotTable.Create(config, source);
		Table = pivot.DrillDown(rowKeys, colKeys);
		return Page();
	}
}
