using BenchmarkDotNet.Attributes;
using BenchmarkDotNet.Configs;
using BenchmarkDotNet.Jobs;
using BenchmarkDotNet.Toolchains.InProcess.Emit;
using PtrHash.CSharp.Port.Native;
using System;
using System.Linq;

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
                //AddJob(Job.Default.WithToolchain(InProcessEmitToolchain.Instance));
            }
        }

        private byte[] _data;
        private int[] _indices;
        private int _sum;

        [Params(10_000, 30_000)]
        public int Size { get; set; }

        [GlobalSetup]
        public void Setup()
        {
            _data = new byte[Size];
            _indices = new int[Size];
            
            var random = new Random(42);
            for (int i = 0; i < Size; i++)
            {
                _data[i] = (byte)random.Next(0, 256);
                _indices[i] = i;
            }
            
            // Shuffle indices to create random access pattern
            for (int i = Size - 1; i > 0; i--)
            {
                int j = random.Next(0, i + 1);
                (_indices[i], _indices[j]) = (_indices[j], _indices[i]);
            }
        }

        [Benchmark]
        public int Sequential_NoPrefetch()
        {
            _sum = 0;
            unsafe
            {
                fixed (byte* dataPtr = _data)
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
        public int Sequential_WithPrefetch()
        {
            _sum = 0;
            unsafe
            {
                fixed (byte* dataPtr = _data)
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
        public int WithHashing_NoPrefetch()
        {
            _sum = 0;
            unsafe
            {
                fixed (byte* dataPtr = _data)
                {
                    for (int i = 0; i < Size; i++)
                    {
                        int hash = _indices[i] * 31 + 17; // Simple hash operation
                        int idx = (hash & 0x7FFFFFFF) % Size;
                        _sum += dataPtr[idx];
                    }
                }
            }
            return _sum;
        }

        [Benchmark]
        public int WithHashing_WithPrefetch()
        {
            _sum = 0;
            unsafe
            {
                fixed (byte* dataPtr = _data)
                {
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
            }
            return _sum;
        }
    }
}