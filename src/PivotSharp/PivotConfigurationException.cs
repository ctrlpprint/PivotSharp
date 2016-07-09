using System;
using System.Collections.Generic;

namespace PivotSharp
{
	public class PivotConfigurationException : Exception
	{
		public string Message { get; set; }
		public IEnumerable<string> InvalidColumns { get; set; }

		public PivotConfigurationException(string message, IEnumerable<string> invalidColumns) {
			Message = message;
			InvalidColumns = invalidColumns;
		}
	}
}