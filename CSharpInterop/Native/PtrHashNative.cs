using System;
using System.Runtime.InteropServices;

namespace PtrHash.Native
{
    /// <summary>
    /// Native FFI bindings for PtrHash library
    /// </summary>
    internal static class PtrHashNative
    {
        private const string LibraryName = "ptrhash";

        #region Structures

        [StructLayout(LayoutKind.Sequential)]
        internal struct FFIParams
        {
            public uint ParamSet; // 0=default, 1=fast
            [MarshalAs(UnmanagedType.U1)]
            public bool SinglePart;
            public double Lambda; // Lambda parameter (to modify baseline settings)
            public uint U64HashFunction; // Hash function for u64 keys
            public uint StringHashFunction; // Hash function for string keys
        }

        [StructLayout(LayoutKind.Sequential)]
        internal struct FFIResultHandle
        {
            [MarshalAs(UnmanagedType.U1)]
            public bool Success;
            public IntPtr Value;
            public IntPtr ErrorMsg;
            public nuint ErrorLen;
        }

        [StructLayout(LayoutKind.Sequential)]
        internal struct FFIResultIndex
        {
            [MarshalAs(UnmanagedType.U1)]
            public bool Success;
            public nuint Value;
            public IntPtr ErrorMsg;
            public nuint ErrorLen;
        }

        [StructLayout(LayoutKind.Sequential)]
        internal struct FFIResultVoid
        {
            [MarshalAs(UnmanagedType.U1)]
            public bool Success;
            public byte Value; // Dummy value for void operations
            public IntPtr ErrorMsg;
            public nuint ErrorLen;
        }

        [StructLayout(LayoutKind.Sequential)]
        internal struct FFIResultInfo
        {
            [MarshalAs(UnmanagedType.U1)]
            public bool Success;
            public PtrHashInfo Value;
            public IntPtr ErrorMsg;
            public nuint ErrorLen;
        }

        [StructLayout(LayoutKind.Sequential)]
        internal struct PtrHashInfo
        {
            public nuint N;
            public double BitsPerKey;
            public nuint MaxIndex;
        }

        #endregion

        #region U64 Key Functions

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultHandle ptrhash_new_u64(
            IntPtr keys,
            nuint n,
            FFIParams parameters);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultIndex ptrhash_index_u64(
            IntPtr handle,
            ulong key);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultIndex ptrhash_index_no_remap_u64(
            IntPtr handle,
            ulong key);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultVoid ptrhash_index_batch_u64(
            IntPtr handle,
            IntPtr keys,
            nuint n,
            IntPtr results,
            [MarshalAs(UnmanagedType.U1)] bool minimal);

        [DllImport(LibraryName, CallingConvention = CallingConvention.Cdecl)]
        internal static extern FFIResultVoid ptrhash_index_stream_u64(
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
    }
}