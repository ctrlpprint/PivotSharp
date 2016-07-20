namespace System
{
	public static class StringExtensions
	{
		public static decimal ToDecimal(this string value, decimal defaultValue = 0) {
			
			decimal dec;
			return decimal.TryParse(value, out dec) ? dec : defaultValue;
		}

		public static int ToInt(this string value, int defaultValue = 0) {

			int val;
			return int.TryParse(value, out val) ? val : defaultValue;
		}

		public static bool IsDateField(this string value) {
			var lower = value.ToLower();
			return lower == "year"
					|| lower == "quarter"
					|| lower == "month"
					|| lower == "week"
					|| lower == "day";

		}
	}
}