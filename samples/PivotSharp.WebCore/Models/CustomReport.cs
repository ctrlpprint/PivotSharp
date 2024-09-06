using Dapper.Contrib.Extensions;
using System.Text.Json;

namespace PivotSharp.WebCore.Models;

[Table("Custom_reports")]
public class CustomReport
{
    [Key]
    public int Id { get; set; }

    public string? Name { get; set; }

    public string ConfigJson { get; set; } = "";

    [Computed]
    public PivotConfig PivotConfig { 
        get { return JsonSerializer.Deserialize<PivotConfig>(ConfigJson)!;  }
        set { ConfigJson = JsonSerializer.Serialize(value); }
    }
}
