ASM Generation Test for GetIndicesStreamPrefetch
================================================
Created PtrHash with 100000 keys
Query set: 10000 keys

Warming up JIT...
; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this (Tier0)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier0 code
; rbp based frame
; partially interruptible

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       sub      rsp, 48
       lea      rbp, [rsp+0x30]
       mov      gword ptr [rbp-0x08], rdi
       mov      bword ptr [rbp-0x18], rsi
       mov      qword ptr [rbp-0x10], rdx
       mov      bword ptr [rbp-0x28], rcx
       mov      qword ptr [rbp-0x20], r8
       mov      dword ptr [rbp-0x2C], r9d
 
G_M000_IG02:                ;; offset=0x0022
 
G_M000_IG03:                ;; offset=0x0022
       mov      rcx, gword ptr [rbp-0x08]
       movzx    rcx, byte  ptr [rcx+0x55]
       test     ecx, ecx
       je       SHORT G_M000_IG07
       mov      ecx, dword ptr [rbp-0x2C]
       movzx    rcx, cl
       test     ecx, ecx
       je       SHORT G_M000_IG05
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchCore[PtrHash.CSharp.Port.Core.SinglePart,PtrHash.CSharp.Port.Core.UseMinimal](System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this]
       nop      
 
G_M000_IG04:                ;; offset=0x0053
       add      rsp, 48
       pop      rbp
       ret      
 
G_M000_IG05:                ;; offset=0x0059
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchCore[PtrHash.CSharp.Port.Core.SinglePart,PtrHash.CSharp.Port.Core.NoMinimal](System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this]
       nop      
 
G_M000_IG06:                ;; offset=0x0074
       add      rsp, 48
       pop      rbp
       ret      
 
G_M000_IG07:                ;; offset=0x007A
       mov      ecx, dword ptr [rbp-0x2C]
       movzx    rcx, cl
       test     ecx, ecx
       je       SHORT G_M000_IG09
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchCore[PtrHash.CSharp.Port.Core.MultiPart,PtrHash.CSharp.Port.Core.UseMinimal](System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this]
       nop      
 
G_M000_IG08:                ;; offset=0x009F
       add      rsp, 48
       pop      rbp
       ret      
 
G_M000_IG09:                ;; offset=0x00A5
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchCore[PtrHash.CSharp.Port.Core.MultiPart,PtrHash.CSharp.Port.Core.NoMinimal](System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this]
       nop      
 
G_M000_IG10:                ;; offset=0x00C0
       add      rsp, 48
       pop      rbp
       ret      
 
; Total bytes of code 198

; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchCore[PtrHash.CSharp.Port.Core.MultiPart,PtrHash.CSharp.Port.Core.UseMinimal](System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this (Tier0-FullOpts)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier-0 switched to FullOpts code
; optimized code
; rbp based frame
; fully interruptible
; No PGO data
; 0 inlinees with PGO data; 146 single block inlinees; 24 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 184
       vzeroupper 
       lea      rbp, [rsp+0xE0]
       xor      eax, eax
       mov      qword ptr [rbp-0x98], rax
       vxorps   xmm8, xmm8, xmm8
       mov      rax, -96
       vmovdqa  xmmword ptr [rbp+rax-0x30], xmm8
       vmovdqa  xmmword ptr [rbp+rax-0x20], xmm8
       vmovdqa  xmmword ptr [rbp+rax-0x10], xmm8
       add      rax, 48
       jne      SHORT  -5 instr
       mov      qword ptr [rbp-0x30], rax
       mov      qword ptr [rbp-0xE0], 0xE696778
       mov      rbx, rdi
       mov      r15d, edx
 
G_M000_IG02:                ;; offset=0x0061
       cmp      r15d, r8d
       jne      G_M000_IG24
       mov      r14, qword ptr [rbx+0x38]
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rdx, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [rdx], ymm0
       vmovdqu  ymmword ptr [rdx+0x20], ymm0
       vmovdqu  ymmword ptr [rdx+0x40], ymm0
       vmovdqu  ymmword ptr [rdx+0x60], ymm0
       vmovdqu  ymmword ptr [rdx+0x80], ymm0
       vmovdqu  ymmword ptr [rdx+0xA0], ymm0
       vmovdqu  ymmword ptr [rdx+0xC0], ymm0
       vmovdqu  ymmword ptr [rdx+0xE0], ymm0
       mov      r13, rdx
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rdx, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [rdx], ymm0
       vmovdqu  ymmword ptr [rdx+0x20], ymm0
       vmovdqu  ymmword ptr [rdx+0x40], ymm0
       vmovdqu  ymmword ptr [rdx+0x60], ymm0
       vmovdqu  ymmword ptr [rdx+0x80], ymm0
       vmovdqu  ymmword ptr [rdx+0xA0], ymm0
       vmovdqu  ymmword ptr [rdx+0xC0], ymm0
       vmovdqu  ymmword ptr [rdx+0xE0], ymm0
       mov      r12, rdx
       mov      rax, rsi
       mov      bword ptr [rbp-0xD0], rax
       mov      bword ptr [rbp-0xD8], rcx
       mov      bword ptr [rbp-0x30], r13
       mov      bword ptr [rbp-0x38], r12
       mov      edx, r15d
       mov      r8d, 32
       cmp      edx, 32
       cmovl    r8d, r15d
       mov      dword ptr [rbp-0x3C], r8d
       xor      r9d, r9d
       test     r8d, r8d
       jle      G_M000_IG23
 
G_M000_IG03:                ;; offset=0x0137
       mov      dword ptr [rbp-0x48], r9d
       movsxd   r10, r9d
       mov      qword ptr [rbp-0xC8], r10
       mov      rdx, qword ptr [rax+8*r10]
       xor      rdx, qword ptr [rbx+0x48]
       mov      rdi, 0x517CC1B727220A95
       lea      rsi, [rbp-0x60]
       mulx     rdx, r11, rdi
       mov      qword ptr [rsi], r11
       mov      rdi, qword ptr [rbp-0x60]
       xor      rdx, rdi
       mov      rdi, 0x517CC1B727220A95
       imul     rdx, rdi
       mov      qword ptr [r13+8*r10], rdx
       mov      rdi, qword ptr [r13+8*r10]
       mov      rdx, qword ptr [rbx+0x68]
       lea      rsi, [rbp-0x68]
       mulx     rdx, r11, rdi
       mov      qword ptr [rsi], r11
       mov      rsi, qword ptr [rbp-0x68]
       mov      qword ptr [rbp-0xB0], rdx
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:BucketInPart(ulong):ulong:this]
--
; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchCore[PtrHash.CSharp.Port.Core.MultiPart,PtrHash.CSharp.Port.Core.NoMinimal](System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this (Tier0-FullOpts)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier-0 switched to FullOpts code
; optimized code
; rbp based frame
; fully interruptible
; No PGO data
; 0 inlinees with PGO data; 146 single block inlinees; 24 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 184
       vzeroupper 
       lea      rbp, [rsp+0xE0]
       xor      eax, eax
       mov      qword ptr [rbp-0x98], rax
       vxorps   xmm8, xmm8, xmm8
       mov      rax, -96
       vmovdqa  xmmword ptr [rbp+rax-0x30], xmm8
       vmovdqa  xmmword ptr [rbp+rax-0x20], xmm8
       vmovdqa  xmmword ptr [rbp+rax-0x10], xmm8
       add      rax, 48
       jne      SHORT  -5 instr
       mov      qword ptr [rbp-0x30], rax
       mov      qword ptr [rbp-0xD8], 0xE696778
       mov      rbx, rdi
       mov      r15d, edx
 
G_M000_IG02:                ;; offset=0x0061
       cmp      r15d, r8d
       jne      G_M000_IG20
       mov      edx, dword ptr [rbx+0x38]
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rdx, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [rdx], ymm0
       vmovdqu  ymmword ptr [rdx+0x20], ymm0
       vmovdqu  ymmword ptr [rdx+0x40], ymm0
       vmovdqu  ymmword ptr [rdx+0x60], ymm0
       vmovdqu  ymmword ptr [rdx+0x80], ymm0
       vmovdqu  ymmword ptr [rdx+0xA0], ymm0
       vmovdqu  ymmword ptr [rdx+0xC0], ymm0
       vmovdqu  ymmword ptr [rdx+0xE0], ymm0
       mov      r14, rdx
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rdx, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [rdx], ymm0
       vmovdqu  ymmword ptr [rdx+0x20], ymm0
       vmovdqu  ymmword ptr [rdx+0x40], ymm0
       vmovdqu  ymmword ptr [rdx+0x60], ymm0
       vmovdqu  ymmword ptr [rdx+0x80], ymm0
       vmovdqu  ymmword ptr [rdx+0xA0], ymm0
       vmovdqu  ymmword ptr [rdx+0xC0], ymm0
       vmovdqu  ymmword ptr [rdx+0xE0], ymm0
       mov      r13, rdx
       mov      r12, rsi
       mov      bword ptr [rbp-0xD0], rcx
       mov      bword ptr [rbp-0x30], r14
       mov      bword ptr [rbp-0x38], r13
       mov      edx, r15d
       mov      ecx, 32
       cmp      edx, 32
       cmovl    ecx, r15d
       mov      dword ptr [rbp-0x3C], ecx
       xor      r8d, r8d
       test     ecx, ecx
       jle      G_M000_IG19
 
G_M000_IG03:                ;; offset=0x012C
       mov      dword ptr [rbp-0x48], r8d
       movsxd   r9, r8d
       mov      qword ptr [rbp-0xC8], r9
       mov      rdx, qword ptr [r12+8*r9]
       xor      rdx, qword ptr [rbx+0x48]
       mov      rdi, 0x517CC1B727220A95
       lea      rsi, [rbp-0x60]
       mulx     rdx, r10, rdi
       mov      qword ptr [rsi], r10
       mov      rdi, qword ptr [rbp-0x60]
       xor      rdx, rdi
       mov      rdi, 0x517CC1B727220A95
       imul     rdx, rdi
       mov      qword ptr [r14+8*r9], rdx
       mov      rdi, qword ptr [r14+8*r9]
       mov      rdx, qword ptr [rbx+0x68]
       lea      rsi, [rbp-0x68]
       mulx     rdx, r10, rdi
       mov      qword ptr [rsi], r10
       mov      rsi, qword ptr [rbp-0x68]
       mov      qword ptr [rbp-0xB0], rdx
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:BucketInPart(ulong):ulong:this]
       mov      rdx, qword ptr [rbp-0xB0]
