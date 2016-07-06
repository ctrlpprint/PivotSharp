using System;
using System.Data;

namespace PivotSharp.Filters
{
	public class GreaterThan<T> : Filter<T> where T : IComparable<T>
	{
		public GreaterThan(string fieldName, T value) : base(fieldName, value) {}

		public override bool Apply(IDataReader source) {
			return ((T)source[FieldName]).CompareTo(Value) > 0;
		}

		public override string SqlClause(string paramName) {
			return string.Format("[{0}] > @{1}", FieldName, paramName.Replace("@", ""));
		}

		public override string Description { get { return string.Format("{0} > {1}", FieldName, Value); } }	
	}
}