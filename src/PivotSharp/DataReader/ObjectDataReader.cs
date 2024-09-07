// <copyright project="Salient.Data" file="ObjectDataReader.cs" company="Sky Sanders">
// This source is a Public Domain Dedication.
// Please see http://spikes.codeplex.com/ for details.   
// Attribution is appreciated
// </copyright> 
// <version>1.0</version>
// Source: http://spikes.codeplex.com/SourceControl/latest#Salient.Data/Salient.Data/ObjectDataReader.cs
// Adapted: David, 2017-07-06 to make GetSchemaTable consistent with the method exposed by DbDataReaders
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;

namespace PivotSharp.DataReader
{
	public abstract class ObjectDataReader : IDataReader
	{
		protected bool Closed;
		protected IList<DynamicProperties.Property> Fields;

		protected ObjectDataReader() { }

		protected ObjectDataReader(Type elementType) {
			SetFields(elementType);
			Closed = false;
		}

		#region IDataReader Members

		public abstract object GetValue(int i);

		/// <summary>Advances the <see cref="T:System.Data.IDataReader"/> to the next record.</summary>
		/// <returns>true if there are more rows; otherwise, false.</returns>
		/// <filterpriority>2</filterpriority>
		public abstract bool Read();

        #endregion

        #region Implementation of IDataRecord

        /// <summary>Gets the number of columns in the current row.</summary>
        /// <returns>
        /// When not positioned in a valid recordset, 0; otherwise, the number of columns in the current record. The default is -1.
        /// </returns>
        /// <filterpriority>2</filterpriority>
        public int FieldCount => Fields.Count;

        /// <summary>Return the index of the named field.</summary>
        /// <returns>The index of the named field.</returns>
        /// </param><filterpriority>2</filterpriority>
        public virtual int GetOrdinal(string name) {
			for (int i = 0; i < Fields.Count; i++) {
				if (Fields[i].Info.Name == name) {
					return i;
				}
			}
			throw new IndexOutOfRangeException("name");
		}


        /// <summary>Gets the column located at the specified index.</summary>
        /// <param name="i">The zero-based index of the column to get. 
        /// </exception><filterpriority>2</filterpriority>
        object IDataRecord.this[int i] => GetValue(i);

        public virtual Type GetFieldType(int i) => Fields[i].Info.PropertyType;


        public virtual bool GetBoolean(int i) => (Boolean)GetValue(i);
        public virtual byte GetByte(int i) => (Byte)GetValue(i);
        public virtual char GetChar(int i) => (Char)GetValue(i);
        public virtual DateTime GetDateTime(int i) => (DateTime)GetValue(i);
        public virtual decimal GetDecimal(int i) => (Decimal)GetValue(i);
        public virtual double GetDouble(int i) => (Double)GetValue(i);
        public virtual float GetFloat(int i) => (float)GetValue(i);
        public virtual Guid GetGuid(int i) => (Guid)GetValue(i);
        public virtual short GetInt16(int i) => (Int16)GetValue(i);
        public virtual int GetInt32(int i) => (Int32)GetValue(i);
        public virtual long GetInt64(int i) => (Int64)GetValue(i);
        public virtual string GetString(int i) => (string)GetValue(i);
        public virtual bool IsDBNull(int i) => GetValue(i) == null;


        /// <summary>Gets the column with the specified name.</summary>
        object IDataRecord.this[string name] => GetValue(GetOrdinal(name));


        /// <summary>Gets the data type information for the specified field.</summary>
        public virtual string GetDataTypeName(int i) => GetFieldType(i).Name;


        /// <summary>Gets the name for the field at index i, or the empty string (""), if there is no value to return.</summary>
        public virtual string GetName(int i) {
			if (i < 0 || i >= Fields.Count) {
				throw new IndexOutOfRangeException("name");
			}
			return Fields[i].Info.Name;
		}

		/// <summary>Gets all the attribute fields in the collection for the current record</summary>
		public virtual int GetValues(object[] values) {
			int i = 0;
			for (; i < Fields.Count; i++) {
				if (values.Length <= i) {
					return i;
				}
				values[i] = GetValue(i);
			}
			return i;
		}

        #region not implemented
        /// <summary>
        /// Returns an <see cref="T:System.Data.IDataReader"/> for the specified column ordinal.
        /// </summary>
        public virtual IDataReader GetData(int i) {
			// need to think about this one
			throw new NotImplementedException();
		}