--
; Assembly listing for method AsmGeneration.Program:TestGetIndicesStreamPrefetch() (Tier0)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier0 code
; rbp based frame
; partially interruptible

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       sub      rsp, 128
       lea      rbp, [rsp+0x80]
       vxorps   xmm8, xmm8, xmm8
       vmovdqa  xmmword ptr [rbp-0x80], xmm8
       vmovdqa  xmmword ptr [rbp-0x70], xmm8
       mov      rax, -96
       vmovdqa  xmmword ptr [rax+rbp], xmm8
       vmovdqa  xmmword ptr [rbp+rax+0x10], xmm8
       vmovdqa  xmmword ptr [rbp+rax+0x20], xmm8
       add      rax, 48
       jne      SHORT  -5 instr
 
G_M000_IG02:                ;; offset=0x0040
       mov      rdi, 0x7FA7FFC04B80
       call     [System.Console:WriteLine(System.String)]
       mov      rsi, 0x7F6784001CD0
       mov      rsi, gword ptr [rsi]
       mov      esi, dword ptr [rsi+0x08]
       movsxd   rsi, esi
       mov      rdi, 0x7FA791C35050
       call     CORINFO_HELP_NEWARR_1_VC
       mov      gword ptr [rbp-0x08], rax
       mov      rdi, 0x7F6784001CD8
       mov      rdi, gword ptr [rdi]
       mov      gword ptr [rbp-0x48], rdi
       mov      rdi, 0x7F6784001CD0
       mov      rdi, gword ptr [rdi]
       call     [System.ReadOnlySpan`1[ulong]:op_Implicit(ulong[]):System.ReadOnlySpan`1[ulong]]
       mov      bword ptr [rbp-0x40], rax
       mov      qword ptr [rbp-0x38], rdx
       mov      rdi, gword ptr [rbp-0x08]
       call     [System.Span`1[ulong]:op_Implicit(ulong[]):System.Span`1[ulong]]
       mov      bword ptr [rbp-0x58], rax
       mov      qword ptr [Testing GetIndicesStreamPrefetch...
  Processed 10000 keys with prefetching
Testing GetIndicesStream (no prefetch)...
  Processed 10000 keys without prefetching
Testing single lookups for comparison...
  Single lookup sum: 1002763412
Testing specific prefetch patterns...
  Tested prefetch patterns for 64, 512, and 4096 key batches
Testing dictionary methods...
rbp-0x50], rdx
       mov      rcx, bword ptr [rbp-0x58]
       mov      r8, qword ptr [rbp-0x50]
       mov      rsi, bword ptr [rbp-0x40]
       mov      rdx, qword ptr [rbp-0x38]
       mov      rdi, gword ptr [rbp-0x48]
       mov      r9d, 1
       cmp      dword ptr [rdi], edi
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       mov      rdi, 0x7F6784001CD8
       mov      rdi, gword ptr [rdi]
       mov      gword ptr [rbp-0x70], rdi
       mov      rdi, 0x7F6784001CD0
       mov      rdi, gword ptr [rdi]
       call     [System.ReadOnlySpan`1[ulong]:op_Implicit(ulong[]):System.ReadOnlySpan`1[ulong]]
       mov      bword ptr [rbp-0x68], rax
       mov      qword ptr [rbp-0x60], rdx
       mov      rdi, gword ptr [rbp-0x08]
       call     [System.Span`1[ulong]:op_Implicit(ulong[]):System.Span`1[ulong]]
       mov      bword ptr [rbp-0x80], rax
       mov      qword ptr [rbp-0x78], rdx
       mov      rcx, bword ptr [rbp-0x80]
       mov      r8, qword ptr [rbp-0x78]
       mov      rsi, bword ptr [rbp-0x68]
       mov      rdx, qword ptr [rbp-0x60]
       mov      rdi, gword ptr [rbp-0x70]
       xor      r9d, r9d
       cmp      dword ptr [rdi], edi
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       lea      rdi, [rbp-0x30]
       mov      esi, 34
       mov      edx, 1
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:.ctor(int,int):this]
       lea      rdi, [rbp-0x30]
       mov      rsi, 0x7FA7FFC04BE0
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:AppendLiteral(System.String):this]
       mov      rsi, 0x7F6784001CD0
 
