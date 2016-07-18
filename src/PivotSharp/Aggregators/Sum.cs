using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Sum : AggregatorBase
	{
		public decimal SumTotal { get; private set; }
		public override string SqlFunctionName { get { return "Sum"; } }

		public Sum(string columnName) {
			ColumnName = columnName;
			SumTotal = 0;
		}

		public override void UpdateFor(IDataReader record) {
			var val = record[ColumnName];
			SumTotal += val.ToString().ToDecimal();
		}

		public override decimal Value { get { return SumTotal; } }
	}
}