using Microsoft.AspNetCore.Mvc;
using System.Data;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class DrillDownModel : QueryBuilderBasePageModel
{
	public DrillDownModel(IConfiguration configuration) : base(configuration) { }

	public DataTable Table { get; private set; } = new();

	public IActionResult OnGet(int id, string rowKeys, string colKeys) {
		var config = Configs.Single(c => c.Key == id).Value;
		var connector = new PivotDbConnector(connectionString);
		Table = connector.GetDrillDownData(config, rowKeys, colKeys);
		return Page();
	}
}
