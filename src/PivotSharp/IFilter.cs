using System.Data;

namespace PivotSharp
{
	public interface IFilter
	{
		string FieldName { get; }
		bool Apply(IDataReader source);
		string SqlClause(string paramName);
		DbType DbType { get; }
		object ParameterValue { get; }
		string Description { get; }
	}
}


