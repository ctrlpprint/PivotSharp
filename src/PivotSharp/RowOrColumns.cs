using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using PivotSharp.Aggregators;

namespace PivotSharp;

public class RowOrColumns : List<RowOrColumn>
{
    public IList<AggregatorDef> AggregatorsDefs { get; set; } = [];

    public IList<string> Fields { get; set; } = [];

    public RowOrColumns(IList<string> fields, IList<AggregatorDef> aggregators) {
        Fields = fields;
        AggregatorsDefs = aggregators;
    }

    public IList<string> FieldNames() {
        if (!this.Any()) return [];
        return this.First().Headers.Select(h => h.FieldName).ToList();
    }

    public RowOrColumn AddRow(IDataReader source) {
        var rowHeader = Fields.Select(rowAttr => source[rowAttr] ?? "null").Select(x => x.ToString()).ToList();
        var flatRowKey = string.Join(",", rowHeader);

        // Update the Row Total for this Header
        if (!rowHeader.Any()) return null;

        var row = this.SingleOrDefault(r => r.FlattenedKey == flatRowKey);
        if (row == null) {
            row = new RowOrColumn()
            {
                Headers = Fields.Select(fieldName => new Header
                {
                    FieldName = fieldName,
                    Name = (source[fieldName] ?? "null").ToString()
                }).ToList(),
                Aggregators = AggregatorsDefs.Select(a => a.Create()).ToList()
            };
            Add(row);
        }

        row.Aggregators.ForEach(a => a.Push(source));
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
                    itemIndex++;
                }
                groupIndex++;
            }
        }
    }

    public IEnumerable<IGrouping<string, RowOrColumn>> GetHeaderGroupsForField(string fieldName) =>
        GetHeaderGroupsForField(FieldNames().IndexOf(fieldName));

    public IEnumerable<IGrouping<string, RowOrColumn>> GetHeaderGroupsForField(int fieldIndex) => this
        .OrderBy(c => c.FlattenedKey).NaturalSort(c => c.FlattenedKey)
        .GroupBy(c => string.Join(",", c.FlattenedKey.Split(',').Take(fieldIndex + 1)));

    public IEnumerable<RowOrColumn> GetItemsForGroup(int fieldIndex, string groupName) => 
        GetHeaderGroupsForField(fieldIndex).Single(g => g.Key == groupName).Select(g => g);

}