using System;
using System.Runtime.InteropServices;
using System.Runtime.CompilerServices;

namespace PtrHash.CSharp.Interop.Native
{
    public static partial class PtrHashNative
    {
        private const string LibraryName = "ptrhash";

        #region Structures

        [StructLayout(LayoutKind.Sequential)]
        public struct FFIParams
        {
            public uint DefaultParamSet; // 0=custom, 1=fast
            
            // Optional override flags (1=set, 0=use preset default)
            public byte HasOverrideSinglePart;
            public byte HasOverrideLambda;
            public byte HasOverrideHashFunction;
            public byte HasOverrideBucketFunction;
            
            // Override values (only used if corresponding HasOverride* is 1)
            [MarshalAs(UnmanagedType.U1)]
            public bool OverrideSinglePart;
            public double OverrideLambda;
            public uint OverrideHashFunction;
            public uint OverrideBucketFunction;

            public static FFIParams Fast => new()
            {
                DefaultParamSet = 1, // Fast preset
                HasOverrideSinglePart = 0, // Use preset default
                HasOverrideLambda = 0, // Use preset default
                HasOverrideHashFunction = 0, // Use preset default
                HasOverrideBucketFunction = 0, // Use preset default
                OverrideSinglePart = false, // Unused
                OverrideLambda = 0.0, // Unused
                OverrideHashFunction = 0, // Unused
                OverrideBucketFunction = 0 // Unused
            };


            public static FFIParams FastWithOverrides(
                uint? hashFunction = null,
                bool? singlePart = null,
                double? lambda = null,
                uint? bucketFunction = null
            ) => new()
            {
                DefaultParamSet = 1, // Fast preset
                HasOverrideSinglePart = (byte)(singlePart.HasValue ? 1 : 0),
                HasOverrideLambda = (byte)(lambda.HasValue ? 1 : 0),
                HasOverrideHashFunction = (byte)(hashFunction.HasValue ? 1 : 0),
                HasOverrideBucketFunction = (byte)(bucketFunction.HasValue ? 1 : 0),
                OverrideSinglePart = singlePart ?? false,
                OverrideLambda = lambda ?? 0.0,
                OverrideHashFunction = hashFunction ?? 0,
                OverrideBucketFunction = bucketFunction ?? 0
            };

            public static FFIParams Custom(
                bool singlePart = false,
                double lambda = 3.0,
                uint hashFunction = 0, // FxHash
                uint bucketFunction = 0 // Linear
            ) => new()
            {
                DefaultParamSet = 0, // Custom
                HasOverrideSinglePart = 1, // Always set for custom
                HasOverrideLambda = 1, // Always set for custom
                HasOverrideHashFunction = 1, // Always set for custom
                HasOverrideBucketFunction = 1, // Always set for custom
                OverrideSinglePart = singlePart,
                OverrideLambda = lambda,
                OverrideHashFunction = hashFunction,
                OverrideBucketFunction = bucketFunction
            };
        }

        [StructLayout(LayoutKind.Sequential)]
        public struct FFIResultHandle
        {
            [MarshalAs(UnmanagedType.U1)]
            public bool Success;
            public IntPtr Value;
            public IntPtr ErrorMsg;
            public nuint ErrorLen;
        }

        [StructLayout(LayoutKind.Sequential)]
        public struct FFIResultIndex
        {
            [MarshalAs(UnmanagedType.U1)]
            public bool Success;
            public nuint Value;
            public IntPtr ErrorMsg;
            public nuint ErrorLen;
        }

        [StructLayout(LayoutKind.Sequential)]
        public struct FFIResultVoid
        {
            [MarshalAs(UnmanagedType.U1)]
            public bool Success;
            public byte Value;
            public IntPtr ErrorMsg;
            public nuint ErrorLen;
        }

        [StructLayout(LayoutKind.Sequential)]
        public struct FFIResultInfo
        {
            [MarshalAs(UnmanagedType.U1)]
            public bool Success;
            public PtrHashInfo Value;
            public IntPtr ErrorMsg;
            public nuint ErrorLen;
        }

