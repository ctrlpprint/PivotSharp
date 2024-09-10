using System.Linq;
using NUnit.Framework;

namespace PivotSharp.Tests;

[TestFixture]
public class SqlPivotTests
{

    [Test]
    public void Can_Generate_Query_With_Multiple_Aggregations() {
        var config = new PivotConfig()
        {
            TableName = "QueryResultStubs",
			Rows = ["Shape"],
            Cols = ["Color"],
            ErrorMode = ConfigurationErrorHandlingMode.Ignore,
            Aggregators = [
                new () { FunctionName = "Sum", ColumnName = "Value" },
                new () { FunctionName = "Min", ColumnName = "Value" }
            ]
        };

        var sqlString = new PivotSqlString(config);
        // Expect a Count to be added to the select (for various purposes, including providing support for Overall Avg)
        const string expected = "select Shape, Color, sum(Value) as Sum_Value, min(Value) as Min_Value, count(*) as Count " +
            "from QueryResultStubs group by Shape, Color";
        Assert.That(sqlString.ToString(), Is.EqualTo(expected));

        var source = new[] {
                new QueryResultStub {  Shape = "Square", Color = "Red", Sum_Value = 100.00M, Min_Value = 50M, Count = 10},
                new QueryResultStub {  Shape = "Square", Color = "Blue", Sum_Value = 110.00M, Min_Value = 40M, Count = 5},
            }.ToList();

        var pivot = PivotTable.Create(config, source);
        pivot.Pivot();

        Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(210M));
        Assert.That(pivot.GrandTotal[1].Value, Is.EqualTo(40M));

    }


    class QueryResultStub
    {
        public string Shape { get; set; }
        public string Color { get; set; }
        public decimal Sum_Value { get; set; }
        public decimal Min_Value { get; set; }
        public int Count { get; set; }
    }

}