using System;
using System.Collections.Generic;
using System.Runtime.CompilerServices;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.PtrHash.Dispatchers;

namespace PtrHash.CSharp.Interop.PtrHash
{
    /// <summary>
    /// Interop PtrHash implementation that dispatches to native type-specific functions
    /// </summary>
    public class PtrHashInterop<TKey, TDispatcher> : IPtrHash<TKey>
        where TDispatcher : struct, IDispatcher<TKey>
    {
        private readonly SafePtrHashHandle _handle;
        private readonly TDispatcher _dispatcher;
        private readonly PtrHashNative.FFIParams _params;
        private bool _disposed;

        public PtrHashNative.FFIParams Params => _params;

        public PtrHashInterop(ReadOnlySpan<TKey> keys, PtrHashNative.FFIParams? parameters = null)
        {
            if (keys.IsEmpty)
                throw new ArgumentException("Keys span cannot be empty", nameof(keys));

            _params = parameters ?? PtrHashNative.FFIParams.Fast;
            _dispatcher = default(TDispatcher);

            var result = _dispatcher.CreateNew(keys, _params);
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Failed to construct PtrHash: {error}");
            }

            _handle = new SafePtrHashHandle(result.Value);
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
        public nuint GetIndex(TKey key)
        {
            var result = _dispatcher.GetIndex(_handle.DangerousGetHandle(), key);
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Index lookup failed: {error}");
            }
            return result.Value;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
        public nuint GetIndexNoRemap(TKey key)
        {
            var result = _dispatcher.GetIndexNoRemap(_handle.DangerousGetHandle(), key);
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Index lookup failed: {error}");
            }
            return result.Value;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
        public bool TryGetIndex(TKey key, out nuint index)
        {
            var result = _dispatcher.GetIndex(_handle.DangerousGetHandle(), key);
            if (result.Success)
            {
                index = result.Value;
                return true;
            }
            else
            {
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                index = 0;
                return false;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining | MethodImplOptions.AggressiveOptimization)]
        public bool TryGetIndexNoRemap(TKey key, out nuint index)
        {
            var result = _dispatcher.GetIndexNoRemap(_handle.DangerousGetHandle(), key);
            if (result.Success)
            {
                index = result.Value;
                return true;
            }
            else
            {
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                index = 0;
                return false;
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        public void GetIndicesBatch(ReadOnlySpan<TKey> keys, Span<nuint> results, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            if (keys.IsEmpty)
                return;

            var result = _dispatcher.GetIndicesBatch(_handle.DangerousGetHandle(), keys, results, minimal);
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Batch lookup failed: {error}");
            }
        }

        [MethodImpl(MethodImplOptions.AggressiveOptimization)]
        public void GetIndicesStream(ReadOnlySpan<TKey> keys, Span<nuint> results, uint prefetchDistance = 32, bool minimal = true)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");

            if (keys.IsEmpty)
                return;

            var result = _dispatcher.GetIndicesStream(_handle.DangerousGetHandle(), keys, results, prefetchDistance, minimal);
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Stream lookup failed: {error}");
            }
        }

        public async IAsyncEnumerable<nuint> GetIndicesAsync(IAsyncEnumerable<TKey> keys, bool minimal = true)
        {
            const int batchSize = 1024;
            var keyBuffer = new TKey[batchSize];
            var resultBuffer = new nuint[batchSize];
            var keyCount = 0;

            await foreach (var key in keys)
            {
                keyBuffer[keyCount++] = key;

                if (keyCount == batchSize)
                {
                    GetIndicesBatch(keyBuffer.AsSpan(0, keyCount), resultBuffer.AsSpan(0, keyCount), minimal);
                    
                    for (int i = 0; i < keyCount; i++)
                    {
                        yield return resultBuffer[i];
                    }
                    
                    keyCount = 0;
                }
            }

            if (keyCount > 0)
            {
                GetIndicesBatch(keyBuffer.AsSpan(0, keyCount), resultBuffer.AsSpan(0, keyCount), minimal);
                
                for (int i = 0; i < keyCount; i++)
                {
                    yield return resultBuffer[i];
                }
            }
        }

        public PtrHashInfo GetInfo()
        {
            var result = _dispatcher.GetInfo(_handle.DangerousGetHandle());
            if (!result.Success)
            {
                var error = GetErrorString(result.ErrorMsg, result.ErrorLen);
                PtrHashNative.ptrhash_free_error(result.ErrorMsg, result.ErrorLen);
                throw new PtrHashException($"Failed to get info: {error}");
            }

            return new PtrHashInfo(result.Value.N, result.Value.BitsPerKey, result.Value.MaxIndex);
        }

        public void Dispose()
        {
            if (!_disposed)
            {
                _handle?.Dispose();
                _disposed = true;
            }
        }


        private static unsafe string GetErrorString(IntPtr errorMsg, nuint errorLen)
        {
            if (errorMsg == IntPtr.Zero || errorLen == 0)
                return "Unknown error";

            var span = new ReadOnlySpan<byte>((void*)errorMsg, (int)errorLen);
            return System.Text.Encoding.UTF8.GetString(span);
        }
    }

    /// <summary>
    /// Optimized PtrHash for ulong keys - zero virtual call overhead
    /// </summary>
    public sealed class PtrHashInteropU64 : PtrHashInterop<ulong, ULongDispatcher>
    {
        public PtrHashInteropU64(ReadOnlySpan<ulong> keys, PtrHashNative.FFIParams? parameters = null)
            : base(keys, parameters) { }
    }

    /// <summary>
    /// Optimized PtrHash for string keys - zero virtual call overhead
    /// </summary>
    public sealed class PtrHashInteropString : PtrHashInterop<string, StringDispatcher>
    {
        public PtrHashInteropString(ReadOnlySpan<string> keys, PtrHashNative.FFIParams? parameters = null)
            : base(keys, parameters) { }
    }

    /// <summary>
    /// Optimized PtrHash for int keys - zero virtual call overhead
    /// </summary>
    public sealed class PtrHashInteropInt : PtrHashInterop<int, IntDispatcher>
    {
        public PtrHashInteropInt(ReadOnlySpan<int> keys, PtrHashNative.FFIParams? parameters = null)
            : base(keys, parameters) { }
    }

    /// <summary>
    /// Optimized PtrHash for uint keys - zero virtual call overhead
    /// </summary>
    public sealed class PtrHashInteropUInt : PtrHashInterop<uint, UIntDispatcher>
    {
        public PtrHashInteropUInt(ReadOnlySpan<uint> keys, PtrHashNative.FFIParams? parameters = null)
            : base(keys, parameters) { }
    }

}