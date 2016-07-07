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
				Filters = new IFilter[] {
					new GreaterThan<int>("Year", 2015),
					new Equals<string>("Category", "Web"),
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
					'FilterNames':[
						{ Name: 'GreaterThan', FieldName: 'Year', ParameterValue: 2015 },
						{ Name: 'Equals', FieldName: 'Category', ParameterValue: 'Web' }
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
			Assert.AreEqual(typeof(GreaterThan<long>), deserialized.Filters[0].GetType());
			Assert.AreEqual("Year", deserialized.Filters[0].FieldName);
			Assert.AreEqual(2015, deserialized.Filters[0].ParameterValue);
			Assert.AreEqual(typeof(Equals<string>), deserialized.Filters[1].GetType());
			Assert.AreEqual("Category", deserialized.Filters[1].FieldName);
			Assert.AreEqual("Web", deserialized.Filters[1].ParameterValue);


			//Assert.NotNull();
		}
		 
	}
}