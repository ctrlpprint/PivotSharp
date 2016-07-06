using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp.Web.Controllers
{
	public class QueryBuilderController : Controller
	{

		private readonly string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["sample-db"].ToString();


		private readonly IDictionary<int, PivotConfig> configs = new Dictionary<int, PivotConfig> {
			{
				1, new PivotConfig() {
					Rows = new[] {"Region"},
					Cols = new[] {"CustomerClubType"},
					Aggregator = () => new Count(),
					FillTable = true
				}
			}, {
				2, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregator = () => new Count(),
					FillTable = true

				}
			}, {
				3, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregator = () => new Sum("Revenue"),
					FillTable = true

				}
			}, {
				4, new PivotConfig() {
					Rows = new[] {"Category", "Product"},
					Cols = new[] {"Year", "Month"},
					Aggregator = () => new Sum("Revenue"),
					FillTable = true

				}
			}, {
				5, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregator = () => new Sum("Revenue"),
					FillTable = true,
					Filters = new IFilter[] {
						new Equals<string>("OrderType", "Club")
					}

				}
			}
		};

		public ActionResult Index() {
			return View(configs);
		}

		public ActionResult View(int id = 1) {

			var config = configs.Single(c => c.Key == id).Value;
			var connector = new PivotDbConnector(connectionString);
			var reader = connector.GetPivotData(config, "OrderLinesRevenueReport");
			var pivot = PivotTable.Create(config);
			pivot.Pivot(reader);


			return View(new PivotTableViewModel(){ Id = id, PivotTable = pivot});
		}

	
		public ActionResult DrillDown(int id, string rowKeys, string colKeys) {

			var config = configs.Single(c => c.Key == id).Value;
			var connector = new PivotDbConnector(connectionString);
			var table = connector.GetDrillDownData(config, "OrderLinesRevenueReport", rowKeys, colKeys);

			return View(table);


		}


	}

	public class PivotConfigViewModel
	{
		public int Id { get; set; }
		public PivotConfig Config { get; set; }
	}
}