G_M000_IG03:                ;; offset=0x0165
       mov      rsi, gword ptr [rsi]
       mov      esi, dword ptr [rsi+0x08]
       lea      rdi, [rbp-0x30]
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:AppendFormatted[int](int):this]
       lea      rdi, [rbp-0x30]
       mov      rsi, 0x7FA7FFC04C10
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:AppendLiteral(System.String):this]
       lea      rdi, [rbp-0x30]
       call     [System.Runtime.CompilerServices.DefaultInterpolatedStringHandler:ToStringAndClear():System.String:this]
       mov      rdi, rax
       call     [System.Console:WriteLine(System.String)]
       nop      
 
G_M000_IG04:                ;; offset=0x019D
       add      rsp, 128
       pop      rbp
       ret      
 
; Total bytes of code 422

; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetchCore[PtrHash.CSharp.Port.Core.SinglePart,PtrHash.CSharp.Port.Core.UseMinimal](System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this (Tier0-FullOpts)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier-0 switched to FullOpts code
; optimized code
; rbp based frame
; fully interruptible
; No PGO data
; 0 inlinees with PGO data; 146 single block inlinees; 24 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 120
       vzeroupper 
       lea      rbp, [rsp+0xA0]
       vxorps   xmm8, xmm8, xmm8
       vmovdqa  xmmword ptr [rbp-0x70], xmm8
       vmovdqa  xmmword ptr [rbp-0x60], xmm8
       vmovdqa  xmmword ptr [rbp-0x50], xmm8
       vmovdqa  xmmword ptr [rbp-0x40], xmm8
       xor      eax, eax
       mov      qword ptr [rbp-0x30], rax
       mov      qword ptr [rbp-0xA0], 0xE696778
       mov      rbx, rdi
       mov      r15d, edx
 
G_M000_IG02:                ;; offset=0x0049
       cmp      r15d, r8d
       jne      G_M000_IG23
       mov      r14, qword ptr [rbx+0x38]
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rdx, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [rdx], ymm0
       vmovdqu  ymmword ptr [rdx+0x20], ymm0
       vmovdqu  ymmword ptr [rdx+0x40], ymm0
       vmovdqu  ymmword ptr [rdx+0x60], ymm0
       vmovdqu  ymmword ptr [rdx+0x80], ymm0
       vmovdqu  ymmword ptr [rdx+0xA0], ymm0
       vmovdqu  ymmword ptr [rdx+0xC0], ymm0
       vmovdqu  ymmword ptr [rdx+0xE0], ymm0
       mov      r13, rdx
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rdx, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu  ymmword ptr [rdx], ymm0
       vmovdqu  ymmword ptr [rdx+0x20], ymm0
       vmovdqu  ymmword ptr [rdx+0x40], ymm0
       vmovdqu  ymmword ptr [rdx+0x60], ymm0
       vmovdqu  ymmword ptr [rdx+0x80], ymm0
       vmovdqu  ymmword ptr [rdx+0xA0], ymm0
       vmovdqu  ymmword ptr [rdx+0xC0], ymm0
       vmovdqu  ymmword ptr [rdx+0xE0], ymm0
       mov      r12, rdx
       mov      rax, rsi
       mov      bword ptr [rbp-0x90], rax
       mov      bword ptr [rbp-0x98], rcx
       mov      bword ptr [rbp-0x30], r13
       mov      bword ptr [rbp-0x38], r12
       mov      edx, r15d
       mov      r8d, 32
       cmp      edx, 32
       cmovl    r8d, r15d
       mov      dword ptr [rbp-0x3C], r8d
       xor      r9d, r9d
       test     r8d, r8d
       jle      G_M000_IG22
 
G_M000_IG03:                ;; offset=0x011F
       mov      dword ptr [rbp-0x48], r9d
       movsxd   r10, r9d
       mov      qword ptr [rbp-0x88], r10
       mov      rdx, qword ptr [rax+8*r10]
       xor      rdx, qword ptr [rbx+0x48]
       mov      rsi, 0x517CC1B727220A95
       lea      rdi, [rbp-0x58]
       mulx     rsi, r11, rsi
       mov      qword ptr [rdi], r11
       mov      rdi, qword ptr [rbp-0x58]
       xor      rsi, rdi
       mov      rdi, 0x517CC1B727220A95
       imul     rsi, rdi
       mov      qword ptr [r13+8*r10], rsi
       mov      rsi, qword ptr [r13+8*r10]
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:BucketInPart(ulong):ulong:this]
       mov      rdx, qword ptr [rbp-0x88]
       mov      qword ptr [r12+8*rdx], rax
       mov      rsi, qword ptr [rbx+0x08]
       add      rsi, qword ptr [r12+8*rdx]
       prefetcht0 byte  ptr [rsi]
       mov      r9d, dword ptr [rbp-0x48]
       inc      r9d
       mov      edx, dword ptr [rbp-0x3C]
       cmp      r9d, edx
