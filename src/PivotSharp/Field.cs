namespace PivotSharp;

public class Field
{
    // public int Position { get; set; }
    public string Name { get; set; } = "";

    public string DataType { get; set; } = "";

    public string HtmlInputType => DataType switch
    {
        "varchar" or "nvarchar" => "text",
        "int" or "decimal" => "number",
        "date" or "datetime" => "date",
        _ => "text",
    };
}