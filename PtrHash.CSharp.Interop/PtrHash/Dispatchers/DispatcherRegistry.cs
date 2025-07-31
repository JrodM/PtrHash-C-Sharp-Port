using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Interop.PtrHash.Dispatchers
{
    /// <summary>
    /// Central registry for type dispatchers that routes generic calls to native type-specific functions
    /// </summary>
    internal static class DispatcherRegistry
    {
        /// <summary>
        /// Dispatch table for native function calls based on key type
        /// </summary>
        private static readonly Dictionary<Type, IDispatcher> Dispatchers = new()
        {
            { typeof(int), new IntDispatcher() },
            { typeof(uint), new UIntDispatcher() },
            { typeof(ulong), new ULongDispatcher() },
            { typeof(string), new StringDispatcher() },
        };

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static IDispatcher<TKey> GetDispatcher<TKey>()
        {
            var type = typeof(TKey);
            if (!Dispatchers.TryGetValue(type, out var dispatcher))
            {
                throw new NotSupportedException($"Key type {type.Name} is not supported by native PtrHash implementation");
            }
            return (IDispatcher<TKey>)dispatcher;
        }

        public static bool IsTypeSupported<TKey>()
            => Dispatchers.ContainsKey(typeof(TKey));

        public static bool IsTypeSupported(Type keyType)
            => Dispatchers.ContainsKey(keyType);
    }
}