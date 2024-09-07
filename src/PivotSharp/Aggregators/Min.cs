using System;
using System.Data;

namespace PivotSharp.Aggregators;

public class Min : AggregatorBase
{
    public override string SqlFunction => $"min({ColumnName})";
    public decimal? Minimum { get; private set; }
    public override string SqlFunctionName => "Min";
    public override decimal Value => Minimum.HasValue ? Minimum.Value : 0;
    public Min(string columnName) => ColumnName = columnName;

    public override void UpdateFor(IDataReader record) {
        var val = GetValue(record).ToString().ToDecimal();
        Minimum = Minimum == null ? val : Math.Min(Minimum.Value, val);
    }
}