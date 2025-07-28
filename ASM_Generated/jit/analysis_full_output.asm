ASM Generation Test for GetIndicesStreamPrefetch
================================================
Created PtrHash with 100000 keys
Query set: 10000 keys

Warming up JIT...
JIT warmup complete.
Running streaming tests to generate assembly...
Testing GetIndicesStreamPrefetch...
  Processed 10000 keys with prefetching
Testing GetIndicesStream (no prefetch)...
  Processed 10000 keys without prefetching
Testing single lookups for comparison...
  Single lookup sum: 1002685513
Testing specific prefetch patterns...
  Tested prefetch patterns for 64, 512, and 4096 key batches
Testing dictionary methods...
; Assembly listing for method PtrHash.CSharp.Port.Collections.PtrHashDictionary`5[ulong,ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:TryGetValueStream(System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this (Tier0)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier0 code
; rbp based frame
; fully interruptible

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       sub      rsp, 256
       vzeroupper 
       lea      rbp, [rsp+0x100]
       xor      eax, eax
       mov      qword ptr [rbp-0xD8], rax
       vxorps   xmm8, xmm8, xmm8
       vmovdqa  xmmword ptr [rbp-0xD0], xmm8
       mov      rax, -144
       vmovdqa  xmmword ptr [rbp+rax-0x30], xmm8
       vmovdqa  xmmword ptr [rbp+rax-0x20], xmm8
       vmovdqa  xmmword ptr [rbp+rax-0x10], xmm8
       add      rax, 48
       jne      SHORT  -5 instr
       mov      qword ptr [rbp-0x30], rax
       mov      qword ptr [rbp-0xF0], rsp
       mov      qword ptr [rbp-0xE0], 0xC1CDCF2
       mov      gword ptr [rbp-0x08], rdi
       mov      bword ptr [rbp-0x18], rsi
       mov      qword ptr [rbp-0x10], rdx
       mov      bword ptr [rbp-0x28], rcx
       mov      qword ptr [rbp-0x20], r8
 
G_M000_IG02:                ;; offset=0x0075
       mov      eax, dword ptr [rbp-0x10]
       cmp      eax, dword ptr [rbp-0x20]
       je       SHORT G_M000_IG04
 
G_M000_IG03:                ;; offset=0x007D
       mov      rdi, 0x78EF543C5580
       call     CORINFO_HELP_NEWSFAST
       mov      gword ptr [rbp-0xC0], rax
       mov      edi, 0xE26
       mov      rsi, 0x78EF543F15A0
       call     CORINFO_HELP_STRCNS
       mov      gword ptr [rbp-0xC8], rax
       mov      rsi, gword ptr [rbp-0xC8]
       mov      rdi, gword ptr [rbp-0xC0]
       call     [System.ArgumentException:.ctor(System.String):this]
       mov      rdi, gword ptr [rbp-0xC0]
       call     CORINFO_HELP_THROW
 
G_M000_IG04:                ;; offset=0x00CE
       cmp      dword ptr [rbp-0x10], 0x1000
       jg       G_M000_IG13
       mov      eax, dword ptr [rbp-0x10]
       mov      dword ptr [rbp-0x3C], eax
       mov      eax, dword ptr [rbp-0x3C]
       mov      eax, eax
       mov      edx, 8
       mov      esi, edx
       mul      rdx:rax, rsi
       jb       G_M000_IG24
       mov      rsi, rax
       test     rsi, rsi
       je       SHORT G_M000_IG06
       add      rsi, 15
       shr      rsi, 4
       add      rsp, 16
 
G_M000_IG05:                ;; offset=0x010A
       push     0
       push     0
       dec      rsi
       jne      SHORT G_M000_IG05
       sub      rsp, 16
       lea      rsi, [rsp+0x10]
 
G_M000_IG06:                ;; offset=0x011C
       lea      rdi, [rbp-0x98]
       mov      edx, dword ptr [rbp-0x3C]
       call     [System.Span`1[ulong]:.ctor(ulong,int):this]
 
