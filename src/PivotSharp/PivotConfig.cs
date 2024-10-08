﻿using System.Collections.Generic;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp;

public class PivotConfig
{
    public string TableName { get; set; } = "";

    public IList<string> Rows { get; set; } = [];

    public IList<string> Cols { get; set; } = [];

    public IList<Filter> Filters { get; set; } = [];

    public IList<AggregatorDef> Aggregators { get; set; } = [];

    public bool IncludeZeroValues { get; set; } = false;

    public ConfigurationErrorHandlingMode ErrorMode { get; set; }
        = ConfigurationErrorHandlingMode.Ignore;

    public PivotConfig() { }
}