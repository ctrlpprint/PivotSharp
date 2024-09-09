using Microsoft.AspNetCore.Mvc;
using PivotSharp.Connectors;
using PivotSharp.DataReader;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages;
public class IndexModel : BaseHomePageModel
{
	private readonly ILogger<IndexModel> _logger;

	public PivotTableViewModel? PivotTable { get; private set; }

	public IndexModel(ILogger<IndexModel> logger) => _logger = logger;

	public ActionResult OnGet(int id = 1) {

		var config = configs.Single(c => c.Key == id).Value;

		var reader = new EnumerableDataReader(source);
		var connector = new PivotEnumerableConnector<Thingy>(config, source);

		var pivot = PivotSharp.PivotTable.Create(config, connector);
		pivot.Pivot();

		PivotTable = new PivotTableViewModel(id, pivot, config);
		return Page();
	}
}
