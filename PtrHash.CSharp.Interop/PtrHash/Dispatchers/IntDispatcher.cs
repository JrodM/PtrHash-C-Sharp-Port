using System;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Interop.Native;

namespace PtrHash.CSharp.Interop.PtrHash.Dispatchers
{
    /// <summary>
    /// Dispatcher for int keys - converts to ulong and uses *_u64 functions
    /// </summary>
    public readonly struct IntDispatcher : IDispatcher<int>
    {
        public Type KeyType => typeof(int);

        public unsafe PtrHashNative.FFIResultHandle CreateNew(ReadOnlySpan<int> keys, PtrHashNative.FFIParams parameters)
        {
            var ulongKeys = new ulong[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                ulongKeys[i] = (ulong)(uint)keys[i];
            }
            
            fixed (ulong* keysPtr = ulongKeys)
            {
                return PtrHashNative.ptrhash_new_u64((IntPtr)keysPtr, (nuint)ulongKeys.Length, parameters);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public PtrHashNative.FFIResultIndex GetIndex(IntPtr handle, int key)
            => PtrHashNative.ptrhash_index_u64(handle, (ulong)(uint)key);

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public PtrHashNative.FFIResultIndex GetIndexNoRemap(IntPtr handle, int key)
            => PtrHashNative.ptrhash_index_no_remap_u64(handle, (ulong)(uint)key);

        public unsafe PtrHashNative.FFIResultVoid GetIndicesBatch(IntPtr handle, ReadOnlySpan<int> keys, Span<nuint> results, bool minimal)
        {
            var ulongKeys = new ulong[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                ulongKeys[i] = (ulong)(uint)keys[i];
            }

            fixed (ulong* keysPtr = ulongKeys)
            fixed (nuint* resultsPtr = results)
            {
                return PtrHashNative.ptrhash_index_batch_u64(handle, (IntPtr)keysPtr, (nuint)ulongKeys.Length, (IntPtr)resultsPtr, minimal);
            }
        }

        public unsafe PtrHashNative.FFIResultVoid GetIndicesStream(IntPtr handle, ReadOnlySpan<int> keys, Span<nuint> results, uint prefetchDistance, bool minimal)
        {
            var ulongKeys = new ulong[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                ulongKeys[i] = (ulong)(uint)keys[i];
            }

            fixed (ulong* keysPtr = ulongKeys)
            fixed (nuint* resultsPtr = results)
            {
                return PtrHashNative.ptrhash_index_stream_u64(handle, (IntPtr)keysPtr, (nuint)ulongKeys.Length, (IntPtr)resultsPtr, (nuint)prefetchDistance, minimal);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public PtrHashNative.FFIResultInfo GetInfo(IntPtr handle)
            => PtrHashNative.ptrhash_info_u64(handle);
    }
}