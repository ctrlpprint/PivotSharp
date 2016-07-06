using System.Collections.Generic;
using System.Linq;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.DataReader;

namespace PivotSharp.Tests
{
	[TestFixture]
	public class Empty_Data_Tests
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

		}

		[Test]
		public void Can_Handle_Empty_Data() {
			var config = new PivotConfig() {
				Rows = new[] { "Shape" },
				Cols = new[] { "Color" },
				Aggregator = () => new Count()

			};
			pivot = PivotTable.Create(config);
			reader = new EnumerableDataReader(new List<ObscureShape>());

			pivot.Pivot(reader);
		}

		[Test]
		public void Can_Handle_Empty_RowSet() {
			var config = new PivotConfig() {
				Cols = new[] { "Color" },
				Aggregator = () => new Count()

			};
			pivot = PivotTable.Create(config);
			reader = new EnumerableDataReader(source);

			pivot.Pivot(reader);
		}

		[Test]
		public void Can_Handle_Empty_ColSet() {
			var config = new PivotConfig() {
				Cols = new[] { "Color" },
				Aggregator = () => new Count()

			};
			pivot = PivotTable.Create(config);
			reader = new EnumerableDataReader(source);

			pivot.Pivot(reader);
		}
	}

}
