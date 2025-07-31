using System;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Interop.Native;

namespace PtrHash.CSharp.Interop.PtrHash.Dispatchers
{
    /// <summary>
    /// Dispatcher for uint keys - converts to ulong and uses *_u64 functions
    /// </summary>
    public readonly struct UIntDispatcher : IDispatcher<uint>
    {
        public Type KeyType => typeof(uint);

        public unsafe PtrHashNative.FFIResultHandle CreateNew(ReadOnlySpan<uint> keys, PtrHashNative.FFIParams parameters)
        {
            // Convert uint[] to ulong[] for native call
            var ulongKeys = new ulong[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                ulongKeys[i] = keys[i];
            }
            
            fixed (ulong* keysPtr = ulongKeys)
            {
                return PtrHashNative.ptrhash_new_u64((IntPtr)keysPtr, (nuint)ulongKeys.Length, parameters);
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public PtrHashNative.FFIResultIndex GetIndex(IntPtr handle, uint key)
            => PtrHashNative.ptrhash_index_u64(handle, key); // Implicit conversion

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public PtrHashNative.FFIResultIndex GetIndexNoRemap(IntPtr handle, uint key)
            => PtrHashNative.ptrhash_index_no_remap_u64(handle, key);

        public unsafe PtrHashNative.FFIResultVoid GetIndicesBatch(IntPtr handle, ReadOnlySpan<uint> keys, Span<nuint> results, bool minimal)
        {
            // Convert to ulong for batch operation
            var ulongKeys = new ulong[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                ulongKeys[i] = keys[i];
            }

            fixed (ulong* keysPtr = ulongKeys)
            fixed (nuint* resultsPtr = results)
            {
                return PtrHashNative.ptrhash_index_batch_u64(handle, (IntPtr)keysPtr, (nuint)ulongKeys.Length, (IntPtr)resultsPtr, minimal);
            }
        }

        public unsafe PtrHashNative.FFIResultVoid GetIndicesStream(IntPtr handle, ReadOnlySpan<uint> keys, Span<nuint> results, uint prefetchDistance, bool minimal)
        {
            var ulongKeys = new ulong[keys.Length];
            for (int i = 0; i < keys.Length; i++)
            {
                ulongKeys[i] = keys[i];
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