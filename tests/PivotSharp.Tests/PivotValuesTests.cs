using System.Data;
using NUnit.Framework;

namespace PivotSharp.Tests;

[TestFixture]
public class PivotValuesTests
{
    private readonly PivotValues pivotValues = [];

    [SetUp]
    public void SetUp() {

        pivotValues.Add(flattenedRowKey:"Dotted,Line", flattenedColKey:"Red,Circle", aggregators:[new TestAggregator(1)]);
        pivotValues.Add(flattenedRowKey:"Dotted,Line", flattenedColKey:"Red,Square", aggregators:[new TestAggregator(2)]);
        pivotValues.Add(flattenedRowKey:"Dashed,Line", flattenedColKey:"Red,Circle", aggregators:[new TestAggregator(3)]);
        pivotValues.Add(flattenedRowKey:"Dotted,Line", flattenedColKey:"Red,Triangle", aggregators:[new TestAggregator(4)]);
    }

    [Test]
    public void CanIndex() {

        Assert.That(pivotValues["Dotted,Line"], Is.Not.Empty);
        Assert.That(pivotValues["Dotted,Line"]["Red,Triangle"].Aggregators[0].Value, Is.EqualTo(4));

    }

    private class TestAggregator : IAggregator
    {
        public string SqlFunction => $"Sum({ColumnName})";

        public string Alias { get; private set; }
        public string SqlFunctionName { get; private set; }
        public string ColumnName { get; set; }
        public void Push(IDataReader record) { }

        public decimal Value { get; set; }
        public string FormattedValue { get; private set; }
        public int Count { get; private set; }
        public bool HasEntries { get; private set; }

        public TestAggregator(int value) => Value = value;
    }

}