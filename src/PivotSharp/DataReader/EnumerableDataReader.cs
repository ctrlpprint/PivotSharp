// <copyright project="Salient.Data" file="EnumerableDataReader.cs" company="Sky Sanders">
// This source is a Public Domain Dedication.
// Please see http://spikes.codeplex.com/ for details.   
// Attribution is appreciated
// </copyright> 
// <version>1.0</version>
// Source: http://spikes.codeplex.com/SourceControl/latest#Salient.Data/Salient.Data/EnumerableDataReader.cs

using System;
using System.Collections;
using System.Collections.Generic;

namespace PivotSharp.DataReader
{
	/// <summary>
	/// Creates an IDataReader over an instance of IEnumerable&lt;> or IEnumerable.
	/// Anonymous type arguments are acceptable.
	/// </summary>
	public class EnumerableDataReader : ObjectDataReader, IEnumerable
	{
        /// <summary>
        /// Helper method to create generic lists from anonymous type
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static IList ToGenericList(Type type) =>
			(IList)Activator.CreateInstance(typeof(List<>).MakeGenericType([type]));

        private readonly IEnumerator enumerator;
		private readonly Type type;
		private object current;

		/// <summary>
		/// Create an IDataReader over an instance of IEnumerable&lt;>.
		/// Anonymous type arguments are acceptable.
		/// </summary>
		public EnumerableDataReader(IEnumerable collection) {
            if (!collection.GetType().IsGenericType) {
                throw new ArgumentException("collection must be IEnumerable<>. Use other constructor for IEnumerable and specify type");
            }

            type = collection.GetType().GetGenericArguments()[0];
            SetFields(type);
            enumerator = collection.GetEnumerator();
		}

		/// <summary>
		/// Create an IDataReader over an instance of IEnumerable.
		/// Use other constructor for IEnumerable&lt;>
		/// </summary>
		/// <param name="collection"></param>
		/// <param name="elementType"></param>
		public EnumerableDataReader(IEnumerable collection, Type elementType) : base(elementType) {
			type = elementType;
			enumerator = collection.GetEnumerator();
		}

		/// <summary>
		/// Return the value of the specified field.
		/// </summary>
		/// <param name="i">The index of the field to find. 
		public override object GetValue(int i) {
			if (i < 0 || i >= Fields.Count) throw new IndexOutOfRangeException();
			return Fields[i].Getter(current);
		}

		/// <summary>
		/// Advances the <see cref="T:System.Data.IDataReader"/> to the next record.
		/// </summary>
		/// <returns>true if there are more rows; otherwise, false.</returns>
		public override bool Read() {
			if (enumerator.MoveNext()) {
				current = enumerator.Current;
                return true;
			} else {
                current = type.IsValueType 
					? Activator.CreateInstance(type) 
					: null;
                return false;
            }
        }

        public IEnumerator GetEnumerator() => enumerator;
    }
}