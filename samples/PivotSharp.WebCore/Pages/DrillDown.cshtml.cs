using Microsoft.AspNetCore.Mvc;
using PivotSharp.Connectors;
using PivotSharp.DataReader;
using PivotSharp.WebCore.Models;
using System.Data;

namespace PivotSharp.WebCore.Pages;

public class DrillDownModel : BaseHomePageModel
{
	public DataTable Table { get; private set; } = new();

	public IActionResult OnGet(int id, string rowKeys, string colKeys) {

		var config = configs.Single(c => c.Key == id).Value;

		var connector = new PivotEnumerableConnector<Thingy>(config, source);

		var pivot = PivotTable.Create(config, connector);
		Table = pivot.DrillDown(rowKeys, colKeys);
		return Page();
	}
}
