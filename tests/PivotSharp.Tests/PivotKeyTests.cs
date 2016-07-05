using System.Collections.Generic;
using NUnit.Framework;

namespace PivotSharp.Tests
{
	[TestFixture]
	class PivotKeyTests
	{
		[Test]
		public void Can_Match() {

			var key1 = new PivotKey() {
				ColKeys = new List<string> {"Red", "Circle"},
				RowKeys = new List<string> {"Dotted", "Line"}
			};

			var key2 = new PivotKey() {
				ColKeys = new List<string> { "Red", "Circle" },
				RowKeys = new List<string> { "Dotted", "Line" }
			};

			Assert.AreEqual(key1, key2);
			Assert.That(key1 == key2);
			Assert.False(key1 != key2);
		}

		[Test]
		public void Can_Distinguish() {

			var key1 = new PivotKey() {
				ColKeys = new List<string> { "Red", "Circle" },
				RowKeys = new List<string> { "Dotted", "Line" }
			};

			var key2 = new PivotKey() {
				ColKeys = new List<string> { "Red", "Circle" },
				RowKeys = new List<string> { "Dashed", "Line" }
			};

			Assert.AreNotEqual(key1, key2);
			Assert.False(key1 == key2);
			Assert.That(key1 != key2);
		}

	}
}
