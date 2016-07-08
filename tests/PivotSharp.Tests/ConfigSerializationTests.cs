using Newtonsoft.Json;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp.Tests
{
	[TestFixture]
	public class ConfigSerializationTests
	{
		[Test]
		public void Can_Deserialize() {

			var config = new PivotConfig() {
				Rows = new[] {"Region", "Country"},
				Cols = new[] {"Source"},
				Aggregator = () => new Sum("Revenue"),
				Filters = new Filter[] {
					new Filter("Year", ">", 2015), 
					new Filter("Category", "=", "Web"), 
				},
				FillTable = true
			};

			// var json = JsonConvert.SerializeObject(config);
			// Debug.WriteLine(json);

			var json = @"
				{
					'Rows':['Region','Country'],
					'Cols':['Category'],
					'AggregatorName':['Sum','Revenue'],
					'FillTable':true,
					'Filters':[
						{ Op: '>', FieldName: 'Year', ParameterValue: 2015 },
						{ Op: '=', FieldName: 'Category', ParameterValue: 'Web' }
					]
				}
";


			var deserialized = JsonConvert.DeserializeObject<PivotConfig>(json);

			Assert.NotNull(deserialized);

			Assert.AreEqual(2, deserialized.Rows.Count);
			Assert.AreEqual("Region", deserialized.Rows[0]);
			Assert.AreEqual("Country", deserialized.Rows[1]);

			Assert.AreEqual(1, deserialized.Cols.Count);
			Assert.AreEqual("Category", deserialized.Cols[0]);
	
			Assert.AreEqual(true, deserialized.FillTable);

			Assert.AreEqual("Sum", deserialized.Aggregator().SqlFunctionName);
			Assert.AreEqual("Revenue", deserialized.Aggregator().ColumnName);
			Assert.AreEqual(0, deserialized.Aggregator().Value);

			Assert.AreEqual(2, deserialized.Filters.Count);

			Assert.AreEqual(typeof(Filter), deserialized.Filters[0].GetType());
			Assert.AreEqual("Year", deserialized.Filters[0].FieldName);
			Assert.AreEqual(">", deserialized.Filters[0].Op);
			Assert.AreEqual(2015, deserialized.Filters[0].ParameterValue);

			Assert.AreEqual(typeof(Filter), deserialized.Filters[1].GetType());
			Assert.AreEqual("Category", deserialized.Filters[1].FieldName);
			Assert.AreEqual("=", deserialized.Filters[1].Op);
			Assert.AreEqual("Web", deserialized.Filters[1].ParameterValue);


			//Assert.NotNull();
		}
		 
	}
}