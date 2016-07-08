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
		public string FieldName { get; private set; }

		[JsonProperty]
		public object ParameterValue { get; private set; }

		public Filter(string fieldName, string op, object parameterValue) {
			Op = op;
			FieldName = fieldName;
			ParameterValue = parameterValue;
		}

		public bool Apply(IDataReader source) {
			return Compare(Op, (IComparable) source[FieldName], (IComparable) ParameterValue);
		}

		public static bool Compare(string op, IComparable left, IComparable right) {

			var opr = FilterOperators.FromString(op);

			if (opr == null)
				throw new ArgumentException("Invalid comparison operator: {0}", op);

			return opr.Compare(left, right);
		}

		public string SqlClause(string paramName) {
			return string.Format("[{0}] {1} @{2}", FieldName, Op, paramName.Replace("@", ""));
		}

		public DbType DbType {
			get { return DbTypeMap.DbTypeFor(ParameterValue.GetType()); }
		}

		public string Description { get { return string.Format("{0} {1} {2}", FieldName, Op, ParameterValue); } }
	}
}