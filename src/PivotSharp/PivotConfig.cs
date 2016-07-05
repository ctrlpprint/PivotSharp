using System;
using System.Collections.Generic;

namespace PivotSharp
{
	public class PivotConfig
	{
		public IList<string> Rows { get; set; }
		public IList<string> Cols { get; set; }
		public Func<IAggregator> Aggregator { get; set; }
		public bool FillTable { get; set; }
		public IList<IFilter> Filters { get; set; }

		public PivotConfig() {
			Rows = new List<string>();
			Cols = new List<string>();
			Filters = new List<IFilter>();
		}
	}
}