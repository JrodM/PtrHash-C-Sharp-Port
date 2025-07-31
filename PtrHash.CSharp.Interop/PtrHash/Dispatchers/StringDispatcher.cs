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

            // Convert strings to UTF-8 byte arrays
            var utf8Keys = new byte[keys.Length][];
            var keyLengths = new nuint[keys.Length];
            var keyHandles = new SafeHGlobalHandle[keys.Length];
            SafeHGlobalHandle keysPtrArrayHandle = null;
            SafeHGlobalHandle keyLengthsPtrHandle = null;

            try
            {
                // Convert to UTF-8 and allocate individual string pointers with SafeHandles
                for (int i = 0; i < keys.Length; i++)
                {
                    if (keys[i] == null)
                        throw new ArgumentException($"Key at index {i} cannot be null", nameof(keys));
                        
                    utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                    keyLengths[i] = (nuint)utf8Keys[i].Length;
                    
                    // Allocate and copy each string using SafeHandle
                    keyHandles[i] = SafeHGlobalHandle.Allocate(utf8Keys[i].Length);
                    Marshal.Copy(utf8Keys[i], 0, keyHandles[i].DangerousGetHandle(), utf8Keys[i].Length);
                }

                // Allocate array of pointers and key lengths using SafeHandles
                keysPtrArrayHandle = SafeHGlobalHandle.Allocate(keys.Length * IntPtr.Size);
                keyLengthsPtrHandle = SafeHGlobalHandle.Allocate((int)(keys.Length * sizeof(nuint)));
                
                // Copy array of string pointers
                var keyPointers = new IntPtr[keys.Length];
                for (int i = 0; i < keys.Length; i++)
                {
                    keyPointers[i] = keyHandles[i].DangerousGetHandle();
                }
                Marshal.Copy(keyPointers, 0, keysPtrArrayHandle.DangerousGetHandle(), keys.Length);

                // Copy key lengths array
                fixed (nuint* keyLengthsArray = keyLengths)
                {
                    Buffer.MemoryCopy(keyLengthsArray, keyLengthsPtrHandle.DangerousGetHandle().ToPointer(), 
                        keys.Length * sizeof(nuint), keys.Length * sizeof(nuint));
                }

                // Call native function
                var result = PtrHashNative.ptrhash_new_string(
                    keysPtrArrayHandle.DangerousGetHandle(), keyLengthsPtrHandle.DangerousGetHandle(), (nuint)keys.Length, parameters);
                    
                return result;
            }
            finally
            {
                // Clean up all allocated memory - SafeHandles will dispose automatically
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
                
            // Convert string to UTF-8 bytes
            var utf8Bytes = Encoding.UTF8.GetBytes(key);
            
            // Pin the byte array and call native function
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
                
            // Convert string to UTF-8 bytes
            var utf8Bytes = Encoding.UTF8.GetBytes(key);
            
            // Pin the byte array and call native function
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

            // Convert strings to UTF-8 byte arrays
            var utf8Keys = new byte[keys.Length][];
            var keyLengths = new nuint[keys.Length];
            var keyHandles = new SafeHGlobalHandle[keys.Length];
            SafeHGlobalHandle keysPtrArrayHandle = null;
            SafeHGlobalHandle keyLengthsPtrHandle = null;

            try
            {
                // Convert to UTF-8 and allocate individual string pointers with SafeHandles
                for (int i = 0; i < keys.Length; i++)
                {
                    if (keys[i] == null)
                        throw new ArgumentException($"Key at index {i} cannot be null", nameof(keys));
                        
                    utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                    keyLengths[i] = (nuint)utf8Keys[i].Length;
                    
                    // Allocate and copy each string using SafeHandle
                    keyHandles[i] = SafeHGlobalHandle.Allocate(utf8Keys[i].Length);
                    Marshal.Copy(utf8Keys[i], 0, keyHandles[i].DangerousGetHandle(), utf8Keys[i].Length);
                }

                // Allocate array of pointers and key lengths using SafeHandles
                keysPtrArrayHandle = SafeHGlobalHandle.Allocate(keys.Length * IntPtr.Size);
                keyLengthsPtrHandle = SafeHGlobalHandle.Allocate((int)(keys.Length * sizeof(nuint)));
                
                // Copy array of string pointers
                var keyPointers = new IntPtr[keys.Length];
                for (int i = 0; i < keys.Length; i++)
                {
                    keyPointers[i] = keyHandles[i].DangerousGetHandle();
                }
                Marshal.Copy(keyPointers, 0, keysPtrArrayHandle.DangerousGetHandle(), keys.Length);

                // Copy key lengths array
                fixed (nuint* keyLengthsArray = keyLengths)
                {
                    Buffer.MemoryCopy(keyLengthsArray, keyLengthsPtrHandle.DangerousGetHandle().ToPointer(), 
                        keys.Length * sizeof(nuint), keys.Length * sizeof(nuint));
                }

                // Pin results array and call native function
                fixed (nuint* resultsPtr = results)
                {
                    return PtrHashNative.ptrhash_index_batch_string(
                        handle, keysPtrArrayHandle.DangerousGetHandle(), keyLengthsPtrHandle.DangerousGetHandle(), (nuint)keys.Length, 
                        (IntPtr)resultsPtr, minimal);
                }
            }
            finally
            {
                // Clean up all allocated memory - SafeHandles will dispose automatically
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

            // Convert strings to UTF-8 byte arrays
            var utf8Keys = new byte[keys.Length][];
            var keyLengths = new nuint[keys.Length];
            var totalKeyBytes = 0;

            // Convert to UTF-8 and calculate total size
            for (int i = 0; i < keys.Length; i++)
            {
                if (keys[i] == null)
                    throw new ArgumentException($"Key at index {i} cannot be null", nameof(keys));
                    
                utf8Keys[i] = Encoding.UTF8.GetBytes(keys[i]);
                keyLengths[i] = (nuint)utf8Keys[i].Length;
                totalKeyBytes += utf8Keys[i].Length;
            }

            // Allocate unmanaged memory using SafeHandles
            SafeHGlobalHandle keysPtrHandle = null;
            SafeHGlobalHandle keyLengthsPtrHandle = null;
            
            try
            {
                keysPtrHandle = SafeHGlobalHandle.Allocate(totalKeyBytes);
                keyLengthsPtrHandle = SafeHGlobalHandle.Allocate((int)(keys.Length * sizeof(nuint)));

                // Copy UTF-8 key data to unmanaged memory
                var currentPtr = keysPtrHandle.DangerousGetHandle();
                for (int i = 0; i < keys.Length; i++)
                {
                    Marshal.Copy(utf8Keys[i], 0, currentPtr, utf8Keys[i].Length);
                    currentPtr += utf8Keys[i].Length;
                }

                // Copy key lengths array
                fixed (nuint* keyLengthsArray = keyLengths)
                {
                    Buffer.MemoryCopy(keyLengthsArray, keyLengthsPtrHandle.DangerousGetHandle().ToPointer(), 
                        keys.Length * sizeof(nuint), keys.Length * sizeof(nuint));
                }

                // Pin results array and call native function
                fixed (nuint* resultsPtr = results)
                {
                    return PtrHashNative.ptrhash_index_stream_string(
                        handle, keysPtrHandle.DangerousGetHandle(), keyLengthsPtrHandle.DangerousGetHandle(), (nuint)keys.Length, 
                        (IntPtr)resultsPtr, (nuint)prefetchDistance, minimal);
                }
            }
            finally
            {
                // Clean up allocated memory - SafeHandles will dispose automatically
                keysPtrHandle?.Dispose();
                keyLengthsPtrHandle?.Dispose();
            }
        }

        public PtrHashNative.FFIResultInfo GetInfo(IntPtr handle)
        {
            // String info function is the same as U64 - no key-specific data needed
            return PtrHashNative.ptrhash_info_u64(handle);
        }
    }
}