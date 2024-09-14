using Microsoft.AspNetCore.Mvc;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class ViewModel : DataBasePageModel
{
	public ViewModel(IConfiguration configuration) : base(configuration) { }

	public PivotTableViewModel PivotTableViewModel { get; private set; }


	public IActionResult OnGet(int? id = 1) {
		var config = Configs.Single(c => c.Key == id).Value;
		var pivot = PivotTable.Create(config, connectionString);
		
		PivotTableViewModel = new PivotTableViewModel(id!.Value, pivot, config);
		return Page();
	}

	// QS Format: http://localhost:52157/QueryBuilder/ViewByConfig?rows[0]=country&cols[0]=year&aggregators[0].columnname=Revenue&aggregators[0].functionname=Count&filters[0].op==&filters[0].columnname=Year&filters[0].parametervalue=2010
	public IActionResult OnGetByGonfig(PivotConfig config) {

		var pivot = PivotTable.Create(config, connectionString);
		

		return Page();
		//TODO: return Redirect("View", new PivotTableViewModel() { Config = config, PivotTable = pivot });
	}

}
