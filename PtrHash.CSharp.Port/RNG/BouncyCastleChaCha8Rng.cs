using System;
using System.Runtime.CompilerServices;
using Org.BouncyCastle.Crypto.Engines;
using Org.BouncyCastle.Crypto.Parameters;

namespace PtrHash.CSharp.Port.RNG
{
    /// <summary>
    /// ChaCha8 RNG using BouncyCastle's ChaChaEngine
    /// This serves as a reference implementation to test against Rust
    /// </summary>
    public sealed class BouncyCastleChaCha8Rng
    {
        private readonly ChaChaEngine _engine;
        private readonly byte[] _buffer = new byte[64];
        private int _pos = 64;

        public BouncyCastleChaCha8Rng(ulong seed)
        {
            var keyBytes = new byte[32];
            BitConverter.GetBytes(seed).CopyTo(keyBytes, 0);

            _engine = new ChaChaEngine(8);
            _engine.Init(
                forEncryption: true,
                parameters: new ParametersWithIV(new KeyParameter(keyBytes), new byte[8])
            );
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        private void Refill()
        {
            _engine.ProcessBytes(_buffer, 0, _buffer.Length, _buffer, 0);
            _pos = 0;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public ulong NextUInt64()
        {
            if (_pos > _buffer.Length - 8) Refill();
            ulong v = BitConverter.ToUInt64(_buffer, _pos);
            _pos += 8;
            return v;
        }

        [MethodImpl(MethodImplOptions.AggressiveInlining)]
        public uint NextUInt32()
        {
            if (_pos > _buffer.Length - 4) Refill();
            uint v = BitConverter.ToUInt32(_buffer, _pos);
            _pos += 4;
            return v;
        }
    }
}