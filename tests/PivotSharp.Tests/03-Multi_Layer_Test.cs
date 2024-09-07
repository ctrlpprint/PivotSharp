using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Tests;

/// <summary>
/// Create the simplest possible muilt-layer pivot
/// </summary>
/// <remarks>
/// Output should look like:
/// -------------------------------------------------------------
/// |                         | // Color / Shape                |
/// |                         |   blue   |      red  |  Totals  |
/// | // Border / Shadow      | circle   | triangle  |  Totals  |
/// -------------------------------------------------------------
/// | dashed    | outside     |       1  |           |       1  |
/// | dotted    | inside      |          |         1 |       1  |        
/// |           | outside     |       2  |           |       2  |        
/// -------------------------------------------------------------
/// | Totals                  |       3  |         1 |       4  |
/// -------------------------------------------------------------
/// </remarks>
[TestFixture]
public class Multi_Layer_Test
{
    private PivotTable pivot;
    private EnumerableDataReader reader;
    private readonly IList<ObscureShape> source = [
        new("blue", "circle", "dotted", "outside"),
        new("blue", "circle", "dotted", "outside"),
        new("blue", "circle", "dashed", "outside"),
        new("red", "triangle", "dotted", "inside")
    ];

    [SetUp]
    public void Init() {

        var config = new PivotConfig()
        {
            Rows = ["Color", "Shape"],
            Cols = ["Border", "Shadow"],
            Aggregators = [new AggregatorDef { FunctionName = "Count" }]
        };

        reader = new EnumerableDataReader(source);

        pivot = PivotTable.Create(config);
        pivot.Pivot(reader);
    }

    [Test]
    public void Can_Generate_Headers() {
        Assert.That(pivot.Cols.Count(), Is.EqualTo(3));
        Assert.That(pivot.Cols[0].FlattenedKey, Is.EqualTo("dotted,outside"));
        Assert.That(pivot.Cols[1].FlattenedKey, Is.EqualTo("dashed,outside"));
        Assert.That(pivot.Cols[2].FlattenedKey, Is.EqualTo("dotted,inside"));

        Assert.That(pivot.Rows.Count(), Is.EqualTo(2));
        Assert.That(pivot.Rows[0].FlattenedKey, Is.EqualTo("blue,circle"));
        Assert.That(pivot.Rows[1].FlattenedKey, Is.EqualTo("red,triangle"));
    }

    [Test]
    public void Can_Generate_Elements() {
        // To iterate the collection of cells, need to go through two layers of dictionary.
        Assert.That(pivot.Values.Count(), Is.EqualTo(3));
        //Assert.AreEqual(3, pivot.Values.Sum(kvp => kvp.Value.Count()));
    }

    [Test]
    public void Can_Generate_Counts() {
        Assert.That(pivot.Values["blue,circle"]["dotted,outside"][0].Value, Is.EqualTo(2));
        Assert.That(pivot.Values["blue,circle"]["dashed,outside"][0].Value, Is.EqualTo(1));
        Assert.That(pivot.Values["red,triangle"]["dotted,inside"][0].Value, Is.EqualTo(1));

        Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(4));
    }
}
