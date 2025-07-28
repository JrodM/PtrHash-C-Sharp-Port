## PtrHash: Minimal Perfect Hashing at RAM

## Throughput

## Ragnar Groot Koerkamp #

```
ETH Zurich, Zurich, Switzerland
```
```
Abstract
```
```
Motivation. Given a set S of n keys, a minimal perfect hash function (MPHF) is a collision-free
bijective mapHmphffrom S to{ 0 ,...,n − 1 }. These functions have uses in databases, search
engines, and are used in bioinformatics indexing tools such as Pufferfish (using BBHash), and Piscem
(PTHash). PTHash is also used in SSHash, a data structure on k -mers that supports membership
queries. PTHash only takes around5%of the total space of SSHash, and thus, trading slightly more
space for faster queries is beneficial. Thus, this work presents a (minimal) perfect hash function that
first prioritizes query throughput, while also allowing efficient construction for 109 or more elements
using 2.4 bits of memory per key.
```
```
Contributions. Both PTHash and PHOBIC first map all n keys to n/λ < nbuckets. Then, each
bucket stores a pilot that controls the final hash value of the keys mapping to it. PtrHash builds
on this by using 1) fixed-width (uncompressed) 8-bit pilots, 2) a construction algorithm similar to
cuckoo-hashing to find suitable pilot values. Further, it 3) uses the same number of buckets and slots
for each part, with 4) a single remap table to map intermediate positions≥ n to < n , 5) encoded
using per-cacheline Elias-Fano coding. Lastly, 6) PtrHash support streaming queries, where we use
prefetching to answer a stream of multiple queries more efficiently than one-by-one processing.
```
```
Results. With default parameters, PtrHash takes 2.40 bits per key. On 300 million string keys,
PtrHash is as fast or faster to build than other MPHFs, and at least 1. 75 ×faster to query. When
streaming multiple queries, this improves to 3. 1 ×speedup over the fastest alternative, while also
being significantly faster to construct. When using 109 integer keys instead, query times are as
low as 12 ns/key when iterating in a for loop, or even down to 8 ns/key when using the streaming
approach, within10%of the maximum memory-bound throughput.
```
```
2012 ACM Subject Classification Theory of computation→Data structures design and analysis;
Information systems→Retrieval efficiency
```
```
Keywords and phrases Minimal perfect hashing; Compressed Data Structures
```
```
Supplementary Material Software :github.com/RagnarGrootKoerkamp/ptrhash
```
```
Funding Ragnar Groot Koerkamp : ETH Research Grant ETH-1721-1 to Gunnar Rätsch.
```
# arXiv:2502.15539v1 [cs.DS] 21 Feb 2025


```
R. Groot Koerkamp 1
```
## 1 Introduction

Given a set of _n_ keys{ _k_ 0 _,...,kn_ − 1 }, a _hash function_ maps them to some co-domain[ _m_ ] :=
{ 0 _,...,m_ − 1 }. When _m_ ≥ _n_ and the hash is injective (collision-free), it is also called _perfect_.
When additionally _m_ = _n_ and it is surjective onto[ _n_ ], it is _minimal_. Thus, a _minimal perfect
hash function_ (MPHF) bijectively maps a set of _n_ keys onto[ _n_ ].

**Metrics.** Various aspects of MPHF data structures can be optimized. First, one could
minimize its space usage and try to approach thelog 2 ( _e_ ) = 1_._ 44 bits/key lower bound [ 34 ].
Indeed, there are many recent works in this direction, such as Bipartite ShockHash-RS, which
gets below 1.5 bits/key [26, 24, 22].
In this paper, we focus primarily on optimizing for query throughput and secondary on
construction speed, while relaxing space usage up to 3 bits/key. This continues the line of
work of FCH [ 18 ], PTHash [ 42 , 43 ], and PHOBIC [ 20 ], that all provide relatively fast queries.

```
Problem statement. Construct a minimal perfect hash function data structureHmphfthat
is fast to query, ideally using one memory access per lookup, and fast to construct, while
staying below 3 bits/key of space.
```
**Motivation.** Our main motivating application is to optimize the use of PTHash in SSHash [ 41 ],
a data structure to index a set of _k_ -mers (sequences of _k_ DNA bases). There, the MPHF
only takes around5%of the total space. Thus, a slightly increased space usage of the MPHF
has little effect on the total space, while faster lookups could significantly improve the overall
query speed. In this application, _k_ -mers are typically encoded as 64-bit integers, and thus
we will focus our attention on integer keys.
Further applications can be found in domains such as networking [ 31 ], databases [ 7 ], and
full-text indexing [ 2 ], where one could imagine hashing IP addresses, URLs, or (compact)
suffix-trie edge labels.

```
Contributions. We introduce PtrHash, a minimal perfect hash function that is primarily
optimized for query throughput and construction speed, at the cost of slightly more memory
usage. Compared to PTHash and PHOBIC, the main novelties are:
```
**1.** a fixed number of buckets _and slots_ per part, removing the need for a part-offset lookup;
**2.** the use of fixed-width 8-bit _pilots_ , so that no compact encoding is needed;
**3.** a pilot search based on cuckoo-hashing;
**4.** remapping using a _single_ remap table, again simplifying lookups;
**5.** a remap table based on a per-cacheline Elias-Fano encoding [12, 15], CacheLineEF;
**6.** the use of _prefetching_ to _stream_ multiple queries in parallel.

**Results.** When using 300 million string keys, PtrHash with default parameters takes
2.40 bits/key and is nearly as fast to construct as the fastest other methods, while being
much faster to query. Compared to the next-fastest method to query, PtrHash provides
1_._ 75 ×faster queries when looping naively, or 3_._ 1 ×faster when streaming.
When using 109 integer keys instead, PtrHash can achieve a throughput of up to 12 ns/key
when looping over queries, or even 8 ns/key when streaming, close to matching the maximum
throughput of random memory accesses of a single thread. In a multi-threaded setting,
PtrHash can fully saturate the DDR4 memory bandwidth with 4 threads.


**2 PtrHash: Minimal Perfect Hashing at RAM Throughput**

## 2 Related work

```
There is a vast amount of literature on (minimal) perfect hashing. Here we only give a
highlight of recent approaches. We refer the reader to Section 2 of [ 43 ] and Sections 4 and 8
of the thesis of Hans-Peter Lehmann [ 22 ], which contains a nice overview of the different
approaches taken by various tools.
```
```
Space lower bound. There is a lower bound of n log 2 ( e )bits to store a minimal perfect
hash function on n random keys [ 34 ]. To get some feeling for this bound, consider any hash
function. Intuitively the probability that this is an MPHF is n! /nn. From this, it follows
that at most, aroundlog 2 ( nn/n !)≈ n log 2 ( e )bits of information are needed to “steer” the
hash function in the right direction. Now, a naive approach is to use a seeded hash function,
and try O ( en )seeds until a perfect hash function is found. Clearly, that is not feasible in
practice.
```
```
Brute-force. When n is small, en can be sufficiently small to allow a bruteforce search
over n. RecSplit exploits this by first partitioning the input keys first into buckets, and
then recursively splitting buckets until they have size at most ℓ ≤ 16. These leafs can then
be solved using brute-force, and the overall space usage can be as low as 1.56 bits/key.
SIMDRecSplit significantly improves the construction time by using a meet-in-the-middle
approach for the leafs, and generally speeds up the implementation. Consensus-RecSplit [ 27 ]
is a recent MPHF that is the first to achieve construction time linear in 1 /ε , where ε is the
bits-per-key space overhead on top of thelog 2 ( e )lower bound. Its core idea is to efficiently
encode the seeds for multiple sub-problems together.
```
```
Graphs. SicHash [ 25 ] and its predecessor BPZ [ 5 ] are based on hypergraph peeling [ 32 , 35 ]:
nodes are the n hash values, and each key corresponds to a size- r hyper-edge. Then keys
can be assigned a value one-by-one as long as each set of k keys covers at least k + 1values.
This is also alike cuckoo hashing, where each key has r = 2target locations. ShockHash [ 26 ]
then takes the RecSplit framework and uses an r = 2cuckoo table for the base case. It
then tries O (( e/ 2) n )seeds until one is found that allows building the cuckoo hash table.
Bipartite ShockHash-RS [ 24 ] further improves this by using meet-in-the-middle on the seeds,
improving the construction time to O
```
### ((√

```
e/ 2
```
```
) n )
= O (1. 166 n ). This is currently the most
space efficient approach. Bipartite ShockHash-Flat is a variant that trades space for more
efficient queries.
```
```
Fingerprinting. Fingerprinting [ 8 , 36 ] is a completely different technique, and used in
BBHash [ 30 ]. Here, the idea is to start with any hash function mapping into[ γn ]for some
γ ≥ 1. Any slots that have exactly one element mapping to them are marked with a 1, and
the remaining n 1 elements are processed recursively, mapping them to[ γn 1 ]. Lookups are
then done using rank queries on this bitvector. FMPH [ 3 ] has a much faster implementation
of the construction that goes down to 3.0 bits/key. FiPS [ 22 ] is a variant that trades some
space in the rank data structure for faster queries. FMPHGO [ 3 ] is variant that first splits
keys into buckets, then uses a seeded hash function that has a low number of collisions, and
only then recurses into colliding keys. This reduces the space usage and number of recursion
steps, leading to faster queries, but takes longer to construct.
```
```
Bucket placement. PtrHash builds on methods that first group the keys into buckets of
a few keys. Then, keys in the buckets are assigned their hash value one bucket at a time,
such that newly assigned values do not collide with previously taken values. All methods
```

