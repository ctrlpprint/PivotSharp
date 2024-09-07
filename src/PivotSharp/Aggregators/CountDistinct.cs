using System;
using System.Collections.Generic;
using System.Data;

namespace PivotSharp.Aggregators;

public class CountDistinct : AggregatorBase
{
    private IList<string> DistinctValues { get; set; } = [];
    public int Distinct { get; private set; }

    public CountDistinct() { }
    public CountDistinct(string columnName) : this() => ColumnName = columnName;

    public override string SqlFunction => $"count(distinct {ColumnName})";
    public override string SqlFunctionName => "Count";
    public override decimal Value => Math.Max(Distinct, DistinctValues.Count);
    public override string FormattedValue => Value.ToString("N0");

    public override void UpdateFor(IDataReader record) {
        if (record.ContainsKey(Alias))
            Distinct += record[Alias].ToString().ToInt();
        else {
            var val = record[ColumnName].ToString();
            if (!DistinctValues.Contains(val)) {
                DistinctValues.Add(val);
            }
        }
    }
}