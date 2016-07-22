namespace PivotSharp
{
	public class Column
	{
		public int Position { get; set; }
		public string Name { get; set; }

		public string DataType { get; set; }

		public string HtmlInputType {

			get {
				switch (DataType) {
					case "varchar":
					case "nvarchar":
						return "text";
					case "int":
					case "decimal":
						return "number";
					case "date":
					case "datetime":
						return "date";
					default:
						return "text";
				}
			}

		}

		
	}
}