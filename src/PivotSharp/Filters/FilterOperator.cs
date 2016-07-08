using System;
using System.Collections.Generic;
using System.Linq;

namespace PivotSharp.Filters
{
	public class FilterOperator
	{
		public string Op { get; set; }
		public Func<IComparable, IComparable, bool> Compare { get; set; }
	}

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

		public static FilterOperator Equals = new FilterOperator() {
			Op = "=",
			Compare = (left, right) => left.CompareTo(right) == 0
		};

		public static FilterOperator GreaterThan = new FilterOperator() {
			Op = ">",
			Compare = (left, right) => left.CompareTo(right) > 0
		};
		public static FilterOperator LessThan = new FilterOperator() {
			Op = "<",
			Compare = (left, right) => left.CompareTo(right) < 0
		};
		public static FilterOperator GreaterThanOrEqualTo = new FilterOperator() {
			Op = ">=",
			Compare = (left, right) => left.CompareTo(right) >= 0
		};
		public static FilterOperator LessThanOrEqualTo = new FilterOperator() {
			Op = "<=",
			Compare = (left, right) => left.CompareTo(right) <= 0
		};
		public static FilterOperator NotEqualTo = new FilterOperator() {
			Op = "<>",
			Compare = (left, right) => left.CompareTo(right) != 0
		};

	}
}