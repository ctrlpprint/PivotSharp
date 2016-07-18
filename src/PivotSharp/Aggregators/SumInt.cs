using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class SumInt : AggregatorBase
	{
		public decimal SumTotal { get; private set; }
		public override string SqlFunctionName { get { return "Sum"; } }

		public SumInt(string columnName) {
			ColumnName = columnName;
			SumTotal = 0;
		}

		public override void UpdateFor(IDataReader record) {
			var val = record[ColumnName].ToString().ToInt();
			SumTotal += val;
		}

		public override decimal Value { get { return SumTotal; } }

		public override string FormattedValue { get { return Value.ToString("N0"); } }
	}
}