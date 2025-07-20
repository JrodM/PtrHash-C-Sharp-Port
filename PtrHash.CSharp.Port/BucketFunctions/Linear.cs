namespace PtrHash.CSharp.Port.BucketFunctions
{
    /// <summary>
    /// The function simply returns `x` itself.
    /// </summary>
    public struct Linear : IBucketFunction
    {
        public bool IsLinear => true;
        public bool BOutput => false;

        public void SetBucketsPerPart(ulong b)
        {
            // No-op for Linear
        }

        public ulong Call(ulong x)
        {
            return x;
        }
    }
}