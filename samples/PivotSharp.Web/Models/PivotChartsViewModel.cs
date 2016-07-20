using System;
using System.Collections.Generic;
using System.Linq;

namespace PivotSharp.Web.Models
{
	public class PivotChartsViewModel
	{
		public IList<IChartViewModel> Charts { get; set; }

		public PivotChartsViewModel(PivotTable table, int maxLines) {
			Charts = new List<IChartViewModel>();

			for (var aggregatorIndex = 0; aggregatorIndex < table.AggregatorDefs.Count; aggregatorIndex++) {

				// if 2-D
				if (table.Cols.Any() && table.Rows.Any()) {

					if (table.Config.Cols.Any(c => c.IsDateField())) {
						Add(LineChartViewModel.TopRows(table, maxLines, aggregatorIndex));
					}

					else if (table.Config.Rows.Any(c => c.IsDateField())) {
						Add(LineChartViewModel.TopCols(table, maxLines, aggregatorIndex));
					}
				}
				if (table.Rows.Any()) {
					Add(PieChartViewModel.TopRows(table, maxLines, aggregatorIndex));
				}

				if (table.Cols.Any()) {
					Add(PieChartViewModel.TopCols(table, maxLines, aggregatorIndex));
				}
			}
		}

		private void Add(IChartViewModel viewModel) {
			viewModel.Index = Charts.Count;
			Charts.Add(viewModel);
			
		}
	}
}