﻿using System;
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
				Aggregator = () => new Count(),
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(5, pivot.Values["Books"]["USA"].Value);
			Assert.AreEqual(11, pivot.GrandTotal.Value);
		}

		[Test]
		public void Can_Sum() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregator = () => new Sum("Value"),
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(115M, pivot.Values["Books"]["USA"].Value);
			Assert.AreEqual(295M, pivot.GrandTotal.Value);
		}

		[Test]
		public void Can_Average() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregator = () => new Ave("Value"),
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(23.0M, pivot.Values["Books"]["USA"].Value);
			Assert.AreEqual(26.82M, Math.Round(pivot.GrandTotal.Value,2));
		}

		[Test]
		public void Can_Min() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregator = () => new Min("Value"),
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(10M, pivot.Values["Books"]["USA"].Value);
			Assert.AreEqual(10M, pivot.GrandTotal.Value);
		}

		[Test]
		public void Can_Max() {
			var config = new PivotConfig() {
				Rows = new[] { "Category" },
				Cols = new[] { "Country" },
				Aggregator = () => new Max("Value"),
			};

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

			Assert.AreEqual(30M, pivot.Values["Books"]["USA"].Value);
			Assert.AreEqual(50M, pivot.GrandTotal.Value);
		}

	}
}