using System;
using System.Collections.Generic;
using System.Linq;
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

		private Func<IAggregator> aggregator = null;
		public Func<IAggregator> Aggregator {
			get {
				if (aggregator == null && AggregatorName.Any()) {
					aggregator = FromString(AggregatorName[0], AggregatorName.Length > 1 ? AggregatorName[1] : null);
				}
				return aggregator;
			}
			set {
				aggregator = value;
				AggregatorName = aggregator != null
					? new[] { aggregator().SqlFunctionName, aggregator().ColumnName }
					: new string[] { };
			}
		}
			
		[JsonProperty()]
		public IList<Filter> Filters { get; set; }

		// Support Json deserialization, and Model Binding.
		// Because the Model Binder will try to fill the array element by element, it's better to make this effectively the backing field,
		// and make Aggregator the derived property.
		// Also, this needs to be public to work with the model binder.
		[JsonProperty]
		public string[] AggregatorName { get; set; }


		[JsonProperty]
		public bool FillTable { get; set; }

		[JsonProperty]
		public ConfigurationErrorHandlingMode ErrorMode { get; set; }

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



		public PivotConfig() {
			Rows = new List<string>();
			Cols = new List<string>();
			Filters = new List<Filter>();
		}


	}
}