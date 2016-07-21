using System.Collections.Generic;
using PivotSharp.Filters;

namespace PivotSharp.Web.Models
{
	public class EditPivotConfigViewModel
	{
		public PivotConfig Config { get; set; }
		public IList<FilterOperator> FilterOperators { get; set; }
		public IList<string> Aggregators { get; set; }
		public IEnumerable<Column> TableStructure { get; set; }
	}
}