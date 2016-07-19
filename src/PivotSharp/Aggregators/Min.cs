using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Min : AggregatorBase
	{
		public override string SqlFunction {
			get { return string.Format("min({0})", ColumnName); }
		}

		public decimal? Minimum { get; private set; }
		public override string SqlFunctionName { get { return "Min"; } }

		public Min(string columnName) {
			ColumnName = columnName;
		}

		public override void UpdateFor(IDataReader record) {
			var val = GetValue(record).ToString().ToDecimal();
			Minimum = Minimum == null ? val : Math.Min(Minimum.Value, val);
		}

		public override decimal Value { get { return Minimum.HasValue ? Minimum.Value : 0; } }

 
	}
}