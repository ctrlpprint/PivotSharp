using Microsoft.AspNetCore.Mvc;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class ViewModel : DataBasePageModel
{
	public ViewModel(IConfiguration configuration) : base(configuration) { }

	public PivotTableViewModel PivotTableViewModel { get; private set; }


	public async Task<IActionResult> OnGet(int id) {
		var report = await GetCustomReport(id);
		if (report == null) return new NotFoundResult();
		var config = report.PivotConfig;
		var pivot = PivotTable.Create(config, connectionString);
		
		PivotTableViewModel = new PivotTableViewModel(id, pivot, config);
		return Page();
	}

	// QS Format: http://localhost:52157/QueryBuilder/ViewByConfig?rows[0]=country&cols[0]=year&aggregators[0].columnname=Revenue&aggregators[0].functionname=Count&filters[0].op==&filters[0].columnname=Year&filters[0].parametervalue=2010
	public IActionResult OnGetByGonfig(PivotConfig config) {
		var pivot = PivotTable.Create(config, connectionString);
        PivotTableViewModel = new PivotTableViewModel(0, pivot, config);
        return Page();
	}

}
