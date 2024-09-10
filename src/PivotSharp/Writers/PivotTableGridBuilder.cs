using System;
using System.Collections.Generic;
using System.Linq;

namespace PivotSharp.Writers;
public class PivotTableGridBuilder
{
	public static Table BuildTable(PivotTable pt) {

		var table = new Table();
		table.Head.Rows = BuildHead(pt);
		table.Body.Rows = BuildBody(pt);
		table.Foot.Rows = BuildFoot(pt);
		return table;
	}
	public static IList<Tr> BuildHead(PivotTable pt) {

		var rows = new List<Tr>();
		// == Config Details ==
		rows.Add(Tr([
			Td (comment: "Display Row Field Names",
				colSpan: pt.Rows.Fields.Count,
				rowSpan: pt.Cols.Fields.Count + pt.Config.Aggregators.Count > 1 ? 2 : 1,
				text: string.Join(" // ", pt.Rows.Fields)),

			Td (comment: "Display Column Field Names",
				colSpan: (pt.Cols.Count + 1) * pt.Config.Aggregators.Count,
				text: string.Join(" // ", pt.Cols.Fields)),
		]));

		// == Headers ==
		if (pt.Cols.Any()) {
			// One Header Row per Column Field.
			foreach (var colField in pt.Cols.Fields) {
				var tr = new Tr();
				foreach (var header in pt.Cols.GetHeaderGroupsForField(colField)) {
					tr.Cells.Add(Th(
						comment: "Column Header",
						colSpan: header.Count() * pt.Config.Aggregators.Count,
						text: header.First().Headers.First(h => h.FieldName == colField).Name
					));
				}
                // Top row only
                if (pt.Cols.Fields.IndexOf(colField) == 0) {
                    foreach (var aggregation in pt.Config.Aggregators) {
                        tr.Cells.Add(Th(
                            comment: "Totals Header",
                            rowSpan: pt.Cols.Fields.Count + 1,
                            text: aggregation.ToString()
                        ));
                    }
                }
                rows.Add(tr);
			}

			// == Aggregators ==
			if (pt.Config.Aggregators.Count > 1) {
				var tr = new Tr();
				var lowestColField = pt.Cols.Fields[pt.Cols.Fields.Count - 1];
				foreach (var header in pt.Cols.GetHeaderGroupsForField(lowestColField)) {
					foreach (var aggregation in pt.Config.Aggregators) {
						tr.Cells.Add(Th(text: aggregation.ToString()));
					}
				}
				rows.Add(tr);
			}
		}
		if (!pt.Cols.Any()) {
			// == Aggregators ==
			rows.Add(Tr(
				pt.Config.Aggregators.Select(a => Td(text: a.ToString()))
			));

		}
		return rows;
	}

	private static IList<Tr> BuildBody(PivotTable pt) {
		var rows = new List<Tr>();

		// One row for each row header
		foreach (var row in pt.Rows.NaturalSort(r => r.FlattenedKey)) {
			var tr = new Tr();
			// One header for each row field
			foreach (var rowField in pt.Rows.Fields) {
				var header = row.Headers.Single(h => h.FieldName == rowField);
				if (header.GroupPosition == 0) {
					tr.Cells.Add(Th(text: header.Name, rowSpan: header.GroupCount));
				}
			}
			// Cells
			foreach (var col in pt.Cols.NaturalSort(c => c.FlattenedKey)) {
				// Iterate through aggregators
				for (int idx = 0; idx < pt.Config.Aggregators.Count; idx++) {

					var cell = pt.Cell(row.FlattenedKey, col.FlattenedKey);
					if (cell != null && cell.Aggregators[idx].HasEntries) {
						tr.Cells.Add(new Td {
							FlattenedRowKey = row.FlattenedKey,
							FlattenedColumnKey = col.FlattenedKey,
							Value = cell.Aggregators[idx].Value,
							BackingRowCount = cell.Aggregators[idx].Count, // ?
							Aggregation = pt.Config.Aggregators[idx].FunctionName
						});
					} else {
						tr.Cells.Add(Td(""));
					}
				}
			}
			// Row Totals
			for (int idx = 0; idx < pt.Config.Aggregators.Count; idx++) {
				tr.Cells.Add(Th(
					value: row.Aggregators[idx].Value,
					aggregation: pt.Config.Aggregators[idx].FunctionName
				));
			}
			rows.Add(tr);
		}
		return rows;
	}

	private static IList<Tr> BuildFoot(PivotTable pt) {
		var rows = new List<Tr>();
		var tr = new Tr();
		tr.Cells.Add(Td(
			colSpan: pt.Rows.Fields.Count,
			text: "Grand Total"
			));

		foreach (var col in pt.Cols.NaturalSort(c => c.FlattenedKey)) {
			for (int idx = 0; idx < pt.Config.Aggregators.Count; idx++) {
				tr.Cells.Add(Th(
					value: col.Aggregators[idx].Value,
					aggregation: pt.Config.Aggregators[idx].FunctionName));
			}
		} 
		for(int idx = 0; idx < pt.Config.Aggregators.Count; idx++) {
			tr.Cells.Add(Th(
				value: pt.GrandTotal.Aggregators[idx].Value, 
				aggregation: pt.Config.Aggregators[idx].FunctionName));
		}
		rows.Add(tr);
		return rows;
	}


	private static Tr Tr() => new Tr();
	private static Tr Tr(IEnumerable<ICell> cells) => new Tr(cells.ToList());
	private static Th Th(string text, string comment = "", int colSpan = 1, int rowSpan = 1) {
		return new Th
		{
			Comment = comment,
			ColSpan = colSpan,
			RowSpan = rowSpan,
			Text = text
		};
	}

    private static Th Th(decimal value, string aggregation, string comment = "") {
        return new Th
        {
            Comment = comment,
			Aggregation = aggregation,
            Value = value			
        };
    }

    private static Td Td(string text, string comment = "", int colSpan = 1, int rowSpan = 1) {
		return new Td
		{
			Comment = comment,
			ColSpan = colSpan,
			RowSpan = rowSpan,
			Text = text
		};
	}
    private static Td Td(decimal value, string aggregation, string comment = "") {
        return new Td
        {
            Comment = comment,
            Aggregation = aggregation,
            Value = value
        };
    }

}
