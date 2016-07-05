using System.Collections.Generic;

namespace System.Data
{
	public static class IDataReaderExtensions
	{
		public static IEnumerable<string> GetColumnNames(this IDataReader reader) {
			// http://stackoverflow.com/a/2738741/424788
			for (var i = 0; i < reader.FieldCount; i++)
				yield return reader.GetName(i);
		} 
	}
}