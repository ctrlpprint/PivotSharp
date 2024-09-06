using PivotSharp.Filters;

namespace PivotSharp.WebCore.Models;

public class CustomReportViewModel
{
    public int Id { get; set; } 
    public string? Name { get; set; }
    public PivotConfig Config { get; set; } = new();
    public IList<FilterOperator> FilterOperators { get; set; } = [];
    public IList<string> Aggregators { get; set; } = [];
    public IEnumerable<Field> Fields { get; set; } = [];
}