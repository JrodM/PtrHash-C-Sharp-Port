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

        public const int HeaderSize = 192; // 3 cache lines
        public const int HeaderAlignment = 192;
        public const int PilotsAlignment = 64;
        public const int RemapAlignment = 64;
        
        public const int PilotsOffset = HeaderSize;
        

        [Flags]
        public enum HeaderFlags : ushort
        {
            None = 0,
            IsMinimal = 1 << 0,
            IsSinglePart = 1 << 1,
            // Bits 2-15 reserved for future use
        }

        /// <summary>
        /// Binary layout of the PtrHash file header.
        /// Layout:
        /// - Cache Line 1: Header identification (read once) + cold-path serialization data
        /// - Cache Line 2: Hot-path data needed for all lookup operations
        /// - Cache Line 3: Reserved for future expansion
        /// </summary>
        [StructLayout(LayoutKind.Sequential, Pack = 1, Size = HeaderSize)]
        public unsafe struct FileHeader
        {
            // ========== Cache Line 1 (64 bytes) - Header & Cold Data ==========
            // Header identification fields (24 bytes)
            public uint Magic;                    // 4 bytes: "PTRH"
            public ushort VersionMajor;           // 2 bytes
            public ushort VersionMinor;           // 2 bytes
            public HeaderFlags Flags;             // 2 bytes
            private ushort _reserved1;            // 2 bytes padding
            public uint BucketFunctionType;       // 4 bytes
            public uint RemappingStorageType;     // 4 bytes
            public uint KeyHasherType;            // 4 bytes
            
            // Cold-path serialization data (24 bytes) - only used during file I/O
            public ulong SlotsTotal;              // 8 bytes - used for validation
            public ulong RemapOffset;             // 8 bytes - file offset of remapping data
            public ulong RemapCount;              // 8 bytes - byte size of remapping data
            
            // Padding to complete cache line
            private fixed byte _padding[16];      // 16 bytes padding to reach 64 bytes

            // ========== Cache Line 2 (64 bytes) - Hot Path Lookup Data ==========
            // Core lookup parameters (32 bytes)
            public ulong Seed;                    // 8 bytes - hash seed
            public ulong BucketsPerPart;          // 8 bytes - buckets in each part
            public ulong SlotsPerPart;            // 8 bytes - slots in each part
            public ulong NumKeys;                 // 8 bytes - total number of keys
            
            // Partitioning data (16 bytes)
            public ulong Parts;                   // 8 bytes
            public ulong BucketsTotal;            // 8 bytes - total buckets across all parts
            
            // Pre-computed magic multipliers for fast modulo operations (16 bytes)
            public uint BucketsPerPartMagic;      // 4 bytes - FastReduce magic for % bucketsPerPart
            public uint SlotsPerPartMagic;        // 4 bytes - FM32 magic for % slotsPerPart
            public uint PartsCountMagic;          // 4 bytes - FastReduce magic for % parts
            public uint BucketsTotalMagic;        // 4 bytes - FastReduce magic for % bucketsTotal
            
            // ========== Cache Line 3 (64 bytes) - Reserved ==========
            private fixed byte _reserved3[64];    // 64 bytes reserved for future expansion

            public readonly byte* GetPilotsPointer()
            {
                fixed (FileHeader* self = &this)
                {
                    return ((byte*)self) + PilotsOffset;
                }
            }

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
                
                if (BucketsPerPartMagic == 0 || SlotsPerPartMagic == 0)
                    return false;
                    
                if (Parts > 1 && PartsCountMagic == 0)
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