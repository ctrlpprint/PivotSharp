﻿// <copyright project="Salient.Reflection" file="DynamicProperties.cs" company="Sky Sanders">
// This source is a Public Domain Dedication.
// Please see http://spikes.codeplex.com/ for details.   
// Attribution is appreciated
// </copyright> 
// <version>1.0</version>
// Source: http://spikes.codeplex.com/SourceControl/latest#Salient.Data/Salient.Data/Salient.Reflection/DynamicProperties.cs

using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Reflection.Emit;

namespace PivotSharp.DataReader
{
    /// <summary>
    /// Gets IL setters and getters for a property.
    /// started with http://jachman.wordpress.com/2006/08/22/2000-faster-using-dynamic-method-calls/
    /// </summary>
    public static class DynamicProperties
    {
        #region Delegates

        public delegate object GenericGetter(object target);

        public delegate void GenericSetter(object target, object value);

        #endregion

        public static IEnumerable<Property> CreatePropertyMethods(Type T) =>
            T.GetProperties().Select(prop => new Property(prop));

        public static IEnumerable<Property> CreatePropertyMethods<T>() =>
            CreatePropertyMethods(typeof(T));


        /// <summary>
        /// Creates a dynamic setter for the property
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <returns></returns>
        public static GenericSetter CreateSetMethod(PropertyInfo propertyInfo) {
            // If there's no setter return null
            MethodInfo setMethod = propertyInfo.GetSetMethod(true);
            if (setMethod == null)
                return null;

            // * Create the dynamic method
            var arguments = new Type[2];
            arguments[0] = arguments[1] = typeof(object);

            var setter = new DynamicMethod(
                String.Concat("_Set", propertyInfo.Name, "_"),
                typeof(void), arguments, propertyInfo.DeclaringType);
            ILGenerator generator = setter.GetILGenerator();
            generator.Emit(OpCodes.Ldarg_0);
            generator.Emit(OpCodes.Castclass, propertyInfo.DeclaringType);
            generator.Emit(OpCodes.Ldarg_1);

            if (propertyInfo.PropertyType.IsClass)
                generator.Emit(OpCodes.Castclass, propertyInfo.PropertyType);
            else
                generator.Emit(OpCodes.Unbox_Any, propertyInfo.PropertyType);

            generator.EmitCall(OpCodes.Callvirt, setMethod, null);
            generator.Emit(OpCodes.Ret);

            // Create the delegate and return it
            return (GenericSetter)setter.CreateDelegate(typeof(GenericSetter));
        }


        /// <summary>
        /// Creates a dynamic getter for the property
        /// </summary>
        /// <param name="propertyInfo"></param>
        /// <returns></returns>
        public static GenericGetter CreateGetMethod(PropertyInfo propertyInfo) {
            // If there's no getter return null
            MethodInfo getMethod = propertyInfo.GetGetMethod(true);
            if (getMethod == null)
                return null;

            // Create the dynamic method
            var arguments = new Type[1];
            arguments[0] = typeof(object);

            var getter = new DynamicMethod(
                String.Concat("_Get", propertyInfo.Name, "_"),
                typeof(object), arguments, propertyInfo.DeclaringType);
            ILGenerator generator = getter.GetILGenerator();
            generator.DeclareLocal(typeof(object));
            generator.Emit(OpCodes.Ldarg_0);
            generator.Emit(OpCodes.Castclass, propertyInfo.DeclaringType);
            generator.EmitCall(OpCodes.Callvirt, getMethod, null);

            if (!propertyInfo.PropertyType.IsClass)
                generator.Emit(OpCodes.Box, propertyInfo.PropertyType);

            generator.Emit(OpCodes.Ret);

            // Create the delegate and return it
            return (GenericGetter)getter.CreateDelegate(typeof(GenericGetter));
        }

        #region Nested type: Property

        public class Property
        {
            public GenericGetter Getter;
            public PropertyInfo Info;
            public GenericSetter Setter;

            public Property(PropertyInfo info) {
                Info = info;
                Setter = CreateSetMethod(info);
                Getter = CreateGetMethod(info);
            }
        }
        #endregion
    }
}