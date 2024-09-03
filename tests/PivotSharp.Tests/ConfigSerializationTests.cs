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

			Assert.That(deserialized, Is.Not.Null);

			Assert.That(deserialized.Rows.Count, Is.EqualTo(2));
			Assert.That(deserialized.Rows[0], Is.EqualTo("Region"));
			Assert.That(deserialized.Rows[1], Is.EqualTo("Country"));

			Assert.That(deserialized.Cols.Count, Is.EqualTo(1));
			Assert.That(deserialized.Cols[0], Is.EqualTo("Category"));
	
			Assert.That(deserialized.FillTable, Is.EqualTo(true));

			Assert.That(deserialized.Aggregators[0].Create().SqlFunctionName, Is.EqualTo("Sum"));
			Assert.That(deserialized.Aggregators[0].Create().ColumnName, Is.EqualTo("Revenue"));
			Assert.That(deserialized.Aggregators[0].Create().Value, Is.EqualTo(0));

			Assert.That(deserialized.Filters.Count, Is.EqualTo(2));

			Assert.That(deserialized.Filters[0].GetType(), Is.EqualTo(typeof(Filter)));
			Assert.That(deserialized.Filters[0].ColumnName, Is.EqualTo("Year"));
			Assert.That(deserialized.Filters[0].Op, Is.EqualTo(">"));
			Assert.That(deserialized.Filters[0].ParameterValue, Is.EqualTo(2015));

			Assert.That(deserialized.Filters[1].GetType(), Is.EqualTo(typeof(Filter)));
			Assert.That(deserialized.Filters[1].ColumnName, Is.EqualTo("Category"));
			Assert.That(deserialized.Filters[1].Op, Is.EqualTo("="));
			Assert.That(deserialized.Filters[1].ParameterValue, Is.EqualTo("Web"));


			//Assert.NotNull();
		}
		 
	}
}