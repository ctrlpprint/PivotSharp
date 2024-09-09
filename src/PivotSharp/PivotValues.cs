using System.Collections.Generic;
using System.Linq;

namespace PivotSharp;

public class PivotValues : Dictionary<PivotKey, IList<IAggregator>>
{
    public IList<IAggregator> FindOrAdd(string flattenedRowKey, string flattenedColKey, IList<IAggregator> aggregators) {
        var existing = this[flattenedRowKey, flattenedColKey];
		return existing != null 
            ? existing : 
            Add(flattenedRowKey, flattenedColKey, aggregators);
	}


	public IList<IAggregator> Add(string flattenedRowKey, string flattenedColKey, IList<IAggregator> aggregators) {
		Add(key: new PivotKey { FlattenedColKey = flattenedColKey, FlattenedRowKey = flattenedRowKey },value: aggregators);
        return aggregators;
    }

    public IDictionary<string, Dictionary<string, IList<IAggregator>>> Rows => this
        .GroupBy(kpv => kpv.Key.FlattenedRowKey)
        .ToDictionary(
            keySelector: gp => gp.Key,
            elementSelector: gp => gp
                .Select(x => new KeyValuePair<string, IList<IAggregator>>(
                    key: x.Key.FlattenedColKey,
                    value: x.Value))
                .ToDictionary(kvp => kvp.Key, kvp => kvp.Value)
        );

    public IDictionary<string, Dictionary<string, IList<IAggregator>>> Cols => this
        .GroupBy(kpv => kpv.Key.FlattenedColKey)
        .ToDictionary(
            keySelector: gp => gp.Key,
            elementSelector: gp => gp
                .Select(x => new KeyValuePair<string, IList<IAggregator>>(
                    key: x.Key.FlattenedRowKey,
                    value: x.Value))
                .ToDictionary(kvp => kvp.Key, kvp => kvp.Value)
        );

    public IList<IAggregator> this[string key1, string key2] {
        get {
            var value = this.SingleOrDefault(v => v.Key.FlattenedRowKey == key1 && v.Key.FlattenedColKey == key2);
            // TODO: What to do if no match?
            // ??? Cannot compare KVP to null...
            // if(value == null) return null;
            return value.Value;
        }
    }

    /// <summary>
    /// Accept a row indexer and return a dictionary of values for that row, keyed on the flattened column keys
    /// </summary>
    public IDictionary<string, IList<IAggregator>> this[string key1] {
        get {
            // TODO: What to do if no match?
            return this
                .Where(v => v.Key.FlattenedRowKey == key1)
                .ToDictionary(kvp => kvp.Key.FlattenedColKey, kvp => kvp.Value);
        }
    }
}