using System.Linq;
using PivotSharp.Aggregators;

namespace PivotSharp
{
	public class PivotSqlString
	{
		private readonly PivotConfig config;
		private readonly string tableName;
		private readonly string groupingColumns;
		private readonly string aggregations;

		public string SelectList {
			get { return string.Format("{0}, {1}", groupingColumns, aggregations); }
		}

		private string AggregateFunction(IAggregator aggregator) {

			return string.Format("{0} as {1}",
				aggregator.SqlFunction,
				aggregator.Alias
				);
		}

		// select {groupingColumns},{aggregateColumns} from {tableName} where {whereClause} group by {groupingColumns}
		public override string ToString() {
			return 
				"select " + SelectList
				+ " from " + tableName
				+ (config.Filters.Any() ? " where " + WhereClause : "")
				+ " group by " + groupingColumns;
		}

		public string WhereClause {
			get { return string.Join(" and ", config.Filters.Select(f => f.SqlClause("param" + config.Filters.IndexOf(f)))); }
		}

		public PivotSqlString(PivotConfig config, string tableName) {
			this.config = config;
			this.tableName = tableName;

			groupingColumns = string.Join(", ", config.Rows.Union(config.Cols));

			var aggregationFunctions = config.Aggregators.ToList();

			// Make sure we always have a Count(*). We'll use this for identifing length of drilldowns, as well as support for Avg.
			if(!aggregationFunctions.Any(a => a.FunctionName == "Count" && string.IsNullOrEmpty(a.ColumnName)))
				aggregationFunctions.Add(new AggregatorDef{FunctionName = "Count"});

			aggregations = string.Join(", ", aggregationFunctions.Select(a => AggregateFunction(a.Create())));
		}
	}
}