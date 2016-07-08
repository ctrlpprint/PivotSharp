using System;

namespace PivotSharp.Tests
{
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