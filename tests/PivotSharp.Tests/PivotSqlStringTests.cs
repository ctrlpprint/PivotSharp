using System.Collections.Generic;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp.Tests;

[TestFixture]
public class PivotSqlStringTests
{

    [Test]
    public void Can_Generate_Count_Query() {
        var config = new PivotConfig()
        {
			TableName = "ObscureShapes",
			Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [new AggregatorDef { FunctionName = "Count" }]
		};

        var sqlString = new PivotSqlString(config);
        const string expected = "select Shape, Color, count(*) as Count from ObscureShapes group by Shape, Color";
        Assert.That(sqlString.ToString(), Is.EqualTo(expected));
    }

    [Test]
    public void Can_Generate_Sum_Query() {
        var config = new PivotConfig()
        {
			TableName = "ObscureShapes",
			Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [new AggregatorDef { FunctionName = "Sum", ColumnName = "Value" }]
        };

        var sqlString = new PivotSqlString(config);
        // It will add a Count to the select for various purposes including providing support for Overall Avg
        const string expected = "select Shape, Color, sum(Value) as Sum_Value, count(*) as Count from ObscureShapes group by Shape, Color";
        Assert.That(sqlString.ToString(), Is.EqualTo(expected));

    }

    [Test]
    public void Can_Generate_Query_With_Multiple_Aggregations() {
        var config = new PivotConfig()
        {
			TableName = "ObscureShapes",
			Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [
                new () { FunctionName = "Sum", ColumnName = "Value" },
                new () { FunctionName = "Min", ColumnName = "Value" }
            ]
        };

        var sqlString = new PivotSqlString(config);
        // It will add a Count to the select for various purposes including providing support for Overall Avg
        const string expected = "select Shape, Color, sum(Value) as Sum_Value, min(Value) as Min_Value, count(*) as Count from ObscureShapes group by Shape, Color";
        Assert.That(sqlString.ToString(), Is.EqualTo(expected));

    }

    [Test]
    public void Can_Generate_Filtered_Query() {
        var config = new PivotConfig()
        {
			TableName = "ObscureShapes",
			Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [new() { FunctionName = "Sum", ColumnName = "Value" }],
            Filters = [new("Border", "=", "dotted")]
        };

        var sqlString = new PivotSqlString(config);
        const string expected = "select Shape, Color, sum(Value) as Sum_Value, count(*) as Count from ObscureShapes where Border = @param0 group by Shape, Color";
        Assert.That(sqlString.ToString(), Is.EqualTo(expected));

    }

    [Test]
    public void Can_Generate_Query_With_Multiple_Filters() {
        var config = new PivotConfig()
        {
			TableName = "ObscureShapes",
			Rows = ["Shape"],
            Cols = ["Color"],
            Aggregators = [new() { FunctionName = "Sum", ColumnName = "Value" }],
            Filters = [
                new ("Border", "<>", "dotted"),
                    new ("Border", "<>", "dashed"),
                ]
        };

        var sqlString = new PivotSqlString(config);
        const string expected = "select Shape, Color, sum(Value) as Sum_Value, count(*) as Count " +
        "from ObscureShapes where Border <> @param0 and Border <> @param1 group by Shape, Color";
        Assert.That(sqlString.ToString(), Is.EqualTo(expected));
    }
}