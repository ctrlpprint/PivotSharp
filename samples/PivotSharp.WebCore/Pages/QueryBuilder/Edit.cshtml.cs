using Dapper;
using Dapper.Contrib.Extensions;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using PivotSharp.Aggregators;
using PivotSharp.Connectors;
using PivotSharp.Filters;
using PivotSharp.WebCore.Models;
using PivotSharp.WebCore.Pages.Shared;
using System.Text.Json;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class EditModel : PageModel
{
    private readonly string connectionString;

    public _PivotFieldModel FieldModelFor(Field column) => 
        new _PivotFieldModel
        {
            Column = column,
            Aggregators = AggregatorFunctions.Options,
            FilterOperators = FilterOperators.All().ToList()
        };

    public _PivotFieldModel FieldModelFor(string columnName) => 
        FieldModelFor(this.Report.Fields.First(c => c.Name == columnName));


    public EditModel(IConfiguration configuration) {
        connectionString = configuration.GetConnectionString("DefaultConnection")!;
    }
    public CustomReportViewModel Report { get; private set; }

    public IActionResult OnGet(int? id) {
        var connector = new PivotDbConnector(new PivotConfig { TableName = "World_Data" },connectionString);
        var columns = connector.GetTableStructure();

        Report = new CustomReportViewModel
        {
            Fields = columns,
            Config = new PivotConfig(),
            FilterOperators = FilterOperators.All().ToList(),
            Aggregators = AggregatorFunctions.Options

        };
        if (id != null) {
            using var conn = new SqlConnection(connectionString);
            var report = conn.QueryFirstOrDefault<CustomReport>(
                sql: "select * from Custom_Reports where id=@id",
                param: new { id = id.Value }
                );
            Report.Config = JsonSerializer.Deserialize<PivotConfig>(report!.ConfigJson)!;
            Report.Id = report.Id;
            Report.Name = report.Name;
        }

        return Page();
    }

    public async Task<IActionResult> OnPost([FromBody] string config) {
        // TODO: Should be able to define the parameter as a PivotConfig type
        // and rely on built-in deserialization. However deserialization is failing
        // when called this way (showing up as a ModelState error)
        var report = JsonSerializer.Deserialize<CustomReport>(config);
        using var conn = new SqlConnection(connectionString);
        long id = await conn.InsertAsync(report);
        return Redirect($"/QueryBuilder/Edit/{id}");
    }

    // For autosuggesting fiter values
    //public ActionResult OnGetColumnValues(string columnName) {

    //    var connector = new PivotDbConnector(connectionString);

    //    // Protect against arbitrary input
    //    var columnList = connector.GetTableStructure("World_Data");
    //    if (!columnList.Any(l => l.Name.Equals(columnName, StringComparison.CurrentCultureIgnoreCase)))
    //        throw new Exception("Could not find Column name");

    //    var columns = connector.GetColumnValues("World_Data", columnName, 300)
    //        .Select(c => c.Key);

    //    return new JsonResult(columns);
    //}

}
