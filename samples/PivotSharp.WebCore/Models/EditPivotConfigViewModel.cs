using PivotSharp.Filters;

namespace PivotSharp.WebCore.Models;

public class EditPivotConfigViewModel
{
    public PivotConfig Config { get; set; } = new();
    public IList<FilterOperator> FilterOperators { get; set; } = [];
    public IList<string> Aggregators { get; set; } = [];
    public IEnumerable<Column> Columns { get; set; } = [];
}