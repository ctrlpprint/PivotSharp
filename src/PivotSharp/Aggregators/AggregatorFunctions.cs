using System.Collections.Generic;

namespace PivotSharp.Aggregators;

public class AggregatorFunctions
{
    public static IList<string> Options => ["Count", "CountDistinct", "Sum", "SumInt", "Ave", "Max", "Min"];
}