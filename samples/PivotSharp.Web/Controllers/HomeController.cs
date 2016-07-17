using System.Collections.Generic;
using System.Linq;
using System.Web.Mvc;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Web.Controllers
{
	public class HomeController : Controller
	{
		private readonly IList<Thingy> source = new List<Thingy> {
				new Thingy ("blue", "circle", "dotted", "outside", 1),
				new Thingy ("blue", "circle", "dotted", "outside", 1),
				new Thingy ("blue", "circle", "dashed", "outside", 11),
				new Thingy ("red", "triangle", "dotted", "inside", 23)
			};

		private readonly IDictionary<int, PivotConfig> configs = new Dictionary<int, PivotConfig> {
			{
				1 , new PivotConfig() {
				Rows = new[] { "Shape" },
				Cols = new[] { "Color" },
				Aggregators = new []{new AggregatorDef { FunctionName = "SumInt", ColumnName = "Lines"}},
			}},
			{
				2, new PivotConfig() {
				Rows = new[] { "Color", "Shape" },
				Cols = new[] { "Border", "Shadow" },
				Aggregators = new []{new AggregatorDef { FunctionName = "Count"}}

			}}
		};

		public ActionResult Index(int id = 1) {

			var config = configs.Single(c => c.Key == id).Value;

			var reader = new EnumerableDataReader(source);

			var pivot = PivotTable.Create(config);
			pivot.Pivot(reader);


			return View(new PivotTableViewModel(){ Id = id, PivotTable = pivot});
		}

	
		public ActionResult DrillDown(int id, string rowKeys, string colKeys) {

			var config = configs.Single(c => c.Key == id).Value;

			var reader = new EnumerableDataReader(source);

			var pivot = PivotTable.Create(config);
			var table = pivot.DrillDown(reader, rowKeys, colKeys);

			return View(table);


		}

		private class Thingy
		{
			public string Color { get; set; }
			public string Shape { get; set; }
			public string Border { get; set; }
			public string Shadow { get; set; }
			public int Lines { get; set; }

			public Thingy(string color, string shape, string border, string shadow, int lines) {
				Color = color;
				Shape = shape;
				Border = border;
				Shadow = shadow;
				Lines = lines;
			}
		}

	}
}