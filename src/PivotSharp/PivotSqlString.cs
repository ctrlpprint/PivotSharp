using System.Collections;
using System.Collections.Generic;
using System.Linq;
using PivotSharp.Aggregators;

namespace PivotSharp;

public class PivotSqlString
{
    private readonly PivotConfig config;
    private readonly string tableName;
	private List<AggregatorDef> aggregationFunctions;

	public IEnumerable<string> GroupingColumns => config.Rows.Union(config.Cols);

	private string AggregateFunction(IAggregator aggregator) => $"{aggregator.SqlFunction} as {aggregator.Alias}";

	public IEnumerable<string>  Aggregations => aggregationFunctions.Select(a => AggregateFunction(a.Create()));

	public string SelectList => string.Join(", ", GroupingColumns.Any() ? GroupingColumns.Union(Aggregations) : Aggregations);

    public string WhereClause => config.Filters.Any()
        ? $"where {string.Join(" and ", values: config.Filters.Select(f => f.SqlClause("param" + config.Filters.IndexOf(f))))}"
        : "";

    public string GroupByClause => GroupingColumns.Any() 
        ? $"group by {string.Join(", ", GroupingColumns)}" 
        : "";

    public PivotSqlString(PivotConfig config) {
        this.config = config;
        this.tableName = config.TableName;


        aggregationFunctions = config.Aggregators.ToList();

        // Make sure we always have a Count(*). We'll use this for identifing length of drilldowns, as well as support for Avg.
        // Also, guarantee that we have at least one aggregation.
        if (!aggregationFunctions.Any(a => a.FunctionName == "Count" && string.IsNullOrEmpty(a.ColumnName)))
            aggregationFunctions.Add(new AggregatorDef { FunctionName = "Count" });

    }

	/// <summary>
	/// select {groupingColumns},{Aggregations} from {tableName} where {FilterColumns} group by {GroupingColumns}
	/// </summary>
	public override string ToString() =>
        string.Join(" ", [$"select {SelectList} from {tableName}", $"{WhereClause}", $"{GroupByClause}"]).Replace("  ", " ");

}