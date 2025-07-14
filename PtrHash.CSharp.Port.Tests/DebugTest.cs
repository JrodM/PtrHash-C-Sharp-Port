using NUnit.Framework;
using PtrHash.CSharp.Port.Core;
using PtrHash.CSharp.Port.KeyHashers;
using System;

namespace PtrHash.CSharp.Port.Tests
{
    [TestFixture]
    public class DebugTest
    {
        [Test]
        public void Debug_SmallInput_CheckCalculations()
        {
            // Arrange
            var keys = new ulong[] { 1, 2, 3, 4, 5 };
            var parameters = PtrHashParams.DefaultFast;
            
            Console.WriteLine($"Input: {keys.Length} keys");
            Console.WriteLine($"Alpha: {parameters.Alpha}");
            Console.WriteLine($"Lambda: {parameters.Lambda}");
            
            // Calculate using the same logic as PtrHash
            var numKeys = (nuint)keys.Length;
            Console.WriteLine($"numKeys: {numKeys}");
            
            // Calculate buckets and slots like PtrHash does
            var numBuckets = (nuint)Math.Ceiling((double)numKeys / parameters.Alpha);
            Console.WriteLine($"numBuckets: {numBuckets}");
            
            var slotsPerBucket = (nuint)Math.Max(1, Math.Ceiling(parameters.Lambda));
            Console.WriteLine($"slotsPerBucket: {slotsPerBucket}");
            
            var numSlots = numBuckets * slotsPerBucket;
            Console.WriteLine($"numSlots: {numSlots}");
            
            // Act & Assert - just log the values, don't construct yet
            Assert.That((long)numSlots, Is.LessThan((long)int.MaxValue), "numSlots should fit in int");
            Assert.That((long)numBuckets, Is.LessThan((long)int.MaxValue), "numBuckets should fit in int");
            
            // Expected: 6 buckets, 3 slots per bucket, 18 total slots
            Assert.That((uint)numBuckets, Is.EqualTo(6U), "Should have 6 buckets for 5 keys with alpha=0.99");
            Assert.That((uint)slotsPerBucket, Is.EqualTo(3U), "Should have 3 slots per bucket with lambda=3.0");
            Assert.That((uint)numSlots, Is.EqualTo(18U), "Should have 18 total slots");
        }
    }
}