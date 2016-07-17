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
		private readonly IList<Sale> source = new List<Sale> {
				new Sale(new DateTime(2016,01,30), "Books", "The Hobbit", "USA", 10M ),
				new Sale(new DateTime(2016,01,30), "DVDs", "Star Wars", "USA", 25M ),

				new Sale(new DateTime(2016,01,31), "Books", "The Hobbit", "USA", 30M ),
				new Sale(new DateTime(2016,01,31), "DVDs", "Star Wars", "USA", 25M ),
				new Sale(new DateTime(2016,01,31), "DVDs", "Spectre", "USA", 25M ),
				new Sale(new DateTime(2016,01,31), "DVDs", "Star Wars", "USA", 25M ),

				new Sale(new DateTime(2016,02,01), "Books", "The Hobbit", "USA", 30M ),
				new Sale(new DateTime(2016,02,01), "Books", "LOTR", "USA", 30M ),
	
				new Sale(new DateTime(2016,02,02), "DVDs", "Spectre", "USA", 30M ),
				new Sale(new DateTime(2016,02,02), "Books", "The Hobbit", "USA", 15M ),
				new Sale(new DateTime(2016,02,02), "Blu-Ray", "Star Wars", "USA", 50M ),
			};

		[SetUp]
		public void SetUp() {
			reader = new EnumerableDataReader(source);			
		}

		[Test]
		public void Can_Count() {
			var config = new PivotConfig() {
				Rows = new[] {"Category"},
				Cols = new[] {"Country"},
				Aggregators = new List<AggregatorDef>() { new AggregatorDef() { FunctionName = "Count"} },
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(5, pivot.Values["Books"]["USA"][0].Value);
			Assert.AreEqual(11, pivot.GrandTotal[0].Value);
		}

		[Test]
		public void Can_Sum() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregator = new AggregatorDef() { FunctionName = "Sum", ColumnName = "Value" },
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(115M, pivot.Values["Books"]["USA"][0].Value);
			Assert.AreEqual(295M, pivot.GrandTotal[0].Value);
		}

		[Test]
		public void Can_Average() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregator = new AggregatorDef() { FunctionName = "Ave", ColumnName = "Value" },
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(23.0M, pivot.Values["Books"]["USA"][0].Value);
			Assert.AreEqual(26.82M, Math.Round(pivot.GrandTotal[0].Value,2));
		}

		[Test]
		public void Can_Min() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregator = new AggregatorDef() { FunctionName = "Min", ColumnName = "Value" },
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(10M, pivot.Values["Books"]["USA"][0].Value);
			Assert.AreEqual(10M, pivot.GrandTotal[0].Value);
		}

		[Test]
		public void Can_Max() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregators = new List<AggregatorDef>() { new AggregatorDef() { FunctionName = "Max", ColumnName = "Value" } },
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(30M, pivot.Values["Books"]["USA"][0].Value);
			Assert.AreEqual(50M, pivot.GrandTotal[0].Value);
		}

		[Test]
		public void Can_Combine() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregators = new List<AggregatorDef>() {
					new AggregatorDef() { FunctionName = "Min", ColumnName = "Value" },
					new AggregatorDef() { FunctionName = "Max", ColumnName = "Value" }
				},
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(10M, pivot.Values["Books"]["USA"][0].Value);
			Assert.AreEqual(10M, pivot.GrandTotal[0].Value);
			Assert.AreEqual(30M, pivot.Values["Books"]["USA"][1].Value);
			Assert.AreEqual(50M, pivot.GrandTotal[1].Value);
		}


	}
}