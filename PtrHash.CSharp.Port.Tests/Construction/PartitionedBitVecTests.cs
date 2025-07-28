using System;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using PtrHash.CSharp.Port.Construction;

namespace PtrHash.CSharp.Port.Tests.Construction
{
    [TestClass]
    public class PartitionedBitVecTests
    {
        [TestMethod]
        public void Constructor_CreatesCorrectNumberOfParts()
        {
            using var bitVec = new PartitionedBitVec(4, 64);
            
            // Test that we can access all parts without errors
            for (nuint i = 0; i < 4 * 64; i++)
            {
                // Should not throw
                bitVec.Get(i);
            }
        }

        [TestMethod]
        public void SetAndGet_GlobalSlot_WorksCorrectly()
        {
            using var bitVec = new PartitionedBitVec(4, 64);
            
            // Set some bits
            bitVec.Set(0, true);
            bitVec.Set(63, true);
            bitVec.Set(64, true);  // First slot of second part
            bitVec.Set(127, true); // Last slot of second part
            bitVec.Set(255, true); // Last slot of last part
            
            // Verify bits are set
            Assert.IsTrue(bitVec.Get(0));
            Assert.IsTrue(bitVec.Get(63));
            Assert.IsTrue(bitVec.Get(64));
            Assert.IsTrue(bitVec.Get(127));
            Assert.IsTrue(bitVec.Get(255));
            
            // Verify other bits are not set
            Assert.IsFalse(bitVec.Get(1));
            Assert.IsFalse(bitVec.Get(62));
            Assert.IsFalse(bitVec.Get(65));
            Assert.IsFalse(bitVec.Get(128));
        }

        [TestMethod]
        public void SetAndGet_LocalSlot_WorksCorrectly()
        {
            using var bitVec = new PartitionedBitVec(4, 64);
            
            // Set bits using local operations
            bitVec.SetLocal(0, 0, true);   // First bit of first part
            bitVec.SetLocal(0, 63, true);  // Last bit of first part
            bitVec.SetLocal(1, 0, true);   // First bit of second part
            bitVec.SetLocal(3, 63, true);  // Last bit of last part
            
            // Verify using local operations
            Assert.IsTrue(bitVec.GetLocal(0, 0));
            Assert.IsTrue(bitVec.GetLocal(0, 63));
            Assert.IsTrue(bitVec.GetLocal(1, 0));
            Assert.IsTrue(bitVec.GetLocal(3, 63));
            
            // Verify using global operations
            Assert.IsTrue(bitVec.Get(0));    // 0 * 64 + 0 = 0
            Assert.IsTrue(bitVec.Get(63));   // 0 * 64 + 63 = 63
            Assert.IsTrue(bitVec.Get(64));   // 1 * 64 + 0 = 64
            Assert.IsTrue(bitVec.Get(255));  // 3 * 64 + 63 = 255
        }

        [TestMethod]
        public void CountOnes_ReturnsCorrectCount()
        {
            using var bitVec = new PartitionedBitVec(4, 64);
            
            // Initially should be zero
            Assert.AreEqual(0u, bitVec.CountOnes());
            
            // Set some bits
            bitVec.Set(0, true);
            bitVec.Set(64, true);
            bitVec.Set(128, true);
            bitVec.Set(192, true);
            
            Assert.AreEqual(4u, bitVec.CountOnes());
            
            // Set more bits
            for (nuint i = 10; i < 20; i++)
            {
                bitVec.Set(i, true);
            }
            
            Assert.AreEqual(14u, bitVec.CountOnes());
        }

        [TestMethod]
        public void Clear_ResetsAllBits()
        {
            using var bitVec = new PartitionedBitVec(4, 64);
            
            // Set some bits
            for (nuint i = 0; i < 256; i += 10)
            {
                bitVec.Set(i, true);
            }
            
            Assert.IsTrue(bitVec.CountOnes() > 0u);
            
            // Clear all bits
            bitVec.Clear();
            
            Assert.AreEqual(0u, bitVec.CountOnes());
            
            // Verify all bits are cleared
            for (nuint i = 0; i < 256; i++)
            {
                Assert.IsFalse(bitVec.Get(i));
            }
        }

        [TestMethod]
        public void GlobalToLocal_ConversionCorrect()
        {
            using var bitVec = new PartitionedBitVec(4, 64);
            
            // Test boundary cases
            TestGlobalToLocal(bitVec, 0, 0, 0);      // First bit
            TestGlobalToLocal(bitVec, 63, 0, 63);    // Last bit of first part
            TestGlobalToLocal(bitVec, 64, 1, 0);     // First bit of second part
            TestGlobalToLocal(bitVec, 127, 1, 63);   // Last bit of second part
            TestGlobalToLocal(bitVec, 128, 2, 0);    // First bit of third part
            TestGlobalToLocal(bitVec, 255, 3, 63);   // Last bit of last part
        }

        private void TestGlobalToLocal(PartitionedBitVec bitVec, nuint globalSlot, nuint expectedPart, nuint expectedLocal)
        {
            // Set using global
            bitVec.Set(globalSlot, true);
            
            // Verify using local
            Assert.IsTrue(bitVec.GetLocal(expectedPart, expectedLocal), 
                $"Global slot {globalSlot} should map to part {expectedPart}, local {expectedLocal}");
        }

        [TestMethod]
        public void LargeBitVec_HandlesCorrectly()
        {
            // Test with larger configuration
            using var bitVec = new PartitionedBitVec(16, 1024);
            
            // Set bits across different parts
            var testPositions = new nuint[] { 0, 1023, 1024, 2047, 8192, 16383 };
            
            foreach (var pos in testPositions)
            {
                bitVec.Set(pos, true);
            }
            
            Assert.AreEqual((nuint)testPositions.Length, bitVec.CountOnes());
            
            foreach (var pos in testPositions)
            {
                Assert.IsTrue(bitVec.Get(pos), $"Bit at position {pos} should be set");
            }
        }

        [TestMethod]
        public void Dispose_CanBeCalledMultipleTimes()
        {
            var bitVec = new PartitionedBitVec(4, 64);
            bitVec.Set(0, true);
            
            bitVec.Dispose();
            bitVec.Dispose(); // Should not throw
        }
    }
}