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
		public List<IAggregator> Aggregators { get; set; }
		public IEnumerable<decimal> Values { get { return Aggregators.Select(a => a.Value); } }
		public decimal Value { get { return Values.FirstOrDefault(); } }

		public RowOrColumn() {
			Headers = new List<Header>();
		}
	}
}