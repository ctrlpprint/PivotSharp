using System.Data;

namespace PivotSharp.Aggregators;

public class Count : AggregatorBase
{
    public override string SqlFunction => $"count({(string.IsNullOrEmpty(ColumnName) ? "*" : ColumnName)})";
    public override string SqlFunctionName => "Count";

    public Count() { }

    public override void UpdateFor(IDataReader record) { }

    public override decimal Value => Count;

    public override string FormattedValue => Value.ToString("N0");
}