```
R. Groot Koerkamp 3
```
iterate different possible key assignments for each bucket until a collision-free one is found,
but differ in the way hash values are determined. To speed up the search for keys, large
buckets are placed before small buckets.
FCH [ 18 ] uses a fixed number of bits to encode the seed for each bucket and uses a _skew_
distribution of bucket sizes. The seed stored in each bucket determines how far the keys are
_displaced_ (shifted) to the right from their initially hashed position. A fallback hash can be
used if needed, and construction can fail if that also does not work. CHD [ 1 ] uses uniform
bucket sizes, but uses a variable-width encoding for the seeds. PTHash [ 42 ] combines these
two ideas and introduces a number of compression schemes for the seed values, that are
called _pilots_. Instead of directly generating an MPHF, it first generates a PHF to[ _n_ ′]for
_n_ ′= _n/α_ ≈ _n/_ 0_._ 99 , and values mapping to positions≥ _n_ are _remapped_ to the skipped values
in[ _n_ ]. PTHash-HEM [ 43 ] first partitions the keys, and uses this to build multiple parts in
parallel. This also enables external-memory construction. Lastly, PHOBIC [ 20 ] improves
from the simple _skew_ distribution of FCH to an _optimal bucket assignment function_ , which
speeds up construction and enables smaller space usage. Secondly, it partitions the input
into parts of expected size 2500 and uses the same number of buckets for each part. Then, it
uses that the pilot values of the _i_ ’th bucket of each part follow the same distribution, and
encodes them together. Together, this saves 0.17 bits/key over PTHash.

## 3 PtrHash

The core design goal of PtrHash^1 is to simplify PTHash to speed up both query speed and
construction time, at the cost of possibly using slightly more memory. We first give a high
level overview of PtrHash (Section 3.1). Then, we explain specific parts of PtrHash in more
detail.
In Appendix A, we investigate _batching_ to improve query throughput, and in Appendix B
we give details on the _sharding_ of the input to construct PtrHash on large inputs.

## 3.1 Overview

```
Before going into details, we first briefly explain the fully constructed PtrHash data structure
and how to query it, see Figure 1 and Listing 1. We also highlight differences to PTHash
[42] and PHOBIC [20].
```
```
Parts and buckets. The input is a set of nkeys { k 0 ,...,kn − 1 }that we want to hash to
nslots [ n ] :={ 0 ,...,n − 1 }. We first hash the keys using a 64-bit hash functionhinto
{h( k 0 ) ,..., h( kn − 1 )}. The total space of hashes[2^64 ]is equally partitioned into Pparts , and
the part of a key is easily found as
```
### ⌊

```
P ·h( ki ) / 264
```
### ⌋

```
[ 28 ]. Then, the expected n/P keys in each
part are partitioned into exactly B non-uniform buckets : each key has a relative positionx
inside the part, and this is passed through a bucket assignment functionγ : [0 , 1)7→[0 , 1)
such as γ ( x ) = x^2 that controls the distribution of expected bucket sizes [ 20 ], as explained in
```
(^1) The PT in PTHash stand for _Pilot Table_. The author of the present paper mistakenly understood it to
stand for Pibiri and Trani, the authors of the PTHash paper. Due to the current author’s unconventional
last name, and PTGK not sounding great, the first initial (R) was appended instead. As things go,
nothing is as permanent as a temporary name. Furthermore, we follow the Google style guide and avoid
a long run of uppercase letters, and write PtrHash instead of PTRHash.


**4 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
1 5 13151717 20
```
```
n=23 keys, with hashes < H
```
```
Sorted hashes, split into
```
```
Minimal perfect hash
```
```
P=2 parts, B=5 buckets per part
```
```
slots per part
```
```
P×B 8-bit pilots, main datastructure
```
```
Remap slots ≥n to <n, in order
```
```
6
```
```
6 10
```
```
10
```
```
Figure 1 Overview of PtrHash on n = 23keys. The keys are hashed into[ H ] = [2^64 ]and this
range is split into P = 2parts and B = 5buckets per part. The key highlighted in yellow has a the
9’th smallest hash, and ends up in bucket 4 (starting at index 0). The corresponding pilotp 4 hashes
the key to slot 6. The array of pilots (grey background) is the main component of the PtrHash data
structure, and ensures that all keys hash to different slots. The blue key has a hash in the second
part (upper half) of hashes, in bucket 6. It gets hashed to slot 25, which is larger than the number
of keys n = 23. Thus, it is remapped (along with the other red cells) into an empty slot < n via a
(compressed) list of free slots, which is the second main component of the data structure.
```
```
detail in Figure 2. The result is then scaled to a bucket index in[ B ]:
```
```
part( ki ) :=
```
### ⌊

```
P ·h( ki ) / 264
```
### ⌋

### ,

```
x :=
```
### (

```
( P ·h( ki )) mod 2^64
```
### )

### / 264 ,

```
bucket( ki ) :=⌊ B · γ ( x )⌋. (1)
```
```
Slots and pilots. Now, the goal and core of the data structure is to map the n/P expected
keys in each part to S ≈( n/P ) /αslots , where α ≈ 0. 99 gives us roughly≈1%extra slots
to play with. The pilot for each bucket controls to which slots its keys map. PtrHash uses
fixed-width 8 -bit pilots { p 0 ,...,pP · B − 1 }, one for each bucket. Specifically, key ki in bucket
bucket( ki )with pilot p bucket( ki )maps to slot
```
```
slot( ki ) :=part( ki )· S +reduce(h( ki )⊕hp( p bucket( ki )) ,S ) , (2)
```
```
wherereduce(· ,S )maps the random 64-bit integer into[ S ]as explained below.
Compared to PHOBIC and PTHash(-HEM) [ 43 ], there are two differences here. First,
while we still split the input into parts, we assign each part not only the same number of
bukets, but also the same number of slots, instead of scaling the number of slots with the
actual size of each part. This removes the need to store a prefix sum of part sizes, and
avoids one memory access at query time to look up the offset of the part. Second, previous
methods search for arbitrary large pilot values that require some form of compression to
store efficiently. Our 8-bit pilots can simply be stored in an array so that lookups are simple.
```
```
Construction. The main difficulty of PtrHash is during construction (Section 3.3), where
we must find values of the pilots pj such that all keys indeed map to different slots. Like
other methods, PtrHash processes multiple parts in parallel. Within each part, it sorts the
buckets from large to small and “greedily” assigns them the smallest pilot value that maps
the keys in the bucket to slots that are still free. Unlike other methods though, PtrHash
only allows pilots up to 255. When no suitable pilot is found, we use a method similar to
(blocked) cuckoo hashing [ 39 , 17 ]: a pilot with a minimal number of collisions is chosen,
```

```
R. Groot Koerkamp 5
```
1 **struct PtrHash** {
2 alpha: **f32** , _// Load factor; ~0._
3 lambda: **f32** , _// Average bucket size; ~3._
4 gamma: Fn( **u64** ) -> **u64** , _// Bucket-assignment function_
5 n: **usize** , _// Number of elements_
6 S: **usize** , _// Slots per part_
7 P: **usize** , _// Number of parts; P = n/(alpha·S)_
8 B: **usize** , _// Buckets per part; B = n/P/lambda_
9 lgS: **usize** _// S = 2^lgS_
10 pilots: Vec< **u8** >, _// P·B pilots_
11 remap: Vec< **usize** >, _// P·S-n remap indices_
12 }
13
14 _/// Multiply a and b as if they are fractions of 2^64._
15 _/// Compiles to taking the high 64~bits of the 64x64->128 multiplication._
16 **fn** mul(a: **usize** , b: **usize** ) -> **usize** {
17 ((a **as u128** * b **as u128** ) >> 64) **as usize**
18 }
19
20 **fn** query(ph: **&PtrHash** , key: **Key** ) -> **usize** {
21 **let** h = hash(key);
22 **let** part = mul(ph.P, h);
23 **let** x = ph.P * h;
24 **let** bucket = mul(ph.B, ph.gamma(x));
25 **let** pilot = ph.pilots[bucket];
26 **let** slot_in_part = mul(C, h ^ (C * pilot)) & (ph.S - 1);
27 **let** slot = (part << ph.lgS) + slot_in_part;
28 **return if** slot < ph.n { slot } **else** { ph.remap[slot - ph.n] }
29 }

```
Listing 1 Rust code for a simple implementation of the query function.
```
```
and the colliding buckets are “evicted” and will have to search for a new pilot. A similar
approach was discovered independently by Stefan Hermann [19, Section 4.5].
```
## 3.2 Details

```
We now go over some specific details.
```
```
Hash functions. The 8-bit pilots pb are hashed into pseudo-random 64-bit integers by using
FxHash [6] forhp, which simply multiplies the pilot with a mixing constant C:
```
```
hp( p ) :=C· p. (3)
```
```
When the keys are 64-bit integers, we use this same FxHash algorithm to hash them
(h( k ) :=C· k ), since multiplication by an odd constant is invertible modulo 264 and hence
collision-free. For other types of keys, the hash function depends on the number of elements.
When the number of elements is not too far above 109 , the probability of hash collisions with
a 64-bit hash function is sufficiently small, and we use the 64-bit variant of xxHash [ 9 , 33 ].
When the number of keys goes beyond 232 ≈ 4 · 109 , the probability of 64-bit hash collisions
increases. In this case, we use the 128 bit variant of xxHash. The high 64 bits determine the
part and bucket in Equation (1), and the low 64 bits are used in Equation (2) to determine
the slot.
```
```
The reduce function. When 64-bit hashes are used, we must ensure that all bits of the
hash are used to avoid collisions. A simple choice would bereduce( x,S ) = x mod S , which
uses all bits when S is not a power of 2 and takes two multiplications using fast mod [ 29 ].
Instead, we use S = 2 s , so that x mod 2 s is a simple bit-mask. Unfortunately, this only uses
```

**6 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
the lower s bits of the hash, while the part and bucket functions use the highlog 2 ( P · B )bits,
leaving some entropy in the middle bits unused.
As a solution, we first multiply x by the mixing constantC, and then take the low s bits
of the high half. This uses all input bits and only needs a single multiplication, giving a
small speedup over fast mod:
```
```
reduce( x, 2 s ) :=
```
### ⌊

