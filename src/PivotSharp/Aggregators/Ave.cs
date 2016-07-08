using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Ave : IAggregator
	{
		public string ColumnName { get; set; }
		public decimal SumTotal { get; private set; }
		public int Count { get; private set; }

		public string SqlFunctionName { get { return "Avg"; } }


		public Ave(string columnName) {
			ColumnName = columnName;
		}

		public void Push(IDataReader record) {
			var val = record[ColumnName].ToString().ToDecimal();
			SumTotal += val;
			Count++;
			HasEntries = true;
		}

		public decimal Value { get { return Count > 0 ? Decimal.Divide(SumTotal, (decimal)Count) : 0; } }

		public string FormattedValue { get { return Value.ToString("N2"); } }
		public bool HasEntries { get; private set; }
	}
}