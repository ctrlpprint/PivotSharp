using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Ave : AggregatorBase
	{
		public override string SqlFunction {
			// Collate the Sum then divide by Count
			get { return string.Format("sum({0})", ColumnName); }
		}

		public decimal SumTotal { get; private set; }

		// Collate the Sum, and then divide by Count.
		public override string SqlFunctionName { get { return "Sum"; } }


		public Ave(string columnName) {
			ColumnName = columnName;
		}

		public override void UpdateFor(IDataReader record) {
			SumTotal += GetValue(record).ToString().ToDecimal();
		}

		public override decimal Value { get { return Count > 0 ? Decimal.Divide(SumTotal, (decimal)Count) : 0; } }
	}
}