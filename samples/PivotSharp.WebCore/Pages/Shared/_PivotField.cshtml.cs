using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp.WebCore.Pages.Shared;

public class _PivotFieldModel
{
    public IList<FilterOperator> FilterOperators { get; set; } = [];
    public IList<string> Aggregators { get; set; } = [];

    public Field Column { get; set; } = new();

}
