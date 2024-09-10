using System.Collections.Generic;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;
using PivotSharp.Filters;

namespace PivotSharp.Tests;

/// <summary>
/// Create the simplest possible sum pivot
/// </summary>
/// <remarks>
/// Output should look like:
/// -------------------------------------------
/// |                  | //color              |
/// | //shape          |   blue   |   Totals  |
/// -------------------------------------------
/// | circle           |       3  |        4  |
/// | triangle         |       3  |        3  |        
/// -------------------------------------------
/// | Totals           |       6  |        6  |
/// -------------------------------------------
/// </remarks>

[TestFixture]
public class String_Filter_Tests
{
	private PivotTable pivot;
    private EnumerableDataReader reader;
    private readonly IList<ObscureShape> source = [
        new("blue", "circle", 1),
        new("blue", "circle", 2),
        new("blue", "triangle", 3),
        new("red", "circle", 1),
        new("red", "triangle", 3)
    ];

    [SetUp]
    public void Init() {
        var config = new PivotConfig()
        {
            Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [new AggregatorDef { FunctionName = "SumInt", ColumnName = "Lines" }],
            Filters = [new Filter("Color", "=", "blue")]
        };
		pivot = PivotTable.Create(config, source);
		
	}


	[Test]
    public void Can_Filter_On_String_Equality() {
        Assert.That(pivot.Cells["circle"]["blue"][0].Value, Is.EqualTo(3));
        Assert.That(pivot.Cells["triangle"]["blue"][0].Value, Is.EqualTo(3));

        Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(6));
    }

    [Ignore("Not implemented yet")]
    public void Can_Filter_On_String_Inequality() {

    }
}