using System;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Interop.Native;

namespace PtrHash.CSharp.Interop.PtrHash.Dispatchers
{
    /// <summary>
    /// Base interface for native function dispatchers
    /// </summary>
    public interface IDispatcher
    {
        Type KeyType { get; }
    }

    /// <summary>
    /// Generic dispatcher interface for type-specific operations
    /// </summary>
    public interface IDispatcher<TKey> : IDispatcher
    {
        unsafe PtrHashNative.FFIResultHandle CreateNew(ReadOnlySpan<TKey> keys, PtrHashNative.FFIParams parameters);
        PtrHashNative.FFIResultIndex GetIndex(IntPtr handle, TKey key);
        PtrHashNative.FFIResultIndex GetIndexNoRemap(IntPtr handle, TKey key);
        unsafe PtrHashNative.FFIResultVoid GetIndicesBatch(IntPtr handle, ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal);
        unsafe PtrHashNative.FFIResultVoid GetIndicesStream(IntPtr handle, ReadOnlySpan<TKey> keys, Span<nuint> results, uint prefetchDistance, bool minimal);
        PtrHashNative.FFIResultInfo GetInfo(IntPtr handle);
    }
}