using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages.Data;

public class IndexModel : BaseDataPageModel
{
	public PivotTableViewModel PivotTable { get; private set; }

	public IActionResult OnGet(int id = 1) {
		var config = configs.Single(c => c.Key == id).Value;
		var pivot = PivotSharp.PivotTable.Create(config);
		pivot.Pivot(GetReader());
		PivotTable = new PivotTableViewModel(id, pivot, config);
		return Page();
	}
}
