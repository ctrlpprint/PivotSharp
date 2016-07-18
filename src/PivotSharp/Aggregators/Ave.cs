using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Ave : AggregatorBase
	{
		public decimal SumTotal { get; private set; }

		// Collate the Sum, and then divide by Count.
		public override string SqlFunctionName { get { return "Sum"; } }


		public Ave(string columnName) {
			ColumnName = columnName;
		}

		public override void UpdateFor(IDataReader record) {
			var val = record[ColumnName].ToString().ToDecimal();
			SumTotal += val;			
		}

		public override decimal Value { get { return Count > 0 ? Decimal.Divide(SumTotal, (decimal)Count) : 0; } }
	}
}