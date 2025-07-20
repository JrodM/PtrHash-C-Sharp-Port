namespace PtrHash.CSharp.Port.BucketFunctions
{
    /// <summary>
    /// `x * x * (1 + x)/2 * 255/256 + x/256`
    /// </summary>
    public struct CubicEps : IBucketFunction
    {
        public bool IsLinear => false;
        public bool BOutput => false;

        public void SetBucketsPerPart(ulong b)
        {
            // No-op for CubicEps
        }

        public ulong Call(ulong x)
        {
            // x * x * (1 + x)/2
            ulong xxPlusX = MulHigh.Multiply(MulHigh.Multiply(x, x), (x >> 1) | (1ul << 63));
            return xxPlusX / 256 * 255 + x / 256;
        }
    }
}