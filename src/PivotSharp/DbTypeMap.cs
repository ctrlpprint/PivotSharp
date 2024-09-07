using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace PivotSharp;

public static class DbTypeMap
{
    private static readonly IList<DbTypeMapping> typeMap;

    public static DbType DbTypeFor(Type t) => typeMap.Single(map => map.Type == t).DbType;

    public static Type TypeFor(DbType t) =>
        typeMap.Any(map => map.DbType == t && map.IsRequired)
            ? typeMap.First(map => map.DbType == t && map.IsRequired).Type
            : null;

    public static DbType DbTypeFor(string dataType) {
        var match = typeMap.SingleOrDefault(m => m.IsRequired && m.DataType == dataType);
        return match != null ? match.DbType : DbType.Object;
    }

    private static DbTypeMapping Map(Type type, DbType dbType, string dbTypeName, bool IsRequired) => new()
        {
            DataType = dbTypeName,
            DbType = dbType,
            Type = type,
            IsRequired = IsRequired
        };

    static DbTypeMap() =>

        // Cribbed from https://github.com/StackExchange/dapper-dot-net/blob/aca965c3bff2defa2ec175fc8f59df173e6d6e3b/Dapper/SqlMapper.cs 
        // Updated for https://msdn.microsoft.com/en-us/library/cc716729(v=vs.110).aspx
        typeMap = new List<DbTypeMapping>() {
                Map(typeof (byte), DbType.Byte, "tinyint", true),
                Map(typeof (sbyte), DbType.SByte, "", true),
                Map(typeof (short), DbType.Int16, "smallint", true),
                Map(typeof (ushort), DbType.UInt16, "", true),
                Map(typeof (int), DbType.Int32, "int", true),
                Map(typeof (uint), DbType.UInt32, "", true),
                Map(typeof (long), DbType.Int64, "bigint", true),
                Map(typeof (ulong), DbType.UInt64, "", true),
                Map(typeof (float), DbType.Single, "real", true),
                Map(typeof (double), DbType.Double, "float", true),
                Map(typeof (decimal), DbType.Decimal, "decimal", true),
                Map(typeof (bool), DbType.Boolean, "bit", true),
                Map(typeof (string), DbType.String, "nvarchar", true),
                Map(typeof (char), DbType.StringFixedLength, "nchar", true),
                Map(typeof (Guid), DbType.Guid, "uniqueidentifier", true),
                Map(typeof (DateTime), DbType.DateTime, "datetime", true),
                Map(typeof (DateTimeOffset), DbType.DateTimeOffset, "datetimeoffset", true),
                Map(typeof (byte[]), DbType.Binary, "image", true),

                Map(typeof (byte?), DbType.Byte, "tinyint", false),
                Map(typeof (sbyte?), DbType.SByte, "", false),
                Map(typeof (short?), DbType.Int16, "smallint", false),
                Map(typeof (ushort?), DbType.UInt16, "", false),
                Map(typeof (int?), DbType.Int32, "int", false),
                Map(typeof (uint?), DbType.UInt32, "", false),
                Map(typeof (long?), DbType.Int64, "bigint", false),
                Map(typeof (ulong?), DbType.UInt64, "", false),
                Map(typeof (float?), DbType.Single, "real", false),
                Map(typeof (double?), DbType.Double, "float", false),
                Map(typeof (decimal?), DbType.Decimal, "decimal", false),
                Map(typeof (bool?), DbType.Boolean, "bit", false),
                Map(typeof (char?), DbType.StringFixedLength, "", false),
                Map(typeof (Guid?), DbType.Guid, "uniqueidentifier", false),
                Map(typeof (DateTime?), DbType.DateTime, "datetime", false),
                Map(typeof (DateTimeOffset?), DbType.DateTimeOffset, "datetimeoffset", false),
            };
}
