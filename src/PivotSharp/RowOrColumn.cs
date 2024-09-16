using System.Collections.Generic;
using System.Linq;

namespace PivotSharp;

public class RowOrColumn
{
    public string FlattenedKey => string.Join(PivotTable.KeyDelimiter, Headers.Select(h => h.Name));
    public IList<Header> Headers { get; set; } = [];
    public List<IAggregator> Aggregators { get; set; } = [];
    public IEnumerable<decimal> Values => Aggregators.Select(a => a.Value);
    public decimal Value => Values.FirstOrDefault();
}