using System.Data;
using NUnit.Framework;

namespace PivotSharp.Tests
{
	[TestFixture]
	public class PivotValuesTests
	{
		private readonly PivotValues pivotValues = new PivotValues();

		[SetUp]
		public void SetUp() {

			pivotValues.Add(
				key: new PivotKey { FlattenedRowKey = "Dotted,Line", FlattenedColKey = "Red,Circle" }, 
				value: new IAggregator[]{new TestAggregator(1)});
			pivotValues.Add(
				key: new PivotKey { FlattenedRowKey = "Dotted,Line", FlattenedColKey = "Red,Square"},
				value: new IAggregator[] { new TestAggregator(2) });
			pivotValues.Add(
				key: new PivotKey { FlattenedRowKey = "Dashed,Line", FlattenedColKey = "Red,Circle"},
				value: new IAggregator[] { new TestAggregator(3) });
			pivotValues.Add(
				key: new PivotKey { FlattenedRowKey = "Dotted,Line", FlattenedColKey = "Red,Triangle"},
				value: new IAggregator[] { new TestAggregator(4) });
		}

		[Test]
		public void CanIndex() {

			Assert.IsNotEmpty(pivotValues["Dotted,Line"]);
			Assert.AreEqual(4, pivotValues["Dotted,Line"]["Red,Triangle"][0].Value);

		}

		private class TestAggregator : IAggregator  {
			public string SqlFunctionName { get; private set; }
			public string ColumnName { get; set; }
			public void Push(IDataReader record) { }

			public decimal Value { get; set; }
			public string FormattedValue { get; private set; }
			public int Count { get; private set; }
			public bool HasEntries { get; private set; }

			public TestAggregator(int value) {
				Value = value;
			}
		}
		 
	}
}