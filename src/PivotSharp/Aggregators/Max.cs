using System;
using System.Data;

namespace PivotSharp.Aggregators;
public class Max : AggregatorBase
{
    public override string SqlFunction => $"max({ColumnName})";
    public decimal? Maximum { get; private set; }
    public override string SqlFunctionName => "Max";
    public Max(string columnName) => ColumnName = columnName;
    public override decimal Value => Maximum.HasValue ? Maximum.Value : 0;

    public override void UpdateFor(IDataReader record) {
        var val = GetValue(record).ToString().ToDecimal();
        Maximum = Maximum == null ? val : Math.Max(Maximum.Value, val);
    }
}