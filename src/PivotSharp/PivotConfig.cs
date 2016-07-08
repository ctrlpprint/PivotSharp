using System;
using System.Collections.Generic;
using Newtonsoft.Json;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp
{
	[JsonObject(MemberSerialization.OptIn)]
	public class PivotConfig
	{
		[JsonProperty]
		public IList<string> Rows { get; set; }
		[JsonProperty]
		public IList<string> Cols { get; set; }
		public Func<IAggregator> Aggregator { get; set; }

		[JsonProperty]
		protected string[] AggregatorName {
			get {
				if (Aggregator == null) return new string[]{};
				var aggregator = Aggregator();
				return new []{aggregator.SqlFunctionName, aggregator.ColumnName};
			}
			set {
				if(value.Length < 2) throw new ArgumentException("Require at least one element");
				Aggregator = FromString(value[0], value.Length > 1 ? value[1] : null);
			} 
		}

		private Func<IAggregator> FromString(string name, string columnName) {

			switch (name) {
				case "Count":	return () => new Count();
				case "Sum":		return () => new Sum(columnName);
				case "Ave":
				case "Avg":		return () => new Ave(columnName);
				case "Min":		return () => new Min(columnName);
				case "Max":		return () => new Max(columnName);
			}
			throw new NotImplementedException();
		}

		[JsonProperty]
		public bool FillTable { get; set; }

		[JsonProperty()]
		public IList<Filter> Filters { get; set; }


		public PivotConfig() {
			Rows = new List<string>();
			Cols = new List<string>();
			Filters = new List<Filter>();
		}


	}
}