```
C· x/ 264
```
### ⌋

```
mod 2 s. (4)
```
```
Remapping. Since each part has slightly (≈1%) more slots than keys, some keys will map
to an index≥ n , leading to a non-minimal perfect hash function. To fix this, those are
remapped back into the gaps left behind in slots < n using a (possibly compressed) lookup
table. This is explained in detail in Section 3.5.
Whereas PTHash-HEM uses a separate remap per part , PtrHash only has a single global
remap table. PHOBIC directly builds a full α = 1table, and does not need any remapping.
```
```
Parameter values. In practice, we usually use α = 0. 99. Similar to PHOBIC, the number
of buckets per part is set to B =⌈( α · S ) /λ ⌉, where λ is the expected size of each bucket and
is around 3 to 4. The number of parts is P =⌈ n/ ( αS )⌉.
```
```
Choosing the number of slots per part S. PtrHash-HEM and PHOBIC randomly split the
keys into parts, and a part with ni elements gets Si = ni/α slots. In PtrHash, each part has
the same number of slots S. We would prefer many small parts, since smaller parts fit better
in cache and hence are faster to construct. On the other hand, there is some variance in the
part sizes, and the largest parts will contain more than n/P keys. In particular, for a given S
and P = P ( S ) =⌈ n/ ( αS )⌉, we estimate the size of the largest part as n/P +
```
### √

```
n/P ·
```
### √

```
2 ln P.
We then choose S as the smallest power of two for which this is below S − 1. 5
```
### √

```
n/P , where
the buffer ensures that, at least in practice, a larger-than-expected largest part still fits.
```
## 3.3 Construction

```
Both PTHash-HEM and PHOBIC first partition the keys into parts, and then build an
MPHF part-by-part, optionally in parallel on multiple threads. Within each part, the keys
are randomly partitioned (Figure 1) into buckets of average size λ. Then, the buckets are
sorted from large to small, and one-by-one greedily assigned a pilot , such that the keys in the
bucket map to slots not yet covered by earlier buckets.
As more buckets are placed, there are fewer remaining empty slots, and searching for
pilots becomes harder. Hence, PTHash uses n/α > n slots to ensure there sufficiently
many empty slots for the last pilots. This speeds up the search and reduces the values of
the pilots. PHOBIC, on the other hand, uses relatively small parts of expected size 2500,
so that the search for the last empty slot usually should not take much more than 2500
attempts. Nevertheless, a drawback of the greedy approach is that pilots values have an
uneven distribution, making it somewhat harder to compress them while still allowing fast
access (e.g. requiring the interleaved coding of PHOBIC).
```
```
Hash-evict. In PtrHash, we instead use fixed width , single byte pilots. To achieve this, we
use a technique resembling cuckoo hashing [ 39 ] that was also independently found in [ 19 ,
Section 4.5]. As before, buckets are greedily inserted from large to small. For some buckets,
there may be no pilot in[2^8 ]such that all its keys map to empty slots. When this happens,
a pilot is found with the lowest weighted number of collisions. The weight of a collision with
```

**R. Groot Koerkamp 7**

**Figure 2** The left shows various bucket assignment functions _γ_ , such as the piecewise linear
function (skewed) used by FCH and PTHash, and the optimal function introduced by PHOBIC.
Flatter slopes at _x_ = 0create larger buckets, while steeper slopes at _x_ = 1create more small buckets,
as shown on the right, as the distribution of expected bucket sizes given by( _γ_ −^1 )′when the expected
bucket size is _λ_ = 4.

an element of a bucket of size _s_ is _s_^2 , to prevent _evicting_^2 large buckets, as those are harder
to place. The colliding buckets are evicted by emptying the slots they map to and pushing
them back onto the priority queue of remaining buckets. Then, the new bucket is inserted,
and the next largest remaining or evicted bucket is inserted.

**Implementation details.** In order to speed up the code to search for pilots, a number of
optimizations are made.

```
takenbit mask. Like PTHash and PHOBIC, we keep atakenbit mask that indicates
for each slot whether it was taken. This keeps the array small so it can be cached
efficiently.
```
```
Collision-free hot path. When searching for pilots, we first test if there is a pilot
without any collisions. This is usually the case, and is faster since it only needs access to
the bit vector. Additionally, where there is a collision, we know a pilot is optimal when it
collides with exactly one bucket of minimal size, allowing for an early break.
```
```
Avoiding loops. To avoid repeated patterns of the same buckets evicting each other, the
search for a pilot starts at a random number in[2^8 ], rather than always restarting at 0.
```
```
Avoiding loops more. Each time a bucket is placed that evicted some other bucket(s),
it is added to a list of the 16 most recently placed buckets. Buckets in this list are never
evicted. This avoids short cycles, where for example two buckets keep evicting each other
from the same slot.
```
**Analysis.** Unfortunately, we do not currently have a formal analysis showing that the
hash-evict method works with high probability given that certain criteria are met. Ideally,
the analysis of [ 19 , Section 5] would be extended to fully cover our method. In Section 4, we
show some practical results.


**8 PtrHash: Minimal Perfect Hashing at RAM Throughput**

## 3.4 Bucket Assignment Functions

```
During construction, slots fill up as more buckets are placed. Because of this, the first
buckets are much easier to place than the later ones, when only few empty slots are left. To
compensate for this, we can introduce an uneven distribution of bucket sizes, so that the
first buckets are much larger and the last buckets are smaller. FCH [ 18 ] accomplishes this by
a skew mapping that assigns60%of the elements to30%of the buckets, so that those30%
are large buckets while the remaining70%is small (Figure 2). This is also the scheme used
by PTHash.
```
```
The optimal bucket function. PHOBIC [ 20 ] provides a more thorough analysis and uses
the optimal function γp ( x ) = x + (1− x )ln(1− x )when the target load factor is α = 1. A
small modification is optimal for α < 1 [ 21 , Appendix B], but for simplicity we only consider
the original γp. This function has derivative 0 at x = 0, so that many x values map close
to 0. In practice, this causes the largest buckets to have size much larger than
```
### √

```
S. Such
buckets are hard to place, because by the birthday paradox they are likely to have multiple
elements hashing to the same slot. To fix this, PHOBIC ensures the slope of γ is at least
ε = 1 /
```
### (

### 5

### √

### S

### )

```
by using γp,ε ( x ) = x + (1− ε )(1− x )ln(1− x )instead. For simplicity in the
implementation, we fix ε = 1 / 28 which works well in practice.
```
```
Approximations. For PtrHash, we aim for high query throughput, and thus we would
like to only use simple computations and avoid additional lookups as much as possible.
To this end, we replace theln(1− x )by its first order Taylor approximation at x = 0,
ln(1− x )≈ − x , giving the quadratic γ 2 ( x ) := x^2. Using the second order approximation
ln(1− x )≈ − x − x^2 / 2 results in the cubic γ ( x ) = ( x^2 + x^3 ) / 2. This version again suffers
from too large buckets, so in practice we use γ 3 ( x ) :=^25528 ·( x^2 + x^3 ) / 2 + 218 · x. We also test
the trivial γ 1 ( x ) := x.
These values can all be computed efficiently by using that the input and output of γ are
64-bit unsigned integers representing a fraction of 264 , so that e.g. x^2 can be computed as
the upper 64-bits of the widening 64 × 64 → 128 bit product x · x.
```
## 3.5 Remapping using CacheLineEF

