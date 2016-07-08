using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public class Min : IAggregator
	{
		public string ColumnName { get; set; }
		public decimal? Minimum { get; private set; }
		public string SqlFunctionName { get { return "Min"; } }

		public Min(string columnName) {
			ColumnName = columnName;
		}

		public void Push(IDataReader record) {
			var val = record[ColumnName].ToString().ToDecimal();
			Minimum = Minimum == null ? val : Math.Min(Minimum.Value, val);
			HasEntries = true;
		}

		public decimal Value { get { return Minimum.HasValue ? Minimum.Value : 0; } }

		public string FormattedValue { get { return Value.ToString("N2"); } }
		public bool HasEntries { get; private set; }
 
	}
}