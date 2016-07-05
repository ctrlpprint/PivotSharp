namespace PivotSharp.Tests
{
	public class ObscureShape
	{
		public string Color { get; set; }
		public string Shape { get; set; }
		public int Lines { get; set; }
		public string Border { get; set; }
		public string Shadow { get; set; }

		public ObscureShape(string color, string shape, string border, string shadow) {
			Color = color;
			Shape = shape;
			Border = border;
			Shadow = shadow;
		}

		public ObscureShape(string color, string shape, int lines = 0) {
			Color = color;
			Shape = shape;
			Lines = lines;
		}
	}
}