```
Like PTHash, PtrHash uses a parameter 0 < α ≤ 1 to use a total of n ′ = n/α slots,
introducing n ′− n additional free slots. As a result of the additional slots, some, say R , of
the keys will map to positions n ≤ q 0 < ··· < qR − 1 < n ′, causing the perfect hash function
to not be minimal.
```
```
Remapping. Since there are a total of n keys, this means there are exactly R empty slots
(gaps) left behind in[ n ], say at positions L 0 to LR − 1. We remap the keys that map to
positions≥ n to the empty slots at positions < n to obtain a minimal perfect hash function.
A simple way to store the remap is as a plain array F , such that F [ qi − n ] = Li. PTHash
encodes this array using Elias-Fano coding [ 12 , 15 ], after setting undefined positions of F
equal to their predecessor. The benefit of a plain F array is fast and cache-local lookups,
whereas Elias-Fano coding provides a more compact encoding that typically requires multiple
lookups to memory.
```
(^2) We would have preferred to call this method hash-displace, as _displace_ is the term used instead of _evict_ in
e.g. the cuckoo filter [ 14 ]. Unfortunately, _hash and displace_ is already taken by hash-and-displace [ 38 , 1 ].


```
R. Groot Koerkamp 9
```
```
44 bytes
Low 8 bits of each 40 bit value
```
```
4 byte
Offset
```
```
16 bytes = 128 bits
Relative high parts
```
```
64 byte CacheLineEF
```
```
Figure 3 Overview of the CacheLineEF data structure.
```
```
CacheLineEF. We would like to answer each query by reading only a single cache line
from memory. To do this, we use a method based on interleaving data. First, the list of
non-decreasing F positions is split into chunks of C = 44values{ v 0 ,...,v 43 }, with the last
chunk possibly containing fewer values. We assume that values are at most 40 bits, and that
the average stride in each block is not more than 500. Then, each chunk is encoded into 64
bytes that can be stored as single cache line, as shown in Figure 3.
We first split all values into their 8 low bits ( vi mod 28 ) and 32 high bits (⌊ vi/ 28 ⌋).
Further, the high part is split into an offset (the high part of v 0 ) and the relative high part:
```
```
vi = 2^8 ·⌊ v 0 / 28 ⌋
︸ ︷︷ ︸
Offset
```
### +2^8 ·

### (

```
⌊ vi/ 28 ⌋−⌊ v 0 / 28 ⌋
```
### )

### ︸ ︷︷ ︸

```
Relative high part
```
```
+ ( vi mod 2^8 )
︸ ︷︷ ︸
Low bits
```
### . (5)

This is stored as follows.
First, the 32 bit offset⌊ _v_ 0 _/_ 28 ⌋is stored.
Then, the relative high parts are encoded into 128 bits. For each _i_ ∈[44], bit _i_ +⌊ _vi/_ 28 ⌋−
⌊ _v_ 0 _/_ 28 ⌋is set to 1. Since the _vi_ are increasing, each _i_ sets a distinct bit, for a total of 44
set bits.
Lastly, the low 8 bits of each _vi_ are directly written to the 44 trailing bytes.

**Lookup.** The value at position _i_ is found by summing the terms of Equation (5). The offset
and low bits can be read directly. This relative high part can be found as 28 ·(select( _i_ )− _i_ ),
whereselect( _i_ )gives the position of the _i_ ’th 1 bit in the 128-bit-encoded relative high parts.
In practice, this can be implemented efficiently using thePDEPinstruction provided by the
BMI2 bit manipulation instruction set [40].

**Limitations.** CacheLineEF uses 64 _/_ 44 ·8 = 11_._ 6 bits per value, which is more than the usual
Elias-Fano, which for example takes8 + 2 = 10bits per value for data with an average stride
of 28. Furthermore, values are limited to 40 bits, covering 1012 items. The range could be
increased to 48 bit numbers by storing 5 bytes of the offset, but this has not been necessary
so far. Lastly, each CacheLineEF can only span a range of around(128−44)· 28 = 21 504,
or an average stride of 500. This means that for PtrHash, we only use CacheLineEF when
_α_ ≤ 0_._ 99 , so that the average distance between empty slots is 100 and the average stride of
500 is not exceeded in practice. When _α >_ 0_._ 99 , a simple plain array can be used instead
without much overhead.

**Comparison.** Compared to Elias-Fano coding, CacheLineEF stores the low order bits as
exactly a single byte, removing the need for unaligned reads. Further, the select data structure
on the high-order bits is replaced by a few local bit-wise operations. CacheLineEF is also
somewhat similar to _(Uniform) Partitioned Elias-Fano Index_ [ 37 ], in that both split the data.
The uniform partitioned index also uses fixed part sizes, but encodes them with variable
widths, and adds a second level of EF to encode the part offsets. Instead, CacheLineEF


**10 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
Figure 4 Bucket size distribution (red) and average number of evictions (black) per additionally
placed bucket during construction of the pilot table, for different bucket assignment functions.
Parameters are n = 10^9 keys, S = 2^18 slots per part, and α = 0. 98 , and the red shaded load factor
ranges from 0 to α. In the first five plots λ = 3. 5 so that the pilots take 2. 29 bits/key. For λ = 4. 0
(bottom-right), the linear, skewed, and optimal bucket assignment functions cause endless evictions,
and construction fails. The cubic function does work, resulting in 2.0 bits/key for the pilots.
```
```
prefers simplicity and uses fixed part sizes with a constant width encoding and simply stores
the offsets directly.
```
## 4 Results

```
We now evaluate PtrHash construction and query throughput for different parameters, and
compare PtrHash to other minimal perfect hash functions. All experiments are run on an
Intel Core i7-10750H CPU with 6 cores and hyper-threading disabled. The frequency is
pinned to 2.6 GHz. Cache sizes are 32 KiB L1 and 256 KiB L2 per core, and 12 MiB shared
L3 cache. Main memory is 64 GiB DDR4 at 3200 MHz, split over two 32 GiB banks.
In Section 4.1, we compare the effect of various parameters and configurations on the
size, construction speed, and query speed of PtrHash. In Section 4.2, we compare PtrHash
to other methods.
Additionally, in Appendix A.2 we investigate query throughput with batching and when
using multiple threads. In Appendix B.1 we compare various sharding methods, and lastly
in Appendix C we compare the effect of different input types and hash functions on query
throughput.
```
## 4.1 Construction

```
The construction experiments use 109 random 64-bit integer keys, for which the data structure
takes over 300 MB and thus is much larger than L3 cache. Unless otherwise mentioned,
construction is in parallel using 6 cores. For the query throughput experiments, we also test
on 20 million keys, for which the data structure take around 6 MB and easily fit in L3 cache.
To avoid the time needed for hashing keys, and since our motivating application is indexing
```

```
R. Groot Koerkamp 11
```
**Figure 5** This plot shows the construction time (blue and red, left axis) and data structure size
(black, green, and yellow, right axis) as a function of _λ_ for _n_ = 10^9 keys. Parallel construction time
on 6 threads is shown for both the linear and cubic _γ_ , and for various values of _α_ (thickness). The
curves stop because construction times out when _λ_ is too large. For each _λ_ , the black line shows
the space taken by the array of pilots. For larger _λ_ there are fewer buckets, and hence the pilots
take less space. The total size including the remap table is shown in green (plain vector) and yellow
(CacheLineEF) for various _α_. The blue (fast), black (default), and red (compact) dots highlight the
chosen parameter configurations.

```
k -mers that fit in 64 bits, we always use random 64-bit integer keys, and hash them using
FxHash.
```
## 4.1.1 Bucket Functions

In Figure 4, we compare the performance of different bucket assignment functions _γ_ in terms
of the bucket size distribution and the number of evictions for each additionally placed bucket.
We see that the linear _γ_ 1 ( _x_ ) = _x_ has a lot of evictions for the last buckets of size 3 and 2 ,
but like all methods it is fast for the last buckets of size 1 due to the load factor _α <_ 1. The
optimal distribution of PHOBIC performs only slightly better than the skewed one of FCH
and PTHash, and can be seen to create more large buckets since the load factor increases
fast for the first buckets. The cubic _γ_ 3 is clearly much better than all other functions, and is
also tested with larger buckets of average size _λ_ = 4, where all other functions fail.
In the remainder, we will test the linear _γ_ 1 for simplicity and lookup speed, and the
cubic _γ_ 3 for space efficiency.

## 4.1.2 Tuning Parameters for Construction

```
In Figure 5 we compare the multi-threaded construction time and space usage of PtrHash on
n = 10^9 keys for various parameters γ ∈{ γ 1 ,γ 3 }, 2. 7 ≤ λ ≤ 4. 2 , α ∈{ 0. 98 , 0. 99 , 0. 995 , 0. 998 },
and plain remapping or CacheLineEF. We see that for fixed γ and α , the construction time
appears to increase exponentially as λ increases, until it times out due to a never-ending
```

**12 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
Table 1 Comparison of space usage (bits/key) and query throughput (ns/query) of PtrHash
when using the recommended parameters with different remap structures. Query throughput is
shown both for perfect hashing (without remap), and for minimal perfect hashing (with remap).
Additionally, query throughput is shown both for a for-loop and for streaming.
```
```
Configuration Pilots Query PHF Remap Query MPHF
Space Loop Stream Type Space Loop Stream
Fast 2.67 11.6 8.6 Vec<u32> 0.33 12.7 8.
CacheLineEF 0.12 12.1 8.
EF 0.09 14.4 9.
Default 2.29 17.6 7.9 Vec<u32> 0.33 20.0 8.
CacheLineEF 0.12 21.0 8.
EF 0.09 21.2 9.
Compact 2.00 17.5 7.9 Vec<u32> 0.33 20.0 8.
CacheLineEF 0.12 21.0 8.
EF 0.09 21.3 9.
```
```
chain of evictions. Load factors α closer to 1 (thinner lines) achieve smaller overall data
structure size, but take longer to construct and time out at smaller λ. The cubic γ 3 is faster
to construct than the identity γ 1 for small λ ≤ 3. 5. Unlike γ 1 , it also scales to much larger λ
up to 4 , and thereby achieves significantly smaller overall size.
We note that for small λ , construction time does converge to around 19 ns/key. A rough
time breakdown is that for each key, 1 ns is spent on hashing, 5 ns on sorting all the keys,
12 ns to find pilots, and lastly 1 ns on remapping to empty slots.
```
```
Recommended parameters. Based on these results, we choose three sets of parameters for
further evaluation, as indicated with blue, black, and red dots in Figure 5:
Fast (blue), aiming for query speed: using the linear γ 1 , λ = 3. 0 , α = 0. 99 , and a plain
vector for remapping. Construction takes only just over 20 ns/key, close to the apparent
lower bound, and space usage is 3 bits/key. This can be used when n is small, or more
generally when memory usage is not a bottleneck.
Default (black), a trade-off between fast construction and small space: using cubic γ 3 ,
λ = 3. 5 , and α = 0. 99 , with CacheLineEF remapping.
Compact (red), aiming for small space: using the cubic γ 3 , λ = 4. 0 , α = 0. 99 , and
CacheLineEF remapping. Construction now takes around 50 ns/key, but the data
structure only uses 2.12 bits/key. In practice, this configuration sometimes ends up in
endless eviction cycles and λ = 3. 9 may be better.
```
## 4.1.3 Remap