        [StructLayout(LayoutKind.Sequential)]
        public struct PtrHashInfo
        {
            public nuint N;
            public double BitsPerKey;
            public nuint MaxIndex;
        }

        #endregion

        #region U64 Key Functions

        [LibraryImport(LibraryName)]
        [UnmanagedCallConv(CallConvs = new Type[] { typeof(CallConvCdecl) })]
        internal static partial FFIResultHandle ptrhash_new_u64(
            IntPtr keys,
            nuint n,
            FFIParams parameters);

        [LibraryImport(LibraryName)]
        [UnmanagedCallConv(CallConvs = new Type[] { typeof(CallConvCdecl) })]
        [SuppressGCTransition] // Critical: 10-20ns vs 100-200ns call overhead with source-gen
        internal static partial FFIResultIndex ptrhash_index_u64(
            IntPtr handle,
            ulong key);

        [LibraryImport(LibraryName)]
        [UnmanagedCallConv(CallConvs = new Type[] { typeof(CallConvCdecl) })]
        [SuppressGCTransition] // Critical: 10-20ns vs 100-200ns call overhead with source-gen
        internal static partial FFIResultIndex ptrhash_index_no_remap_u64(
            IntPtr handle,
            ulong key);

        [LibraryImport(LibraryName)]
        [UnmanagedCallConv(CallConvs = new Type[] { typeof(CallConvCdecl) })]
        [SuppressGCTransition] // Batch operations are compute-intensive, ideal for SuppressGCTransition
        internal static partial FFIResultVoid ptrhash_index_batch_u64(
            IntPtr handle,
            IntPtr keys,
            nuint n,
            IntPtr results,
            [MarshalAs(UnmanagedType.U1)] bool minimal);

        [LibraryImport(LibraryName)]
        [UnmanagedCallConv(CallConvs = new Type[] { typeof(CallConvCdecl) })]
        [SuppressGCTransition] // Stream operations with prefetch are compute-intensive
        internal static partial FFIResultVoid ptrhash_index_stream_u64(
            IntPtr handle,
            IntPtr keys,
            nuint n,
            IntPtr results,
            nuint prefetchDistance,
            [MarshalAs(UnmanagedType.U1)] bool minimal);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultInfo ptrhash_info_u64(
            IntPtr handle);

        #endregion

        #region String Key Functions

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultHandle ptrhash_new_string(
            IntPtr keys,
            IntPtr keyLengths,
            nuint n,
            FFIParams parameters);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultIndex ptrhash_index_string(
            IntPtr handle,
            IntPtr key,
            nuint keyLen);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultIndex ptrhash_index_no_remap_string(
            IntPtr handle,
            IntPtr key,
            nuint keyLen);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultVoid ptrhash_index_batch_string(
            IntPtr handle,
            IntPtr keys,
            IntPtr keyLengths,
            nuint n,
            IntPtr results,
            [MarshalAs(UnmanagedType.U1)] bool minimal);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultVoid ptrhash_index_stream_string(
            IntPtr handle,
            IntPtr keys,
            IntPtr keyLengths,
            nuint n,
            IntPtr results,
            nuint prefetchDistance,
            [MarshalAs(UnmanagedType.U1)] bool minimal);

        #endregion

        #region Memory Management

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern void ptrhash_free(IntPtr handle);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern void ptrhash_free_error(IntPtr errorMsg, nuint errorLen);

        #endregion

        #region Hash Function Testing

        [LibraryImport(LibraryName)]
        [UnmanagedCallConv(CallConvs = new Type[] { typeof(CallConvCdecl) })]
        [SuppressGCTransition] // Hash functions are very fast, perfect for SuppressGCTransition
        internal static partial ulong test_native_fxhash64(ulong key, ulong seed);

        [LibraryImport(LibraryName)]
        [UnmanagedCallConv(CallConvs = new Type[] { typeof(CallConvCdecl) })]
        [SuppressGCTransition] // Hash functions are very fast, perfect for SuppressGCTransition
        internal static partial ulong test_native_stronger_hash(ulong key, ulong seed);

        #endregion
    }
}