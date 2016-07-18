using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Max : AggregatorBase
	{
		public decimal? Maximum { get; private set; }
		public override string SqlFunctionName { get { return "Max"; } }

		public Max(string columnName) {
			ColumnName = columnName;
		}

		public override void UpdateFor(IDataReader record) {
			var val = record[ColumnName].ToString().ToDecimal();
			Maximum = Maximum == null ? val : Math.Max(Maximum.Value, val);
		}

		public override decimal Value { get { return Maximum.HasValue ? Maximum.Value : 0; } } 
	}
}