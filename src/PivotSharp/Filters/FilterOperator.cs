using System;

namespace PivotSharp.Filters
{
	public class FilterOperator
	{
		public string Op { get; set; }
		public Func<IComparable, IComparable, bool> Compare { get; set; }
	}
}