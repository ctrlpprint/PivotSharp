using System.Collections.Generic;
using System.Linq;

namespace PivotSharp;

public class PivotBody : Dictionary<PivotKey, PivotCell>
{
    public PivotCell FindOrAdd(string flattenedRowKey, string flattenedColKey, IEnumerable<IAggregator> aggregators) {
		return this[flattenedRowKey, flattenedColKey]
			?? Add(flattenedRowKey, flattenedColKey, aggregators);
	}


	public PivotCell Add(string flattenedRowKey, string flattenedColKey, IEnumerable<IAggregator> aggregators) {
        var cell = new PivotCell(aggregators);
		Add(
            key: new PivotKey { FlattenedColKey = flattenedColKey, FlattenedRowKey = flattenedRowKey },
            value: cell);
        return cell;
    }

    public IDictionary<string, Dictionary<string, PivotCell>> Rows => this
        .GroupBy(kpv => kpv.Key.FlattenedRowKey)
        .ToDictionary(
            keySelector: gp => gp.Key,
            elementSelector: gp => gp
                .Select(x => new KeyValuePair<string, PivotCell>(
                    key: x.Key.FlattenedColKey,
                    value: x.Value))
                .ToDictionary(kvp => kvp.Key, kvp => kvp.Value)
        );

    public IDictionary<string, Dictionary<string, PivotCell>> Cols => this
        .GroupBy(kpv => kpv.Key.FlattenedColKey)
        .ToDictionary(
            keySelector: gp => gp.Key,
            elementSelector: gp => gp
                .Select(x => new KeyValuePair<string, PivotCell>(
                    key: x.Key.FlattenedRowKey,
                    value: x.Value))
                .ToDictionary(kvp => kvp.Key, kvp => kvp.Value)
        );

	public PivotCell? this[string key1, string key2] =>
        this.SingleOrDefault(v => v.Key.FlattenedRowKey == key1 && v.Key.FlattenedColKey == key2).Value;

	/// <summary>
	/// Accept a row indexer and return a dictionary of values for that row, keyed on the flattened column keys
	/// </summary>
	public IDictionary<string, PivotCell> this[string key1] => this
		.Where(v => v.Key.FlattenedRowKey == key1)
		.ToDictionary(kvp => kvp.Key.FlattenedColKey, kvp => kvp.Value);
}