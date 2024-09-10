using Microsoft.AspNetCore.Mvc;
using PivotSharp.WebCore.Models;
using System.Web;

namespace PivotSharp.WebCore.Pages;
public class IndexModel : BaseHomePageModel
{
	private readonly ILogger<IndexModel> _logger;

    public string PivotHtml { get; private set; }
    public PivotTableViewModel? PivotTable { get; private set; }

	public IndexModel(ILogger<IndexModel> logger) => _logger = logger;

	public ActionResult OnGet(int id = 1) {

		var config = configs.Single(c => c.Key == id).Value;
		var pivot = PivotSharp.PivotTable.Create(config, source);

		this.PivotHtml = pivot.BuildHtmlTable();

		PivotTable = new PivotTableViewModel(id, pivot, config);
		return Page();
	}
}
