using System;
using System.Runtime.InteropServices;
using Microsoft.Win32.SafeHandles;

namespace PtrHash.CSharp.Port.Core
{
    /// <summary>
    /// SafeHandle for aligned native memory in the C# port
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