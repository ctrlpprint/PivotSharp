using System.Collections;
using System.Collections.Generic;

namespace PivotSharp.Aggregators
{
	public class AggregatorFunctions
	{
		public static IList<string> Options {
			get {
				return new List<string> {
					"Count",
					"CountDistinct",
					"Sum",
					"SumInt",
					"Ave",
					"Max",
					"Min"
				};
			}
		}
	}
}