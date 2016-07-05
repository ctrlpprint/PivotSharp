using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Sum : IAggregator
	{
		public string ColumnName { get; set; }
		public decimal SumTotal { get; private set; }
		public string SqlFunctionName { get { return "Sum"; } }


		public Sum(string columnName) {
			ColumnName = columnName;
			SumTotal = 0;
		}

		public void Push(IDataReader record) {
			var val = record[ColumnName];
			SumTotal += val.ToString().ToDecimal();
			HasEntries = true;
		}

		public decimal Value { get { return SumTotal; } }

		public string FormattedValue { get { return Value.ToString("N2"); } }
		public bool HasEntries { get; private set; }
	}
}