```
In Table 1, we compare the space usage and query throughput of the different remap data
structures for both the fast and compact parameters, for n = 10^9 keys. We observe that the
overhead of CacheLineEF is 2. 75 ×smaller than a plain vector, and only40%larger than
true Elias-Fano encoding.
The speed of non-minimal (PHF) queries that do not remap does not depend on the
remap structure used.
```

```
R. Groot Koerkamp 13
```
**Table 2** Performance comparison of MPHF on 300 million random string keys of uniform length
between 10 and 50. Construction time is shown for 6 threads. A * indicates single-threaded timings
(optimistic 6-fold speedup in parentheses). Near-optimal values in each column are shown in bold.

```
Approach Configuration bits/keySpace Construction6t, ns/key ns/queryQuery
```
```
Bruteforce
```
```
SIMDRecSplit nn =5=8,, bb =5=100 1.81 2.96^26 66 310258
```
```
Bip. ShockHash-Flat n =64 1.62 2140* (357) 201
```
```
Consensus-RecSplit kk = 256= 512,, εε = 0= 0 ..^1003 1.581.49 1199* (200)521* (87)^565528
```
```
Fingerprinting
```
```
FMPH γγ =2=1 ..^00 3.402.80^4469168236
```
```
FMPHGO ss =4=4,, bb =16=16,, γγ =2=1 ..^00 2.862.21^298423160212
```
```
FiPS γγ =2=1 ..^05 3.523.12 109* (93* (^1618 ))^109124
```
```
Graph
```
```
SicHash pp^11 =0=0 ..^2145 ,, pp^22 =0=0 ..^7831 ,, αα =0=0 ..^9097 2.412.08^4863149141
```
```
Bucket placement
```
```
CHD λ =3. 0 2.27 1059* (177) 542
```
```
PTHash
```
```
λ =4. 0 , α =0. 99 , C-C 3.19 403 77
+ HEM 173
λ =5. 0 , α =0. 99 , EF 2.17 765 156
+ HEM 323
```
```
PHOBIC
```
```
λ =3. 9 , α =1. 0 , IC-C 4.14 62 116
λ =4. 5 , α =1. 0 , IC-R 2.34 80 179
λ =6. 5 , α =1. 0 , IC-C 2.44 220 108
λ =7. 0 , α =1. 0 , IC-R 1.86 446 157
```
```
PtrHash
```
```
Fast λ =3. 0 , α =0. 99 , γ 1 , Vec 2.99 26 38
+ streaming 20
Default λ =3. 5 , α =0. 99 , γ 3 , CLEF 2.40 32 44
+ streaming 25
Compact λ =4. 0 , α =0. 99 , γ 3 , CLEF 2.12 62 42
+ streaming 23
```
For _minimal_ (MPHF) queries with the for loop, EF is significantly slower (14.2 ns) with
the fast parameters than the plain vector (12.5 ns), while CacheLineEF (12.9 ns) is only
slightly slower. The difference is much smaller with the compact parameters, because the
additional computations for the cubic _γ_ 3 reduce the number of iterations the processor can
work ahead. When streaming queries, for both parameter choices CacheLineEF is less than
0.1 ns slower than the plain vector, while EF is 1 ns slower.
In the end, we choose CacheLineEF when using compact parameters, but prefer the
simpler and slightly faster plain vector for fast parameters.

## 4.2 Comparison to Other Methods

```
In Table 2 we compare the performance of PtrHash against other methods on short, random
strings. In particular, we compare against methods and configurations that are reasonably fast
to construct: SIMDRecSplit [ 13 , 4 ], Bipartite ShockHash-Flat [ 26 , 24 ], Consensus-RecSplit
[ 27 ], FMPH and FMPHGO [ 3 ], FiPS [ 22 ], SicHash [ 25 ], CHD [ 1 ], PTHash [ 42 , 43 ], and
```

