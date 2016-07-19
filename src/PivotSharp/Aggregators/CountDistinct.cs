using System;
using System.Collections.Generic;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class CountDistinct : AggregatorBase
	{
		private IList<string> DistinctValues { get; set; }
		public int Distinct { get; private set; }

		public CountDistinct() {
			DistinctValues = new List<string>();
		}

		public CountDistinct(string columnName):this() {
			ColumnName = columnName;
		}

		public override string SqlFunction {
			get { return string.Format("count(distinct {0})", ColumnName); }
		}
		public override string SqlFunctionName { get { return "Count"; } }

		public override void UpdateFor(IDataReader record) {
			if (record.ContainsKey(Alias))
				Distinct += record[Alias].ToString().ToInt();
			else {
				var val = record[ColumnName].ToString();
				if (!DistinctValues.Contains(val)) {
					DistinctValues.Add(val);
				}
			}

		}

		public override decimal Value {
			get { return Math.Max(Distinct, DistinctValues.Count); }
		}

		public override string FormattedValue { get { return Value.ToString("N0"); } }
	}
}