		/// <summary>
		/// Reads a stream of bytes from the specified column offset into the buffer as an array, starting at the given buffer offset.
		/// </summary>
		/// <returns>
		/// The actual number of bytes read.
		/// </returns>
		/// <param name="i">The zero-based column ordinal. 
		/// </param><param name="fieldOffset">The index within the field from which to start the read operation. 
		/// </param><param name="buffer">The buffer into which to read the stream of bytes. 
		/// </param><param name="bufferoffset">The index for <paramref name="buffer"/> to start the read operation. 
		/// </param><param name="length">The number of bytes to read. 
		/// </param><exception cref="T:System.IndexOutOfRangeException">The index passed was outside the range of 0 through <see cref="P:System.Data.IDataRecord.FieldCount"/>. 
		/// </exception><filterpriority>2</filterpriority>
		public virtual long GetBytes(int i, long fieldOffset, byte[] buffer, int bufferoffset, int length) {
			// need to keep track of the bytes got for each record - more work than i want to do right now
			// http://msdn.microsoft.com/en-us/library/system.data.idatarecord.getbytes.aspx
			throw new NotImplementedException();
		}

		/// <summary>
		/// Reads a stream of characters from the specified column offset into the buffer as an array, starting at the given buffer offset.
		/// </summary>
		/// <returns>
		/// The actual number of characters read.
		/// </returns>
		/// <param name="i">The zero-based column ordinal. 
		/// </param><param name="fieldoffset">The index within the row from which to start the read operation. 
		/// </param><param name="buffer">The buffer into which to read the stream of bytes. 
		/// </param><param name="bufferoffset">The index for <paramref name="buffer"/> to start the read operation. 
		/// </param><param name="length">The number of bytes to read. 
		/// </param><exception cref="T:System.IndexOutOfRangeException">The index passed was outside the range of 0 through <see cref="P:System.Data.IDataRecord.FieldCount"/>. 
		/// </exception><filterpriority>2</filterpriority>
		public virtual long GetChars(int i, long fieldoffset, char[] buffer, int bufferoffset, int length) {
			// need to keep track of the bytes got for each record - more work than i want to do right now
			// http://msdn.microsoft.com/en-us/library/system.data.idatarecord.getchars.aspx
			throw new NotImplementedException();
		}
        #endregion

        #endregion

        #region Implementation of IDataReader

        public virtual void Close() => Closed = true;

        /// <summary>
        /// Returns a <see cref="T:System.Data.DataTable"/> that describes the column metadata of the <see cref="T:System.Data.IDataReader"/>.
        /// Columns included:
        /// - ColumnName:string
        /// - DataType:Type
        /// </summary>
        public virtual DataTable GetSchemaTable() {
			var dt = new DataTable();
			dt.Columns.Add("ColumnName", typeof(string));
			dt.Columns.Add("DataType", typeof(Type));

			foreach (DynamicProperties.Property field in Fields) {
				Type colType;
				bool nullable = false;
				if (field.Info.PropertyType.IsGenericType && field.Info.PropertyType.GetGenericTypeDefinition() == typeof(Nullable<>)) {
					colType = field.Info.PropertyType.GetGenericArguments()[0];
					nullable = true;
				}
				else {
					colType = field.Info.PropertyType;
				}

				dt.Rows.Add(field.Info.Name, colType);
			}
			return dt;
		}

		/// <summary>
		/// Advances the data reader to the next result, when reading the results of batch SQL statements.
		/// </summary>
		/// <returns>
		/// true if there are more rows; otherwise, false.
		/// </returns>
		/// <filterpriority>2</filterpriority>
		public virtual bool NextResult() {
			throw new NotImplementedException();
		}


		/// <summary>
		/// Gets a value indicating the depth of nesting for the current row.
		/// </summary>
		/// <returns>
		/// The level of nesting.
		/// </returns>
		/// <filterpriority>2</filterpriority>
		public virtual int Depth {
			get { throw new NotImplementedException(); }
		}

        public virtual bool IsClosed => Closed;

        /// <summary>
        /// Gets the number of rows changed, inserted, or deleted by execution of the SQL statement.
        /// </summary>
        /// <returns>
        /// The number of rows changed, inserted, or deleted; 0 if no rows were affected or the statement failed; and -1 for SELECT statements.
        /// </returns>
        /// <filterpriority>2</filterpriority>
        public virtual int RecordsAffected => -1; // assuming select only

        #endregion

        #region Implementation of IDisposable

        /// <summary>
        /// Performs application-defined tasks associated with freeing, releasing, or resetting unmanaged resources.
        /// </summary>
        /// <filterpriority>2</filterpriority>
        public virtual void Dispose() => Fields = null;

        #endregion

        protected void SetFields(Type elementType) => Fields = DynamicProperties.CreatePropertyMethods(elementType).ToList();
    }
}