using System;
using System.Runtime.InteropServices;
using Microsoft.Win32.SafeHandles;

namespace PtrHash.CSharp.Interop.Native
{
    /// <summary>
    /// SafeHandle for native PtrHash instances
    /// </summary>
    public sealed class SafePtrHashHandle : SafeHandleZeroOrMinusOneIsInvalid
    {
        public SafePtrHashHandle() : base(true) { }

        public SafePtrHashHandle(IntPtr handle) : base(true)
        {
            SetHandle(handle);
        }

        protected override bool ReleaseHandle()
        {
            if (!IsInvalid)
            {
                PtrHashNative.ptrhash_free(handle);
            }
            return true;
        }
    }

    /// <summary>
    /// SafeHandle for native memory allocated with AllocHGlobal
    /// </summary>
    public sealed class SafeHGlobalHandle : SafeHandleZeroOrMinusOneIsInvalid
    {
        public SafeHGlobalHandle() : base(true) { }

        public SafeHGlobalHandle(IntPtr handle) : base(true)
        {
            SetHandle(handle);
        }

        protected override bool ReleaseHandle()
        {
            if (!IsInvalid)
            {
                Marshal.FreeHGlobal(handle);
            }
            return true;
        }

        public static SafeHGlobalHandle Allocate(int bytes)
        {
            var ptr = Marshal.AllocHGlobal(bytes);
            return new SafeHGlobalHandle(ptr);
        }
    }

    /// <summary>
    /// SafeHandle for aligned native memory
    /// </summary>
    public sealed class SafeAlignedHandle : SafeHandleZeroOrMinusOneIsInvalid
    {
        public SafeAlignedHandle() : base(true) { }

        public SafeAlignedHandle(IntPtr handle) : base(true)
        {
            SetHandle(handle);
        }

        protected override bool ReleaseHandle()
        {
            if (!IsInvalid)
            {
                unsafe
                {
                    System.Runtime.InteropServices.NativeMemory.AlignedFree(handle.ToPointer());
                }
            }
            return true;
        }

        public static unsafe SafeAlignedHandle Allocate(nuint size, nuint alignment)
        {
            var ptr = System.Runtime.InteropServices.NativeMemory.AlignedAlloc(size, alignment);
            return new SafeAlignedHandle(new IntPtr(ptr));
        }
    }
}