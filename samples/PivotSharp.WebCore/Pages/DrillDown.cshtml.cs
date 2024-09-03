using Microsoft.AspNetCore.Mvc;
using PivotSharp.DataReader;
using System.Data;

namespace PivotSharp.WebCore.Pages;

public class DrillDownModel : BaseHomePageModel
{
	public DataTable Table { get; private set; } = new();

	public IActionResult OnGet(int id, string rowKeys, string colKeys) {

		var config = configs.Single(c => c.Key == id).Value;

		var reader = new EnumerableDataReader(source);

		var pivot = PivotTable.Create(config);
		Table = pivot.DrillDown(reader, rowKeys, colKeys);
		return Page();
	}
}
