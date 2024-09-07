using System;
using System.Data;

namespace PivotSharp.Aggregators;

public class SumInt : AggregatorBase
{
    public override string SqlFunction => $"sum({ColumnName})";
    public decimal SumTotal { get; private set; }
    public override string SqlFunctionName => "Sum";
    public override decimal Value => SumTotal;
    public override string FormattedValue => Value.ToString("N0");

    public SumInt(string columnName) {
        ColumnName = columnName;
        SumTotal = 0;
    }

    public override void UpdateFor(IDataReader record) {
        SumTotal += GetValue(record).ToString().ToDecimal();
    }
}