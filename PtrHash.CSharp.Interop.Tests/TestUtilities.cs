using System;
using System.Collections.Generic;
using System.Linq;
using PtrHash.CSharp.Interop.Native;
using PtrHash.CSharp.Interop.PtrHash;

namespace PtrHash.CSharp.Interop.Tests
{
    public static class TestUtilities
    {
        public static string[] GenerateTestStringKeys(int count = 8)
        {
            return count switch
            {
                8 => new[] { "hello", "world", "test", "ptrhash", "minimal", "perfect", "hash", "function" },
                4 => new[] { "hello", "world", "test", "ptrhash" },
                2 => new[] { "hello", "world" },
                _ => Enumerable.Range(0, count).Select(i => $"key_{i}").ToArray()
            };
        }

        public static ulong[] GenerateTestU64Keys(int count = 8)
        {
            return count switch
            {
                8 => new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300 },
                10 => new ulong[] { 1, 2, 3, 4, 5, 100, 200, 300, 1000, 2000 },
                3 => new ulong[] { 1, 2, 3 },
                _ => Enumerable.Range(0, count).Select(i => (ulong)(i + 1)).ToArray()
            };
        }

        public static ulong[] GenerateUniqueRandomKeys(int count, int seed = 42)
        {
            var random = new Random(seed);
            var keySet = new HashSet<ulong>();
            
            while (keySet.Count < count)
            {
                keySet.Add((ulong)random.NextInt64(1, long.MaxValue));
            }
            
            return keySet.ToArray();
        }

        public static string GenerateRandomString(Random random, int length)
        {
            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            var result = new char[length];
            for (int i = 0; i < length; i++)
            {
                result[i] = chars[random.Next(chars.Length)];
            }
            return new string(result);
        }

        public static PtrHashNative.FFIParams GetTestParams(bool useFast = true, uint hashFunction = 1)
        {
            // Use default fast configuration but with StrongerIntHash (1) instead of FxHash (0) to avoid construction timeouts
            return useFast 
                ? PtrHashNative.FFIParams.FastWithOverrides(hashFunction: hashFunction)
                : PtrHashNative.FFIParams.Custom(hashFunction: hashFunction);
        }

        public static void AssertValidPtrHashInfo(PtrHashInfo info, int expectedKeyCount)
        {
            Microsoft.VisualStudio.TestTools.UnitTesting.Assert.AreEqual((nuint)expectedKeyCount, info.KeyCount);
            Microsoft.VisualStudio.TestTools.UnitTesting.Assert.IsTrue(info.BitsPerKey > 0);
            Microsoft.VisualStudio.TestTools.UnitTesting.Assert.IsTrue(info.MaxIndex >= info.KeyCount);
        }

        public static void AssertUniqueIndicesInRange<T>(T[] keys, nuint[] indices, nuint maxIndex)
        {
            var uniqueIndices = new HashSet<nuint>(indices);
            Microsoft.VisualStudio.TestTools.UnitTesting.Assert.AreEqual(keys.Length, uniqueIndices.Count, "All indices should be unique");
            
            foreach (var index in indices)
            {
                Microsoft.VisualStudio.TestTools.UnitTesting.Assert.IsTrue(index < maxIndex, $"Index {index} should be less than {maxIndex}");
            }
        }
    }
}