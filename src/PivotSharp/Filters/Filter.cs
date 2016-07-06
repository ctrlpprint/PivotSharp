using System;
using System.Data;

namespace PivotSharp.Filters
{
	public abstract class Filter<T> : IFilter where T:IComparable<T>
	{
		public Filter(string fieldName, T value) {
			FieldName = fieldName;
			Value = value;
		}

		public string FieldName { get; protected set; }
		public T Value { get; protected set; }
		public object ParameterValue { get { return Value; } }
		public abstract string Description { get; }

		public DbType DbType {
			get { return DbTypeMap.DbTypeFor(typeof(T)); }
		}
		public abstract bool Apply(IDataReader source);
		public abstract string SqlClause(string paramName);
		
	}
}