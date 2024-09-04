using PivotSharp.WebCore.Models;
using System.Data;

namespace PivotSharp.WebCore.Pages.Data;

public class DrillDownModel : BaseDataPageModel
{
	public DrillDownModel(IConfiguration configuration) : base(configuration) { }

	public DataTable Table { get; private set; } = new();
	public PivotTableViewModel PivotTableModel { get; private set; } 

	public void OnGet(int id = 1) {
		var config = configs.Single(c => c.Key == id).Value;
		var pivot = PivotTable.Create(config);
		pivot.Pivot(GetReader());
		PivotTableModel = new PivotTableViewModel(id, pivot, config);
	}
}
