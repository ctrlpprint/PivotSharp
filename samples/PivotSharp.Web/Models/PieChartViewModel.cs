using System.Collections.Generic;
using System.Linq;

namespace PivotSharp.Web.Models
{
	public class PieChartViewModel : IChartViewModel
	{
		public string Title { get; set; }
		public IEnumerable<string> Labels { get; set; }
		public IEnumerable<decimal> Series { get; set; }
		public int Index { get; set; }

		/// <summary>
		/// Generates a view model for the top 5 row totals in the table
		/// </summary>
		public static PieChartViewModel TopRows(PivotTable table, int segments, int aggregatorIndex) {

			var aggregator = table.AggregatorDefs[aggregatorIndex];

			var top = table.Rows.OrderByDescending(r => r.Values.Skip(aggregatorIndex).First()).Take(segments).ToList();

			return new PieChartViewModel {
				Labels = top.Select(r => string.Format("{0} ({1})", r.FlattenedKey, r.Values.Skip(aggregatorIndex).First())),
				Series = top.Select(r => r.Values.Skip(aggregatorIndex).First()),
				Index = aggregatorIndex,
				Title = string.Format("{0} (Top {1}:{2})", aggregator, segments, string.Join(", ", table.Config.Rows))

			};
		}

		/// <summary>
		/// Generates a view model for the top 5 col totals in the table
		/// </summary>
		public static PieChartViewModel TopCols(PivotTable table, int segments, int aggregatorIndex) {

			var aggregator = table.AggregatorDefs[aggregatorIndex];

			var top = table.Cols.OrderByDescending(r => r.Values.Skip(aggregatorIndex).First()).Take(segments).ToList();

			return new PieChartViewModel {
				Labels = top.Select(r => string.Format("{0} ({1})", r.FlattenedKey, r.Values.Skip(aggregatorIndex).First())),
				Series = top.Select(r => r.Values.Skip(aggregatorIndex).First()),
				Index = aggregatorIndex,
				Title = string.Format("{0} (Top {1}:{2})", aggregator, segments, string.Join(", ", table.Config.Cols))

			};
		}

	}
}