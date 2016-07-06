using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Tests
{
	/// <summary>
	/// Create the simplest possible pivot
	/// </summary>
	/// <remarks>
	/// Output should look like:
	/// --------------------------------------------------
	/// |                  | //color                     |
	/// | //shape          |   blue   |  red  |  Totals  |
	/// --------------------------------------------------
	/// | circle           |       2  |       |       2  |
	/// | triangle         |          |     1 |       1  |        
	/// --------------------------------------------------
	/// | Totals           |       2  |     1 |       3  |
	/// --------------------------------------------------
	/// </remarks>
	[TestFixture]
	public class Simple_Count_Test
	{
		private PivotTable pivot;
		private EnumerableDataReader reader;
		private readonly IList<ObscureShape> source = new List<ObscureShape> {
				new ObscureShape("blue", "circle"),
				new ObscureShape("blue", "circle"),
				new ObscureShape("red", "triangle")
			};

		[SetUp]
		public void Init() {

			var config = new PivotConfig() {
				Rows = new[] {"Shape"},
				Cols = new[] {"Color"},
				Aggregator = () => new Count()

			};
			pivot = PivotTable.Create(config);
			reader = new EnumerableDataReader(source);

			pivot.Pivot(reader);
		}

		[Test]
		public void Can_Generate_Headers() {
			Assert.AreEqual(1, pivot.Cols.Fields.Count);
			Assert.AreEqual("Color", pivot.Cols.Fields[0]);

			Assert.AreEqual(2, pivot.Cols.Count);
			Assert.AreEqual("blue", pivot.Cols[0].Headers[0].Name);
			Assert.AreEqual("red", pivot.Cols[1].Headers[0].Name);

			Assert.AreEqual("blue", pivot.Cols[0].FlattenedKey);
			Assert.AreEqual("red", pivot.Cols[1].FlattenedKey);

			Assert.AreEqual(1, pivot.Rows.Fields.Count);
			Assert.AreEqual("Shape", pivot.Rows.Fields[0]);

			Assert.AreEqual(2, pivot.Rows.Count);
			Assert.AreEqual("circle", pivot.Rows[0].Headers[0].Name);
			Assert.AreEqual("triangle", pivot.Rows[1].Headers[0].Name);

			Assert.AreEqual("circle", pivot.Rows[0].FlattenedKey);
			Assert.AreEqual("triangle", pivot.Rows[1].FlattenedKey);
		}

		[Test]
		public void Can_Generate_Elements() {
			Assert.AreEqual(2, pivot.Values.Count());
			//Assert.AreEqual(2, pivot.Values.Sum(kvp => kvp.Value.Count()));
		}

		[Test]
		public void Can_Generate_Cell_Counts() {
			
			Assert.AreEqual(2, pivot.Values["circle"]["blue"].Value);
			Assert.AreEqual(1, pivot.Values["triangle"]["red"].Value);

			Assert.AreEqual(3, pivot.GrandTotal.Value);
		}

		[Test]
		public void Can_Generate_Row_Counts() {
			Assert.AreEqual(2, pivot.Rows.Single(r => r.FlattenedKey == "circle").Value);
			Assert.AreEqual(1, pivot.Rows.Single(r => r.FlattenedKey == "triangle").Value);
		}

		[Test]
		public void Can_Generate_Col_Counts() {
			Assert.AreEqual(2, pivot.Cols.Single(r => r.FlattenedKey == "blue").Value);
			Assert.AreEqual(1, pivot.Cols.Single(r => r.FlattenedKey == "red").Value);
		}


		[Test]
		public void Can_Write_Table() {
			var output = PivotWriter.WriteHtmlTable(pivot);
			Assert.NotNull(output);
		}

		[Test]
		public void Can_Retrieve_Listing() {

			reader = new EnumerableDataReader(source);
			var listing = pivot.DrillDown(reader, "circle", "blue");

			Assert.AreEqual(2, listing.Rows.Count);
			Assert.AreEqual(2, listing.Rows.Count);

		}
	}

}