**14 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
PHOBIC [ 20 ]. We also include Bipartite ShockHash-Flat [ 26 , 24 ], which is able to use
relatively little space with fast construction time. The specific parameters are based on
Table 1 of [ 20 ], Table 8.1 of [ 22 ], and Table 3 of [ 3 ]. These results were obtained using the
excellent MPHF-Experiments library [ 23 ] by Hans-Peter Lehmann. Construction is done on
6 threads in parallel when supported. By default, the framework queries one key at a time.
For PtrHash with streaming queries, we modified this to query all keys at once.
Input. The input is 300 million random strings of random length between 10 and 50
characters. This input size is such that the MPHF data structures take around 75 MB, which
is much larger than the 12 MB L3 cache.
```
```
PtrHash. As expected, the space usage of PtrHash matches the numbers of Table 1. In
general, PtrHash can be slightly larger due to rounding in the number of parts and slots per
part, but for large inputs like here this effect is small. Construction times per key are slightly
slower than as predicted by Figure 5, while we might expect slightly faster construction due
to the lower number of keys. Likely, the slowdown is caused by hashing the input strings.
The hashing of input strings has a much worse effect on query throughput. In Table 1, we
obtained query throughput of 12 ns and 18 ns for the fast and compact configurations when
looping, and as low as 8 ns when streaming queries. With string inputs, these numbers more
than double to 38 ns resp. 42 ns when looping, and 20 ns when streaming. A similar effect
can be seen when comparing Tables 3 and 4 of [3]. Appendix C further investigates this.
```
```
Speed. We observe that PtrHash with fast parameters is the fastest to construct alongside
SIMDRecSplit (26 ns/key) and FiPS (16 ns/key, assuming optimal scaling to 6 threads),
resulting in around 3 bits/key for all three methods. However, query throughput of PtrHash
is 8 ×(SIMDRecSplit) resp. 2. 8 ×(FiPS) faster, going up to 15 ×resp. 5 ×faster when
streaming all queries at once. Compared to the next-fastest method to query, PTHash-CC
(HEM), PtrHash is twice faster to query (or nearly 4 ×when streaming), is 6. 5 ×faster to
build, and even slightly smaller.
With default parameters, PtrHash is 1. 75 ×faster to query than the fastest configuration
of PTHash, and 3. 1 ×faster when using streaming, while being over 5 ×faster to construct.
Indeed, the speedup in query speed is explained by the fact that only a single memory
access is needed for most queries (compared to≥ 2 for PtrHash-HEM and PHOBIC), and
generally by the fact that the code for querying is short.
```
```
Space. PtrHash with the fast parameters is larger (2.99 bits/key) than some other methods,
but compensates by being significantly faster to construct and/or query. When space is of
importance, the compact version can be used (2.12 bits/key). This takes 2. 4 ×longer to build
at 62 ns/key, and has only slightly slower queries. Compared to methods that are smaller,
PtrHash is over 3 ×faster to build than PHOBIC. Consensus, SIMDRecSplit, and SicHash
achieve smaller space of 1.58, 1.81 and 2.08 bits/key in comparable time (63-87 ns/key), but
again are at least 3 ×slower to query, or over 6 ×compared to streaming queries.
```
## 5 Conclusions and Future Work

```
We have introduced PtrHash, a minimal perfect hash function that builds on PTHash and
PHOBIC. Its main novelty is the used of fixed-width 8-bit pilots that simplify queries. To
make this possible, we use hash-and-evict , similar to Cuckoo hashing: when there is no pilot
that leads to a collision-free placement of the corresponding keys, some other pilots are
evicted and have to search for a new value.
```

```
R. Groot Koerkamp 15
```
The result is an MPHF with twice faster queries (38 ns/key) than any other method (at
least 77 ns/key) for datasets larger than L3 cache. Further, due to its simplicity, queries
can be processed in _streaming_ fashion, giving another two times speedup (20 ns/key). At
this point, the hashing of string inputs becomes a bottleneck. For integer keys, such as
_k_ -mers, much higher throughput of up to 8 ns/key can be obtained, fully saturating the RAM
throughput of each core, or when using multiple cores even saturating the main memory
(2.5 ns/key).

```
Future work. A theoretical analysis of our method is currently missing. While the hash-evict
strategy works well in practice, we currently have no relation between the bucket size λ , load
factor α , and the number of evicts arising during construction. Such an analysis could help
to better understand the optimal bucket assignment function, like PHOBIC [ 20 ] did for the
case without eviction.
Second, the size of pilots could possibly be improved by further parameter tuning. In
particular we use 8-bit pilots, while slightly fewer or more bits may lead to smaller data
structures. An experiment with 4-bit pilots was not promising, however.
Lastly, to further improve the throughput, we suggest that more attention is given to
the exact input format. As already seen, hashing all queries at once can provide significant
performance gains via prefetching. For string input specifically, it is more efficient when the
strings are consecutively packed in memory rather than separately allocated, and it might
be more efficient to explicitly hash multiple strings in parallel. More generally, applications
should investigate whether they can be rewritten to take advantage of streaming queries.
```
## Acknowledgements

```
First, I thank Giulio Ermanno Pibiri for his ongoing feedback in various stages of this project.
Further, I thank Sebastiano Vigna for feedback from trying to construct PtrHash on 1012 keys
and integrating ε -serde, and lastly I thank Hans-Peter Lehmann for feedback on the text.
```
```
References
1 Djamal Belazzougui, Fabiano C. Botelho, and Martin Dietzfelbinger. Hash, displace, and
compress. In Algorithms - ESA 2009 , page 682–693. Springer Berlin Heidelberg, 2009.doi:
10.1007/978-3-642-04128-0_61.
2 Djamal Belazzougui and Gonzalo Navarro. Alphabet-independent compressed text indexing.
ACM Transactions on Algorithms , 10(4):1–19, August 2014.doi:10.1145/2635816.
3 Piotr Beling. Fingerprinting-based minimal perfect hashing revisited. ACM Journal of
Experimental Algorithmics , 28:1–16, June 2023.doi:10.1145/3596453.
4 Dominik Bez, Florian Kurpicz, Hans-Peter Lehmann, and Peter Sanders. High Performance
Construction of RecSplit Based Minimal Perfect Hash Functions. In Inge Li Gørtz, Martin
Farach-Colton, Simon J. Puglisi, and Grzegorz Herman, editors, 31st Annual European
Symposium on Algorithms (ESA 2023) , volume 274 of Leibniz International Proceedings in
Informatics (LIPIcs) , pages 19:1–19:16, Dagstuhl, Germany, 2023. Schloss Dagstuhl – Leibniz-
Zentrum für Informatik. URL:https://drops.dagstuhl.de/entities/document/10.4230/
LIPIcs.ESA.2023.19,doi:10.4230/LIPIcs.ESA.2023.19.
5 Fabiano C. Botelho, Rasmus Pagh, and Nivio Ziviani. Simple and space-efficient minimal
perfect hash functions. In Algorithms and Data Structures , page 139–150. Springer Berlin
Heidelberg, 2007.doi:10.1007/978-3-540-73951-7_13.
6 Christopher Breeden. fxhash: A fast, non-secure, hashing algorithm derived from an internal
hasher in firefox. URL:https://crates.io/crates/fxhash.
```

**16 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
7 C.-C. Chang. Perfect hashing schemes for mining association rules. The Computer Journal ,
48(2):168–179, February 2005.doi:10.1093/comjnl/bxh074.
8 Jarrod A. Chapman, Isaac Ho, Sirisha Sunkara, Shujun Luo, Gary P. Schroth, and Daniel S.
Rokhsar. Meraculous: De novo genome assembly with short paired-end reads. PLoS ONE ,
6(8):e23501, August 2011.doi:10.1371/journal.pone.0023501.
9 Yann Collet. xxhash: Extremely fast non-cryptographic hash algorithm. URL:https:
//xxhash.com.
10 Travis Downs. Measuring reorder buffer capacity on skylake, April 2017. URL:https:
//www.realworldtech.com/forum/?threadid=166772&curpostid=167685.
11 Travis Downs. Measuring reorder buffer capacity on skylake, November 2018. URL:https:
//github.com/Kobzol/hardware-effects/issues/1#issuecomment-441111396.
12 Peter Elias. Efficient storage and retrieval by content and address of static files. Journal of
the ACM , 21(2):246–260, April 1974.doi:10.1145/321812.321820.
13 Emmanuel Esposito, Thomas Mueller Graf, and Sebastiano Vigna. Recsplit: Minimal perfect
hashing via recursive splitting. In 2020 Proceedings of the Twenty-Second Workshop on
Algorithm Engineering and Experiments (ALENEX) , page 175–185. Society for Industrial and
Applied Mathematics, January 2020.doi:10.1137/1.9781611976007.14.
14 Bin Fan, Dave G. Andersen, Michael Kaminsky, and Michael D. Mitzenmacher. Cuckoo
filter. Proceedings of the 10th ACM International on Conference on emerging Networking
Experiments and Technologies , Dec 2014.doi:10.1145/2674005.2674994.
15 R.M. Fano. On the Number of Bits Required to Implement an Associative Memory. Memor-
andum 61, Computation Structures Group. MIT Project MAC Computer Structures Group,
```
1971. URL:https://books.google.ch/books?id=07DeGwAACAAJ.
**16** Tommaso Fontana, Sebastiano Vigna, and Stefano Zacchiroli. Webgraph: The next generation
(is in rust). In _Companion Proceedings of the ACM Web Conference 2024_ , WWW ’24, page
686–689. ACM, May 2024.doi:10.1145/3589335.3651581.
**17** Dimitris Fotakis, Rasmus Pagh, Peter Sanders, and Paul Spirakis. Space efficient hash tables
with worst case constant access time. _Theory of Computing Systems_ , 38(2):229–248, December
2004.doi:10.1007/s00224-004-1195-x.
**18** Edward A. Fox, Qi Fan Chen, and Lenwood S. Heath. A faster algorithm for constructing
minimal perfect hash functions. _Proceedings of the 15th annual international ACM SIGIR
conference on Research and development in information retrieval - SIGIR ’92_ , 1992.doi:
10.1145/133160.133209.
**19** Stefan Hermann. Accelerating minimal perfect hash function construction using gpu
parallelization. Master’s thesis, Karlsruher Institut für Technologie (KIT), 2023. doi:
10.5445/IR/1000164413.
**20** Stefan Hermann, Hans-Peter Lehmann, Giulio Ermanno Pibiri, Peter Sanders, and Stefan
Walzer. Phobic: Perfect hashing with optimized bucket sizes and interleaved coding. In
_32nd Annual European Symposium on Algorithms_. Schloss Dagstuhl – Leibniz-Zentrum für
Informatik, 2024.doi:10.4230/LIPICS.ESA.2024.69.
**21** Stefan Hermann, Hans-Peter Lehmann, Giulio Ermanno Pibiri, Peter Sanders, and Stefan
Walzer. Phobic: Perfect hashing with optimized bucket sizes and interleaved coding, 2024.
doi:10.48550/ARXIV.2404.18497.
**22** Hans-Peter Lehmann. _Fast and Space-Efficient Perfect Hashing_. PhD thesis, Karlsruher
Institut für Technologie (KIT), 2024.doi:10.5445/IR/1000176432.
**23** Hans-Peter Lehmann. Mphf-experiments, January 2025. URL:https://github.com/
ByteHamster/MPHF-Experiments.
**24** Hans-Peter Lehmann, Peter Sanders, and Stefan Walzer. Shockhash: Towards optimal-space
minimal perfect hashing beyond brute-force, 2023.doi:10.48550/ARXIV.2308.09561.
**25** Hans-Peter Lehmann, Peter Sanders, and Stefan Walzer. Sichash - small irregular cuckoo
tables for perfect hashing. In _2023 Proceedings of the Symposium on Algorithm Engineering_


**R. Groot Koerkamp 17**

