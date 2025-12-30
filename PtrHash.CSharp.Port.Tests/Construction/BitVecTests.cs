using System;
using System.Collections.Generic;
using System.Linq;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Construction;

namespace PtrHash.CSharp.Port.Tests.Construction
{
    [TestClass]
    public class BitVecTests
    {
        [TestMethod]
        public void Constructor_CreatesCorrectLength()
        {
            using var bitVec = new BitVec(100);
            Assert.AreEqual((nuint)100, bitVec.Length);
        }

        [TestMethod]
        public void Constructor_InitializesAllBitsToFalse()
        {
            using var bitVec = new BitVec(128);
            
            for (nuint i = 0; i < bitVec.Length; i++)
            {
                Assert.IsFalse(bitVec.Get(i), $"Bit at index {i} should be false");
            }
        }

        [TestMethod]
        public void SetAndGet_SingleBit_WorksCorrectly()
        {
            using var bitVec = new BitVec(64);
            
            bitVec.Set(0, true);
            Assert.IsTrue(bitVec.Get(0));
            
            bitVec.Set(0, false);
            Assert.IsFalse(bitVec.Get(0));
            
            bitVec.Set(63, true);
            Assert.IsTrue(bitVec.Get(63));
        }

        [TestMethod]
        public void SetAndGet_MultipleBits_WorksCorrectly()
        {
            using var bitVec = new BitVec(256);
            
            // Set every 10th bit
            for (nuint i = 0; i < bitVec.Length; i += 10)
            {
                bitVec.Set(i, true);
            }
            
            // Verify pattern
            for (nuint i = 0; i < bitVec.Length; i++)
            {
                bool expected = (i % 10) == 0;
                Assert.AreEqual(expected, bitVec.Get(i), $"Bit at index {i}");
            }
        }

        [TestMethod]
        public void Get_OutOfRange_ThrowsException()
        {
            using var bitVec = new BitVec(64);
            
            // Should not throw for valid index
            bitVec.Get(63);
            Assert.ThrowsException<IndexOutOfRangeException>(() => bitVec.Get(64));
            Assert.ThrowsException<IndexOutOfRangeException>(() => bitVec.Get(100));
        }

        [TestMethod]
        public void Set_OutOfRange_ThrowsException()
        {
            using var bitVec = new BitVec(64);
            
            // Should not throw for valid index
            bitVec.Set(63, true);
            Assert.ThrowsException<IndexOutOfRangeException>(() => bitVec.Set(64, true));
            Assert.ThrowsException<IndexOutOfRangeException>(() => bitVec.Set(100, true));
        }

        [TestMethod]
        public void CountOnes_EmptyVector_ReturnsZero()
        {
            using var bitVec = new BitVec(128);
            Assert.AreEqual((nuint)0, bitVec.CountOnes());
        }

        [TestMethod]
        public void CountOnes_AllSet_ReturnsLength()
        {
            using var bitVec = new BitVec(128);
            
            // Set all bits
            for (nuint i = 0; i < bitVec.Length; i++)
            {
                bitVec.Set(i, true);
            }
            
            Assert.AreEqual((nuint)128, bitVec.CountOnes());
        }

        [TestMethod]
        public void CountOnes_PartiallySet_ReturnsCorrectCount()
        {
            using var bitVec = new BitVec(256);
            
            // Set specific bits
            var setBits = new nuint[] { 0, 1, 10, 50, 100, 150, 200, 255 };
            foreach (var bit in setBits)
            {
                bitVec.Set(bit, true);
            }
            
            Assert.AreEqual((nuint)setBits.Length, bitVec.CountOnes());
        }

        [TestMethod]
        public void Clear_ResetsAllBits()
        {
            using var bitVec = new BitVec(128);
            
            // Set some bits
            for (nuint i = 0; i < bitVec.Length; i += 3)
            {
                bitVec.Set(i, true);
            }
            
            Assert.IsTrue(bitVec.CountOnes() > 0);
            
            // Clear all
            bitVec.Clear();
            
            Assert.AreEqual((nuint)0, bitVec.CountOnes());
            for (nuint i = 0; i < bitVec.Length; i++)
            {
                Assert.IsFalse(bitVec.Get(i));
            }
        }

        [TestMethod]
        public void Get_WorksWithValidIndices()
        {
            using var bitVec = new BitVec(64);
            
            bitVec.Set(10, true);
            bitVec.Set(20, true);
            
            // Get works on valid indices
            Assert.IsTrue(bitVec.Get(10));
            Assert.IsTrue(bitVec.Get(20));
            Assert.IsFalse(bitVec.Get(15));
        }

        [TestMethod]
        public void Set_WorksWithValidIndices()
        {
            using var bitVec = new BitVec(64);
            
            // Set works on valid indices
            bitVec.Set(10, true);
            bitVec.Set(20, true);
            bitVec.Set(30, false);
            
            Assert.IsTrue(bitVec.Get(10));
            Assert.IsTrue(bitVec.Get(20));
            Assert.IsFalse(bitVec.Get(30));
        }

