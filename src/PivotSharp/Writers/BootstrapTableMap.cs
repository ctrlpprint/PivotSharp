using System.Text;

namespace PivotSharp.Writers;
public class BootstrapTableMap : IHtmlTableMap
{
    public virtual string Map(Table table) {
        var sb = new StringBuilder();
        sb.AppendLine();
        sb.AppendLine("<table class=\"table table-bordered table-responsive\">");
        sb.AppendLine(Map(table.Head));
        sb.AppendLine(Map(table.Body));
        sb.AppendLine(Map(table.Foot));
        sb.AppendLine("</table>");
        return sb.ToString();
    }

    public virtual string Map(THead thead) {
        var sb = new StringBuilder();
        sb.AppendLine("\t<thead>");
        foreach (var row in thead.Rows) {
            sb.AppendLine(Map(row));
        }
        sb.AppendLine("\t</thead>");
        return sb.ToString();
    }

    public virtual string Map(TBody tbody) {
        var sb = new StringBuilder();
        sb.AppendLine("\t<tbody>");
        foreach (var row in tbody.Rows) {
            sb.AppendLine(Map(row));
        }
        sb.AppendLine("\t</tbody>");
        return sb.ToString();
    }

    public virtual string Map(TFoot tfoot) {
        var sb = new StringBuilder();
        sb.AppendLine("\t<tfoot>");
        foreach (var row in tfoot.Rows) {
            sb.AppendLine(Map(row));
        }
        sb.AppendLine("\t</tfoot>");
        return sb.ToString();
    }

    public virtual string Map(Tr tr) {
        var sb = new StringBuilder();
        sb.AppendLine("\t\t<tr>");
        foreach (var cell in tr.Cells) {
            sb.AppendLine(Map(cell));
        }
        sb.AppendLine("\t\t</tr>");
        return sb.ToString();
    }

    public virtual string Map(ICell cell) {
        var tag = cell is Th ? "th" : "td";
        var sb = new StringBuilder($"\t\t\t<{tag} ");
        if (cell.RowSpan > 1) sb.Append($"rowspan=\"{cell.RowSpan}\" ");
        if (cell.ColSpan > 1) sb.Append($"colspan=\"{cell.ColSpan}\" ");
        if (cell.Aggregation != null && cell.Value != null) {
            sb.Append("class =\"data-cell text-right\" ");
            sb.Append($"data-row-key=\"{cell.FlattenedRowKey}\" ");
            sb.Append($"data-col-key=\"{cell.FlattenedColumnKey}\" ");
            sb.Append($"data-cell-count=\"{cell.BackingRowCount}\" ");
        }
        sb.Append(">");
        if (cell.Value.HasValue) {
            sb.Append(cell.Value.ToString());
        } else {
            sb.Append(cell.Text);
        }
        sb.Append($"</{tag}>");

        return sb.ToString();
    }
}
