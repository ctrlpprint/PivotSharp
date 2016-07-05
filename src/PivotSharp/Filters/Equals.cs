using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;


namespace PivotSharp.Filters
{
	public class Equals<T> : IFilter
	{
		public Equals(string fieldName, T value) {
			FieldName = fieldName;
			Value = value;
		}

		public string FieldName { get; set; }
		public T Value { get; set; }
		public bool Apply(IDataReader source) {
			return ((T)source[FieldName]).Equals(Value);
		}

		public string SqlClause() {
			if (typeof (T) == typeof (string)) {
				return string.Format("{0} = '{1}'", FieldName, Value);				
			}
			if (typeof(T) == typeof(DateTime)) {
				return string.Format("{0} = '{1}'", FieldName, Value); // ???
			}

			return string.Format("{0} = {1}", FieldName, Value);				

		}
	}

	public class In<T> : IFilter
	{
		public string FieldName { get; set; }
		public IList<T> Values { get; set; }
		public bool Apply(IDataReader source) {
			return Values.Any(v => ((T)source[FieldName]).Equals(v));
		}

		public string SqlClause() {
			if (typeof(T) == typeof(string)) {
				return string.Format("{0} in ({1})", FieldName, string.Join(",", Values.Select(v => string.Format("'{0}", v))));
			}
			if (typeof(T) == typeof(DateTime)) {
				return string.Format("{0} = '{1}'", FieldName, Values); // ???
			}

			return string.Format("{0} in ({1})", FieldName, string.Join(",", Values));

		}
	}

}