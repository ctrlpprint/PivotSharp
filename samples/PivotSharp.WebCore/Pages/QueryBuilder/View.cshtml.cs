using Microsoft.AspNetCore.Mvc;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class ViewModel : QueryBuilderBasePageModel
{
	public PivotTableViewModel PivotTableViewModel { get; private set; }

	public IActionResult OnGet(int? id = 1) {
		var config = Configs.Single(c => c.Key == id).Value;
		var connector = new PivotDbConnector(connectionString);
		var reader = connector.GetPivotData(config, "OrderLinesRevenueNZReport");
		var pivot = PivotTable.Create(config);
		pivot.Pivot(reader);
		PivotTableViewModel = new PivotTableViewModel(id!.Value, pivot, config);
		return Page();
	}

	// QS Format: http://localhost:52157/QueryBuilder/ViewByConfig?rows[0]=country&cols[0]=year&aggregators[0].columnname=Revenue&aggregators[0].functionname=Count&filters[0].op==&filters[0].columnname=Year&filters[0].parametervalue=2010
	public IActionResult OnGetByGonfig(PivotConfig config) {

		var connector = new PivotDbConnector(connectionString);
		var reader = connector.GetPivotData(config, "OrderLinesRevenueNZReport");
		var pivot = PivotTable.Create(config);
		pivot.Pivot(reader);

		return Page();
		//TODO: return Redirect("View", new PivotTableViewModel() { Config = config, PivotTable = pivot });
	}

}
