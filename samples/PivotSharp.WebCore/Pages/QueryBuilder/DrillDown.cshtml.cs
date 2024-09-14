using Microsoft.AspNetCore.Mvc;
using PivotSharp.Connectors;
using System.Data;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class DrillDownModel : DataBasePageModel
{
	public DrillDownModel(IConfiguration configuration) : base(configuration) { }

	public DataTable Table { get; private set; } = new();

	public IActionResult OnGet(int id, string rowKeys, string colKeys) {
		var config = Configs.Single(c => c.Key == id).Value;
		var connector = new PivotDbConnector(config, connectionString);
		Table = connector.GetDrillDownData(rowKeys, colKeys);
		return Page();
	}
}
