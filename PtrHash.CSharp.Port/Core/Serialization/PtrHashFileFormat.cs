using System;
using System.Runtime.InteropServices;
using PtrHash.CSharp.Port.Core;

namespace PtrHash.CSharp.Port.Core.Serialization
{
    /// <summary>
    /// Constants and structures defining the PtrHash binary file format.
    /// </summary>
    public static class PtrHashFileFormat
    {
        /// <summary>
        /// Magic number identifying PtrHash files: "PTRH"
        /// </summary>
        public const uint MagicNumber = 0x48525450; // "PTRH" in little-endian

        public static readonly ushort CurrentMajorVersion = (ushort)int.Parse(ThisAssembly.AssemblyVersion.Split('.')[0]);
        public static readonly ushort CurrentMinorVersion = (ushort)int.Parse(ThisAssembly.AssemblyVersion.Split('.')[1]);

        public const int HeaderSize = 128; // 2 cache lines
        public const int PilotsOffset = HeaderSize;


        [Flags]
        public enum HeaderFlags : ushort
        {
            None = 0,
            IsMinimal = 1 << 0,
        }

        // Cache line 1 (64 bytes): Header identification + serialization metadata
        //   24 bytes identification + 24 bytes serialization + 16 bytes padding
        // Cache line 2 (64 bytes): Lookup parameters
        //   48 bytes params + 16 bytes reserved
        // Pilots start at offset 128, cache-line aligned
        [StructLayout(LayoutKind.Sequential, Pack = 1, Size = HeaderSize)]
        public unsafe struct FileHeader
        {
            // Cache line 1
            public uint Magic;
            public ushort VersionMajor;
            public ushort VersionMinor;
            public HeaderFlags Flags;
            private ushort _reserved1;
            public uint BucketFunctionType;
            public uint RemappingStorageType;
            public uint KeyHasherType;
            public uint PartType;

            public ulong SlotsTotal;
            public ulong RemapOffset;
            public ulong RemapCount;

            private fixed byte _padding[12];

            // Cache line 2
            public ulong Seed;
            public ulong BucketsPerPart;
            public ulong SlotsPerPart;
            public ulong NumKeys;

            public ulong Parts;
            public ulong BucketsTotal;

            private uint _reserved2a;
            private uint _reserved2b;
            private uint _reserved2c;
            private uint _reserved2d;

            public readonly bool Validate()
            {
                if (Magic != MagicNumber)
                    return false;

                if (!IsVersionSupported())
                    return false;

                if (Parts == 0 || BucketsPerPart == 0 || SlotsPerPart == 0)
                    return false;

                if (BucketsTotal != Parts * BucketsPerPart)
                    return false;

                if (SlotsTotal != Parts * SlotsPerPart)
                    return false;

                if (!Enum.IsDefined(typeof(PtrHashGenericTypes.PartMode), PartType))
                    return false;

                if (!Enum.IsDefined(typeof(PtrHashGenericTypes.BucketFunction), BucketFunctionType))
                    return false;

                if (!Enum.IsDefined(typeof(PtrHashGenericTypes.RemappingStorage), RemappingStorageType))
                    return false;

                if (!Enum.IsDefined(typeof(PtrHashGenericTypes.KeyHasher), KeyHasherType))
                    return false;

                return true;
            }

            public readonly bool IsVersionSupported()
            {
                return VersionMajor == CurrentMajorVersion &&
                       VersionMinor <= CurrentMinorVersion;
            }
        }
    }
}