```
and Experiments (ALENEX) , page 176–189. Society for Industrial and Applied Mathematics,
January 2023.doi:10.1137/1.9781611977561.ch15.
26 Hans-Peter Lehmann, Peter Sanders, and Stefan Walzer. Shockhash: Towards optimal-space
minimal perfect hashing beyond brute-force. In 2024 Proceedings of the Symposium on
Algorithm Engineering and Experiments (ALENEX) , page 194–206. Society for Industrial and
Applied Mathematics, January 2024.doi:10.1137/1.9781611977929.15.
27 Hans-Peter Lehmann, Peter Sanders, Stefan Walzer, and Jonatan Ziegler. Combined search
and encoding for seeds, with an application to minimal perfect hashing, 2025. URL:https:
//arxiv.org/abs/2502.05613,doi:10.48550/ARXIV.2502.05613.
28 Daniel Lemire. Fast random integer generation in an interval. ACM Transactions on Modeling
and Computer Simulation , 29(1):1–12, January 2019.doi:10.1145/3230636.
29 Daniel Lemire, Owen Kaser, and Nathan Kurz. Faster remainder by direct computation: Ap-
plications to compilers and software libraries. Software: Practice and Experience , 49(6):953–970,
February 2019.doi:10.1002/spe.2689.
30 Antoine Limasset, Guillaume Rizk, Rayan Chikhi, and Pierre Peterlongo. Fast and Scalable
Minimal Perfect Hashing for Massive Key Sets. In 16th International Symposium on Experi-
mental Algorithms (SEA 2017) , volume 75 of Leibniz International Proceedings in Informatics
(LIPIcs) , pages 25:1–25:16, Dagstuhl, Germany, 2017. Schloss Dagstuhl–Leibniz-Zentrum fuer
Informatik.doi:10.4230/LIPIcs.SEA.2017.25.
31 Yi Lu, Balaji Prabhakar, and Flavio Bonomi. Perfect hashing for network applications.
In 2006 IEEE International Symposium on Information Theory. IEEE, July 2006. doi:
10.1109/isit.2006.261567.
32 B. S. Majewski, N. C. Wormald, G. Havas, and Z. J. Czech. A family of perfect hashing
methods. The Computer Journal , 39(6):547–554, 01 1996. arXiv:https://academic.oup.
com/comjnl/article-pdf/39/6/547/1103380/390547.pdf,doi:10.1093/comjnl/39.6.547.
33 Artur Martirosian. xxhash-rust: Implementation of xxhash in rust. URL:https://crates.
io/crates/xxhash-rust.
34 Kurt Mehlhorn. On the program size of perfect and universal hash functions. 23rd Annual
Symposium on Foundations of Computer Science (sfcs 1982) , Nov 1982.doi:10.1109/sfcs.
1982.80.
35 Michael Molloy. Cores in random hypergraphs and boolean formulas. Random Structures
& Algorithms , 27(1):124–135, March 2005. URL:http://dx.doi.org/10.1002/rsa.20061,
doi:10.1002/rsa.20061.
36 Ingo Müller, Peter Sanders, Robert Schulze, and Wei Zhou. Retrieval and perfect hashing using
fingerprinting. In Experimental Algorithms , page 138–149. Springer International Publishing,
2014.doi:10.1007/978-3-319-07959-2_12.
37 Giuseppe Ottaviano and Rossano Venturini. Partitioned elias-fano indexes. In Proceedings of
the 37th international ACM SIGIR conference on Research and development in information
retrieval , SIGIR ’14. ACM, July 2014.doi:10.1145/2600428.2609615.
38 Rasmus Pagh. Hash and displace: Efficient evaluation of minimal perfect hash functions.
In Algorithms and Data Structures , page 49–54. Springer Berlin Heidelberg, 1999. doi:
10.1007/3-540-48447-7_5.
39 Rasmus Pagh and Flemming Friche Rodler. Cuckoo hashing. In Algorithms — ESA 2001 ,
page 121–133. Springer Berlin Heidelberg, 2001.doi:10.1007/3-540-44676-1_10.
40 Prashant Pandey, Michael A. Bender, and Rob Johnson. A fast x86 implementation of select,
2017.doi:10.48550/ARXIV.1706.00990.
41 Giulio Ermanno Pibiri. Sparse and skew hashing of k-mers. Bioinformatics , 38:i185–i194,
June 2022.doi:10.1093/bioinformatics/btac245.
42 Giulio Ermanno Pibiri and Roberto Trani. Pthash: Revisiting fch minimal perfect hashing.
Proceedings of the 44th International ACM SIGIR Conference on Research and Development
in Information Retrieval , Jul 2021.doi:10.1145/3404835.3462849.
```

**18 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
43 Giulio Ermanno Pibiri and Roberto Trani. Parallel and external-memory construction of
minimal perfect hash functions with pthash. IEEE Transactions on Knowledge and Data
Engineering , 36(3):1249–1259, March 2024.doi:10.1109/tkde.2023.3303341.
44 Sebastiano Vigna and Tommaso Fontana. ε -serde, 2024. URL:https://github.com/vigna/
epserde-rs.
45 Henry Wong. Measuring reorder buffer capacity, may 2013. URL:https://blog.stuffedcow.
net/2013/05/measuring-rob-capacity/.
```

```
R. Groot Koerkamp 19
```
## A Query throughput

## A.1 Batching and streaming

```
Throughput. In practice in bioinformatics applications such as SSHash, we expect many
independent queries to the MPHF. This means that queries can be answered in parallel,
instead of one by one. Thus, we should optimize for query throughput rather than individual
query latency. We report throughput as inverse throughput in amortized nanoseconds per
query, rather than the usual queries per second.
```
**Out-of-order execution.** An MPHF on 109 keys requires memory at least 1_._ 5 bits _/_ key×
109 keys= 188MB, which is much larger than the L3 cache of size around 16 MB. Thus,
most queries require reading a pilot from main memory (RAM), which usually has a latency
around 80 ns. Nevertheless, existing MPHFs such as FCH [ 18 ] achieve an inverse throughput
as low as 35 ns/query on such a dataset [ 42 ]. This is achieved by _pipelining_ and the _reorder
buffer_. For example, Intel Skylake CPUs can execute over 200 instructions ahead while
waiting for memory to become available [ 45 , 10 ]. This allows the CPU to already start
processing future queries and fetch the required cache lines from RAM while waiting for the
current query. Thus, when each iteration requires less than 100 instructions and there are no
branch-misses, this effectively makes up to two reads in parallel. A large part of speeding up
queries is then to reduce the length of each iteration so that out-of-order execution can fetch
memory more iterations ahead.

**Prefetching.** Instead of relying on the CPU hardware to parallellize requests to memory,
we can also explicitly _prefetch_^3 cache lines from our code. Each prefetch requires a _line
fill buffer_ to store the result before it is copied into the L1 cache. Skylake has 12 line fill
buffers [ 11 ], and hence can support up to 12 parallel reads from memory. In theory, this gives
a maximal random memory throughput around 80 _/_ 12 = 6_._ 67 ns per read from memory, but
in practice experiments show that the limit is 7.4 ns per read. Thus, our goal is to achieve a
query throughput of 7.4 ns.
We consider two models to implement prefetching: batching and streaming.

(^3) There are typically multiple types of prefetching instructions that prefetch into a different level of the
cache hierarchy. We prefetch into all levels of cache usingprefetcht0.
Time
In-progress reads
Time
Batching: prefetch in chunks of size 8 Streaming: prefetch 8 iterations ahead
**Figure 6** Simplified schematic of in-progress reads from main memory (RAM) when using two
different prefetching approaches processing (up to) 8 reads in parallel. Each horizontal line indicates
the duration a read is in progress, from the moment it is prefetched (left vertical bar) to the moment
it is available in L1 cache and its corresponding line fill buffer is free again (right vertical bar).
Streaming (right) provides better parallelism than batching (left).


**20 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
Batching. In this approach, the queries are split into batches (chunks) of size B , and are
then processed one batch at a time (Figure 6, left). In each batch, two passes are made over
all keys. In the first pass, each key is hashed, its bucket it determined, and the cache line
containing the corresponding pilot is prefetched. In the second pass, the hashes are iterated
again, and the corresponding slots are computed.
```
```
Streaming. A drawback of batching is that at the start and end of each batch, the memory
bandwidth is not fully saturated. Streaming fixes this by prefetching the cache line for the
pilot B iterations ahead of the current one, and is able to sustain the maximum possible
number of parallel prefetches throughout, apart from at the very start and end (Figure 6,
right).
```
## A.2 Evaluation

