using PivotSharp.Writers;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Razor.TagHelpers;

namespace PivotSharp.TagHelpers;

public class PivotTableTagHelper : TagHelper
{
    public PivotTable? Model { get; set; }

    public IHtmlTableMap? Map { get; set; }

    public override async Task ProcessAsync(TagHelperContext context, TagHelperOutput output)
    {
        output.TagName = null; // We'll build our own

        if (Model == null)
        {
            output.SuppressOutput();
        }
        else
        {
            output.Content.SetHtmlContent(Model.BuildHtmlTable(map: Map));
        }

    }
}
