using System;
using System.Collections;
using System.Collections.Generic;
using System.Net.Mail;

namespace PivotSharp.Filters
{
	/// <summary>
	/// Present a list of available filters to a user
	/// </summary>
	/// <remarks>
	/// We want an end user to be able to enter something like:
	/// 
	/// --------------------------------------------------
	/// | Filter Name    | Field Name   | Value          |
	/// --------------------------------------------------
	/// | "Equals"       | "Category"   | "Books"        |
	/// | "GreaterThan"  | "Year"       | 2015           |
	/// | ....           |              |                |
	/// --------------------------------------------------
	/// 
	/// or more intuitively
	/// -----------------------------------------------
	/// | Field Name   | Operator    | Value         |
	/// -----------------------------------------------
	/// | "Category"   | =           |"Books"        |
	/// | "Year"       | >           |2015           |
	/// | ....         |             |               |
	/// ----------------------------------------------
	/// </remarks>
	public class Filters
	{
		public static bool Compare<T>(string op, T left, T right) where T : IComparable<T> {
			switch (op) {
				case "<": 
					return left.CompareTo(right) < 0;
				case ">": 
					return left.CompareTo(right) > 0;
				case "<=": 
					return left.CompareTo(right) <= 0;
				case ">=": 
					return left.CompareTo(right) >= 0;
				case "==":
				case "=":
					return left.Equals(right);
				case "<>": 
				case "!=": 
					return !left.Equals(right);
				default: throw new ArgumentException("Invalid comparison operator: {0}", op);
			}
		}

	}
}