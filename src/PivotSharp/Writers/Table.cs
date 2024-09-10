using System.Collections.Generic;

namespace PivotSharp.Writers;
public class Table
{
	public THead Head { get; set; } = new();
	public TBody Body { get; set; } = new();
	public TFoot Foot { get; set; } = new();
}

public class THead 
{
	public ICollection<Tr> Rows { get; set; } = [];
}

public class TBody {
	public IList<Tr> Rows { get; set; } = [];
}

public class TFoot{
	public IList<Tr> Rows { get; set; } = [];
}

public class Tr {
	public IList<ICell> Cells { get; set; } = [];
	public Tr() { }
	public Tr(IList<ICell> cells) {
		this.Cells = cells;
	}
}

public class Th :Cell {

}

public class Td : Cell {

}

public class Cell : ICell
{
	public int ColSpan { get; set; } = 1;
	public int RowSpan { get; set; } = 1;
    public decimal? Value { get; set; }
    public string? Text { get; set; }
    public string FlattenedRowKey { get; set; } = "";
	public string FlattenedColumnKey { get; set; } = "";
	public int BackingRowCount { get; set; }
	public string Comment { get; set; } = "";
	public string? Aggregation { get; set; }
}

public interface ICell {
	public int ColSpan { get; }
	public int RowSpan { get; }
	public decimal? Value { get; }
	public string? Text { get; }
	public string FlattenedRowKey { get; }
	public string FlattenedColumnKey { get; }
	public int BackingRowCount { get; }
	public string Comment { get; }
	public string? Aggregation { get; }
}

