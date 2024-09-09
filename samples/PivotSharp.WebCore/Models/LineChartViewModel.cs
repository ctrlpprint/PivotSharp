namespace PivotSharp.WebCore.Models;

public class LineChartViewModel : IChartViewModel
{
    public string Title { get; set; } = "";
    public IEnumerable<string> Labels { get; set; } = [];
    public IEnumerable<IEnumerable<decimal>> Series { get; set; } = [];
    public IEnumerable<string> Legends { get; set; } = [];
    public int Index { get; set; }

    public static LineChartViewModel TopRows(PivotTable table, int lines, int aggregatorIndex)
    {
        var aggregator = table.Config.Aggregators[aggregatorIndex];

        var top = table.Cells
            .Rows
            .Select(row => new
            {
                FlattenedKey = row.Key,
                Row = row.Value.NaturalSort(c => c.Key),
                RowSum = table.Rows.Single(r => r.FlattenedKey == row.Key).Values.Skip(aggregatorIndex).Single()
            })
            .OrderByDescending(row => row.RowSum)
            .Take(lines)
            .ToList();

        return new LineChartViewModel
        {
            Labels = table.Cols.Select(r => r.FlattenedKey).NaturalSort(r => r),
            Legends = top.Select(r => r.FlattenedKey),

            // Issues with gaps in data...
            Series = top.Select(row => row.Row.Select(v => v.Value[aggregatorIndex].Value)),
            Title = aggregator.ToString()
        };
    }

    public static LineChartViewModel TopCols(PivotTable table, int lines, int aggregatorIndex)
    {
        var aggregator = table.Config.Aggregators[aggregatorIndex];

        var top = table.Cells
            .Cols
            .Select(col => new
            {
                FlattenedKey = col.Key,
                Row = col.Value.NaturalSort(c => c.Key),
                RowSum = table.Cols.Single(r => r.FlattenedKey == col.Key).Values.Skip(aggregatorIndex).Single()
            })
            .OrderByDescending(col => col.RowSum)
            .Take(lines)
            .ToList();

        return new LineChartViewModel
        {
            Labels = table.Rows.Select(r => r.FlattenedKey).NaturalSort(r => r),
            Legends = top.Select(r => r.FlattenedKey),

            // Issues with gaps in data...
            Series = top.Select(col => col.Row.Select(v => v.Value[aggregatorIndex].Value)),
            Title = aggregator.ToString()
        };
    }

}