using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Max : AggregatorBase
	{
		public override string SqlFunction {
			get { return string.Format("max({0})", ColumnName); }
		}

		public decimal? Maximum { get; private set; }
		public override string SqlFunctionName { get { return "Max"; } }

		public Max(string columnName) {
			ColumnName = columnName;
		}

		public override void UpdateFor(IDataReader record) {
			var val = GetValue(record).ToString().ToDecimal();
			Maximum = Maximum == null ? val : Math.Max(Maximum.Value, val);
		}

		public override decimal Value { get { return Maximum.HasValue ? Maximum.Value : 0; } } 
	}
}