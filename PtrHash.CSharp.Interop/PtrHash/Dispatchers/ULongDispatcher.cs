using System;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Interop.Native;

namespace PtrHash.CSharp.Interop.PtrHash.Dispatchers
{
    /// <summary>
    /// Dispatcher for ulong keys - routes to *_u64 native functions
    /// </summary>
    public readonly struct ULongDispatcher : IDispatcher<ulong>
    {
        public Type KeyType => typeof(ulong);

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public unsafe PtrHashNative.FFIResultHandle CreateNew(ReadOnlySpan<ulong> keys, PtrHashNative.FFIParams parameters)
        {
            fixed (ulong* keysPtr = keys)
            {
                return PtrHashNative.ptrhash_new_u64((IntPtr)keysPtr, (nuint)keys.Length, parameters);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public PtrHashNative.FFIResultIndex GetIndex(IntPtr handle, ulong key)
            => PtrHashNative.ptrhash_index_u64(handle, key);

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public PtrHashNative.FFIResultIndex GetIndexNoRemap(IntPtr handle, ulong key)
            => PtrHashNative.ptrhash_index_no_remap_u64(handle, key);

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public unsafe PtrHashNative.FFIResultVoid GetIndicesBatch(IntPtr handle, ReadOnlySpan<ulong> keys, Span<nuint> results, bool minimal)
        {
            fixed (ulong* keysPtr = keys)
            fixed (nuint* resultsPtr = results)
            {
                return PtrHashNative.ptrhash_index_batch_u64(handle, (IntPtr)keysPtr, (nuint)keys.Length, (IntPtr)resultsPtr, minimal);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public unsafe PtrHashNative.FFIResultVoid GetIndicesStream(IntPtr handle, ReadOnlySpan<ulong> keys, Span<nuint> results, uint prefetchDistance, bool minimal)
        {
            fixed (ulong* keysPtr = keys)
            fixed (nuint* resultsPtr = results)
            {
                return PtrHashNative.ptrhash_index_stream_u64(handle, (IntPtr)keysPtr, (nuint)keys.Length, (IntPtr)resultsPtr, (nuint)prefetchDistance, minimal);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public PtrHashNative.FFIResultInfo GetInfo(IntPtr handle)
            => PtrHashNative.ptrhash_info_u64(handle);
    }
}