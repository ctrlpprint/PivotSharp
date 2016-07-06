using System;
using System.Collections.Generic;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;
using PivotSharp.Filters;

namespace PivotSharp.Tests
{
	[TestFixture]
	public class Date_Filter_Tests
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
		public void Can_Filter_On_Date_Equality() {
			var config = new PivotConfig() {
				Rows = new[] {"Category"},
				Cols = new[] {"Country"},
				Aggregator = () => new SumInt("Value"),
				Filters = new IFilter[] {
					new Equals<DateTime>("Date", new DateTime(2016,02,01))
				}
			};

			reader = new EnumerableDataReader(source);

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);


			Assert.AreEqual(60M, pivot.Values["Books"]["USA"].Value);
		}

	}

	public class Sale
	{
		public DateTime Date { get; protected set; }
		public string Category { get; protected set; }
		public string Product { get; protected set; }
		public string Country { get; protected set; }
		public decimal Value { get; protected set; }

		public Sale(DateTime date, string category, string product, string country, decimal value) {
			Date = date;
			Category = category;
			Product = product;
			Country = country;
			Value = value;
		}
	}
}