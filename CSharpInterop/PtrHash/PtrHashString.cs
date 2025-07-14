using System;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;
using System.Text;
using PtrHash.Native;
using PtrHash.Core;

namespace PtrHash.PtrHash
{
    /// <summary>
    /// High-performance Minimal Perfect Hash Function for string keys.
    /// Provides zero-copy operations where possible to minimize overhead.
    /// </summary>
    public sealed class PtrHashString : IPtrHash<string>
    {
        private IntPtr _handle;
        private bool _disposed;

        /// <summary>
        /// Construct a new PtrHash for the given set of string keys
        /// </summary>
        /// <param name="keys">Span of unique string keys to hash</param>
        /// <param name="config">Configuration parameters</param>
        /// <exception cref="ArgumentException">Keys span is empty or contains null strings</exception>
        /// <exception cref="PtrHashException">Construction failed</exception>
        public PtrHashString(ReadOnlySpan<string> keys, PtrHashConfig config = default)
        {
            if (keys.IsEmpty)
                throw new ArgumentException("Keys span cannot be empty", nameof(keys));

            for (int i = 0; i < keys.Length; i++)
            {
                if (keys[i] == null)
                    throw new ArgumentException($"Key at index {i} is null", nameof(keys));
            }

            if (config.Equals(default(PtrHashConfig)))
                config = PtrHashConfig.Default;

            // Convert strings to UTF-8 byte arrays and pin them
            var utf8Keys = new byte[keys.Length][];
            var keyPtrs = new IntPtr[keys.Length];
            var keyLengths = new nuint[keys.Length];
            var handles = new GCHandle[keys.Length];

            try
            {
                for (int i = 0; i < keys.Length; i++)
                {
                    utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                    keyLengths[i] = (nuint)utf8Keys[i].Length;
                    handles[i] = GCHandle.Alloc(utf8Keys[i], GCHandleType.Pinned);
                    keyPtrs[i] = handles[i].AddrOfPinnedObject();
                }

                unsafe
                {
                    fixed (IntPtr* keysPtrArray = keyPtrs)
                    fixed (nuint* lengthsPtr = keyLengths)
                    {
                        var nativeParams = new PtrHashNative.FFIParams
                        {
                            ParamSet = (uint)config.ParameterSet,
                            SinglePart = config.SinglePart,
                            Lambda = config.Lambda ?? 0.0,
                            U64HashFunction = (uint)(config.U64HashFunction ?? U64HashFunction.FxHash),
                            StringHashFunction = (uint)(config.StringHashFunction ?? StringHashFunction.GxHash)
                        };

                        var result = PtrHashNative.ptrhash_new_string(
                            (IntPtr)keysPtrArray,
                            (IntPtr)lengthsPtr,
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
            finally
            {
                // Free the pinned handles
                for (int i = 0; i < handles.Length; i++)
                {
                    if (handles[i].IsAllocated)
                        handles[i].Free();
                }
            }
        }

        /// <summary>
        /// Construct a new PtrHash for the given array of string keys
        /// </summary>
        /// <param name="keys">Array of unique string keys to hash</param>
        /// <param name="config">Configuration parameters</param>
        /// <exception cref="ArgumentNullException">Keys array is null</exception>
        /// <exception cref="ArgumentException">Keys array is empty or contains null strings</exception>
        /// <exception cref="PtrHashException">Construction failed</exception>
        public PtrHashString(string[] keys, PtrHashConfig config = default)
            : this((keys ?? throw new ArgumentNullException(nameof(keys))).AsSpan(), config)
        {
        }

        /// <summary>
        /// Construct a new PtrHash for the given list of string keys
        /// </summary>
        /// <param name="keys">List of unique string keys to hash</param>
        /// <param name="config">Configuration parameters</param>
        /// <exception cref="ArgumentNullException">Keys list is null</exception>
        /// <exception cref="ArgumentException">Keys list is empty or contains null strings</exception>
        /// <exception cref="PtrHashException">Construction failed</exception>
        public PtrHashString(List<string> keys, PtrHashConfig config = default)
            : this(CollectionsMarshal.AsSpan(keys ?? throw new ArgumentNullException(nameof(keys))), config)
        {
        }

        /// <summary>
        /// Get the minimal perfect hash index for a single string key
        /// </summary>
        /// <param name="key">Key to lookup</param>
        /// <returns>Index in range [0, n)</returns>
        /// <exception cref="ArgumentNullException">Key is null</exception>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Lookup failed</exception>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndex(string key)
        {
            if (key == null)
                throw new ArgumentNullException(nameof(key));

            ThrowIfDisposed();

            var utf8Key = Encoding.UTF8.GetBytes(key);
            
            unsafe
            {
                fixed (byte* keyPtr = utf8Key)
                {
                    var result = PtrHashNative.ptrhash_index_string(
                        _handle,
                        (IntPtr)keyPtr,
                        (nuint)utf8Key.Length);

                    if (!result.Success)
                    {
                        var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                        PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                        throw new PtrHashException($"Index lookup failed: {error}");
                    }

                    return result.Value;
                }
            }
        }

        /// <summary>
        /// Get the minimal perfect hash index for a string key from UTF-8 bytes (zero-copy)
        /// </summary>
        /// <param name="utf8Key">UTF-8 encoded key bytes</param>
        /// <returns>Index in range [0, n)</returns>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Lookup failed</exception>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndex(ReadOnlySpan<byte> utf8Key)
        {
            ThrowIfDisposed();

            unsafe
            {
                fixed (byte* keyPtr = utf8Key)
                {
                    var result = PtrHashNative.ptrhash_index_string(
                        _handle,
                        (IntPtr)keyPtr,
                        (nuint)utf8Key.Length);

                    if (!result.Success)
                    {
                        var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                        PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                        throw new PtrHashException($"Index lookup failed: {error}");
                    }

                    return result.Value;
                }
            }
        }

        /// <summary>
        /// Batch lookup multiple string keys
        /// </summary>
        /// <param name="keys">String keys to lookup</param>
        /// <param name="results">Output span for results (must be same length as keys)</param>
        /// <exception cref="ArgumentException">Keys span contains null strings or keys and results have different lengths</exception>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Batch lookup failed</exception>
        public void GetIndicesBatch(ReadOnlySpan<string> keys, Span<nuint> results)
        {
            // Call the version with minimal parameter
            GetIndicesBatch(keys, results, minimal: true);
        }

        /// <summary>
        /// Batch lookup multiple string keys from an array
        /// </summary>
        /// <param name="keys">String keys array to lookup</param>
        /// <param name="results">Output span for results (must be same length as keys)</param>
        /// <param name="minimal">Whether to remap indices to [0, n)</param>
        /// <exception cref="ArgumentNullException">Keys array is null</exception>
        /// <exception cref="ArgumentException">Keys array contains null strings or keys and results have different lengths</exception>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Batch lookup failed</exception>
        public void GetIndicesBatch(string[] keys, Span<nuint> results, bool minimal = true)
        {
            if (keys == null)
                throw new ArgumentNullException(nameof(keys));
            
            GetIndicesBatch(keys.AsSpan(), results, minimal);
        }

        /// <summary>
        /// Batch lookup multiple string keys from a list
        /// </summary>
        /// <param name="keys">String keys list to lookup</param>
        /// <param name="results">Output span for results (must be same length as keys)</param>
        /// <param name="minimal">Whether to remap indices to [0, n)</param>
        /// <exception cref="ArgumentNullException">Keys list is null</exception>
        /// <exception cref="ArgumentException">Keys list contains null strings or keys and results have different lengths</exception>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Batch lookup failed</exception>
        public void GetIndicesBatch(List<string> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys == null)
                throw new ArgumentNullException(nameof(keys));
            
            GetIndicesBatch(CollectionsMarshal.AsSpan(keys), results, minimal);
        }

        /// <summary>
        /// Batch lookup multiple string keys from UTF-8 bytes (zero-copy)
        /// </summary>
        /// <param name="utf8Keys">UTF-8 encoded key bytes</param>
        /// <param name="results">Output array for results (must be same length as keys)</param>
        /// <exception cref="ArgumentException">Keys and results arrays have different lengths</exception>
        /// <exception cref="ObjectDisposedException">PtrHash has been disposed</exception>
        /// <exception cref="PtrHashException">Batch lookup failed</exception>
        public void GetIndicesBatch(ReadOnlySpan<ReadOnlyMemory<byte>> utf8Keys, Span<nuint> results)
        {
            ThrowIfDisposed();

            if (utf8Keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            if (utf8Keys.IsEmpty)
                return;

            for (int i = 0; i < utf8Keys.Length; i++)
            {
                results[i] = GetIndex(utf8Keys[i].Span);
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
                throw new ObjectDisposedException(nameof(PtrHashString));
        }

        private static unsafe string GetErrorString(IntPtr errorMsg, nuint errorLen)
        {
            if (errorMsg == IntPtr.Zero || errorLen == 0)
                return "Unknown error";

            var span = new ReadOnlySpan<byte>((void*)errorMsg, (int)errorLen);
            return System.Text.Encoding.UTF8.GetString(span);
        }

        /// <summary>
        /// Get the non-minimal hash index for a single string key (can be >= n, but slightly faster)
        /// </summary>
        /// <param name="key">Key to lookup</param>
        /// <returns>Index that may be >= n</returns>
        /// <exception cref=\"ArgumentNullException\">Key is null</exception>
        /// <exception cref=\"ObjectDisposedException\">PtrHash has been disposed</exception>
        /// <exception cref=\"PtrHashException\">Lookup failed</exception>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public nuint GetIndexNoRemap(string key)
        {
            if (key == null)
                throw new ArgumentNullException(nameof(key));

            ThrowIfDisposed();

            var utf8Key = Encoding.UTF8.GetBytes(key);
            
            unsafe
            {
                fixed (byte* keyPtr = utf8Key)
                {
                    var result = PtrHashNative.ptrhash_index_no_remap_string(
                        _handle,
                        (IntPtr)keyPtr,
                        (nuint)utf8Key.Length);

                    if (!result.Success)
                    {
                        var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                        PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                        throw new PtrHashException($"Index lookup failed: {error}");
                    }

                    return result.Value;
                }
            }
        }

        /// <summary>
        /// Batch lookup multiple string keys with zero-copy operation
        /// </summary>
        /// <param name="keys">Keys to lookup</param>
        /// <param name="results">Output array for results (must be same length as keys)</param>
        /// <param name="minimal">Whether to remap indices to [0, n)</param>
        /// <exception cref=\"ArgumentException\">Keys and results arrays have different lengths or contain null strings</exception>
        /// <exception cref=\"ObjectDisposedException\">PtrHash has been disposed</exception>
        /// <exception cref=\"PtrHashException\">Batch lookup failed</exception>
        public void GetIndicesBatch(ReadOnlySpan<string> keys, Span<nuint> results, bool minimal = true)
        {
            ThrowIfDisposed();

            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            if (keys.IsEmpty)
                return;

            for (int i = 0; i < keys.Length; i++)
            {
                if (keys[i] == null)
                    throw new ArgumentException($"Key at index {i} is null", nameof(keys));
            }

            // Convert strings to UTF-8 byte arrays and pin them
            var utf8Keys = new byte[keys.Length][];
            var keyPtrs = new IntPtr[keys.Length];
            var keyLengths = new nuint[keys.Length];
            var handles = new GCHandle[keys.Length];

            try
            {
                for (int i = 0; i < keys.Length; i++)
                {
                    utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                    keyLengths[i] = (nuint)utf8Keys[i].Length;
                    handles[i] = GCHandle.Alloc(utf8Keys[i], GCHandleType.Pinned);
                    keyPtrs[i] = handles[i].AddrOfPinnedObject();
                }

                unsafe
                {
                    fixed (IntPtr* keysPtrArray = keyPtrs)
                    fixed (nuint* lengthsPtr = keyLengths)
                    fixed (nuint* resultsPtr = results)
                    {
                        var result = PtrHashNative.ptrhash_index_batch_string(
                            _handle,
                            (IntPtr)keysPtrArray,
                            (IntPtr)lengthsPtr,
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
            finally
            {
                // Free the pinned handles
                for (int i = 0; i < handles.Length; i++)
                {
                    if (handles[i].IsAllocated)
                        handles[i].Free();
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
        /// <exception cref=\"ArgumentException\">Keys and results arrays have different lengths or contain null strings</exception>
        /// <exception cref=\"ObjectDisposedException\">PtrHash has been disposed</exception>
        /// <exception cref=\"PtrHashException\">Stream lookup failed</exception>
        public void GetIndicesStream(ReadOnlySpan<string> keys, Span<nuint> results, uint prefetchDistance = 32, bool minimal = true)
        {
            ThrowIfDisposed();

            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            if (keys.IsEmpty)
                return;

            for (int i = 0; i < keys.Length; i++)
            {
                if (keys[i] == null)
                    throw new ArgumentException($"Key at index {i} is null", nameof(keys));
            }

            // Convert strings to UTF-8 byte arrays and pin them
            var utf8Keys = new byte[keys.Length][];
            var keyPtrs = new IntPtr[keys.Length];
            var keyLengths = new nuint[keys.Length];
            var handles = new GCHandle[keys.Length];

            try
            {
                for (int i = 0; i < keys.Length; i++)
                {
                    utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                    keyLengths[i] = (nuint)utf8Keys[i].Length;
                    handles[i] = GCHandle.Alloc(utf8Keys[i], GCHandleType.Pinned);
                    keyPtrs[i] = handles[i].AddrOfPinnedObject();
                }

                unsafe
                {
                    fixed (IntPtr* keysPtrArray = keyPtrs)
                    fixed (nuint* lengthsPtr = keyLengths)
                    fixed (nuint* resultsPtr = results)
                    {
                        var result = PtrHashNative.ptrhash_index_stream_string(
                            _handle,
                            (IntPtr)keysPtrArray,
                            (IntPtr)lengthsPtr,
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
            finally
            {
                // Free the pinned handles
                for (int i = 0; i < handles.Length; i++)
                {
                    if (handles[i].IsAllocated)
                        handles[i].Free();
                }
            }
        }
    }
}