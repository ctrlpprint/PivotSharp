namespace System;

public static class StringExtensions
{
    public static decimal ToDecimal(this string value, decimal defaultValue = 0) =>
        decimal.TryParse(value, out decimal dec) ? dec : defaultValue;

    public static int ToInt(this string value, int defaultValue = 0) =>
        int.TryParse(value, out int val) ? val : defaultValue;

    public static bool IsDateField(this string value) {
        var lower = value.ToLower();
        return lower == "year"
            || lower == "quarter"
            || lower == "month"
            || lower == "week"
            || lower == "day";
    }
}