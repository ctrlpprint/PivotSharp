using System;
using System.Data;

namespace PivotSharp.Aggregators;

// Collate the Sum then divide by Count

public class Ave : AggregatorBase
{
    public override string SqlFunction => $"sum({ColumnName})";

    public decimal SumTotal { get; private set; }

    public override string SqlFunctionName => "Sum";

    public Ave(string columnName) => ColumnName = columnName;

    public override void UpdateFor(IDataReader record) => 
        SumTotal += GetValue(record).ToString().ToDecimal();

    public override decimal Value => Count > 0 ? Decimal.Divide(SumTotal, (decimal)Count) : 0;
}