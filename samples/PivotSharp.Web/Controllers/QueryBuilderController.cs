using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using System.Web.Routing;
using System.Web.UI.WebControls;
using Newtonsoft.Json;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using PivotSharp.Web.Models;
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
					Rows = new[] {"Country"},
					Cols = new[] {"Year"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"}},
					FillTable = true

				}
			}, {
				4, new PivotConfig() {
					Rows = new[] {"Category", "Product"},
					Cols = new[] {"Year"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"}},
					FillTable = true

				}
			}, {
				5, new PivotConfig() {
					Rows = new[] {"Category", "Product"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"},
					},
					Filters = new Filter[] {
						new Filter("Year", ">=", "2015"), 
					},
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, // HACK: Filters will break validation because they don't come through in the resultset.
					FillTable = true

				}
			}, {
				6, new PivotConfig() {
					Rows = new[] {"Year", "Month"},
					Cols = new List<string>() ,
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"},
						new AggregatorDef { FunctionName = "Ave", ColumnName = "RevenueNZ"},
						new AggregatorDef { FunctionName = "CountDistinct", ColumnName = "OrderID"},
						new AggregatorDef { FunctionName = "Count", ColumnName = ""}
					},
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, // HACK: Aggregators will now break validation because they don't come through in the resultset.
					FillTable = true

				}
			}, {
				7, new PivotConfig() {
					Rows = new[] {"Year"},
					Cols = new[] {"Week"},
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"},
					},
					Filters = new Filter[] {
						new Filter("Year", ">=", "2015"), 
					},
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, // HACK: Aggregators will now break validation because they don't come through in the resultset.
					FillTable = true

				}
			}, {
				8, new PivotConfig() {
					Rows = new[] {"Country"},
					Cols = new[] {"Category"},
					Aggregators = new [] {
						new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"},
					},
					FillTable = true

				}
			}, {
				9, new PivotConfig() {
					Rows = new[] {"Region", "Country"},
					Cols = new[] {"Year", "Month"},
					Aggregators = new []{new AggregatorDef { FunctionName = "Sum", ColumnName = "RevenueNZ"}},
					FillTable = true,
					ErrorMode = ConfigurationErrorHandlingMode.Ignore, // HACK: Filters will break validation because they don't come through in the resultset.
					Filters = new Filter[] {
						new Filter("CustomerClubType", "=", "Auto-Ship"), 
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
			var reader = connector.GetPivotData(config, "OrderLinesRevenueNZReport");
			var pivot = PivotTable.Create(config);
			pivot.Pivot(reader);


			return View(new PivotTableViewModel(){ Id = id, Config = config, PivotTable = pivot});
		}

		public ActionResult Generate(string config) {

			PivotConfig pivotConfig = JsonConvert.DeserializeObject<PivotConfig>(config);

			// Will pass the object, but it'll call ToString() on the lists, which isn't pretty.
			// return RedirectToAction("ViewByConfig", config);

			// Comes through as nul;
			// return RedirectToAction("ViewByConfig", new {config = config});

			TempData["Config"] = pivotConfig;
			return RedirectToAction("ViewByConfig");
		}


		public ActionResult ViewByConfig(PivotConfig config) {

			config = TempData["Config"] as PivotConfig;
			var connector = new PivotDbConnector(connectionString);
			var reader = connector.GetPivotData(config, "OrderLinesRevenueNZReport");
			var pivot = PivotTable.Create(config);
			pivot.Pivot(reader);


			return View("View", new PivotTableViewModel() { Config = config, PivotTable = pivot });
		}

	
		public ActionResult DrillDown(int id, string rowKeys, string colKeys) {

			var config = configs.Single(c => c.Key == id).Value;
			var connector = new PivotDbConnector(connectionString);
			var table = connector.GetDrillDownData(config, "OrderLinesRevenueNZReport", rowKeys, colKeys);

			return View(table);


		}

		public ActionResult Add() {

			var connector = new PivotDbConnector(connectionString);
			var columns = connector.GetTableStructure("OrderLinesRevenueNZReport");

			var viewModel = new EditPivotConfigViewModel {
				Columns = columns,
				Config = new PivotConfig(),
				FilterOperators = FilterOperators.All().ToList(),
				Aggregators = AggregatorFunctions.Options

			};

			return View(viewModel);
		}

		public ActionResult GetColumnValues(string columnName) {

			var connector = new PivotDbConnector(connectionString);

			// Protect against arbitrary input
			var columnList = connector.GetTableStructure("OrderLinesRevenueNZReport");
			if(!columnList.Any(l => l.Name.Equals(columnName, StringComparison.CurrentCultureIgnoreCase)))
				throw new Exception("Could not find Column name");

			var columns = connector.GetColumnValues("OrderLinesRevenueNZReport", columnName, 300).Select(c => c.Key);

			return Json(columns, JsonRequestBehavior.AllowGet);

		}

	}

	public class PivotConfigViewModel
	{
		public int Id { get; set; }
		public PivotConfig Config { get; set; }
	}
}