using System;
using System.Collections.Generic;
using System.Data;

namespace PivotSharp
{
	public class DbTypeMap
	{
		private static Dictionary<Type, DbType> typeMap;

		public static DbType DbTypeFor(Type t) {
			return typeMap[t];
		}

		static DbTypeMap() {
			// Cribbed from https://github.com/StackExchange/dapper-dot-net/blob/aca965c3bff2defa2ec175fc8f59df173e6d6e3b/Dapper/SqlMapper.cs 
			typeMap = new Dictionary<Type, DbType>();
			typeMap[typeof (byte)] = DbType.Byte;
			typeMap[typeof (sbyte)] = DbType.SByte;
			typeMap[typeof (short)] = DbType.Int16;
			typeMap[typeof (ushort)] = DbType.UInt16;
			typeMap[typeof (int)] = DbType.Int32;
			typeMap[typeof (uint)] = DbType.UInt32;
			typeMap[typeof (long)] = DbType.Int64;
			typeMap[typeof (ulong)] = DbType.UInt64;
			typeMap[typeof (float)] = DbType.Single;
			typeMap[typeof (double)] = DbType.Double;
			typeMap[typeof (decimal)] = DbType.Decimal;
			typeMap[typeof (bool)] = DbType.Boolean;
			typeMap[typeof (string)] = DbType.String;
			typeMap[typeof (char)] = DbType.StringFixedLength;
			typeMap[typeof (Guid)] = DbType.Guid;
			typeMap[typeof (DateTime)] = DbType.DateTime;
			typeMap[typeof (DateTimeOffset)] = DbType.DateTimeOffset;
			typeMap[typeof (byte[])] = DbType.Binary;
			typeMap[typeof (byte?)] = DbType.Byte;
			typeMap[typeof (sbyte?)] = DbType.SByte;
			typeMap[typeof (short?)] = DbType.Int16;
			typeMap[typeof (ushort?)] = DbType.UInt16;
			typeMap[typeof (int?)] = DbType.Int32;
			typeMap[typeof (uint?)] = DbType.UInt32;
			typeMap[typeof (long?)] = DbType.Int64;
			typeMap[typeof (ulong?)] = DbType.UInt64;
			typeMap[typeof (float?)] = DbType.Single;
			typeMap[typeof (double?)] = DbType.Double;
			typeMap[typeof (decimal?)] = DbType.Decimal;
			typeMap[typeof (bool?)] = DbType.Boolean;
			typeMap[typeof (char?)] = DbType.StringFixedLength;
			typeMap[typeof (Guid?)] = DbType.Guid;
			typeMap[typeof (DateTime?)] = DbType.DateTime;
			typeMap[typeof (DateTimeOffset?)] = DbType.DateTimeOffset;
		}
	}
}