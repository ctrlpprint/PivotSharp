using System;
using Newtonsoft.Json;

namespace PivotSharp.Aggregators;

/// <summary>
/// Defines the behaviour of an aggregate
/// </summary>
/// <remarks>
/// Aggregators and their behaviours:
/// 
/// --------------------------------------------------------------------
/// Aggregator			In-Memory					SQL
/// --------------------------------------------------------------------
/// Count				++							Sum of count(*)
/// Sum(Column)			+= value of column			sum(Column)
/// Avg(Column)			
/// 
/// </remarks>
[JsonObject(MemberSerialization.OptIn)]
public class AggregatorDef
{
    [JsonProperty]
    public string FunctionName { get; set; }
    [JsonProperty]
    public string ColumnName { get; set; }

    public IAggregator Create() {
        return FromString(FunctionName, ColumnName)();
    }

    private Func<IAggregator> FromString(string name, string columnName) {

        switch (name) {
            case "Count": return () => new Count();
            case "CountDistinct": return () => new CountDistinct(columnName);
            case "SumInt": return () => new SumInt(columnName);
            case "Sum": return () => new Sum(columnName);
            case "Ave":
            case "Avg": return () => new Ave(columnName);
            case "Min": return () => new Min(columnName);
            case "Max": return () => new Max(columnName);

        }
        throw new NotImplementedException();
    }

    public override string ToString() {

        // TODO: Needs tidy up.
        if (ColumnName == "Count") return "Count";
        if (FunctionName == "Sum" || FunctionName == "SumInt")
            return $"Total {ColumnName}";

        return $"{FunctionName} {ColumnName}";
    }

    #region Comparators
    public bool Equals(AggregatorDef other) {

        if (!(FunctionName == null && other.FunctionName == null) && FunctionName != other.FunctionName) return false;
        if (!(ColumnName == null && other.ColumnName == null) && ColumnName != other.ColumnName) return false;
        return true;
    }

    public override bool Equals(object obj) {
        if (obj is null) return false;
        if (ReferenceEquals(this, obj)) return true;
        if (obj.GetType() != this.GetType()) return false;
        return Equals((AggregatorDef)obj);
    }

    public static bool operator ==(AggregatorDef key1, AggregatorDef key2) =>
        key1 is not null && key1.Equals(key2);

    public static bool operator !=(AggregatorDef key1, AggregatorDef key2) =>
        !(key1 == key2);

    public override int GetHashCode() {
        unchecked {
            return (ToString().GetHashCode() * 397);
        }
    }
    #endregion

}