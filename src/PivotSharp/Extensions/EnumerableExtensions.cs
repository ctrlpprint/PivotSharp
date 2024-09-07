using System.Linq;
using System.Text.RegularExpressions;

namespace System.Collections.Generic;
public static class EnumerableExtensions
{
    /// <summary>
    /// Alphanumeric sort. Sorts, eg, ["z1,", "z11", "z2"] as ["z1,", "z2", "z11"]
    /// </summary>
    /// <remarks>
    /// Source: http://stackoverflow.com/a/11720793/424788
    /// Other solutions are described on that page.
    /// </remarks>
    public static IEnumerable<T> NaturalSort<T>(this IEnumerable<T> source, Func<T, string> selector) {
        int max = source
            .SelectMany(i => Regex.Matches(selector(i), @"\d+").Cast<Match>().Select(m => (int?)m.Value.Length))
            .Max() ?? 0;

        return source.OrderBy(i => Regex.Replace(selector(i), @"\d+", m => m.Value.PadLeft(max, '0')));
    }
}