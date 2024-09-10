using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.Connectors;
using PivotSharp.DataReader;

namespace PivotSharp.Tests;

/// <summary>
/// Create the simplest possible pivot
/// </summary>
/// <remarks>
/// Output should look like:
/// --------------------------------------------------
/// |                  | //color                     |
/// | //shape          |   blue   |  red  |  Totals  |
/// --------------------------------------------------
/// | circle           |       2  |       |       2  |
/// | triangle         |          |     1 |       1  |        
/// --------------------------------------------------
/// | Totals           |       2  |     1 |       3  |
/// --------------------------------------------------
/// </remarks>
[TestFixture]
public class Simple_Count_Test
{
    private PivotTable pivot;
    private EnumerableDataReader reader;
    private readonly IList<ObscureShape> source = [
        new ("blue", "circle"),
        new ("blue", "circle"),
        new ("red", "triangle")
    ];

    [SetUp]
    public void Init() {

        var config = new PivotConfig()
        {
            Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [new AggregatorDef { FunctionName = "Count" }]
        };
		var connector = new PivotEnumerableConnector<ObscureShape>(config, source);
		pivot = PivotTable.Create(config, connector);

		pivot.Pivot();
    }

    [Test]
    public void Can_Generate_Headers() {
        Assert.That(pivot.Cols.Fields.Count, Is.EqualTo(1));
        Assert.That(pivot.Cols.Fields[0], Is.EqualTo("Color"));

        Assert.That(pivot.Cols.Count, Is.EqualTo(2));
        Assert.That(pivot.Cols[0].Headers[0].Name, Is.EqualTo("blue"));
        Assert.That(pivot.Cols[1].Headers[0].Name, Is.EqualTo("red"));

        Assert.That(pivot.Cols[0].FlattenedKey, Is.EqualTo("blue"));
        Assert.That(pivot.Cols[1].FlattenedKey, Is.EqualTo("red"));

        Assert.That(pivot.Rows.Fields.Count, Is.EqualTo(1));
        Assert.That(pivot.Rows.Fields[0], Is.EqualTo("Shape"));

        Assert.That(pivot.Rows.Count, Is.EqualTo(2));
        Assert.That(pivot.Rows[0].Headers[0].Name, Is.EqualTo("circle"));
        Assert.That(pivot.Rows[1].Headers[0].Name, Is.EqualTo("triangle"));

        Assert.That(pivot.Rows[0].FlattenedKey, Is.EqualTo("circle"));
        Assert.That(pivot.Rows[1].FlattenedKey, Is.EqualTo("triangle"));
    }

    [Test]
    public void Can_Generate_Elements() {
        Assert.That(pivot.Cells.Count(), Is.EqualTo(2));
        //Assert.AreEqual(2, pivot.Values.Sum(kvp => kvp.Value.Count()));
    }

    [Test]
    public void Can_Generate_Cell_Counts() {

        Assert.That(pivot.Cells["circle"]["blue"][0].Value, Is.EqualTo(2));
        Assert.That(pivot.Cells["triangle"]["red"][0].Value, Is.EqualTo(1));

        Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(3));
    }

    [Test]
    public void Can_Generate_Row_Counts() {
        Assert.That(pivot.Rows.Single(r => r.FlattenedKey == "circle").Value, Is.EqualTo(2));
        Assert.That(pivot.Rows.Single(r => r.FlattenedKey == "triangle").Value, Is.EqualTo(1));
    }

    [Test]
    public void Can_Generate_Col_Counts() {
        Assert.That(pivot.Cols.Single(r => r.FlattenedKey == "blue").Value, Is.EqualTo(2));
        Assert.That(pivot.Cols.Single(r => r.FlattenedKey == "red").Value, Is.EqualTo(1));
    }


    [Test]
    public void Can_Write_Table() {
        var output = PivotWriter.WriteHtmlTable(pivot);
        Assert.That(output, Is.Not.Null);
    }

    [Test]
    public void Can_Retrieve_Listing() {

        var listing = pivot.DrillDown("circle", "blue");

        Assert.That(listing.Rows.Count, Is.EqualTo(2));
        Assert.That(listing.Rows.Count, Is.EqualTo(2));
    }
}
