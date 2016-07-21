using System;
using System.Collections.Generic;
using System.Linq;

namespace PivotSharp.Filters
{
	public static class FilterOperators
	{
		public static IEnumerable<FilterOperator> All() {
			return new[] {
				Equals,
				GreaterThan,
				GreaterThanOrEqualTo,
				LessThan,
				LessThanOrEqualTo,
				NotEqualTo
			};
		}

		public static IEnumerable<string> AllOperators() {
			return All().Select(o => o.Op);
		} 

		public static FilterOperator FromString(string op) {
			return All().SingleOrDefault(o => o.Op == op);
		}

		// Need to convert to the right IComparable. Parameters can be deserialized/bound as strings whilst actually representing ints, dates, etc.
		private static int Compare(IComparable left, IComparable right) {
			return left.CompareTo(Convert.ChangeType(right, left.GetType()));
		}

		public static FilterOperator Equals = new FilterOperator() {
			Op = "=",
			Compare = (left, right) => Compare(left, right) == 0
		};

		public static FilterOperator GreaterThan = new FilterOperator() {
			Op = ">",
			Compare = (left, right) => Compare(left, right) > 0
		};
		public static FilterOperator LessThan = new FilterOperator() {
			Op = "<",
			Compare = (left, right) => Compare(left, right) < 0
		};
		public static FilterOperator GreaterThanOrEqualTo = new FilterOperator() {
			Op = ">=",
			Compare = (left, right) => Compare(left, right) >= 0
		};
		public static FilterOperator LessThanOrEqualTo = new FilterOperator() {
			Op = "<=",
			Compare = (left, right) => Compare(left, right) <= 0
		};
		public static FilterOperator NotEqualTo = new FilterOperator() {
			Op = "<>",
			Compare = (left, right) => Compare(left, right) != 0
		};

	}
}