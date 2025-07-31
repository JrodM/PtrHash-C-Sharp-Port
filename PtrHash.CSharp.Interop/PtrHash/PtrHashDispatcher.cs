using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.PtrHash.Dispatchers;

namespace PtrHash.CSharp.Interop.PtrHash
{
    /// <summary>
    /// Legacy dispatcher - kept for backward compatibility
    /// </summary>
    internal static class PtrHashDispatcher
    {
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static IDispatcher<TKey> GetDispatcher<TKey>()
            => DispatcherRegistry.GetDispatcher<TKey>();

        public static bool IsTypeSupported<TKey>()
            => DispatcherRegistry.IsTypeSupported<TKey>();
    }
}