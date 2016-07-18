using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using Filter = PivotSharp.Filters.Filter;

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
					Aggregators = new []{new AggregatorDef { FunctionName = "Count"}},
					FillTable = true
				}
			}, {
				2, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Count"}},
					FillTable = true

				}
			}, {
				3, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "Revenue"}},
					FillTable = true

				}
			}, {
				4, new PivotConfig() {
					Rows = new[] {"Category", "Product"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "Revenue"}},
					FillTable = true

				}
			}, {
				5, new PivotConfig() {
					Rows = new[] {"Category", "Product"},
					Cols = new[] {"Year"},
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "Revenue"},
						new AggregatorDef { FunctionName = "Count", ColumnName = ""}
					},
					FillTable = true

				}
			}, {
				6, new PivotConfig() {
					Rows = new[] {"Category", "Product"},
					Cols = new List<string>() ,
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "Revenue"},
						new AggregatorDef { FunctionName = "Ave", ColumnName = "Revenue"},
						new AggregatorDef { FunctionName = "Count", ColumnName = ""}
					},
					FillTable = true

				}
			}, {
				7, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "Revenue"}},
					FillTable = true,
					Filters = new Filter[] {
						new Filter("OrderType", "=", "Club"), 
					}
				}
			}
		};

		public ActionResult Index() {
			return View(configs);
		}

		public ActionResult View(int? id) {

			var config = configs.Single(c => c.Key == id).Value;
			var connector = new PivotDbConnector(connectionString);
			var reader = connector.GetPivotData(config, "OrderLinesRevenueReport");
			var pivot = PivotTable.Create(config);
			pivot.Pivot(reader);


			return View(new PivotTableViewModel(){ Id = id, Config = config, PivotTable = pivot});
		}

		// eg: /QueryBuilder/ViewByConfig/?AggregatorName=Sum&AggregatorName=Revenue&Rows=Category&Rows=Product&Cols=Year&Cols=Month&FillTable=true
		// eg: /QueryBuilder/ViewByConfig/?AggregatorName[0]=Sum&AggregatorName[1]=Revenue&Rows[0]=Category&Rows[1]=Product&Cols[0]=Year&Cols[1]=Month&FillTable=true&Filters[0].ColumnName=Year&Filters[0].ParameterValue=2016&Filters[0].Op=%3C
		public ActionResult ViewByConfig(PivotConfig config) {

			var connector = new PivotDbConnector(connectionString);
			var reader = connector.GetPivotData(config, "OrderLinesRevenueReport");
			var pivot = PivotTable.Create(config);
			pivot.Pivot(reader);


			return View("View", new PivotTableViewModel() { Config = config, PivotTable = pivot });
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