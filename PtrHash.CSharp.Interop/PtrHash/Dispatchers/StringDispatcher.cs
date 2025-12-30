using System;
using System.Runtime.CompilerServices;
using System.Runtime.InteropServices;
using System.Text;
using PtrHash.CSharp.Interop.Native;

namespace PtrHash.CSharp.Interop.PtrHash.Dispatchers
{
    /// <summary>
    /// Dispatcher for string keys - routes to *_string native functions
    /// </summary>
    public readonly struct StringDispatcher : IDispatcher<string>
    {
        public Type KeyType => typeof(string);

        public unsafe PtrHashNative.FFIResultHandle CreateNew(ReadOnlySpan<string> keys, PtrHashNative.FFIParams parameters)
        {
            if (keys.IsEmpty)
                throw new ArgumentException("Keys span cannot be empty", nameof(keys));

            var utf8Keys = new byte[keys.Length][];
            var keyLengths = new nuint[keys.Length];
            var keyHandles = new SafeHGlobalHandle[keys.Length];
            SafeHGlobalHandle keysPtrArrayHandle = null;
            SafeHGlobalHandle keyLengthsPtrHandle = null;

            try
            {
                for (int i = 0; i < keys.Length; i++)
                {
                    if (keys[i] == null)
                        throw new ArgumentException($"Key at index {i} cannot be null", nameof(keys));
                        
                    utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                    keyLengths[i] = (nuint)utf8Keys[i].Length;
                    
                    keyHandles[i] = SafeHGlobalHandle.Allocate(utf8Keys[i].Length);
                    Marshal.Copy(utf8Keys[i], 0, keyHandles[i].DangerousGetHandle(), utf8Keys[i].Length);
                }

                keysPtrArrayHandle = SafeHGlobalHandle.Allocate(keys.Length * IntPtr.Size);
                keyLengthsPtrHandle = SafeHGlobalHandle.Allocate((int)(keys.Length * sizeof(nuint)));
                
                var keyPointers = new IntPtr[keys.Length];
                for (int i = 0; i < keys.Length; i++)
                {
                    keyPointers[i] = keyHandles[i].DangerousGetHandle();
                }
                Marshal.Copy(keyPointers, 0, keysPtrArrayHandle.DangerousGetHandle(), keys.Length);

                fixed (nuint* keyLengthsArray = keyLengths)
                {
                    Buffer.MemoryCopy(keyLengthsArray, keyLengthsPtrHandle.DangerousGetHandle().ToPointer(), 
                        keys.Length * sizeof(nuint), keys.Length * sizeof(nuint));
                }

                var result = PtrHashNative.ptrhash_new_string(
                    keysPtrArrayHandle.DangerousGetHandle(), keyLengthsPtrHandle.DangerousGetHandle(), (nuint)keys.Length, parameters);
                    
                return result;
            }
            finally
            {
                for (int i = 0; i < keyHandles.Length; i++)
                {
                    keyHandles[i]?.Dispose();
                }
                keysPtrArrayHandle?.Dispose();
                keyLengthsPtrHandle?.Dispose();
            }
        }

        public unsafe PtrHashNative.FFIResultIndex GetIndex(IntPtr handle, string key)
        {
            if (key == null)
                throw new ArgumentNullException(nameof(key));
                
            var utf8Bytes = Encoding.UTF8.GetBytes(key);
            
            fixed (byte* keyPtr = utf8Bytes)
            {
                return PtrHashNative.ptrhash_index_string(
                    handle, (IntPtr)keyPtr, (nuint)utf8Bytes.Length);
            }
        }

        public unsafe PtrHashNative.FFIResultIndex GetIndexNoRemap(IntPtr handle, string key)
        {
            if (key == null)
                throw new ArgumentNullException(nameof(key));
                
            var utf8Bytes = Encoding.UTF8.GetBytes(key);
            
            fixed (byte* keyPtr = utf8Bytes)
            {
                return PtrHashNative.ptrhash_index_no_remap_string(
                    handle, (IntPtr)keyPtr, (nuint)utf8Bytes.Length);
            }
        }

        public unsafe PtrHashNative.FFIResultVoid GetIndicesBatch(IntPtr handle, ReadOnlySpan<string> keys, Span<nuint> results, bool minimal)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");
                
            if (keys.IsEmpty)
                return new PtrHashNative.FFIResultVoid { Success = true, Value = 0, ErrorMsg = IntPtr.Zero, ErrorLen = 0 };

            var utf8Keys = new byte[keys.Length][];
            var keyLengths = new nuint[keys.Length];
            var keyHandles = new SafeHGlobalHandle[keys.Length];
            SafeHGlobalHandle keysPtrArrayHandle = null;
            SafeHGlobalHandle keyLengthsPtrHandle = null;

            try
            {
                for (int i = 0; i < keys.Length; i++)
                {
                    if (keys[i] == null)
                        throw new ArgumentException($"Key at index {i} cannot be null", nameof(keys));
                        
                    utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                    keyLengths[i] = (nuint)utf8Keys[i].Length;
                    
                    keyHandles[i] = SafeHGlobalHandle.Allocate(utf8Keys[i].Length);
                    Marshal.Copy(utf8Keys[i], 0, keyHandles[i].DangerousGetHandle(), utf8Keys[i].Length);
                }

                keysPtrArrayHandle = SafeHGlobalHandle.Allocate(keys.Length * IntPtr.Size);
                keyLengthsPtrHandle = SafeHGlobalHandle.Allocate((int)(keys.Length * sizeof(nuint)));
                
                var keyPointers = new IntPtr[keys.Length];
                for (int i = 0; i < keys.Length; i++)
                {
                    keyPointers[i] = keyHandles[i].DangerousGetHandle();
                }
                Marshal.Copy(keyPointers, 0, keysPtrArrayHandle.DangerousGetHandle(), keys.Length);

                fixed (nuint* keyLengthsArray = keyLengths)
                {
                    Buffer.MemoryCopy(keyLengthsArray, keyLengthsPtrHandle.DangerousGetHandle().ToPointer(), 
                        keys.Length * sizeof(nuint), keys.Length * sizeof(nuint));
                }

                fixed (nuint* resultsPtr = results)
                {
                    return PtrHashNative.ptrhash_index_batch_string(
                        handle, keysPtrArrayHandle.DangerousGetHandle(), keyLengthsPtrHandle.DangerousGetHandle(), (nuint)keys.Length, 
                        (IntPtr)resultsPtr, minimal);
                }
            }
            finally
            {
                for (int i = 0; i < keyHandles.Length; i++)
                {
                    keyHandles[i]?.Dispose();
                }
                keysPtrArrayHandle?.Dispose();
                keyLengthsPtrHandle?.Dispose();
            }
        }

