using System.Collections.Generic;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;
using PivotSharp.Filters;

namespace PivotSharp.Tests
{
	/// <summary>
	/// Create the simplest possible sum pivot
	/// </summary>
	/// <remarks>
	/// Output should look like:
	/// -------------------------------------------
	/// |                  | //color              |
	/// | //shape          |   blue   |   Totals  |
	/// -------------------------------------------
	/// | circle           |       3  |        4  |
	/// | triangle         |       3  |        3  |        
	/// -------------------------------------------
	/// | Totals           |       6  |        6  |
	/// -------------------------------------------
	/// </remarks>

	[TestFixture]
	public class String_Filter_Tests
	{
		private PivotTable pivot;
		private EnumerableDataReader reader;
		private readonly IList<ObscureShape> source = new List<ObscureShape> {
				new ObscureShape("blue", "circle", 1),
				new ObscureShape("blue", "circle", 2),
				new ObscureShape("blue", "triangle", 3),
				new ObscureShape("red", "circle", 1),
				new ObscureShape("red", "triangle", 3)
			};

		[SetUp]
		public void Init() {
			var config = new PivotConfig() {
				Rows = new[] {"Shape"},
				Cols = new[] {"Color"},
				Aggregator = new AggregatorDef { FunctionName = "SumInt", ColumnName = "Lines"},
				Filters = new Filter[] {
					new Filter("Color", "=", "blue"), 
				}
			};

			reader = new EnumerableDataReader(source);

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);
		}


		[Test]
		public void Can_Filter_On_String_Equality() {
			Assert.AreEqual(3, pivot.Values["circle"]["blue"].Value);
			Assert.AreEqual(3, pivot.Values["triangle"]["blue"].Value);

			Assert.AreEqual(6, pivot.GrandTotal.Value);			
		}

		[Ignore("Not implemented yet")]
		public void Can_Filter_On_String_Inequality() {
			
		}
	}
}