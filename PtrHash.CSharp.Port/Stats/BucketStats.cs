using System;
using System.Collections.Generic;
using System.Linq;

namespace PtrHash.CSharp.Port.Stats
{
    /// <summary>
    /// Statistics collected during PtrHash construction for performance analysis
    /// </summary>
    public class BucketStats
    {
        private readonly Row[] byPct;
        private readonly List<Row> byBucketLen;

        public BucketStats()
        {
            byPct = new Row[100];
            for (int i = 0; i < 100; i++)
            {
                byPct[i] = new Row();
            }
            byBucketLen = new List<Row>(100);
        }

        public void Add(nuint bucketId, nuint bucketsTotal, int bucketLen, ulong pilot, int evictions)
        {
            var pct = (int)(bucketId * 100 / bucketsTotal);
            byPct[pct].Add(bucketLen, pilot, evictions);

            // Ensure we have enough rows for this bucket length
            while (byBucketLen.Count <= bucketLen)
            {
                byBucketLen.Add(new Row());
            }
            byBucketLen[bucketLen].Add(bucketLen, pilot, evictions);
        }

        public void Merge(BucketStats other)
        {
            // Merge by percentage
            for (int i = 0; i < 100; i++)
            {
                byPct[i].Merge(other.byPct[i]);
            }

            // Merge by bucket length
            var maxLen = Math.Max(byBucketLen.Count, other.byBucketLen.Count);
            while (byBucketLen.Count < maxLen)
            {
                byBucketLen.Add(new Row());
            }

            for (int i = 0; i < other.byBucketLen.Count; i++)
            {
                byBucketLen[i].Merge(other.byBucketLen[i]);
            }
        }

        public void Print()
        {
            Console.Write(ToString());
        }

        public override string ToString()
        {
            var sb = new System.Text.StringBuilder();
            sb.AppendLine();
            sb.AppendLine("Bucket Statistics by Percentile:");
            FormatRows(sb, byPct, false);
            sb.AppendLine();
            sb.AppendLine("Bucket Statistics by Size:");
            FormatRows(sb, byBucketLen.ToArray(), true);
            sb.AppendLine();
            return sb.ToString();
        }

        private static void FormatRows(System.Text.StringBuilder sb, Row[] rows, bool showSize)
        {
            var totalBuckets = rows.Sum(r => r.Buckets);
            var totalElements = rows.Sum(r => r.Elements);

            sb.AppendFormat("{0,4}  {1,11} {2,7} {3,6} {4,6} {5,6} {6,10} {7,10} {8,10} {9,10}\n",
                showSize ? "size" : "%ile", "buckets", "%", "avg", "max", "sum%", "pilot_avg", "pilot_max", "evict_avg", "evict_max");

            for (int i = 0; i < rows.Length; i++)
            {
                var row = rows[i];
                if (row.Buckets == 0) continue;

                var avgElements = row.Elements / (double)row.Buckets;
                var avgPilot = row.PilotSum / (double)row.Buckets;
                var avgEvictions = row.Evictions / (double)row.Buckets;
                var bucketPct = row.Buckets * 100.0 / totalBuckets;
                var elementsPct = row.Elements * 100.0 / totalElements;

                sb.AppendFormat("{0,4}  {1,11:N0} {2,7:F1} {3,6:F1} {4,6} {5,6:F1} {6,10:F1} {7,10} {8,10:F1} {9,10}\n",
                    showSize ? i : i,
                    row.Buckets,
                    bucketPct,
                    avgElements,
                    row.ElementsMax,
                    elementsPct,
                    avgPilot,
                    row.PilotMax,
                    avgEvictions,
                    row.EvictionsMax);
            }
        }

        private static void PrintRows(Row[] rows, bool showSize)
        {
            var totalBuckets = rows.Sum(r => r.Buckets);
            var totalElements = rows.Sum(r => r.Elements);

            Console.WriteLine("{0,4}  {1,11} {2,7} {3,6} {4,6} {5,6} {6,10} {7,10} {8,10} {9,10}",
                showSize ? "size" : "%ile", "buckets", "%", "avg", "max", "sum%", "pilot_avg", "pilot_max", "evict_avg", "evict_max");

            for (int i = 0; i < rows.Length; i++)
            {
                var row = rows[i];
                if (row.Buckets == 0) continue;

                var avgElements = row.Elements / (double)row.Buckets;
                var avgPilot = row.PilotSum / (double)row.Buckets;
                var avgEvictions = row.Evictions / (double)row.Buckets;
                var bucketPct = row.Buckets * 100.0 / totalBuckets;
                var elementsPct = row.Elements * 100.0 / totalElements;

                Console.WriteLine("{0,4}  {1,11:N0} {2,7:F1} {3,6:F1} {4,6} {5,6:F1} {6,10:F1} {7,10} {8,10:F1} {9,10}",
                    showSize ? i : i,
                    row.Buckets,
                    bucketPct,
                    avgElements,
                    row.ElementsMax,
                    elementsPct,
                    avgPilot,
                    row.PilotMax,
                    avgEvictions,
                    row.EvictionsMax);
            }
        }

        private class Row
        {
            public int Buckets { get; private set; }
            public int Elements { get; private set; }
            public int ElementsMax { get; private set; }
            public ulong PilotSum { get; private set; }
            public ulong PilotMax { get; private set; }
            public int Evictions { get; private set; }
            public int EvictionsMax { get; private set; }

            public void Add(int bucketLen, ulong pilot, int evictions)
            {
                Buckets++;
                Elements += bucketLen;
                ElementsMax = Math.Max(ElementsMax, bucketLen);
                PilotSum += pilot;
                PilotMax = Math.Max(PilotMax, pilot);
                Evictions += evictions;
                EvictionsMax = Math.Max(EvictionsMax, evictions);
            }

            public void Merge(Row other)
            {
                Buckets += other.Buckets;
                Elements += other.Elements;
                ElementsMax = Math.Max(ElementsMax, other.ElementsMax);
                PilotSum += other.PilotSum;
                PilotMax = Math.Max(PilotMax, other.PilotMax);
                Evictions += other.Evictions;
                EvictionsMax = Math.Max(EvictionsMax, other.EvictionsMax);
            }
        }
    }
}