using System;
using System.Collections.Generic;

namespace System.Linq;

public static class EnumerableExtensions
{
    /// <summary>
    /// Pivot function, works similarly to Excel Pivot Tables.
    /// Pivots a flat list (source) on key1Selector (=> rows) and 
    /// </summary>
    /// <remarks>
    /// From http://www.extensionmethod.net/Details.aspx?ID=147
    /// </remarks>
    public static Dictionary<TKey1, Dictionary<TKey2, TValue>> Pivot<TSource, TKey1, TKey2, TValue>(
        this IEnumerable<TSource> source,
        Func<TSource, TKey1> key1Selector,
        Func<TSource, TKey2> key2Selector,
        Func<IEnumerable<TSource>, TValue> aggregate) {

        return source.GroupBy(key1Selector).Select(x => new
        {
            X = x.Key,
            Y = x.GroupBy(key2Selector).Select(
                z => new
                {
                    Z = z.Key,
                    V = aggregate(z)
                }
            ).ToDictionary(e => e.Z, o => o.V)
        }
        ).ToDictionary(e => e.X, o => o.Y);
    }
}