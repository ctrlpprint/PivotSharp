using Microsoft.AspNetCore.Mvc.RazorPages;
using PivotSharp.Aggregators;
using PivotSharp.WebCore.Models;

namespace PivotSharp.WebCore.Pages;

public class BaseHomePageModel : PageModel
{
	protected readonly IList<Thingy> source = [
				new Thingy ("blue", "circle", "dotted", "outside", 1),
				new Thingy ("blue", "circle", "dotted", "outside", 1),
				new Thingy ("blue", "circle", "dashed", "outside", 11),
				new Thingy ("red", "triangle", "dotted", "inside", 23)
			];

	protected readonly IDictionary<int, PivotConfig> configs = new Dictionary<int, PivotConfig> {
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

}
