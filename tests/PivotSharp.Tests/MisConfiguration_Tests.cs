using System;
using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;
using PivotSharp.Filters;

namespace PivotSharp.Tests
{
	[TestFixture]
	public class MisConfiguration_Tests
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
				new Sale(new DateTime(2016,02,02), "DVS", "Star Wars", "USA", 30M ),
			};

		[Test]
		public void Can_Throw_On_Incorrect_Filter_Column() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregators = new List<AggregatorDef>(){ new AggregatorDef() { FunctionName = "SumInt", ColumnName = "Value" }},
				ErrorMode = ConfigurationErrorHandlingMode.Throw,
				Filters = new Filter[] {
					new Filter("ThisIsntAColumnName", "=", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);
			pivot = PivotTable.Create(config);

			var ex = Assert.Throws<PivotConfigurationException>(() => pivot.Pivot(reader));
			Assert.AreEqual(1, ex.InvalidColumns.Count());
			Assert.AreEqual("ThisIsntAColumnName", ex.InvalidColumns.First());

		}

		[Test]
		public void Can_Ignore_And_Report_Incorrect_Filter_Column() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregators = new List<AggregatorDef>() { new AggregatorDef() { FunctionName = "SumInt", ColumnName = "Value" } },
				ErrorMode = ConfigurationErrorHandlingMode.Ignore,
				Filters = new Filter[] {
					new Filter("ThisIsntAColumnName", "=", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);
			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(1, pivot.InvalidColumns.Count());
			Assert.AreEqual("ThisIsntAColumnName", pivot.InvalidColumns.First());
			Assert.AreEqual(275M, pivot.GrandTotal[0].Value); // Sum of all rows

		}

		[Test]
		public void Can_Throw_On_Incorrect_Row_Column() {
			var config = new PivotConfig() {
				Rows = new[] { "Category", "ThisIsntAColumnName" },
				Cols = new[] { "Country" },
				Aggregators = new List<AggregatorDef>() { new AggregatorDef() { FunctionName = "SumInt", ColumnName = "Value" } },
				ErrorMode = ConfigurationErrorHandlingMode.Throw,
				Filters = new Filter[] {
					new Filter("Date", "=", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);
			pivot = PivotTable.Create(config);

			var ex = Assert.Throws<PivotConfigurationException>(() => pivot.Pivot(reader));
			Assert.AreEqual(1, ex.InvalidColumns.Count());
			Assert.AreEqual("ThisIsntAColumnName", ex.InvalidColumns.First());

		}

		[Test]
		public void Can_Ignore_And_Report_Incorrect_Row_Column() {
			var config = new PivotConfig() {
				Rows = new[] { "Category", "ThisIsntAColumnName" },
				Cols = new[] { "Country" },
				Aggregators = new List<AggregatorDef>() { new AggregatorDef() { FunctionName = "SumInt", ColumnName = "Value" } },
				ErrorMode = ConfigurationErrorHandlingMode.Ignore,
				Filters = new Filter[] {
					new Filter("Date", "=", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);
			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(1, pivot.InvalidColumns.Count());
			Assert.AreEqual("ThisIsntAColumnName", pivot.InvalidColumns.First());
			Assert.AreEqual(60M, pivot.GrandTotal[0].Value); // Sum of filtered rows

		}

		[Test]
		public void Can_Throw_On_Incorrect_Col_Column() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country", "ThisIsntAColumnName" },
				Aggregators = new List<AggregatorDef>() { new AggregatorDef() { FunctionName = "SumInt", ColumnName = "Value" } },
				ErrorMode = ConfigurationErrorHandlingMode.Throw,
				Filters = new Filter[] {
					new Filter("Date", "=", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);
			pivot = PivotTable.Create(config);

			var ex = Assert.Throws<PivotConfigurationException>(() => pivot.Pivot(reader));
			Assert.AreEqual(1, ex.InvalidColumns.Count());
			Assert.AreEqual("ThisIsntAColumnName", ex.InvalidColumns.First());

		}

		[Test]
		public void Can_Ignore_And_Report_Incorrect_Col_Column() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country", "ThisIsntAColumnName" },
				Aggregators = new List<AggregatorDef>() { new AggregatorDef() { FunctionName = "SumInt", ColumnName = "Value" } },
				ErrorMode = ConfigurationErrorHandlingMode.Ignore,
				Filters = new Filter[] {
					new Filter("Date", "=", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);
			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(1, pivot.InvalidColumns.Count());
			Assert.AreEqual("ThisIsntAColumnName", pivot.InvalidColumns.First());
			Assert.AreEqual(60M, pivot.GrandTotal[0].Value); // Sum of filtered rows

		}

		[Test]
		public void Can_Throw_On_Incorrect_Aggregator_Column() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregators = new List<AggregatorDef>(){ new AggregatorDef() { FunctionName = "SumInt", ColumnName = "ThisIsntAColumnName" }},
				ErrorMode = ConfigurationErrorHandlingMode.Throw,
				Filters = new Filter[] {
					new Filter("Date", "=", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);
			pivot = PivotTable.Create(config);

			var ex = Assert.Throws<PivotConfigurationException>(() => pivot.Pivot(reader));
			Assert.AreEqual(1, ex.InvalidColumns.Count());
			Assert.AreEqual("ThisIsntAColumnName", ex.InvalidColumns.First());

		}

		[Test]
		public void Can_Ignore_And_Report_Incorrect_Aggregator_Column() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregators = new List<AggregatorDef>() { new AggregatorDef() { FunctionName = "SumInt", ColumnName = "ThisIsntAColumnName" } },
				ErrorMode = ConfigurationErrorHandlingMode.Ignore,
				Filters = new Filter[] {
					new Filter("Date", "=", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);
			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(1, pivot.InvalidColumns.Count());
			Assert.AreEqual("ThisIsntAColumnName", pivot.InvalidColumns.First());
			Assert.AreEqual("Count", pivot.AggregatorDefs[0].Create().SqlFunctionName);
			Assert.AreEqual(2, pivot.GrandTotal[0].Value); // Count of filtered rows

		}

	}
}