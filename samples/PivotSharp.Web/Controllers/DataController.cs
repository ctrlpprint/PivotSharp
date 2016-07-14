using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web.Mvc;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using Filter = PivotSharp.Filters.Filter;

namespace PivotSharp.Web.Controllers
{
	public class DataController : Controller
	{

		private readonly IDictionary<int, PivotConfig> configs = new Dictionary<int, PivotConfig> {
			{
				1 , new PivotConfig() {
					Rows = new[] { "Region" },
					Cols = new[] { "CustomerClubType" },
					Aggregator = new AggregatorDef { FunctionName = "Count"}
				}},
			{
				2, new PivotConfig() {
					Rows = new[] { "Region", "Country" },
					Cols = new[] { "Year", "Month" },
					Aggregator = new AggregatorDef { FunctionName = "Count"}

				}},
			{
				3, new PivotConfig() {
					Rows = new[] { "Region", "Country" },
					Cols = new[] { "Year", "Month" },
					Aggregator = new AggregatorDef { FunctionName = "Count"},
					Filters = new Filter[] {
						new Filter("OrderType", "=", "Club"), 
					}



				}}
		};

		private SqlDataReader GetReader() {
			var conn = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["sample-db"].ToString());
			var cmd = new SqlCommand("select * from OrderLinesRevenueReport", conn);
			conn.Open();
			return cmd.ExecuteReader(CommandBehavior.CloseConnection);
		}

		public ActionResult Index(int id = 1) {

			var config = configs.Single(c => c.Key == id).Value;
			var pivot = PivotTable.Create(config);
			pivot.Pivot(GetReader());


			return View(new PivotTableViewModel(){ Id = id, PivotTable = pivot});
		}

	
		public ActionResult DrillDown(int id, string rowKeys, string colKeys) {

			var config = configs.Single(c => c.Key == id).Value;

			var reader = GetReader();

			var pivot = PivotTable.Create(config);
			var table = pivot.DrillDown(reader, rowKeys, colKeys);

			return View(table);


		}


	}
}