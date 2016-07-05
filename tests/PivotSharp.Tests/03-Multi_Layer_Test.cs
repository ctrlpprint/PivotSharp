using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Tests
{
	/// <summary>
	/// Create the simplest possible muilt-layer pivot
	/// </summary>
	/// <remarks>
	/// Output should look like:
	/// -------------------------------------------------------------
	/// |                         | // Color / Shape                |
	/// |                         |   blue   |      red  |  Totals  |
	/// | // Border / Shadow      | circle   | triangle  |  Totals  |
	/// -------------------------------------------------------------
	/// | dashed    | outside     |       1  |           |       1  |
	/// | dotted    | inside      |          |         1 |       1  |        
	/// |           | outside     |       2  |           |       2  |        
	/// -------------------------------------------------------------
	/// | Totals                  |       3  |         1 |       4  |
	/// -------------------------------------------------------------
	/// </remarks>
	[TestFixture]
	public class Multi_Layer_Test
	{
		private PivotTable pivot;
		private EnumerableDataReader reader;
		private readonly IList<ObscureShape> source = new List<ObscureShape> {
				new ObscureShape("blue", "circle", "dotted", "outside"),
				new ObscureShape("blue", "circle", "dotted", "outside"),
				new ObscureShape("blue", "circle", "dashed", "outside"),
				new ObscureShape("red", "triangle", "dotted", "inside")
			};

		[SetUp]
		public void Init() {

			var config = new PivotConfig() {
				Rows = new[] {"Color", "Shape"},
				Cols = new[] {"Border", "Shadow"},
				Aggregator = () => new Count()

			};

			reader = new EnumerableDataReader(source);

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);
		}

		[Test]
		public void Can_Generate_Headers() {
			Assert.AreEqual(3, pivot.Cols.Count());
			Assert.AreEqual("dotted,outside", pivot.Cols[0].FlattenedKey);
			Assert.AreEqual("dashed,outside", pivot.Cols[1].FlattenedKey);
			Assert.AreEqual("dotted,inside", pivot.Cols[2].FlattenedKey);

			Assert.AreEqual(2, pivot.Rows.Count());
			Assert.AreEqual("blue,circle", pivot.Rows[0].FlattenedKey);
			Assert.AreEqual("red,triangle", pivot.Rows[1].FlattenedKey);
		}

		[Test]
		public void Can_Generate_Elements() {
			// To iterate the collection of cells, need to go through two layers of dictionary.
			Assert.AreEqual(3, pivot.Values.Count());
			//Assert.AreEqual(3, pivot.Values.Sum(kvp => kvp.Value.Count()));
		}

		[Test]
		public void Can_Generate_Counts() {
			Assert.AreEqual(2, pivot.Values["blue,circle"]["dotted,outside"].Value);
			Assert.AreEqual(1, pivot.Values["blue,circle"]["dashed,outside"].Value);
			Assert.AreEqual(1, pivot.Values["red,triangle"]["dotted,inside"].Value);

			Assert.AreEqual(4, pivot.GrandTotal.Value);
		}
	}
}
