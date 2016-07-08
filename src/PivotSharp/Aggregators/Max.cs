using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Max : IAggregator
	{
		public string ColumnName { get; set; }
		public decimal? Maximum { get; private set; }
		public string SqlFunctionName { get { return "Max"; } }

		public Max(string columnName) {
			ColumnName = columnName;
		}

		public void Push(IDataReader record) {
			var val = record[ColumnName].ToString().ToDecimal();
			Maximum = Maximum == null ? val : Math.Max(Maximum.Value, val);
			HasEntries = true;
		}

		public decimal Value { get { return Maximum.HasValue ? Maximum.Value : 0; } }

		public string FormattedValue { get { return Value.ToString("N2"); } }
		public bool HasEntries { get; private set; }
 
	}
}