using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace PivotSharp;
public class PivotCell
{
	public IList<IAggregator> Aggregators { get; private set; } = [];

	public PivotCell(IEnumerable<IAggregator> list) {
		Aggregators = list.ToList();
	}

	public void UpdateFrom(IDataReader source) {
		foreach (var aggregator in Aggregators) {
			aggregator.Push(source);
		}
	}

	public decimal Value(IAggregator aggregator) =>
		Aggregators.Single(a => a.Equals(aggregator)).Value;

	public IAggregator this[int index] => Aggregators[index];	
}
