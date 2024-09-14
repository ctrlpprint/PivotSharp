using Microsoft.AspNetCore.Mvc;
using PivotSharp.Connectors;
using System.Data;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class DrillDownModel : DataBasePageModel
{
	public DrillDownModel(IConfiguration configuration) : base(configuration) { }

	public DataTable Table { get; private set; } = new();

	public async Task<IActionResult> OnGet(int id, string rowKeys, string colKeys) {
        var report = await GetCustomReport(id);
        if (report == null) return new NotFoundResult();
        var connector = new PivotDbConnector(report.PivotConfig, connectionString);
		Table = connector.GetDrillDownData(rowKeys, colKeys);
		return Page();
	}
}
