using System.Collections.Generic;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp.Tests
{
	[TestFixture]
	public class PivotSqlStringTests
	{

		[Test]
		public void Can_Generate_Count_Query() {
			var config = new PivotConfig() {
				Rows = new[] { "Shape" },
				Cols = new[] { "Color" },
				Aggregators = new List<AggregatorDef>{new AggregatorDef { FunctionName = "Count"}}

			};

			var sqlString = new PivotSqlString(config, "ObscureShapes");
			const string expected = "select [Shape], [Color], Count(*) as [Count] from [ObscureShapes] group by [Shape], [Color]";
			Assert.AreEqual(expected, sqlString.ToString());
		}

		[Test]
		public void Can_Generate_Sum_Query() {
			var config = new PivotConfig() {
				Rows = new[] { "Shape" },
				Cols = new[] { "Color" },
				Aggregators = new List<AggregatorDef>{new AggregatorDef{FunctionName = "Sum", ColumnName = "Value"}}
			};

			var sqlString = new PivotSqlString(config, "ObscureShapes");
			const string expected = "select [Shape], [Color], Sum([Value]) as [Value] from [ObscureShapes] group by [Shape], [Color]";
			Assert.AreEqual(expected, sqlString.ToString());
			
		}

		[Test]
		public void Can_Generate_Filtered_Query() {
			var config = new PivotConfig() {
				Rows = new[] { "Shape" },
				Cols = new[] { "Color" },
				Aggregators = new List<AggregatorDef>{new AggregatorDef{FunctionName = "Sum", ColumnName = "Value"}},
				Filters = new Filter[] {
					new Filter("Border", "=", "dotted"), 
				}
			};

			var sqlString = new PivotSqlString(config, "ObscureShapes");
			const string expected = "select [Shape], [Color], Sum([Value]) as [Value] from [ObscureShapes] where [Border] = @param0 group by [Shape], [Color]";
			Assert.AreEqual(expected, sqlString.ToString());

		}

	}
}