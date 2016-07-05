using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Count : IAggregator
	{
		public Type ReturnedType = typeof (int);

		public string SqlFunctionName { get { return "Count"; } }
		public string ColumnName { get; set; }

		public int RunningCount { get; private set; }

		public Count() {
			RunningCount = 0;
		}

		public void Push(IDataReader row) {
			RunningCount++;
			HasEntries = true;
		}

		public decimal Value {
			get { return RunningCount; }
		}

		public string FormattedValue { get { return Value.ToString("N0"); } }
		public bool HasEntries { get; private set; }
	}
}