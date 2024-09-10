using System.Collections.Generic;
using System.Data;

namespace PivotSharp.Connectors;

public interface IPivotDataSourceConnector
{
	public IEnumerable<Field> GetTableStructure();
    public IDataReader GetPivotData();
    public DataTable GetDrillDownData(string flattendedRowKeys, string flattenedColKeys);
	void UpdateConfig(PivotConfig config);
}