```
A note on benchmarking throughput. To our knowledge, all recent papers on (minimal)
perfect hashing measure query speed by first creating a list of keys, and then querying all
keys in the list, as infor key in keys { ptr_hash.query(key); }. One might think this
measures the average latency of a query, but that is not the case, as the CPU will execute
instructions from adjacent iterations at the same time. Indeed, as can be seen in Table 1,
this loop can be as fast as 12 ns/key for n = 10^9 , which is over 6 times faster than the RAM
latency of around 80 ns (for an input of size 300 MB), and thus, at least 6 iterations are
being processed in parallel.
Hence, we argue that existing benchmarks measure (and optimize for) throughput
and that they assume that the list of keys to query is known in advance. We make
this assumption explicit by changing the API to benchmark all queries at once, as in
ptr_hash.query_all(keys). This way, we can explicitly process multiple queries in parallel.
We also argue that properly optimizing for throughput is relevant for applications. SSHash,
for example, queries all minimizers of a DNA sequence, which can be done by first computing
and storing those minimizers, followed by querying them all at once.
We now explore the effect of the batch size and number of parallel threads on query
throughput.
```
```
Batching and Streaming. In Figure 7, we compare the query throughput of a simple for
loop with the batching and streaming variants with various batch/lookahead sizes. We
see that both for small n = 20· 106 and large n = 10^9 , the fast parameters yield higher
throughput than the compact parameters when using a for loop. This is because of the
overhead of computing γ 3 ( x ). For small n , batching and streaming do not provide much
benefit, indicating that memory latency is not a bottleneck. However, for large n , both
batching and streaming improve over the plain for loop. As expected, streaming is faster than
batching here. For streaming, throughput saturates when prefetching around 16 iterations
ahead. At this point, memory throughput is the bottleneck, and the difference between the
compact and fast parameters disappears. In fact, compact parameters with γ 3 are slightly
faster. This is because γ 3 has a more skew distribution of bucket sizes with more large
buckets. When the pilots for these large buckets are cached, they are more likely to be hit
by subsequent queries, and hence avoid some accesses to main memory.
For further experiments we choose streaming over batching, and use a lookahead of 32
iterations. The final throughput of 8 ns per query is very close to the optimal throughput of
7.4 ns per random memory read.
```

```
R. Groot Koerkamp 21
```
**Figure 7** Query throughput of prefetching via batching (dotted) and streaming (dashed) with
various batch/lookahead sizes, compared to a plain for loop (solid), for _n_ = 20· 106 (left) and _n_ = 10^9
(right) keys. Blue shows the results for the fast parameters, and red for the compact parameters.
Default parameters give performance nearly identical to the compact parameters, since the main
differentiating factor is the use of _γ_ 1 versus _γ_ 3. All times are measured over a total of 109 queries,
and for (non-minimal) perfect hashing only, _without_ remapping.

## A.3 Multi-threaded Throughput

```
In Figure 8 we compare the throughput of the fast and compact parameters for multiple
threads. When n = 20· 106 is small and the entire data structure fits in L3 cache, the scaling
to multiple threads is nearly perfect. As expected, minimal perfect hashing (bright) tends to
be slightly slower than perfect hashing (dimmed), but the difference is small. The fast γ 1 is
faster than the compact γ 3 , and streaming provides only a small benefit over a for loop. For
large n = 10^9 , all methods converge towards the limit imposed by the full RAM throughput
of 25.6 GB/s. Streaming variants hit this starting at around 4 threads, and remain faster
than the for loop. As before, the compact version is slightly faster because of its more efficient
use of the caches, and is even slightly better than the maximum throughput of random reads
to RAM. Minimal perfect hashing is only slightly slower than perfect hashing.
```
## B Sharding

When the number of keys is large, say over 1010 , their 64-bit (or 128-bit) hashes may not
all fit in memory at the same time, even though the final PtrHash data structure (the list
of pilots) would fit. Thus, we can not simply sort all hashes in memory to partition them.
Instead, we split the set of all _n_ hashes into, say _s_ =⌈ _n/_ 232 ⌉ _shards_ of≈ 232 elements each,
where the _i_ ’th shard corresponds to hash values in _si_ := [2^64 · _i/s,_ 264 ·( _i_ + 1) _/s_ ). Then,
shards are processed one at a time. The hashes in each shard are sorted and split into parts,
after which the parts are constructed as usual. This way, the shards only play a role during
construction, and the final constructed data structure is independent of which sharding
strategy was used.

```
In-memory sharding. The first approach to sharding is to iterate over the set of keys s
times. In the i ’th iteration, all keys are hashed, and only those hashes in the corresponding
interval si are stored and processed. This way, no disk space is needed for construction.
```

**22 PtrHash: Minimal Perfect Hashing at RAM Throughput**

```
Figure 8 In this plot we compare the throughput of a for loop (solid) versus streaming (dashed)
for multiple threads, for both non-minimal (dimmed) and minimal (bright) perfect hashing. The
left shows results for n = 20· 106 , and the right shows results for n = 10^9. In blue the results for
the fast parameters with γ 1 , and in red the results for compact parameters with γ 3 , which perfors
nearly identical to the default parameters. On the right, the solid black line shows the maximum
throughput based on 7.4 ns per random memory access per thread, and the solid black line shows
the maximum throughput based on the total memory bandwidth of 25.6 GB/s.
```
```
On-disk sharding. A drawback of the first approach is that keys are potentially hashed
many times. This can be avoided by writing hashes to disk. Specifically, we can create one
file per shard and append hashes to their corresponding file. These files are then read and
processed one by one.
```
```
Hybrid sharding. A hybrid of the two approaches above only requires disk space for D < s
shards. This iterates and hashes the keys⌈ s/D ⌉times, and in each iteration writes hashes
for D shards to disk. Those are then processed one by one as before.
```
```
On-disk PtrHash. When the number of keys is so large that even the pilots do not fit
in memory, they can also be stored to disk and read on-demand while querying. This is
supported using ε -serde [44, 16].
```
## B.1 Evaluation

```
We tested the in-memory and hybrid sharding by constructing PtrHash with default para-
meters on 5 · 1010 random integer keys on a laptop with only 64 GB of memory, using 6 cores
in parallel. All 64-bit hashes would take 400 GB, so we use 24 shards of around 231 keys,
that each take 16 GB. The final data structure takes 2.40 bits/key, or 15 GB in total, and
the peak memory usage is around 50 GB.
The in-memory strategy iterates through and hashes the integer keys 24 times, and takes
3098 seconds in total or 129 s per shard. Of this, 67s (52%) is spent on hashing the keys, 14s
(11%) is spent sorting hashes into buckets, and 45s (35%) is spent searching for pilots.
The hybrid strategy is allowed to use up to 128 GB of disk space, and thus writes hashes
to disk in 3 batches of 8 shards at a time. This brings the total time down to 2494 s (17%
faster), and uses 104 s per shard. Of this, an amortized 31 s (30%) per shard is spent writing
hashes to disk, and 9 s (9%) is spent reading hashes from disk, which together is faster than
the 67s that was previously spent on hashing all keys.
```

```
R. Groot Koerkamp 23
```
## C Evaluating Hash Functions

```
In Table 3, we compare the throughput of various hash functions on different types of inputs,
both when iterating and streaming through queries. The hash functions being compared are
64-bit FxHash [ 6 ], and the 64-bit and 128-bit variants of XxHash (XXH3 specifically). We
test various inputs, of increasing complexity:
```
**1.** plain integers keys, the easy case;
**2.** allocated integer keys, to measure the overhead of the memory indirection;
**3.** short back-to-back packed fixed-length strings, to measure the overhead of string hashing;
**4.** longer packed fixed-length strings, to measure the overhead of iteration the string charac-
    ters;
**5.** variable-length packed strings, to measure the overhead of branch-mispredictions;
**6.** allocated variable-length strings, to again measure pointer indirection overhead.

```
The string slices are all packed back-to-back into a single large allocation, so that their
contents can be efficiently prefetched. TheVec<u8>version on the other hand uses the
default allocator, which may or may not put things close to each other and/or in order.
```
**Results.** Both when iterating and when streaming queries, FxHashing plain integers is
fastest, as expected. Both XxHash variants are quite a bit slower, especially when using
plain iteration. On boxed integers, most methods become around 1 ns/key slower. FxHash
maintains this speed advantage for short strings, but for longer strings XXH3-64 becomes
faster. In fact, XXH3 is only marginally slower for 50 byte strings than for boxed integers,
which is quite impressive!
When moving on to variable-length strings, all methods take quite a hit of at least
5 ns/key due to the branch-mispredictions. XXH3-64 remains fastest, but FxHash is nearly
as fast when looping over queries. The same is true when moving to allocated strings, which
is again around 2 ns/key slower.
Overall, FxHash is the best hash to use for integer keys, and XXH3-64 is a good choice
for strings. XXH3-128 is slower and should only be used when really needed. Hashing is
slightly faster when the keys are back to back in memory.

```
Table 3 MPHF query throughput (ns/key) of PtrHash with fast parameters ( α = 0. 99 , λ = 3. 0 ,
γ 1 ( x ) = x , and a plain vector for remapping) for n = 10^8 keys.
```
```
Input Loop Stream
FxHash XXH3-64 XXH3-128 FxHash XXH3-64 XXH3-128
u64 11.1 24.4 29.9 7.2 9.1 10.5
Box<u64> 12.7 30.1 31.2 8.7 11.1 12.4
&[u8; 10] 19.4 27.7 32.9 10.1 12.5 14.2
&[u8; 50] 34.1 28.6 32.8 16.5 12.7 14.1
&[u8] 39.2 37.0 50.9 27.2 17.8 23.1
Vec<u8> 40.2 40.6 52.7 28.3 20.2 25.3
```

