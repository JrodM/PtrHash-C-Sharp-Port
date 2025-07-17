using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using BenchmarkDotNet.Toolchains.InProcess.Emit;
using PtrHash.CSharp.Port.Native;
using System;
using System.Linq;
using System.Runtime.InteropServices;

namespace PtrHash.Benchmarks
{
    [Config(typeof(Config))]
    [MemoryDiagnoser]
    [SimpleJob(RuntimeMoniker.Net80)]
    public class PrefetchBenchmark
    {
        private class Config : ManualConfig
        {
            public Config()
            {
                AddJob(Job.Default.WithToolchain(InProcessEmitToolchain.Instance));
            }
        }

        private byte[] _managedData;
        private IntPtr _unmanagedData;
        private int[] _indices;
        private int _sum;

        [Params(10_000, 30_000)]
        public int Size { get; set; }

        [GlobalSetup]
        public void Setup()
        {
            _managedData = new byte[Size];
            _unmanagedData = Marshal.AllocHGlobal(Size);
            _indices = new int[Size];
            
            var random = new Random(42);
            for (int i = 0; i < Size; i++)
            {
                byte value = (byte)random.Next(0, 256);
                _managedData[i] = value;
                Marshal.WriteByte(_unmanagedData, i, value);
                _indices[i] = i;
            }
            
            // Shuffle indices to create random access pattern
            for (int i = Size - 1; i > 0; i--)
            {
                int j = random.Next(0, i + 1);
                (_indices[i], _indices[j]) = (_indices[j], _indices[i]);
            }
        }

        [GlobalCleanup]
        public void Cleanup()
        {
            if (_unmanagedData != IntPtr.Zero)
            {
                Marshal.FreeHGlobal(_unmanagedData);
            }
        }

        // Managed memory benchmarks
        [Benchmark]
        public int Managed_Sequential_NoPrefetch()
        {
            _sum = 0;
            unsafe
            {
                fixed (byte* dataPtr = _managedData)
                {
                    for (int i = 0; i < Size; i++)
                    {
                        _sum += dataPtr[i];
                    }
                }
            }
            return _sum;
        }

        [Benchmark]
        public int Managed_Sequential_WithPrefetch()
        {
            _sum = 0;
            unsafe
            {
                fixed (byte* dataPtr = _managedData)
                {
                    for (int i = 0; i < Size; i++)
                    {
                        if (i + 64 < Size) // Prefetch ahead
                        {
                            Prefetch.PrefetchRead(dataPtr + i + 64);
                        }
                        _sum += dataPtr[i];
                    }
                }
            }
            return _sum;
        }

        [Benchmark]
        public int Managed_Random_NoPrefetch()
        {
            _sum = 0;
            unsafe
            {
                fixed (byte* dataPtr = _managedData)
                {
                    for (int i = 0; i < Size; i++)
                    {
                        _sum += dataPtr[_indices[i]];
                    }
                }
            }
            return _sum;
        }

        [Benchmark]
        public int Managed_Random_WithPrefetch()
        {
            _sum = 0;
            unsafe
            {
                fixed (byte* dataPtr = _managedData)
                {
                    for (int i = 0; i < Size; i++)
                    {
                        if (i + 16 < Size) // Prefetch next access
                        {
                            Prefetch.PrefetchRead(dataPtr + _indices[i + 16]);
                        }
                        _sum += dataPtr[_indices[i]];
                    }
                }
            }
            return _sum;
        }

        // Unmanaged memory benchmarks
        [Benchmark]
        public int Unmanaged_Sequential_NoPrefetch()
        {
            _sum = 0;
            unsafe
            {
                byte* dataPtr = (byte*)_unmanagedData;
                for (int i = 0; i < Size; i++)
                {
                    _sum += dataPtr[i];
                }
            }
            return _sum;
        }

        [Benchmark]
        public int Unmanaged_Sequential_WithPrefetch()
        {
            _sum = 0;
            unsafe
            {
                byte* dataPtr = (byte*)_unmanagedData;
                for (int i = 0; i < Size; i++)
                {
                    if (i + 64 < Size) // Prefetch ahead
                    {
                        Prefetch.PrefetchRead(dataPtr + i + 64);
                    }
                    _sum += dataPtr[i];
                }
            }
            return _sum;
        }

        [Benchmark]
        public int Unmanaged_Random_NoPrefetch()
        {
            _sum = 0;
            unsafe
            {
                byte* dataPtr = (byte*)_unmanagedData;
                for (int i = 0; i < Size; i++)
                {
                    _sum += dataPtr[_indices[i]];
                }
            }
            return _sum;
        }

        [Benchmark]
        public int Unmanaged_Random_WithPrefetch()
        {
            _sum = 0;
            unsafe
            {
                byte* dataPtr = (byte*)_unmanagedData;
                for (int i = 0; i < Size; i++)
                {
                    if (i + 16 < Size) // Prefetch next access
                    {
                        Prefetch.PrefetchRead(dataPtr + _indices[i + 16]);
                    }
                    _sum += dataPtr[_indices[i]];
                }
            }
            return _sum;
        }

        [Benchmark]
        public int Unmanaged_WithHashing_NoPrefetch()
        {
            _sum = 0;
            unsafe
            {
                byte* dataPtr = (byte*)_unmanagedData;
                for (int i = 0; i < Size; i++)
                {
                    int hash = _indices[i] * 31 + 17; // Simple hash operation
                    int idx = (hash & 0x7FFFFFFF) % Size;
                    _sum += dataPtr[idx];
                }
            }
            return _sum;
        }

        [Benchmark]
        public int Unmanaged_WithHashing_WithPrefetch()
        {
            _sum = 0;
            unsafe
            {
                byte* dataPtr = (byte*)_unmanagedData;
                for (int i = 0; i < Size; i++)
                {
                    int hash = _indices[i] * 31 + 17; // Simple hash operation
                    int idx = (hash & 0x7FFFFFFF) % Size;
                    
                    if (i + 16 < Size) // Prefetch next hashed access
                    {
                        int nextHash = _indices[i + 16] * 31 + 17;
                        int nextIdx = (nextHash & 0x7FFFFFFF) % Size;
                        Prefetch.PrefetchRead(dataPtr + nextIdx);
                    }
                    
                    _sum += dataPtr[idx];
                }
            }
            return _sum;
        }
    }
}