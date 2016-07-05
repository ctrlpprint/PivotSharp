using System.Data;

namespace PivotSharp
{
	public interface IFilter
	{
		bool Apply(IDataReader source);
		string SqlClause();
	}
}


