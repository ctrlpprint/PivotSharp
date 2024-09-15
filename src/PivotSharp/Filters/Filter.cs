using System;
using System.Data;
using System.Text.Json.Serialization;

namespace PivotSharp.Filters;

public class Filter
{
    public string Op { get; set; } = "";

    public string ColumnName { get; set; } = "";

    public object ParameterValue { get; set; } = "";

    public Filter() { }

    public Filter(string columnName, string op, object parameterValue) {
        Op = op;
        ColumnName = columnName;
        ParameterValue = parameterValue;
    }

    public bool Apply(IDataReader source) {
        // Ignore rather than throw. If we're using the DB Connector, the filters have already been applied,
        // and the source will not necessarily include the filter field.
        if (!source.ContainsKey(ColumnName)) return true;

        if (source[ColumnName].GetType() == typeof(System.DBNull)) return false;
        return Compare(Op, (IComparable)source[ColumnName], (IComparable)ParameterValue);
    }

    public static bool Compare(string op, IComparable left, IComparable right) {

        var opr = FilterOperators.FromString(op);
        if (opr == null) throw new ArgumentException("Invalid comparison operator: {0}", op);

        return opr.Compare(left, right);
    }

    public string SqlClause(string paramName) =>  $"{ColumnName} {Op} @{paramName.Replace("@", "")}";

    [JsonIgnore]
    public DbType DbType => ParameterValue == null// || ParameterValue.GetType() == typeof(string[])
        ? DbType.Object
        : DbTypeMap.DbTypeFor(ParameterValue.GetType());

    [JsonIgnore]
    public string Description => $"{ColumnName} {Op} {ParameterValue}";
}