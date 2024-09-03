namespace PivotSharp.WebCore.Models;

public class PivotTableViewModel
{
	public int? Id { get; set; }
	public PivotTable PivotTable { get; set; }
	public PivotConfig Config { get; set; }

	public PivotTableViewModel(int id, PivotTable pivotTable, PivotConfig config) {
		Id = id;
		PivotTable = pivotTable;
		Config = config;
	}


}