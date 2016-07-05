using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Tests
{
	/// <summary>
	/// Create the simplest possible sum pivot
	/// </summary>
	/// <remarks>
	/// Output should look like:
	/// --------------------------------------------------
	/// |                  | //color                     |
	/// | //shape          |   blue   |  red  |  Totals  |
	/// --------------------------------------------------
	/// | circle           |       3  |     1 |       4  |
	/// | triangle         |          |     3 |       3  |        
	/// --------------------------------------------------
	/// | Totals           |       3  |     4 |       7  |
	/// --------------------------------------------------
	/// </remarks>
	[TestFixture]
	public class Simple_Sum_Test
	{
		private PivotTable pivot;
		private EnumerableDataReader reader;
		private readonly IList<ObscureShape> source = new List<ObscureShape> {
				new ObscureShape("blue", "circle", 1),
				new ObscureShape("blue", "circle", 2),
				new ObscureShape("red", "circle", 1),
				new ObscureShape("red", "triangle", 3)
			};

		[SetUp]
		public void Init() {
			var config = new PivotConfig() {
				Rows = new[] {"Shape"},
				Cols = new[] {"Color"},
				Aggregator = () => new SumInt("Lines")
			};

			reader = new EnumerableDataReader(source);

			pivot = PivotTable.Create(config);
			pivot.Pivot(reader);

		}

		[Test]
		public void Can_Generate_Headers() {
			Assert.AreEqual(2, pivot.Cols.ToList().Count());
			Assert.AreEqual("blue", pivot.Cols[0].FlattenedKey);
			Assert.AreEqual("red", pivot.Cols[1].FlattenedKey);

			Assert.AreEqual(2, pivot.Rows.ToList().Count());
			Assert.AreEqual("circle", pivot.Rows[0].FlattenedKey);
			Assert.AreEqual("triangle", pivot.Rows[1].FlattenedKey);
		}

		[Test]
		public void Can_Generate_Elements() {
			Assert.AreEqual(3, pivot.Values.Count());
//			Assert.AreEqual(3, pivot.Values.Sum(kvp => kvp.Value.Count()));
		}

		[Test]
		public void Can_Generate_Sums() {
			Assert.AreEqual(3, pivot.Values["circle"]["blue"].Value);
			Assert.AreEqual(1, pivot.Values["circle"]["red"].Value);
			Assert.AreEqual(3, pivot.Values["triangle"]["red"].Value);

			Assert.AreEqual(7, pivot.GrandTotal.Value);
		}
	}

}
