using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;
using PtrHash.Native;
using PtrHash.Core;

namespace PtrHash.PtrHash
{
    /// <summary>
    /// High-performance Minimal Perfect Hash Function for 64-bit unsigned integer keys.
    /// Provides zero-copy operations where possible to minimize overhead.
    /// </summary>
    public sealed class PtrHashU64 : IPtrHash<ulong>
    {
        private IntPtr _handle;
        private bool _disposed;

        /// <summary>
        /// Construct a new PtrHash for the given set of u64 keys
        /// </summary>
        /// <param name="keys">Span of unique keys to hash</param>
        /// <param name="config">Configuration parameters</param>
        /// <exception cref="ArgumentException">Keys span is empty</exception>
        /// <exception cref="PtrHashException">Construction failed</exception>
        public PtrHashU64(ReadOnlySpan<ulong> keys, PtrHashConfig config = default)
        {
            if (keys.IsEmpty)
                throw new ArgumentException("Keys span cannot be empty", nameof(keys));

            if (config.Equals(default(PtrHashConfig)))
                config = PtrHashConfig.Default;

            unsafe
            {
                fixed (ulong* keysPtr = keys)
                {
                    var nativeParams = new PtrHashNative.FFIParams
                    {
                        ParamSet = (uint)config.ParameterSet,
                        SinglePart = config.SinglePart,
                        Lambda = config.Lambda ?? 0.0,
                        U64HashFunction = (uint)(config.U64HashFunction ?? U64HashFunction.FxHash),
                        StringHashFunction = (uint)(config.StringHashFunction ?? StringHashFunction.GxHash)
                    };

                    var result = PtrHashNative.ptrhash_new_u64(
                        (IntPtr)keysPtr,
                        (nuint)keys.Length,
                        nativeParams);

                    if (!result.Success)
                    {
                        var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                        PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                        throw new PtrHashException($"Failed to construct PtrHash: {error}");
                    }

                    _handle = result.Value;
                }
            }
        }

        /// <summary>
        /// Construct a new PtrHash for the given array of u64 keys
        /// </summary>
        /// <param name="keys">Array of unique keys to hash</param>
        /// <param name="config">Configuration parameters</param>
        /// <exception cref="ArgumentNullException">Keys array is null</exception>
        /// <exception cref="ArgumentException">Keys array is empty</exception>
        /// <exception cref="PtrHashException">Construction failed</exception>
        public PtrHashU64(ulong[] keys, PtrHashConfig config = default)
            : this((keys ?? throw new ArgumentNullException(nameof(keys))).AsSpan(), config)
        {
        }

        /// <summary>
        /// Construct a new PtrHash for the given list of u64 keys
        /// </summary>
        /// <param name="keys">List of unique keys to hash</param>
        /// <param name="config">Configuration parameters</param>
        /// <exception cref="ArgumentNullException">Keys list is null</exception>
        /// <exception cref="ArgumentException">Keys list is empty</exception>
        /// <exception cref="PtrHashException">Construction failed</exception>
        public PtrHashU64(List<ulong> keys, PtrHashConfig config = default)
            : this(CollectionsMarshal.AsSpan(keys ?? throw new ArgumentNullException(nameof(keys))), config)
        {
        }

        /// <summary>
        /// Get the minimal perfect hash index for a single key
        /// </summary>
        /// <param name="key">Key to lookup</param>
        /// <returns>Index in range [0, n)</returns>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Lookup failed</exception>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndex(ulong key)
        {
            ThrowIfDisposed();

            var result = PtrHashNative.ptrhash_index_u64(_handle, key);
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Index lookup failed: {error}");
            }

            return result.Value;
        }

        /// <summary>
        /// Get the non-minimal hash index for a single key (can be >= n, but slightly faster)
        /// </summary>
        /// <param name="key">Key to lookup</param>
        /// <returns>Index that may be >= n</returns>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Lookup failed</exception>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemap(ulong key)
        {
            ThrowIfDisposed();

            var result = PtrHashNative.ptrhash_index_no_remap_u64(_handle, key);
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Index lookup failed: {error}");
            }

