namespace System
{
	public static class StringExtensions
	{
		public static decimal ToDecimal(this string value, decimal defaultValue = 0) {
			
			decimal dec;
			return decimal.TryParse(value, out dec) ? dec : defaultValue;
		}
	}
}