G_M000_IG07:                ;; offset=0x012C
       vmovdqu  xmm0, xmmword ptr [rbp-0x98]
       vmovdqu  xmmword ptr [rbp-0x38], xmm0
 
G_M000_IG08:                ;; offset=0x0139
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rcx, bword ptr [rbp-0x38]
       mov      r8, qword ptr [rbp-0x30]
       mov      rdi, gword ptr [rbp-0x08]
       mov      rdi, gword ptr [rdi+0x08]
       mov      r9d, 1
       cmp      dword ptr [rdi], edi
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
 
G_M000_IG09:                ;; offset=0x015F
       vmovdqu  xmm0, xmmword ptr [rbp-0x18]
       vmovdqu  xmmword ptr [rbp-0xB8], xmm0
 
G_M000_IG10:                ;; offset=0x016C
       mov      rdi, bword ptr [rbp-0x38]
       mov      rsi, qword ptr [rbp-0x30]
       call     [System.Span`1[ulong]:op_Implicit(System.Span`1[ulong]):System.ReadOnlySpan`1[ulong]]
       mov      bword ptr [rbp-0xA8], rax
       mov      qword ptr [rbp-0xA0], rdx
       lea      rdi, [rsp]
       lea      rsi, [rbp-0x28]
       mov      rcx, bword ptr [rsi]
       mov      bword ptr [rsp], rcx
       add      rsi, 8
       add      rdi, 8
       movsq    
       mov      rsi, bword ptr [rbp-0xB8]
       mov      rdx, qword ptr [rbp-0xB0]
       mov      rcx, bword ptr [rbp-0xA8]
       mov      r8, qword ptr [rbp-0xA0]
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Collections.PtrHashDictionary`5[ulong,ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:ProcessIndices(System.ReadOnlySpan`1[ulong],System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this]
       cmp      qword ptr [rbp-0xE0], 0xC1CDCF2
       je       SHORT G_M000_IG11
       call     CORINFO_HELP_FAIL_FAST
 
G_M000_IG11:                ;; offset=0x01D9
       nop      
 
G_M000_IG12:                ;; offset=0x01DA
       lea      rsp, [rbp]
       pop      rbp
       ret      
 
G_M000_IG13:                ;; offset=0x01E0
       call     [System.Buffers.ArrayPool`1[ulong]:get_Shared():System.Buffers.ArrayPool`1[ulong]]
       mov      gword ptr [rbp-0xD0], rax
       mov      rdi, gword ptr [rbp-0xD0]
       mov      esi, dword ptr [rbp-0x10]
       mov      rax, gword ptr [rbp-0xD0]
       mov      rax, qword ptr [rax]
       mov      rax, qword ptr [rax+0x40]
       call     [rax+0x20]System.Buffers.ArrayPool`1[ulong]:Rent(int):ulong[]:this
       mov      gword ptr [rbp-0x48], rax
 
G_M000_IG14:                ;; offset=0x020C
       mov      rdi, gword ptr [rbp-0x48]
       mov      edx, dword ptr [rbp-0x10]
       xor      esi, esi
       call     [System.MemoryExtensions:AsSpan[ulong](ulong[],int,int):System.Span`1[ulong]]
       mov      bword ptr [rbp-0x68], rax
       mov      qword ptr [rbp-0x60], rdx
 
G_M000_IG15:                ;; offset=0x0223
       vmovdqu  xmm0, xmmword ptr [rbp-0x68]
       vmovdqu  xmmword ptr [rbp-0x58], xmm0
 
G_M000_IG16:                ;; offset=0x022D
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rcx, bword ptr [rbp-0x58]
       mov      r8, qword ptr [rbp-0x50]
       mov      rdi, gword ptr [rbp-0x08]
       mov      rdi, gword ptr [rdi+0x08]
       mov      r9d, 1
       cmp      dword ptr [rdi], edi
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
 
G_M000_IG17:                ;; offset=0x0253
       vmovdqu  xmm0, xmmword ptr [rbp-0x18]
       vmovdqu  xmmword ptr [rbp-0x88], xmm0
 
G_M000_IG18:                ;; offset=0x0260
       mov      rdi, bword ptr [rbp-0x58]
       mov      rsi, qword ptr [rbp-0x50]
       call     [System.Span`1[ulong]:op_Implicit(System.Span`1[ulong]):System.ReadOnlySpan`1[ulong]]
       mov      bword ptr [rbp-0x78], rax
       mov      qword ptr [rbp-0x70], rdx
       lea      rdi, [rsp]
       lea      rsi, [rbp-0x28]
       mov      rcx, bword ptr [rsi]
       mov      bword ptr [rsp], rcx
       add      rsi, 8
       add      rdi, 8
       movsq    
       mov      rsi, bword ptr [rbp-0x88]
       mov      rdx, qword ptr [rbp-0x80]
       mov      rcx, bword ptr [rbp-0x78]
       mov      r8, qword ptr [rbp-0x70]
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Collections.PtrHashDictionary`5[ulong,ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:ProcessIndices(System.ReadOnlySpan`1[ulong],System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this]
       jmp      SHORT G_M000_IG19
 
G_M000_IG19:                ;; offset=0x02AE
       mov      rdi, qword ptr [rbp-0xF0]
       call     G_M000_IG25
 
G_M000_IG20:                ;; offset=0x02BA
       nop      
 
G_M000_IG21:                ;; offset=0x02BB
       cmp      qword ptr [rbp-0xE0], 0xC1CDCF2
       je       SHORT G_M000_IG22
       call     CORINFO_HELP_FAIL_FAST
 
G_M000_IG22:                ;; offset=0x02CD
       nop      
 
G_M000_IG23:                ;; offset=0x02CE
       lea      rsp, [rbp]
       pop      rbp
       ret      
 
G_M000_IG24:                ;; offset=0x02D4
       call     CORINFO_HELP_OVERFLOW
       int3     
 
G_M000_IG25:                ;; offset=0x02DA
       push     rbp
       sub      rsp, 32
       vzeroupper 
       mov      rbp, qword ptr [rdi+0x10]
       mov      qword ptr [rsp+0x10], rbp
       lea      rbp, [rbp+0x100]
 
G_M000_IG26:                ;; offset=0x02F2
       call     [System.Buffers.ArrayPool`1[ulong]:get_Shared():System.Buffers.ArrayPool`1[ulong]]
       mov      gword ptr [rbp-0xD8], rax
       mov      rdi, gword ptr [rbp-0xD8]
       mov      rsi, gword ptr [rbp-0x48]
       xor      edx, edx
       mov      rax, gword ptr [rbp-0xD8]
       mov      rax, qword ptr [rax]
       mov      rax, qword ptr [rax+0x40]
       call     [rax+0x28]System.Buffers.ArrayPool`1[ulong]:Return(ulong[],bool):this
       nop      
 
G_M000_IG27:                ;; offset=0x031E
       add      rsp, 32
       pop      rbp
       ret      
 
; Total bytes of code 804

; Assembly listing for method PtrHash.CSharp.Port.Collections.PtrHashDictionary`5[ulong,ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:TryGetValueStreamOptimal(System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this (Tier0-FullOpts)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier-0 switched to FullOpts code
; optimized code
; rbp based frame
; fully interruptible
; No PGO data
; 1 inlinees with PGO data; 237 single block inlinees; 45 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 264
       vzeroupper 
       lea      rbp, [rsp+0x130]
       vxorps   xmm8, xmm8, xmm8
       vmovdqa  xmmword ptr [rbp-0x90], xmm8
       vmovdqa  xmmword ptr [rbp-0x80], xmm8
       vmovdqa  xmmword ptr [rbp-0x70], xmm8
       vmovdqa  xmmword ptr [rbp-0x60], xmm8
       vmovdqa  xmmword ptr [rbp-0x50], xmm8
       xor      eax, eax
       mov      qword ptr [rbp-0x40], rax
       mov      qword ptr [rbp-0x120], rsp
       mov      qword ptr [rbp-0x108], 0xC1CDCF2
       mov      bword ptr [rbp-0xF0], rcx
       mov      rbx, rdi
       mov      r14, rsi
       mov      r15d, edx
       mov      r13d, r8d
 
G_M000_IG02:                ;; offset=0x0068
       cmp      r15d, r13d
       jne      G_M000_IG44
       cmp      r15d, 0x1000
       jg       G_M000_IG25
 
G_M000_IG03:                ;; offset=0x007E
       mov      eax, r15d
       mov      edi, 8
       mul      rdx:rax, rdi
       jb       G_M000_IG43
       test     rax, rax
       je       SHORT G_M000_IG05
       add      rax, 15
       shr      rax, 4
       add      rsp, 16
 
G_M000_IG04:                ;; offset=0x00A0
       push     0
       push     0
       dec      rax
       jne      SHORT G_M000_IG04
       sub      rsp, 16
       lea      rax, [rsp+0x10]
 
G_M000_IG05:                ;; offset=0x00B2
       mov      edi, r15d
       xor      esi, esi
       test     edi, edi
       jle      G_M000_IG13
       align    [0 bytes for IG06]
 
G_M000_IG06:                ;; offset=0x00BF
       mov      edx, esi
       lea      r11, bword ptr [rax+8*rdx]
       mov      rcx, gword ptr [rbx+0x08]
       mov      edx, esi
       mov      rdx, qword ptr [r14+8*rdx]
       cmp      byte  ptr [rcx+0x55], 0
       jne      G_M000_IG10
 
G_M000_IG07:                ;; offset=0x00D9
       xor      rdx, qword ptr [rcx+0x48]
       mov      r8, 0x517CC1B727220A95
       lea      r9, [rbp-0x40]
       mulx     rdx, r10, r8
       mov      qword ptr [r9], r10
       mov      r8, qword ptr [rbp-0x40]
       xor      rdx, r8
       mov      r8, 0x517CC1B727220A95
       imul     rdx, r8
       mov      qword ptr [rbp-0xB0], rdx
       lea      r8, bword ptr [rcx+0x78]
       mov      r8, qword ptr [r8]
       lea      r9, [rbp-0x48]
       mov      r10, qword ptr [rbp-0xB0]
       mov      rdx, r8
       mulx     rdx, r12, r10
       mov      qword ptr [r9], r12
       mov      r8, qword ptr [rcx+0x08]
       movzx    rdx, byte  ptr [r8+rdx]
       mov      qword ptr [rbp-0x38], rdx
       lea      r8, bword ptr [rcx+0x68]
       mov      r8, qword ptr [r8]
       lea      r9, [rbp-0x50]
       mov      rdx, r8
       mulx     r8, r12, r10
       mov      qword ptr [r9], r12
       imul     r8, qword ptr [rcx+0x18]
       mov      rdx, qword ptr [rbp-0x38]
       xor      rdx, qword ptr [rcx+0x48]
       mov      r9, 0x517CC1B727220A95
       imul     rdx, r9
       lea      r9, bword ptr [rcx+0x80]
       xor      rdx, r10
       imul     rdx, qword ptr [r9+0x08]
       mov      r9, qword ptr [r9]
       lea      r10, [rbp-0x58]
       mulx     rdx, r12, r9
       mov      qword ptr [r10], r12
       add      rdx, r8
       cmp      rdx, qword ptr [rcx+0x38]
       jb       SHORT G_M000_IG08
       mov      r8, qword ptr [rcx+0x58]
       sub      edx, dword ptr [rcx+0x38]
       movsxd   rcx, edx
       mov      ecx, dword ptr [r8+4*rcx]
       jmp      SHORT G_M000_IG09
 
G_M000_IG08:                ;; offset=0x01A1
       mov      rcx, rdx
 
G_M000_IG09:                ;; offset=0x01A4
       jmp      G_M000_IG12
 
G_M000_IG10:                ;; offset=0x01A9
       xor      rdx, qword ptr [rcx+0x48]
       mov      r8, 0x517CC1B727220A95
       lea      r9, [rbp-0x60]
       mulx     rdx, r10, r8
       mov      qword ptr [r9], r10
       mov      r8, qword ptr [rbp-0x60]
       xor      rdx, r8
       mov      r8, 0x517CC1B727220A95
       imul     rdx, r8
       mov      qword ptr [rbp-0xB8], rdx
       mov      r8, qword ptr [rcx+0x70]
       lea      r9, [rbp-0x68]
       mov      r10, qword ptr [rbp-0xB8]
       mov      rdx, r8
       mulx     rdx, r12, r10
       mov      qword ptr [r9], r12
       mov      r8, qword ptr [rcx+0x08]
       movzx    rdx, byte  ptr [r8+rdx]
       xor      rdx, qword ptr [rcx+0x48]
       mov      r8, 0x517CC1B727220A95
       imul     rdx, r8
       lea      r8, bword ptr [rcx+0x80]
       xor      rdx, r10
       imul     rdx, qword ptr [r8+0x08]
       mov      r8, qword ptr [r8]
       lea      r9, [rbp-0x70]
       mulx     rdx, r10, r8
       mov      qword ptr [r9], r10
       cmp      rdx, qword ptr [rcx+0x38]
       jb       SHORT G_M000_IG11
       mov      r8, qword ptr [rcx+0x58]
       sub      edx, dword ptr [rcx+0x38]
       movsxd   rdx, edx
       mov      ecx, dword ptr [r8+4*rdx]
       jmp      SHORT G_M000_IG12
 
G_M000_IG11:                ;; offset=0x0248
       mov      rcx, rdx
 
G_M000_IG12:                ;; offset=0x024B
       mov      qword ptr [r11], rcx
       inc      esi
       cmp      esi, edi
       jl       G_M000_IG06
 
G_M000_IG13:                ;; offset=0x0258
       mov      r12, rax
       mov      rax, bword ptr [rbp-0xF0]
       mov      bword ptr [rbp-0x100], rax
       xor      ecx, ecx
       test     r15d, r15d
       jle      G_M000_IG20
 
G_M000_IG14:                ;; offset=0x0274
       mov      edi, ecx
       mov      edi, dword ptr [r12+8*rdi]
       mov      rdx, gword ptr [rbx+0x10]
       cmp      dword ptr [rdx+0x08], edi
       jbe      G_M000_IG24
 
G_M000_IG15:                ;; offset=0x0287
       cmp      edi, dword ptr [rdx+0x08]
       jae      G_M000_IG45
       mov      edi, edi
       shl      rdi, 4
       lea      r8, bword ptr [rdx+rdi+0x10]
       mov      bword ptr [rbp-0xE0], r8
       mov      rdi, gword ptr [rbx+0x18]
       mov      dword ptr [rbp-0x74], ecx
       mov      edx, ecx
       mov      rsi, qword ptr [r14+8*rdx]
       mov      rdx, qword ptr [r8]
       mov      r11, 0x78EF54ABD118
       cmp      qword ptr [rdi], r11
       jne      SHORT G_M000_IG17
       cmp      rsi, rdx
       jne      SHORT G_M000_IG16
       jmp      SHORT G_M000_IG18
 
G_M000_IG16:                ;; offset=0x02C8
       mov      ecx, dword ptr [rbp-0x74]
       jmp      SHORT G_M000_IG24
 
G_M000_IG17:                ;; offset=0x02CD
       mov      r11, 0x78EF536700D8
       call     [r11]System.Collections.Generic.IEqualityComparer`1[ulong]:Equals(ulong,ulong):bool:this
       test     eax, eax
       je       SHORT G_M000_IG23
 
G_M000_IG18:                ;; offset=0x02DE
       mov      ecx, dword ptr [rbp-0x74]
       cmp      ecx, r13d
       jae      G_M000_IG45
       mov      edi, ecx
       mov      r8, bword ptr [rbp-0xE0]
       mov      rsi, qword ptr [r8+0x08]
       mov      rax, bword ptr [rbp-0x100]
       mov      qword ptr [rax+8*rdi], rsi
 
G_M000_IG19:                ;; offset=0x0302
       inc      ecx
       cmp      ecx, r15d
       jl       G_M000_IG14
 
G_M000_IG20:                ;; offset=0x030D
       cmp      qword ptr [rbp-0x108], 0xC1CDCF2
       je       SHORT G_M000_IG21
       call     CORINFO_HELP_FAIL_FAST
 
G_M000_IG21:                ;; offset=0x031F
       nop      
 
G_M000_IG22:                ;; offset=0x0320
       lea      rsp, [rbp-0x28]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret      
 
G_M000_IG23:                ;; offset=0x032F
       mov      ecx, dword ptr [rbp-0x74]
 
G_M000_IG24:                ;; offset=0x0332
       cmp      ecx, r13d
       jae      G_M000_IG45
       mov      edi, ecx
       mov      rsi, qword ptr [rbx+0x20]
       mov      rax, bword ptr [rbp-0x100]
       mov      qword ptr [rax+8*rdi], rsi
       jmp      SHORT G_M000_IG19
 
G_M000_IG25:                ;; offset=0x034E
       mov      rdi, 0x78AF44001F28
       mov      rdi, gword ptr [rdi]
       mov      esi, r15d
       call     [System.Buffers.SharedArrayPool`1[ulong]:Rent(int):ulong[]:this]
       mov      gword ptr [rbp-0xD0], rax
 
G_M000_IG26:                ;; offset=0x036B
       test     rax, rax
       jne      SHORT G_M000_IG27
       test     r15d, r15d
       jne      G_M000_IG37
       xor      rcx, rcx
       xor      r8d, r8d
       jmp      SHORT G_M000_IG28
 
G_M000_IG27:                ;; offset=0x0380
       cmp      dword ptr [rax+0x08], r15d
       jb       G_M000_IG37
       lea      rcx, bword ptr [rax+0x10]
       mov      r8d, r15d
       mov      rax, gword ptr [rbp-0xD0]
 
G_M000_IG28:                ;; offset=0x0398
       mov      bword ptr [rbp-0xF8], rcx
       mov      dword ptr [rbp-0xA4], r8d
       xor      r9d, r9d
       test     r15d, r15d
       jle      G_M000_IG35
 
G_M000_IG29:                ;; offset=0x03B2
       cmp      r9d, r8d
       jae      G_M000_IG36
       mov      edx, r9d
       lea      r10, bword ptr [rcx+8*rdx]
       mov      bword ptr [rbp-0xD8], r10
       mov      r11, gword ptr [rbx+0x08]
       mov      gword ptr [rbp-0xE8], r11
       mov      dword ptr [rbp-0x2C], r9d
       mov      edx, r9d
       mov      rsi, qword ptr [r14+8*rdx]
       cmp      byte  ptr [r11+0x55], 0
       jne      G_M000_IG39
 
G_M000_IG30:                ;; offset=0x03EA
       mov      rdx, rsi
       xor      rdx, qword ptr [r11+0x48]
       mov      rdi, 0x517CC1B727220A95
       lea      rsi, [rbp-0x88]
       mulx     rdi, r12, rdi
       mov      qword ptr [rsi], r12
       mov      r12, qword ptr [rbp-0x88]
       xor      r12, rdi
       mov      rsi, 0x517CC1B727220A95
       imul     r12, rsi
       lea      rdx, bword ptr [r11+0x78]
       mov      rdx, qword ptr [rdx]
       lea      rdi, [rbp-0x90]
       mulx     rdx, rsi, r12
       mov      qword ptr [rdi], rsi
       mov      rdi, qword ptr [r11+0x08]
       movzx    rsi, byte  ptr [rdi+rdx]
       mov      qword ptr [rbp-0x80], rsi
       lea      rdi, bword ptr [r11+0x68]
       mov      rdx, qword ptr [rdi]
       vxorps   xmm0, xmm0, xmm0
       vmovups  xmmword ptr [rbp-0xA0], xmm0
       lea      rdi, [rbp-0xA0]
       xor      esi, esi
       call     [System.UInt128:.ctor(ulong,ulong):this]
       mov      rax, qword ptr [rbp-0xA0]
       mov      qword ptr [rbp-0xC0], rax
       mov      rcx, qword ptr [rbp-0x98]
       mov      qword ptr [rbp-0xC8], rcx
       mov      rdi, r12
       call     [System.UInt128:op_Implicit(ulong):System.UInt128]
       mov      rcx, rdx
       mov      rdi, qword ptr [rbp-0xC0]
       mov      rsi, qword ptr [rbp-0xC8]
       mov      rdx, rax
       call     [System.UInt128:op_Multiply(System.UInt128,System.UInt128):System.UInt128]
       mov      rdi, rax
       mov      rsi, rdx
       mov      edx, 64
       call     [System.UInt128:op_RightShift(System.UInt128,int):System.UInt128]
       mov      rdi, rax
       mov      rsi, rdx
       call     [System.UInt128:op_Explicit(System.UInt128):ulong]
       mov      rcx, gword ptr [rbp-0xE8]
       imul     rax, qword ptr [rcx+0x18]
       mov      qword ptr [rbp-0x110], rax
       mov      rdi, rcx
       mov      rsi, r12
       mov      rdx, qword ptr [rbp-0x80]
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:SlotInPart(PtrHash.CSharp.Port.KeyHashers.HashValue,ulong):ulong:this]
       add      rax, qword ptr [rbp-0x110]
       mov      rdx, rax
       mov      r12, gword ptr [rbp-0xE8]
 
G_M000_IG31:                ;; offset=0x04F7
       cmp      rdx, qword ptr [r12+0x38]
       jb       G_M000_IG38
       mov      rdi, qword ptr [r12+0x58]
       mov      rsi, qword ptr [r12+0x60]
       sub      edx, dword ptr [r12+0x38]
       call     [PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage:Index(PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage,int):ulong]
 
G_M000_IG32:                ;; offset=0x0517
       mov      rdi, bword ptr [rbp-0xD8]
       mov      qword ptr [rdi], rax
       mov      r9d, dword ptr [rbp-0x2C]
       inc      r9d
       cmp      r9d, r15d
       jl       SHORT G_M000_IG34
 
G_M000_IG33:                ;; offset=0x052D
       mov      rdi, bword ptr [rbp-0xF8]
       mov      esi, dword ptr [rbp-0xA4]
       call     [System.Span`1[ulong]:op_Implicit(System.Span`1[ulong]):System.ReadOnlySpan`1[ulong]]
       mov      rcx, rax
       mov      r8d, edx
       mov      r12, bword ptr [rbp-0xF0]
       mov      bword ptr [rsp], r12
       mov      dword ptr [rsp+0x08], r13d
       mov      rsi, r14
       mov      edx, r15d
       mov      rdi, rbx
       call     [PtrHash.CSharp.Port.Collections.PtrHashDictionary`5[ulong,ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:ProcessIndices(System.ReadOnlySpan`1[ulong],System.ReadOnlySpan`1[ulong],System.Span`1[ulong]):this]
       jmp      SHORT G_M000_IG40
 
G_M000_IG34:                ;; offset=0x0567
       mov      rax, gword ptr [rbp-0xD0]
       mov      rcx, bword ptr [rbp-0xF8]
       mov      r8d, dword ptr [rbp-0xA4]
       jmp      G_M000_IG29
 
G_M000_IG35:                ;; offset=0x0581
       jmp      SHORT G_M000_IG33
 
G_M000_IG36:                ;; offset=0x0583
       call     CORINFO_HELP_RNGCHKFAIL
 
G_M000_IG37:                ;; offset=0x0588
       call     [System.ThrowHelper:ThrowArgumentOutOfRangeException()]
       int3     
 
G_M000_IG38:                ;; offset=0x058F
       mov      rax, rdx
       jmp      SHORT G_M000_IG32
 
G_M000_IG39:                ;; offset=0x0594
       mov      rdi, r11
       call     [PtrHash.CSharp.Port.Core.PtrHash`4[ulong,PtrHash.CSharp.Port.KeyHashers.StrongerIntHasher,PtrHash.CSharp.Port.BucketFunctions.Linear,PtrHash.CSharp.Port.Storage.UInt32VectorRemappingStorage]:GetIndexSinglePart(ulong):ulong:this]
       jmp      G_M000_IG32
 
G_M000_IG40:                ;; offset=0x05A2
       call     [System.Buffers.ArrayPool`1[ulong]:get_Shared():System.Buffers.ArrayPool`1[ulong]]
       mov      rdi, rax
       mov      rsi, gword ptr [rbp-0xD0]
       xor      edx, edx
       mov      rax, qw  Tested both dictionary streaming methods with 10000 keys
Assembly generation complete.
Check output for JIT-generated assembly or run with AOT for AOT assembly.
ord ptr [rax]
       mov      rax, qword ptr [rax+0x40]
       call     [rax+0x28]System.Buffers.ArrayPool`1[ulong]:Return(ulong[],bool):this
       cmp      qword ptr [rbp-0x108], 0xC1CDCF2
       je       SHORT G_M000_IG41
       call     CORINFO_HELP_FAIL_FAST
 
G_M000_IG41:                ;; offset=0x05D0
       nop      
 
G_M000_IG42:                ;; offset=0x05D1
       lea      rsp, [rbp-0x28]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret      
 
G_M000_IG43:                ;; offset=0x05E0
       call     CORINFO_HELP_OVERFLOW
 
G_M000_IG44:                ;; offset=0x05E5
       mov      rdi, 0x78EF543C5580
       call     CORINFO_HELP_NEWSFAST
       mov      rbx, rax
       mov      edi, 0xE26
       mov      rsi, 0x78EF543F15A0
       call     CORINFO_HELP_STRCNS
       mov      rsi, rax
       mov      rdi, rbx
       call     [System.ArgumentException:.ctor(System.String):this]
       mov      rdi, rbx
       call     CORINFO_HELP_THROW
 
G_M000_IG45:                ;; offset=0x061F
       call     CORINFO_HELP_RNGCHKFAIL
       int3     
 
G_M000_IG46:                ;; offset=0x0625
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 24
       vzeroupper 
       mov      rbp, qword ptr [rdi+0x10]
       mov      qword ptr [rsp+0x10], rbp
       lea      rbp, [rbp+0x130]
 
G_M000_IG47:                ;; offset=0x0646
       call     [System.Buffers.ArrayPool`1[ulong]:get_Shared():System.Buffers.ArrayPool`1[ulong]]
       mov      rdi, rax
       mov      rsi, gword ptr [rbp-0xD0]
       xor      edx, edx
       mov      rax, qword ptr [rax]
       mov      rax, qword ptr [rax+0x40]
       call     [rax+0x28]System.Buffers.ArrayPool`1[ulong]:Return(ulong[],bool):this
       nop      
 
G_M000_IG48:                ;; offset=0x0663
       add      rsp, 24
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret      
 
; Total bytes of code 1650

