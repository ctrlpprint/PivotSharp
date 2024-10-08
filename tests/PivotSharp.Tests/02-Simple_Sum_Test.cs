﻿using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.Connectors;
using PivotSharp.DataReader;

namespace PivotSharp.Tests;

/// <summary>
/// Create the simplest possible sum pivot
/// </summary>
/// <remarks>
/// Output should look like:
/// --------------------------------------------------
/// |                  | //color                     |
/// | //shape          |   blue   |  red  |  Totals  |
/// --------------------------------------------------
/// | circle           |       3  |     1 |       4  |
/// | triangle         |          |     3 |       3  |        
/// --------------------------------------------------
/// | Totals           |       3  |     4 |       7  |
/// --------------------------------------------------
/// </remarks>
[TestFixture]
public class Simple_Sum_Test
{
    private PivotTable pivot;
    private IPivotDataSourceConnector connector;
    private readonly IList<ObscureShape> source = [
        new("blue", "circle", 1),
        new("blue", "circle", 2),
        new("red", "circle", 1),
        new("red", "triangle", 3)
    ];

    [SetUp]
    public void Init() {
        var config = new PivotConfig()
        {
            Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [new () { FunctionName = "SumInt", ColumnName = "Lines" }]
        };

		pivot = PivotTable.Create(config, source);
		

	}

	[Test]
    public void Can_Generate_Headers() {
        Assert.That(pivot.Cols.ToList().Count(), Is.EqualTo(2));
        Assert.That(pivot.Cols[0].FlattenedKey, Is.EqualTo("blue"));
        Assert.That(pivot.Cols[1].FlattenedKey, Is.EqualTo("red"));

        Assert.That(pivot.Rows.ToList().Count(), Is.EqualTo(2));
        Assert.That(pivot.Rows[0].FlattenedKey, Is.EqualTo("circle"));
        Assert.That(pivot.Rows[1].FlattenedKey, Is.EqualTo("triangle"));
    }

    [Test]
    public void Can_Generate_Elements() {
        Assert.That(pivot.Cells.Count(), Is.EqualTo(3));
        //			Assert.AreEqual(3, pivot.Values.Sum(kvp => kvp.Value.Count()));
    }

    [Test]
    public void Can_Generate_Sums() {
        Assert.That(pivot.Cells["circle"]["blue"][0].Value, Is.EqualTo(3));
        Assert.That(pivot.Cells["circle"]["red"][0].Value, Is.EqualTo(1));
        Assert.That(pivot.Cells["triangle"]["red"][0].Value, Is.EqualTo(3));

        Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(7));
    }
}
