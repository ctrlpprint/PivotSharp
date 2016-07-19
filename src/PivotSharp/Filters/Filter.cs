using System;
using System.Data;
using Newtonsoft.Json;

namespace PivotSharp.Filters
{
	[JsonObject(MemberSerialization.OptIn)]
	public class Filter
	{
		[JsonProperty]
		public string Op { get; set; }

		[JsonProperty]
		public string ColumnName { get; set; }

		// The problem with a property of type object (or dynamic) is the asp.net mvc model binder will always bind a value 
		// as a string[]. See eg http://stackoverflow.com/questions/15886757/mvc-model-binding-subclass-object-property-filled-with-a-string-array 
		[JsonProperty]
		public object ParameterValue { get; set; }

		// For Model Binding
		public Filter() { }

		public Filter(string columnName, string op, object parameterValue) {
			Op = op;
			ColumnName = columnName;
			ParameterValue = parameterValue;
		}

		public bool Apply(IDataReader source) {
			return Compare(Op, (IComparable) source[ColumnName], (IComparable) ParameterValue);
		}

		public static bool Compare(string op, IComparable left, IComparable right) {

			var opr = FilterOperators.FromString(op);

			if (opr == null)
				throw new ArgumentException("Invalid comparison operator: {0}", op);

			return opr.Compare(left, right);
		}

		public string SqlClause(string paramName) {
			return string.Format("{0} {1} @{2}", ColumnName, Op, paramName.Replace("@", ""));
		}

		public DbType DbType {
			get {
				// MVC Model Binding will fill ParameterValue with a string[] and then try to read this property so we need to return something.
				return ParameterValue == null || ParameterValue.GetType() == typeof(string[])
					? DbType.Object
					: DbTypeMap.DbTypeFor(ParameterValue.GetType());
			}
		}

		public string Description { get { return string.Format("{0} {1} {2}", ColumnName, Op, ParameterValue); } }
	}
}