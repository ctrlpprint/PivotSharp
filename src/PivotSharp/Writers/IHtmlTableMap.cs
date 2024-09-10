namespace PivotSharp.Writers;

public interface IHtmlTableMap
{
    string Map(ICell cell);
    string Map(Table table);
    string Map(TBody tbody);
    string Map(TFoot tfoot);
    string Map(THead thead);
    string Map(Tr tr);

}