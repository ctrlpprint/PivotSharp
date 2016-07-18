using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Count : AggregatorBase
	{
		public override string SqlFunctionName { get { return "Count"; } }

		public Count() { }

		public override void UpdateFor(IDataReader record) { }

		public override decimal Value {
			get { return Count; }
		}

		public string FormattedValue { get { return Value.ToString("N0"); } }
	}
}