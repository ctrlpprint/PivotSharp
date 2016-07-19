using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Sum : AggregatorBase
	{
		public override string SqlFunction {
			get { return string.Format("sum({0})", ColumnName); }
		}

		public decimal SumTotal { get; private set; }
		public override string SqlFunctionName { get { return "Sum"; } }

		public Sum(string columnName) {
			ColumnName = columnName;
			SumTotal = 0;
		}

		public override void UpdateFor(IDataReader record) {
			SumTotal += GetValue(record).ToString().ToDecimal();
		}

		public override decimal Value { get { return SumTotal; } }
	}
}