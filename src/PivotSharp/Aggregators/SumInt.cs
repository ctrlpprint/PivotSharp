using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class SumInt : IAggregator
	{
		public string ColumnName { get; set; }
		public decimal SumTotal { get; private set; }

		public string SqlFunctionName { get { return "Sum"; } }


		public SumInt(string columnName) {
			ColumnName = columnName;
			SumTotal = 0;
		}

		public void Push(IDataReader record) {
			var val = record[ColumnName];
			int valToAdd;
			if (int.TryParse(val.ToString(), out valToAdd)) {
				SumTotal += valToAdd;
			}
			HasEntries = true;
		}

		public decimal Value { get { return SumTotal; } }

		public string FormattedValue { get { return Value.ToString("N0"); } }
		public bool HasEntries { get; private set; }
	}
}