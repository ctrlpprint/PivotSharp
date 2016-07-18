using System;
using System.Data;

namespace PivotSharp.Aggregators
{
	public abstract class AggregatorBase : IAggregator
	{
		public abstract string SqlFunctionName { get; }
		public virtual string ColumnName { get; set; }

		public abstract void UpdateFor(IDataReader record);

		public virtual void Push(IDataReader record) {
			Count += record.ContainsKey("Count")
				? record["Count"].ToString().ToInt() 
				: 1;
			UpdateFor(record);
		}

		public abstract decimal Value { get; }
		public virtual string FormattedValue { get { return Value.ToString("N2"); } }
		public virtual int Count { get; private set; }
		public virtual bool HasEntries { get { return Count > 0; } }
	}
}