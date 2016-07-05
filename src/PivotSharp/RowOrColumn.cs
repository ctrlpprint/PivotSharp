using System.Collections.Generic;
using System.Linq;

namespace PivotSharp
{
	public class RowOrColumn
	{
		public string FlattenedKey {
			get { return string.Join(",", Headers.Select(h => h.Name)); }
		}

		public IList<Header> Headers { get; set; }
		public IAggregator Aggregator { get; set; }
		public decimal Value { get { return Aggregator.Value; } }

		public RowOrColumn() {
			Headers = new List<Header>();
		}
	}
}