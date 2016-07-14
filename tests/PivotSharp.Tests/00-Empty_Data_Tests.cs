using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Tests
{
	[TestFixture]
	public class Empty_Data_Tests
	{
		private PivotTable pivot;
		private EnumerableDataReader reader;
		private readonly IList<ObscureShape> source = new List<ObscureShape> {
				new ObscureShape("blue", "circle"),
				new ObscureShape("blue", "circle"),
				new ObscureShape("red", "triangle")
			};

		[SetUp]
		public void Init() {

		}

		[Test]
		public void Can_Handle_Empty_Data() {
			var config = new PivotConfig() {
				Rows = new[] { "Shape" },
				Cols = new[] { "Color" },
				Aggregator = new AggregatorDef { FunctionName = "Count" }

			};
			pivot = PivotTable.Create(config);
			reader = new EnumerableDataReader(new List<ObscureShape>());

			pivot.Pivot(reader);
			Assert.AreEqual(0, pivot.GrandTotal.Value);
			Assert.AreEqual(0, pivot.Rows.Count());
			Assert.AreEqual(0, pivot.Cols.Count());
		}

		[Test]
		public void Can_Handle_Empty_RowSet() {
			var config = new PivotConfig() {
				Cols = new[] { "Color" },
				Aggregator = new AggregatorDef { FunctionName = "Count" }

			};
			pivot = PivotTable.Create(config);
			reader = new EnumerableDataReader(source);

			pivot.Pivot(reader);
			Assert.AreEqual(3, pivot.GrandTotal.Value);
			Assert.AreEqual(0, pivot.Rows.Count());
			Assert.AreEqual(2, pivot.Cols.Count());
			Assert.AreEqual(2, pivot.Cols.Single(r => r.FlattenedKey == "blue").Value);
			Assert.AreEqual(1, pivot.Cols.Single(r => r.FlattenedKey == "red").Value);
		}

		[Test]
		public void Can_Handle_Empty_ColSet() {
			var config = new PivotConfig() {
				Rows = new[] { "Color" },
				Aggregator = new AggregatorDef { FunctionName = "Count" }

			};
			pivot = PivotTable.Create(config);
			reader = new EnumerableDataReader(source);

			pivot.Pivot(reader);
			Assert.AreEqual(3, pivot.GrandTotal.Value);
			Assert.AreEqual(2, pivot.Rows.Count());
			Assert.AreEqual(2, pivot.Rows.Single(r => r.FlattenedKey == "blue").Value);
			Assert.AreEqual(1, pivot.Rows.Single(r => r.FlattenedKey == "red").Value);
			Assert.AreEqual(0, pivot.Cols.Count());
		}
	}

}
