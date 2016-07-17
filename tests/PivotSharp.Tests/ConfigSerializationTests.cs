using System.Collections.Generic;
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
				Aggregators = new List<AggregatorDef>{new AggregatorDef{FunctionName = "Sum", ColumnName = "Value"}},
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
					'Aggregators':[
						{FunctionName:'Sum', ColumnName:'Revenue'}
					],
					'FillTable':true,
					'Filters':[
						{ Op: '>', ColumnName: 'Year', ParameterValue: 2015 },
						{ Op: '=', ColumnName: 'Category', ParameterValue: 'Web' }
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

			Assert.AreEqual("Sum", deserialized.Aggregators[0].Create().SqlFunctionName);
			Assert.AreEqual("Revenue", deserialized.Aggregators[0].Create().ColumnName);
			Assert.AreEqual(0, deserialized.Aggregators[0].Create().Value);

			Assert.AreEqual(2, deserialized.Filters.Count);

			Assert.AreEqual(typeof(Filter), deserialized.Filters[0].GetType());
			Assert.AreEqual("Year", deserialized.Filters[0].ColumnName);
			Assert.AreEqual(">", deserialized.Filters[0].Op);
			Assert.AreEqual(2015, deserialized.Filters[0].ParameterValue);

			Assert.AreEqual(typeof(Filter), deserialized.Filters[1].GetType());
			Assert.AreEqual("Category", deserialized.Filters[1].ColumnName);
			Assert.AreEqual("=", deserialized.Filters[1].Op);
			Assert.AreEqual("Web", deserialized.Filters[1].ParameterValue);


			//Assert.NotNull();
		}
		 
	}
}