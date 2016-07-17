using System.Linq;

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
			const string template = "{0}({1}) as {2}";

			return (string.IsNullOrEmpty(aggregator.ColumnName))
				? string.Format(template,	aggregator.SqlFunctionName,		"*",							Bracket(aggregator.SqlFunctionName))
				: string.Format(template,	aggregator.SqlFunctionName,		Bracket(aggregator.ColumnName),	Bracket(aggregator.ColumnName));
		}

		// select {groupingColumns},{aggregateColumns} from {tableName} where {whereClause} group by {groupingColumns}
		public override string ToString() {
			return 
				"select " + SelectList
				+ " from " + Bracket(tableName)
				+ (config.Filters.Any() ? " where " + WhereClause : "")
				+ " group by " + groupingColumns;
		}

		private string Bracket(string str) {
			return "[" + str + "]";
		}

		public string WhereClause {
			get { return string.Join(", ", config.Filters.Select(f => f.SqlClause("param" + config.Filters.IndexOf(f)))); }
		}

		public PivotSqlString(PivotConfig config, string tableName) {
			this.config = config;
			this.tableName = tableName;

			groupingColumns = string.Join(", ", config.Rows.Union(config.Cols).Select(Bracket));
			aggregations = string.Join(", ", config.Aggregators.Select(a => AggregateFunction(a.Create())));
		}
	}
}