        public unsafe PtrHashNative.FFIResultVoid GetIndicesStream(IntPtr handle, ReadOnlySpan<string> keys, Span<nuint> results, uint prefetchDistance, bool minimal)
        {
            if (keys.Length != results.Length)
                throw new ArgumentException("Keys and results spans must have the same length");
                
            if (keys.IsEmpty)
                return new PtrHashNative.FFIResultVoid { Success = true, Value = 0, ErrorMsg = IntPtr.Zero, ErrorLen = 0 };

            var utf8Keys = new byte[keys.Length][];
            var keyLengths = new nuint[keys.Length];
            var totalKeyBytes = 0;

            for (int i = 0; i < keys.Length; i++)
            {
                if (keys[i] == null)
                    throw new ArgumentException($"Key at index {i} cannot be null", nameof(keys));
                    
                utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                keyLengths[i] = (nuint)utf8Keys[i].Length;
                totalKeyBytes += utf8Keys[i].Length;
            }

            SafeHGlobalHandle keysPtrHandle = null;
            SafeHGlobalHandle keyLengthsPtrHandle = null;
            
            try
            {
                keysPtrHandle = SafeHGlobalHandle.Allocate(totalKeyBytes);
                keyLengthsPtrHandle = SafeHGlobalHandle.Allocate((int)(keys.Length * sizeof(nuint)));

                var currentPtr = keysPtrHandle.DangerousGetHandle();
                for (int i = 0; i < keys.Length; i++)
                {
                    Marshal.Copy(utf8Keys[i], 0, currentPtr, utf8Keys[i].Length);
                    currentPtr += utf8Keys[i].Length;
                }

                fixed (nuint* keyLengthsArray = keyLengths)
                {
                    Buffer.MemoryCopy(keyLengthsArray, keyLengthsPtrHandle.DangerousGetHandle().ToPointer(), 
                        keys.Length * sizeof(nuint), keys.Length * sizeof(nuint));
                }

                fixed (nuint* resultsPtr = results)
                {
                    return PtrHashNative.ptrhash_index_stream_string(
                        handle, keysPtrHandle.DangerousGetHandle(), keyLengthsPtrHandle.DangerousGetHandle(), (nuint)keys.Length, 
                        (IntPtr)resultsPtr, (nuint)prefetchDistance, minimal);
                }
            }
            finally
            {
                keysPtrHandle?.Dispose();
                keyLengthsPtrHandle?.Dispose();
            }
        }

        public PtrHashNative.FFIResultInfo GetInfo(IntPtr handle)
        {
            return PtrHashNative.ptrhash_info_u64(handle);
        }
    }
}