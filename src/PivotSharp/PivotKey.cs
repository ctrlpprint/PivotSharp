using System;
using System.Collections.Generic;
using System.Linq;

namespace PivotSharp;

/// <summary>
/// A Key in the format "RowKey1,RowKey2|ColKey1,ColKey2"
/// </summary>
public class PivotKey
{
    public IList<string> RowKeys { get; set; } = [];
    public IList<string> ColKeys { get; set; } = [];

    public string FlattenedRowKey {
        get { return string.Join(PivotTable.KeyDelimiter, RowKeys); }
        set { RowKeys = [.. value.Split([PivotTable.KeyDelimiter], StringSplitOptions.RemoveEmptyEntries)]; }
    }

    public string FlattenedColKey {
        get { return string.Join(PivotTable.KeyDelimiter, ColKeys); }
        set { ColKeys = [.. value.Split([PivotTable.KeyDelimiter], StringSplitOptions.RemoveEmptyEntries)]; }
    }

    public override string ToString() {
        return $"{FlattenedRowKey}|{FlattenedColKey}";
    }

    #region Comparison operators
    public bool Equals(PivotKey other) {
        if (RowKeys.Count != other.RowKeys.Count || ColKeys.Count != other.ColKeys.Count) return false;
        if (RowKeys.Except(other.RowKeys).Any() || other.RowKeys.Except(RowKeys).Any()) return false;
        if (ColKeys.Except(other.ColKeys).Any() || other.ColKeys.Except(ColKeys).Any()) return false;
        return true;
    }

    public override bool Equals(object obj) {
        if (ReferenceEquals(null, obj)) return false;
        if (ReferenceEquals(this, obj)) return true;
        if (obj.GetType() != this.GetType()) return false;
        return Equals((PivotKey)obj);
    }

    public static bool operator ==(PivotKey key1, PivotKey key2) => key1 is not null && key1.Equals(key2);
    public static bool operator !=(PivotKey key1, PivotKey key2) => !(key1 == key2);

    public override int GetHashCode() {
        unchecked { return (ToString().GetHashCode() * 397); }
    }
    #endregion

}