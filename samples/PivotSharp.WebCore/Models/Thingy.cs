namespace PivotSharp.WebCore.Models;

public class Thingy
{
	public string Color { get; set; }
	public string Shape { get; set; }
	public string Border { get; set; }
	public string Shadow { get; set; }
	public int Lines { get; set; }

	public Thingy(string color, string shape, string border, string shadow, int lines) {
		Color = color;
		Shape = shape;
		Border = border;
		Shadow = shadow;
		Lines = lines;
	}

}
