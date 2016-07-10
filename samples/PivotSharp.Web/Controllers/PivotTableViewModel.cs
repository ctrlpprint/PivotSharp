namespace PivotSharp.Web.Controllers
{
	public class PivotTableViewModel
	{
		public int? Id { get; set; }
		public PivotTable PivotTable { get; set; }
		public PivotConfig Config { get; set; }
	}
}