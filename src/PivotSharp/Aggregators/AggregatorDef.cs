using System;
using Newtonsoft.Json;

namespace PivotSharp.Aggregators
{
	[JsonObject(MemberSerialization.OptIn)]
	public class AggregatorDef
	{
		[JsonProperty]
		public string FunctionName { get; set; }
		[JsonProperty]
		public string ColumnName { get; set; }

		public IAggregator Create() {
			return FromString(FunctionName, ColumnName)();
		}

		private Func<IAggregator> FromString(string name, string columnName) {

			switch (name) {
				case "Count": return () => new Count();
				case "SumInt": return() => new SumInt(columnName);
				case "Sum": return () => new Sum(columnName);
				case "Ave":
				case "Avg": return () => new Ave(columnName);
				case "Min": return () => new Min(columnName);
				case "Max": return () => new Max(columnName);
			}
			throw new NotImplementedException();
		}

		public override string ToString() {

			// HACK: Needs tidy up.
			if (ColumnName == "Count") return "Count";
			if (FunctionName == "Sum" || FunctionName == "SumInt")
				return string.Format("Total {0}", ColumnName);

			return string.Format("{0} {1}", FunctionName, ColumnName);
		}
	}
}