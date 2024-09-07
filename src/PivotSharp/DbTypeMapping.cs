using System;
using System.Data;

namespace PivotSharp;
public class DbTypeMapping
{
    public Type Type { get; set; }
    public string DataType { get; set; }
    public DbType DbType { get; set; }
    public bool IsRequired { get; set; }
}