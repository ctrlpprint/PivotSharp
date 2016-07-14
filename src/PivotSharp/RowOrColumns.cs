using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using PivotSharp.Aggregators;
using PivotSharp.Extensions;

namespace PivotSharp
{



	public class RowOrColumns : List<RowOrColumn>
	{
		public AggregatorDef AggregatorDef { get; set; }

		public IList<string> Fields { get; set; }

		public RowOrColumns(IList<string> fields, AggregatorDef aggregator) {
			Fields = fields;
			AggregatorDef = aggregator;
		}

		public IList<string> FieldNames() {
			if (!this.Any()) return new List<string>();
			return this.First().Headers.Select(h => h.FieldName).ToList();
		}

		public RowOrColumn AddRow(IDataReader source) {
			var rowHeader = Fields.Select(rowAttr => source[rowAttr] ?? "null").Select(x => x.ToString()).ToList();
			var flatRowKey = string.Join(",", rowHeader);

			// Update the Row Total for this Header
			if (!rowHeader.Any()) return null;

			var row = this.SingleOrDefault(r => r.FlattenedKey == flatRowKey);
			if (row == null) {
				row = new RowOrColumn() {
					Headers = Fields.Select(fieldName => new Header {
						FieldName = fieldName,
						Name = (source[fieldName] ?? "null").ToString()
					}).ToList(),
					Aggregator = AggregatorDef.Create()
				};
				Add(row);
			}

			row.Aggregator.Push(source);
			return row;
		}

		public void AssignGroups() {
			foreach (var fieldName in FieldNames()) {
				var groupIndex = 0;
				foreach (var headerGroup in GetHeaderGroupsForField(fieldName)) {
					var itemIndex = 0;
					var itemsInGroup = headerGroup.Count();
					foreach (var rowOrColumn in headerGroup) {
						var header = rowOrColumn.Headers.Single(h => h.FieldName == fieldName);
						header.GroupIndex = groupIndex;
						header.GroupPosition = itemIndex;
						header.GroupCount = itemsInGroup;
						itemIndex ++;
					}
					groupIndex++;
				}
			}
		}

		public IEnumerable<IGrouping<string, RowOrColumn>> GetHeaderGroupsForField(string fieldName) {

			var fieldIndex = FieldNames().IndexOf(fieldName);

			return GetHeaderGroupsForField(fieldIndex);
		}

		public IEnumerable<IGrouping<string, RowOrColumn>> GetHeaderGroupsForField(int fieldIndex) {
			return this
				.OrderBy(c => c.FlattenedKey).NaturalSort(c => c.FlattenedKey)
				.GroupBy(c => string.Join(",", c.FlattenedKey.Split(',').Take(fieldIndex + 1)));
		}

		public IEnumerable<RowOrColumn> GetItemsForGroup(int fieldIndex, string groupName) {

			return GetHeaderGroupsForField(fieldIndex).Single(g => g.Key == groupName).Select(g => g);

		}

	}
}