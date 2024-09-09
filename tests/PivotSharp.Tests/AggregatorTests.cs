using System;
using System.Collections.Generic;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Tests
{
    [TestFixture]
	public class AggregatorTests
	{
		private PivotTable pivot;
		private EnumerableDataReader reader;
		private readonly IList<Sale> source = [
			new (new DateTime(2016,01,30), "Books", "The Hobbit", "USA", 10M ),
			new (new DateTime(2016,01,30), "DVDs", "Star Wars", "USA", 25M ),

			new (new DateTime(2016,01,31), "Books", "The Hobbit", "USA", 30M ),
			new (new DateTime(2016,01,31), "DVDs", "Star Wars", "USA", 25M ),
			new (new DateTime(2016,01,31), "DVDs", "Spectre", "USA", 25M ),
			new (new DateTime(2016,01,31), "DVDs", "Star Wars", "USA", 25M ),

			new (new DateTime(2016,02,01), "Books", "The Hobbit", "USA", 30M ),
			new (new DateTime(2016,02,01), "Books", "LOTR", "USA", 30M ),
	
			new (new DateTime(2016,02,02), "DVDs", "Spectre", "USA", 30M ),
			new (new DateTime(2016,02,02), "Books", "The Hobbit", "USA", 15M ),
			new (new DateTime(2016,02,02), "Blu-Ray", "Star Wars", "USA", 50M ),
		];

        [SetUp]
        public void SetUp() => reader = new EnumerableDataReader(source);

        [Test]
		public void Can_Count() {
			var config = new PivotConfig() {
				Rows = ["Category"],
				Cols = ["Country"],
				Aggregators = [new () { FunctionName = "Count"}],
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.That(pivot.Cells["Books"]["USA"][0].Value, Is.EqualTo(5));
			Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(11));
		}

		[Test]
		public void Can_Sum() {
			var config = new PivotConfig()
			{
				Rows = ["Category"],
				Cols = ["Country"],
				Aggregators = [new (){ FunctionName = "Sum", ColumnName = "Value" }
			],
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.That(pivot.Cells["Books"]["USA"][0].Value, Is.EqualTo(115M));
			Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(295M));
		}

		[Test]
		public void Can_Average() {
			var config = new PivotConfig() {
				Rows = ["Category"],
				Cols = ["Country"],
				Aggregators = [new () { FunctionName = "Ave", ColumnName = "Value" }],
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.That(pivot.Cells["Books"]["USA"][0].Value, Is.EqualTo(23.0M));
			Assert.That(Math.Round(pivot.GrandTotal[0].Value, 2), Is.EqualTo(26.82M));
		}

		[Test]
		public void Can_Min() {
			var config = new PivotConfig() {
				Rows = ["Category"],
				Cols = ["Country"],
				Aggregators = [new () { FunctionName = "Min", ColumnName = "Value" }],
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.That(pivot.Cells["Books"]["USA"][0].Value, Is.EqualTo(10M));
			Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(10M));
		}

		[Test]
		public void Can_Max() {
			var config = new PivotConfig() {
				Rows = ["Category"],
				Cols = ["Country"],
				Aggregators = [new () { FunctionName = "Max", ColumnName = "Value" }],
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.That(pivot.Cells["Books"]["USA"][0].Value, Is.EqualTo(30M));
			Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(50M));
		}

		[Test]
		public void Can_Combine() {
			var config = new PivotConfig() {
				Rows = ["Category"],
				Cols = ["Country"],
				Aggregators = [
					new () { FunctionName = "Min", ColumnName = "Value" },
					new () { FunctionName = "Max", ColumnName = "Value" }
				],
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.That(pivot.Cells["Books"]["USA"][0].Value, Is.EqualTo(10M));
			Assert.That(pivot.GrandTotal[0].Value, Is.EqualTo(10M));
			Assert.That(pivot.Cells["Books"]["USA"][1].Value, Is.EqualTo(30M));
			Assert.That(pivot.GrandTotal[1].Value, Is.EqualTo(50M));
		}


	}
}