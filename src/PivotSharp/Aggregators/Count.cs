using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Count : AggregatorBase
	{
		public override string SqlFunction {
			get { return string.Format("count({0})", string.IsNullOrEmpty(ColumnName) ? "*": ColumnName); }
		}
		public override string SqlFunctionName { get { return "Count"; } }

		public Count() { }

		public override void UpdateFor(IDataReader record) { }

		public override decimal Value {
			get { return Count; }
		}

		public override string FormattedValue { get { return Value.ToString("N0"); } }
	}
}