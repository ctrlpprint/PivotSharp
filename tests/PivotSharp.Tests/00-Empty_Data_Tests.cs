using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Tests;

public class Empty_Data_Tests
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

    }

    [Test]
    public void Can_Handle_Empty_Data() {
        var config = new PivotConfig()
        {
            Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [new AggregatorDef { FunctionName = "Count" }]

        };
		pivot = PivotTable.Create(config, new List<ObscureShape>());
        
        Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(0));
        Assert.That(pivot.Rows.Count(), Is.EqualTo(0));
        Assert.That(pivot.Cols.Count(), Is.EqualTo(0));
    }

    [Test]
    public void Can_Handle_Empty_RowSet() {
        var config = new PivotConfig()
        {
            Cols = ["Color"],
            Aggregators = [new AggregatorDef { FunctionName = "Count" }]

        };
		pivot = PivotTable.Create(config, source);
		
		
        Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(3));
        Assert.That(pivot.Rows.Count(), Is.EqualTo(0));
        Assert.That(pivot.Cols.Count(), Is.EqualTo(2));
        Assert.That(pivot.Cols.Single(r => r.FlattenedKey == "blue").Value, Is.EqualTo(2));
        Assert.That(pivot.Cols.Single(r => r.FlattenedKey == "red").Value, Is.EqualTo(1));
    }

    [Test]
    public void Can_Handle_Empty_ColSet() {
        var config = new PivotConfig()
        {
            Rows = ["Color"],
            Aggregators = [new AggregatorDef { FunctionName = "Count" }]
        };
		pivot = PivotTable.Create(config, source);
		
		
        Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(3));
        Assert.That(pivot.Rows.Count(), Is.EqualTo(2));
        Assert.That(pivot.Rows.Single(r => r.FlattenedKey == "blue").Value, Is.EqualTo(2));
        Assert.That(pivot.Rows.Single(r => r.FlattenedKey == "red").Value, Is.EqualTo(1));
        Assert.That(pivot.Cols.Count(), Is.EqualTo(0));
    }
}
