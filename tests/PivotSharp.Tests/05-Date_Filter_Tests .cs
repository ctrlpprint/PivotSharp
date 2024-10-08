﻿using System;
using System.Collections.Generic;
using NUnit.Framework;
using PivotSharp.Aggregators;
using PivotSharp.Filters;

namespace PivotSharp.Tests;

[TestFixture]
public class Date_Filter_Tests
{
    private PivotTable pivot;
    private readonly IList<Sale> source = [
        new (new DateTime(2016,01,30), "Books", "The Hobbit", "USA", 10M ),
        new (new DateTime(2016,01,30), "DVDs", "Star Wars", "USA", 25M ),

        new (new DateTime(2016,01,31), "Books", "The Hobbit", "USA", 30M ),
        new (new DateTime(2016,01,31), "DVDs", "Star Wars", "USA", 25M ),
        new (new DateTime(2016,01,31), "DVDs", "Spectre", "USA", 25M ),
        new (new DateTime(2016,01,31), "DVDs", "Star Wars", "USA", 25M ),

        new (new DateTime(2016,02,01), "Books", "The Hobbit", "USA", 30M ),
        new (new DateTime(2016,02,01), "Books", "LOTR", "USA", 30M ),

        new (new DateTime(2016,02,02), "DVDs", "Spectre", "USA", 30M ),
        new (new DateTime(2016,02,02), "Books", "The Hobbit", "USA", 15M ),
        new (new DateTime(2016,02,02), "DVS", "Star Wars", "USA", 30M ),
    ];

    [Test]
    public void Can_Filter_On_Date_Equality() {
        var config = new PivotConfig()
        {
            Rows = ["Category"],
            Cols = ["Country"],
            Aggregators = [new AggregatorDef { FunctionName = "SumInt", ColumnName = "Value" }],
            Filters = [new Filter("Date", "=", new DateTime(2016,02,01))]
        };

		pivot = PivotTable.Create(config, source);
		


		Assert.That(pivot.Cells["Books"]["USA"][0].Value, Is.EqualTo(60M));
    }

}