            return result.Value;
        }

        /// <summary>
        /// Batch lookup multiple keys with zero-copy operation
        /// </summary>
        /// <param name="keys">Keys to lookup</param>
        /// <param name="results">Output array for results (must be same length as keys)</param>
        /// <param name="minimal">Whether to remap indices to [0, n)</param>
        /// <exception cref="ArgumentNullException">Keys or results array is null</exception>
        /// <exception cref="ArgumentException">Keys and results arrays have different lengths</exception>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Batch lookup failed</exception>
        public void GetIndicesBatch(ReadOnlySpan<ulong> keys, Span<nuint> results, bool minimal = true)
        {
            ThrowIfDisposed();

            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            if (keys.IsEmpty)
                return;

            unsafe
            {
                fixed (ulong* keysPtr = keys)
                fixed (nuint* resultsPtr = results)
                {
                    var result = PtrHashNative.ptrhash_index_batch_u64(
                        _handle,
                        (IntPtr)keysPtr,
                        (nuint)keys.Length,
                        (IntPtr)resultsPtr,
                        minimal);

                    if (!result.Success)
                    {
                        var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                        PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                        throw new PtrHashException($"Batch lookup failed: {error}");
                    }
                }
            }
        }

        /// <summary>
        /// Stream lookup with prefetching for maximum throughput
        /// </summary>
        /// <param name="keys">Keys to lookup</param>
        /// <param name="results">Output array for results (must be same length as keys)</param>
        /// <param name="prefetchDistance">Prefetch distance (8, 16, 32, or 64 recommended)</param>
        /// <param name="minimal">Whether to remap indices to [0, n)</param>
        /// <exception cref="ArgumentException">Keys and results arrays have different lengths</exception>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Stream lookup failed</exception>
        public void GetIndicesStream(ReadOnlySpan<ulong> keys, Span<nuint> results, uint prefetchDistance = 32, bool minimal = true)
        {
            ThrowIfDisposed();

            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            if (keys.IsEmpty)
                return;

            unsafe
            {
                fixed (ulong* keysPtr = keys)
                fixed (nuint* resultsPtr = results)
                {
                    var result = PtrHashNative.ptrhash_index_stream_u64(
                        _handle,
                        (IntPtr)keysPtr,
                        (nuint)keys.Length,
                        (IntPtr)resultsPtr,
                        (nuint)prefetchDistance,
                        minimal);

                    if (!result.Success)
                    {
                        var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                        PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                        throw new PtrHashException($"Stream lookup failed: {error}");
                    }
                }
            }
        }

        /// <summary>
        /// Get information about this PtrHash instance
        /// </summary>
        /// <returns>Information about the hash function</returns>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Failed to get info</exception>
        public PtrHashInfo GetInfo()
        {
            ThrowIfDisposed();

            var result = PtrHashNative.ptrhash_info_u64(_handle);
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Failed to get info: {error}");
            }

            return new PtrHashInfo(result.Value.N, result.Value.BitsPerKey, result.Value.MaxIndex);
        }

        /// <summary>
        /// Dispose the PtrHash instance and free native resources
        /// </summary>
        public void Dispose()
        {
            if (!_disposed && _handle != IntPtr.Zero)
            {
                PtrHashNative.ptrhash_free(_handle);
                _handle = IntPtr.Zero;
                _disposed = true;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void ThrowIfDisposed()
        {
            if (_disposed)
                throw new ObjectDisposedException(nameof(PtrHashU64));
        }

        private static unsafe string GetErrorString(IntPtr errorMsg, nuint errorLen)
        {
            if (errorMsg == IntPtr.Zero || errorLen == 0)
                return "Unknown error";

            var span = new ReadOnlySpan<byte>((void*)errorMsg, (int)errorLen);
            return System.Text.Encoding.UTF8.GetString(span);
        }
    }
}