using Dapper;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.Data.SqlClient;
using PivotSharp.Aggregators;
using PivotSharp.Filters;
using PivotSharp.WebCore.Models;
using System.Data;

namespace PivotSharp.WebCore.Pages.QueryBuilder;

public class DataBasePageModel : PageModel
{
	protected readonly string connectionString;

	public DataBasePageModel(IConfiguration configuration) {
		connectionString = configuration.GetConnectionString("DefaultConnection")!;
	}

    protected SqlDataReader GetReader() {
        var conn = new SqlConnection(connectionString);
        var cmd = new SqlCommand("select * from World_Data", conn);
        conn.Open();
        return cmd.ExecuteReader(CommandBehavior.CloseConnection);
    }

    protected async Task<IEnumerable<CustomReport>> GetCustomReports() {
        using var conn = new SqlConnection(connectionString);
        return await conn.QueryAsync<CustomReport>("select * from Custom_Reports");
    }
    protected async Task<CustomReport?> GetCustomReport(int id) {
        using var conn = new SqlConnection(connectionString);
        return await conn.QueryFirstOrDefaultAsync<CustomReport>("select * from Custom_Reports where ID = @id", new { id });
    }

}
