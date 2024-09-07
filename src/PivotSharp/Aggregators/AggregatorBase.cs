using System;
using System.Data;
using System.Linq;

namespace PivotSharp.Aggregators;

public abstract class AggregatorBase : IAggregator
{
    public const string AliasDelimter = "_";

    public abstract string SqlFunction { get; }
    public abstract string SqlFunctionName { get; }
    public virtual string ColumnName { get; set; }

    public virtual string Alias => string.Join(
       separator: AliasDelimter, 
       values: new[] { SqlFunctionName, ColumnName }.Where(s => !string.IsNullOrEmpty(s)));

    public abstract void UpdateFor(IDataReader record);

    public virtual void Push(IDataReader record) {
        Count += record.ContainsKey("Count")
            ? record["Count"].ToString().ToInt()
            : 1;
        UpdateFor(record);
    }

    protected object GetValue(IDataReader record) {
        if (record.ContainsKey(Alias))
            return record[Alias];
        return record[ColumnName];
    }

    public abstract decimal Value { get; }
    public virtual string FormattedValue { get { return Value.ToString("N2"); } }
    public virtual int Count { get; private set; }
    public virtual bool HasEntries { get { return Count > 0; } }
}