        [TestMethod]
        public void IterZeros_EmptyVector_ReturnsAllIndices()
        {
            using var bitVec = new BitVec(64);
            
            var zeros = new List<nuint>();
            foreach (var index in bitVec.IterZeros())
            {
                zeros.Add(index);
            }
            
            // Should return all indices 0-63
            Assert.AreEqual(64, zeros.Count);
            for (nuint i = 0; i < 64; i++)
            {
                CollectionAssert.Contains(zeros, i);
            }
        }

        [TestMethod]
        public void IterZeros_FullVector_ReturnsNoIndices()
        {
            using var bitVec = new BitVec(64);
            
            // Set all bits
            for (nuint i = 0; i < 64; i++)
            {
                bitVec.Set(i, true);
            }
            
            var zeros = new List<nuint>();
            foreach (var index in bitVec.IterZeros())
            {
                zeros.Add(index);
            }
            
            Assert.AreEqual(0, zeros.Count);
        }

        [TestMethod]
        public void IterZeros_PartiallySet_ReturnsOnlyZeroIndices()
        {
            using var bitVec = new BitVec(128);
            
            // Set every other bit
            for (nuint i = 0; i < 128; i += 2)
            {
                bitVec.Set(i, true);
            }
            
            var zeros = new List<nuint>();
            foreach (var index in bitVec.IterZeros())
            {
                zeros.Add(index);
            }
            
            Assert.AreEqual(64, zeros.Count);
            foreach (var index in zeros)
            {
                Assert.IsTrue(index % 2 == 1, $"Index {index} should be odd");
                Assert.IsFalse(bitVec.Get(index));
            }
        }

        [TestMethod]
        public void IterZeros_NonAlignedLength_StopsAtLength()
        {
            using var bitVec = new BitVec(100); // Not aligned to 64
            
            // Set some bits
            bitVec.Set(0, true);
            bitVec.Set(50, true);
            bitVec.Set(99, true);
            
            var zeros = new List<nuint>();
            foreach (var index in bitVec.IterZeros())
            {
                zeros.Add(index);
            }
            
            Assert.AreEqual(97, zeros.Count); // 100 - 3 set bits
            foreach (var index in zeros)
            {
                Assert.IsTrue(index < 100u);
                Assert.IsFalse(bitVec.Get(index));
            }
        }

        [TestMethod]
        public void IterZeros_FullWord_SkipsEfficiently()
        {
            using var bitVec = new BitVec(192); // 3 words
            
            // Set all bits in the middle word (64-127)
            for (nuint i = 64; i < 128; i++)
            {
                bitVec.Set(i, true);
            }
            
            var zeros = new List<nuint>();
            foreach (var index in bitVec.IterZeros())
            {
                zeros.Add(index);
            }
            
            Assert.AreEqual(128, zeros.Count);
            foreach (var index in zeros)
            {
                Assert.IsTrue(index < 64 || index >= 128);
            }
        }

        [TestMethod]
        public void WordBoundaries_HandledCorrectly()
        {
            using var bitVec = new BitVec(192); // 3 words
            
            // Set bits at word boundaries
            bitVec.Set(0, true);    // First bit of first word
            bitVec.Set(63, true);   // Last bit of first word
            bitVec.Set(64, true);   // First bit of second word
            bitVec.Set(127, true);  // Last bit of second word
            bitVec.Set(128, true);  // First bit of third word
            bitVec.Set(191, true);  // Last bit
            
            Assert.AreEqual((nuint)6, bitVec.CountOnes());
            
            // Verify all bits are set correctly
            Assert.IsTrue(bitVec.Get(0));
            Assert.IsTrue(bitVec.Get(63));
            Assert.IsTrue(bitVec.Get(64));
            Assert.IsTrue(bitVec.Get(127));
            Assert.IsTrue(bitVec.Get(128));
            Assert.IsTrue(bitVec.Get(191));
        }

        [TestMethod]
        public void NonAlignedLength_WorksCorrectly()
        {
            // Test with length that doesn't align to word boundary
            using var bitVec = new BitVec(100); // Not a multiple of 64
            
            // Should be able to set all bits including the last
            bitVec.Set(99, true);
            Assert.IsTrue(bitVec.Get(99));
            
            // Should not be able to access beyond length
            Assert.ThrowsException<IndexOutOfRangeException>(() => bitVec.Get(100));
        }

        [TestMethod]
        public void LargeBitVec_HandlesCorrectly()
        {
            using var bitVec = new BitVec(10000);
            
            // Set pattern of bits
            for (nuint i = 0; i < bitVec.Length; i++)
            {
                if (i % 7 == 0 || i % 11 == 0)
                {
                    bitVec.Set(i, true);
                }
            }
            
            // Count set bits
            int expectedCount = 0;
            for (int i = 0; i < 10000; i++)
            {
                if (i % 7 == 0 || i % 11 == 0)
                {
                    expectedCount++;
                }
            }
            
            Assert.AreEqual((nuint)expectedCount, bitVec.CountOnes());
        }

        [TestMethod]
        public void Dispose_CanBeCalledMultipleTimes()
        {
            var bitVec = new BitVec(64);
            bitVec.Set(0, true);
            
            bitVec.Dispose();
            bitVec.Dispose();
        }

    }
}