using System;
using NUnit.Framework;

namespace PivotSharp.Tests
{
	/// <summary>
	/// 
	/// </summary>
	/// <remarks>
	/// What would a normal table API look like?
	/// -------------------------------------------------------------
	/// |              | circle   |  square   | triangle |  Totals  |
	/// -------------------------------------------------------------
	/// |  dotted      |       1  |           |       1  |        2 |
	/// |  dashed      |          |         3 |       1  |        4 |
	/// |  solid       |       2  |           |       2  |        4 |
	/// -------------------------------------------------------------
	/// | Totals       |       3  |         3 |       4  |       10 |
	/// ------------------------------------------------------------- 
	/// 
	/// table.RowHeaders[0] --> "dotted"
	/// table.ColHeaders[0] --> "circle"
	/// table.Cols[0].Total --> 3
	/// table.Cols[0].Header --> "circle"

	/// table.Values[0,0] -- > 1
	/// table.Values[1,1] -- > 3
	/// table.Values[2,2] -- > 4
	/// table.Values["circle", "solid"] --> 2
	/// table.Values["circle"] --> 3
	/// 
	/// Or:
	/// table.Values[0][0]  --> 1
	/// table.Values[1][1] -- > 3
	/// table.Values[2][2] -- > 4
	/// table.Values["circle"]["solid"] --> 2
	/// 
	/// Or:
	/// table[0,0] -- > 1
	/// table["circle", "solid"] --> 2
	/// table[0][0]  --> 1
	/// table["circle"]["solid"] --> 2 (Cell value)
	/// 
	/// The following are nice, but are potentially ambiguous calls.
	/// table["circle"] --> 3 (Col total)
	/// table["dotted"] --> 3 (Row total)
	/// What if a particular heading appears as both a row  and a column?
	/// 
	/// An alternative
	/// table["circle"]["Totals"] --> 3 (Col total)
	/// table["Totals"]["dotted"] --> 3 (Row total)
	/// but this doesn't feel very intuititive. 
	/// 
	/// What about:
	/// table[0,0] -- > 1
	/// table[0] --> { Header: "circle", Values: {1, 0, 2}, Total: 3 }
	/// or
	/// table[0] --> { Header: "circle", Values: {dotted: 1, dashed:0, solid:2}, Total: 3 }
	/// 
	/// =====================================================================================
	/// What would a Pivot Table API ideally look like?
	/// 
	/// ------------------------------------------------------------------------
	/// |                         | // Color / Shape                           |
	/// |                         |   blue   |          red         |          |
	/// | // Border / Shadow      | circle   |  circle   | triangle |  Totals  |
	/// ------------------------------------------------------------------------
	/// | dashed    | outside     |       1  |           |       1  |        2 |
	/// | dotted    | inside      |          |         4 |       1  |        5 |
	/// |           | outside     |       2  |           |       3  |        5 |
	/// ------------------------------------------------------------------------
	/// | Totals                  |       3  |         4 |       5  |       12 |
	/// ------------------------------------------------------------------------
	/// 
	/// table["blue,circle"]["dotted,outside"] --> 2
	/// table["blue,circle"]["dotted,outside"].Value --> 2
	/// table["blue,circle"].Value --> 3
	/// 
	/// The following is nice, but only works for a column. If we tried to use the same for a row we get potential ambiguity.
	/// table["blue,circle"] 
	///		--> { Headers: {"blue", "circle"}, Values { "dashed,outside" :1, "dotted,inside":0,  "dotted,outside":2 }, Value: 3 }
	/// table["dashed","outside"]
	///		--> { Headers: {"dotted", "outside"}, Values ....
	/// 
	/// The following is unambiguous:
	/// table.Cols["blue,circle"] 
	///		--> { Headers: {"blue", "circle"}, Values { "dashed,outside" :1, "dotted,inside":0,  "dotted,outside":2 }, Value: 3 }
	/// table.Rows["dotted,outside"] 
	///		--> { Headers: {"blue", "circle"}, Values { "dashed,outside" :1, "dotted,inside":0,  "dotted,outside":2 }, Value: 3 }
	/// table.GrandTotal --> 3
	/// table.Rows[0].Header = "dashed,outside"
	/// 
	/// 
	/// =====================================================================================
	/// Multiple aggregators with no column headers:
	/// --------------------------------------------------------------
	/// | // Border / Shadow      | Count    | Sum(Value)| Ave(Value)|
	/// --------------------------------------------------------------
	/// | dashed    | outside     |       1  |         5 |      5.0  |
	/// | dotted    | inside      |       2  |        15 |		7.5  |
	/// |           | outside     |       2  |         7 |      3.5  |
	/// --------------------------------------------------------------
	/// | Totals                  |       5  |        27 |      5.4  |
	/// --------------------------------------------------------------
	/// 
	/// Multiple aggregators with column headers:
	/// ---------------------------------------------------------------------------------------------------------------------------------------
	/// |                         |   blue                           ||          red                     ||            Totals                 |
	/// | // Border / Shadow      | Count    | Sum(Value)| Ave(Value)|| Count    | Sum(Value)| Ave(Value)|| Count    | Sum(Value)| Ave(Value)|
	/// --------------------------------------------------------------
	/// | dashed    | outside     |       1  |         5 |      5.0  |...
	/// | dotted    | inside      |       2  |        15 |		7.5  |...
	/// |           | outside     |       2  |         7 |      3.5  |...
	/// --------------------------------------------------------------
	/// | Totals                  |       5  |        27 |      5.4  |...
	/// --------------------------------------------------------------
	/// 
	/// The number of columns could obviously get out of hand very quickly.
	/// </remarks>
	[TestFixture]
	public class PivotWriterTests
	{

		 
	}

}