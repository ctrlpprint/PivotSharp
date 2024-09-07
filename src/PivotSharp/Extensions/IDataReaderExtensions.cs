using System.Collections.Generic;
using System.Linq;

namespace System.Data
{
	public static class IDataReaderExtensions
	{
		public static IEnumerable<string> GetColumnNames(this IDataReader reader) {
			// http://stackoverflow.com/a/2738741/424788
			for (var i = 0; i < reader.FieldCount; i++)
				yield return reader.GetName(i);
		}

        public static bool ContainsKey(this IDataReader reader, string name) =>
			GetColumnNames(reader).Any(c => c == name);
    }
}