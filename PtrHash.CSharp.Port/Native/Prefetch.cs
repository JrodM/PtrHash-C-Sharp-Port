using System;
using System.Runtime.CompilerServices;
using System.Runtime.Intrinsics.X86;

namespace PtrHash.CSharp.Port.Native
{
    /// <summary>
    /// Native prefetch instructions for improving memory access patterns
    /// Uses SSE prefetch instructions when available
    /// </summary>
    public static unsafe class Prefetch
    {
        /// <summary>
        /// Prefetch memory address for reading (temporal locality)
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void PrefetchRead(void* address)
        {
            if (Sse.IsSupported)
            {
                Sse.Prefetch0(address);
            }
            // If SSE is not supported, this becomes a no-op
            // The JIT should optimize this away on unsupported platforms
        }

        /// <summary>
        /// Prefetch memory address for reading with specific locality hint
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void PrefetchReadNta(void* address)
        {
            if (Sse.IsSupported)
            {
                Sse.PrefetchNonTemporal(address);
            }
        }

        /// <summary>
        /// Prefetch memory address for reading (T1 cache level)
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void PrefetchReadT1(void* address)
        {
            if (Sse.IsSupported)
            {
                Sse.Prefetch1(address);
            }
        }

        /// <summary>
        /// Prefetch memory address for reading (T2 cache level)
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void PrefetchReadT2(void* address)
        {
            if (Sse.IsSupported)
            {
                Sse.Prefetch2(address);
            }
        }

        /// <summary>
        /// Prefetch array element at specific index
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void PrefetchArray<T>(T[] array, nuint index) where T : unmanaged
        {
            if (index < (nuint)array.Length)
            {
                fixed (T* ptr = &array[index])
                {
                    PrefetchRead(ptr);
                }
            }
        }

        /// <summary>
        /// Prefetch span element at specific index
        /// </summary>
        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public static void PrefetchSpan<T>(Span<T> span, nuint index) where T : unmanaged
        {
            if (index < (nuint)span.Length)
            {
                fixed (T* ptr = &span[(int)index])
                {
                    PrefetchRead(ptr);
                }
            }
        }
    }
}