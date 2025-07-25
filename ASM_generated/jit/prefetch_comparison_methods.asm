; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`3[ulong,PtrHash.CSharp.Port.KeyHashers.FxHasher,PtrHash.CSharp.Port.BucketFunctions.Linear]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this (Tier0)
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
       mov      rsi, gword ptr [rbp-0x08]
       movzx    rsi, byte  ptr [rsi+0x5D]
       test     esi, esi
       je       SHORT G_M000_IG05
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      r9d, dword ptr [rbp-0x2C]
       movzx    r9, r9b
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`3[ulong,PtrHash.CSharp.Port.KeyHashers.FxHasher,PtrHash.CSharp.Port.BucketFunctions.Linear]:GetIndicesStreamPrefetchSinglePart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       nop      
 
G_M000_IG04:                ;; offset=0x0052
       add      rsp, 48
       pop      rbp
       ret      
 
G_M000_IG05:                ;; offset=0x0058
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      r9d, dword ptr [rbp-0x2C]
       movzx    r9, r9b
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`3[ulong,PtrHash.CSharp.Port.KeyHashers.FxHasher,PtrHash.CSharp.Port.BucketFunctions.Linear]:GetIndicesStreamPrefetchMultiPart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       nop      
 
G_M000_IG06:                ;; offset=0x007B
       add      rsp, 48
       pop      rbp
       ret      
 
; Total bytes of code 129

; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`3[ulong,PtrHash.CSharp.Port.KeyHashers.FxHasher,PtrHash.CSharp.Port.BucketFunctions.Linear]:GetIndicesStreamPrefetchSinglePart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this (Tier0-FullOpts)
; Emitting BLENDED_CODE for X64 with AVX - Unix
; Tier-0 switched to FullOpts code
; optimized code
; rbp based frame
; fully interruptible
; No PGO data
; 0 inlinees with PGO data; 96 single block inlinees; 18 inlinees without PGO data

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
       xor      eax, eax
       mov      qword ptr [rbp-0x78], rax
       vxorps   xmm8, xmm8, xmm8
       vmovdqa  xmmword ptr [rbp-0x70], xmm8
       vmovdqa  xmmword ptr [rbp-0x60], xmm8
       vmovdqa  xmmword ptr [rbp-0x50], xmm8
       vmovdqa  xmmword ptr [rbp-0x40], xmm8
       mov      qword ptr [rbp-0x30], rax
       mov      qword ptr [rbp-0x98], 0xB2B29A4
       mov      rbx, rdi
       mov      r15d, edx
 
G_M000_IG02:                ;; offset=0x004D
       cmp      r15d, r8d
       jne      G_M000_IG26
       test     r9b, r9b
       je       SHORT G_M000_IG04
 
G_M000_IG03:                ;; offset=0x005B
       cmp      byte  ptr [rbx+0x5C], 0
       je       SHORT G_M000_IG04
       xor      edx, edx
       cmp      gword ptr [rbx+0x08], 0
       setne    dl
       jmp      SHORT G_M000_IG05
       align    [0 bytes for IG06]
 
G_M000_IG04:                ;; offset=0x006D
       xor      edx, edx
 
G_M000_IG05:                ;; offset=0x006F
       movzx    r14, dl
       mov      r13, qword ptr [rbx+0x40]
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
       mov      rax, rdx
       mov      r8, rsi
       mov      bword ptr [rbp-0x88], r8
       mov      bword ptr [rbp-0x90], rcx
       mov      bword ptr [rbp-0x30], r12
       mov      bword ptr [rbp-0x40], rax
       mov      qword ptr [rbp-0x38], rax
       mov      edx, r15d
       mov      esi, 32
       cmp      edx, 32
       cmovl    esi, r15d
       mov      dword ptr [rbp-0x44], esi
       xor      edi, edi
       test     esi, esi
       jle      G_M000_IG25
 
G_M000_IG06:                ;; offset=0x0140
       movsxd   r11, edi
       mov      rdx, qword ptr [r8+8*r11]
       mov      r9, qword ptr [rbx+0x50]
       rol      r9, 5
       xor      rdx, r9
       mov      r9, 0x517CC1B727220A95
       imul     rdx, r9
       mov      qword ptr [r12+8*r11], rdx
       mov      r9, qword ptr [r12+8*r11]
       mov      rdx, qword ptr [rbx+0x68]
       lea      r10, [rbp-0x60]
       mulx     rdx, rsi, r9
       mov      qword ptr [r10], rsi
       mov      qword ptr [rax+8*r11], rdx
       mov      rdx, qword ptr [rbx+0x10]
       add      rdx, qword ptr [rax+8*r11]
       prefetcht0 byte  ptr [rdx]
       inc      edi
       mov      esi, dword ptr [rbp-0x44]
       cmp      edi, esi
       jl       G_M000_IG24
 
G_M000_IG07:                ;; offset=0x0194
       cmp      esi, 32
       jge      SHORT G_M000_IG10
       align    [7 bytes for IG08]
 
G_M000_IG08:                ;; offset=0x01A0
       movsxd   rdx, esi
       xor      edi, edi
       mov      qword ptr [r12+8*rdx], rdi
       movsxd   rdx, esi
 
G_M000_IG09:                ;; offset=0x01AC
       mov      qword ptr [rax+8*rdx], rdi
       inc      esi
       cmp      esi, 32
       jl       SHORT G_M000_IG08
 
G_M000_IG10:                ;; offset=0x01B7
       xor      r9d, r9d
       lea      edx, [r15-0x20]
       xor      r10d, r10d
       test     edx, edx
       cmovg    r10d, edx
       mov      dword ptr [rbp-0x4C], r10d
       test     r10d, r10d
       jle      G_M000_IG23
 
G_M000_IG11:                ;; offset=0x01D4
       mov      edx, r9d
       sar      edx, 31
       and      edx, 31
       add      edx, r9d
       and      edx, -32
       mov      esi, r9d
       sub      esi, edx
       movsxd   rsi, esi
       mov      rdx, qword ptr [r12+8*rsi]
       mov      qword ptr [rbp-0x80], rdx
       mov      rdi, qword ptr [rax+8*rsi]
       mov      qword ptr [rbp-0x58], rdi
       mov      dword ptr [rbp-0x48], r9d
       lea      r11d, [r9+0x20]
       movsxd   r11, r11d
       mov      r11, qword ptr [r8+8*r11]
       mov      r10, qword ptr [rbx+0x50]
       rol      r10, 5
       xor      r11, r10
       mov      r10, 0x517CC1B727220A95
       imul     r11, r10
       mov      qword ptr [r12+8*rsi], r11
       mov      r11, qword ptr [r12+8*rsi]
       mov      r10, qword ptr [rbx+0x68]
       lea      rdi, [rbp-0x68]
       mov      rdx, r10
       mulx     rdx, rcx, r11
       mov      qword ptr [rdi], rcx
       mov      qword ptr [rax+8*rsi], rdx
       mov      rdx, qword ptr [rbx+0x10]
       mov      rdi, rdx
       add      rdi, qword ptr [rax+8*rsi]
       prefetcht0 byte  ptr [rdi]
       mov      rdi, qword ptr [rbp-0x58]
       movzx    rdx, byte  ptr [rdx+rdi]
       xor      rdx, qword ptr [rbx+0x50]
       mov      rsi, 0x517CC1B727220A95
       imul     rdx, rsi
       lea      rsi, bword ptr [rbx+0x78]
       mov      rdi, qword ptr [rbp-0x80]
       xor      rdx, rdi
       imul     rdx, qword ptr [rsi+0x08]
       mov      rsi, qword ptr [rsi]
       lea      rdi, [rbp-0x70]
       mulx     rsi, r11, rsi
       mov      qword ptr [rdi], r11
       test     r14d, r14d
       je       SHORT G_M000_IG13
 
G_M000_IG12:                ;; offset=0x028E
       cmp      rsi, r13
       jb       SHORT G_M000_IG13
       sub      esi, r13d
       mov      rdi, gword ptr [rbx+0x08]
       mov      r11, 0x7E60DCC600E0
       call     [r11]PtrHash.CSharp.Port.Storage.IRemappingStorage:Index(int):ulong:this
       mov      rsi, rax
 
G_M000_IG13:                ;; offset=0x02AA
       mov      r9d, dword ptr [rbp-0x48]
       movsxd   rdx, r9d
       mov      rcx, bword ptr [rbp-0x90]
       mov      qword ptr [rcx+8*rdx], rsi
       inc      r9d
       mov      edx, dword ptr [rbp-0x4C]
       cmp      r9d, edx
       mov      r8, bword ptr [rbp-0x88]
       jl       G_M000_IG22
 
G_M000_IG14:                ;; offset=0x02D2
       cmp      r9d, r15d
       jge      G_M000_IG18
 
G_M000_IG15:                ;; offset=0x02DB
       mov      edx, r9d
       sar      edx, 31
       and      edx, 31
       add      edx, r9d
       and      edx, -32
       mov      dword ptr [rbp-0x48], r9d
       mov      esi, r9d
       sub      esi, edx
       movsxd   rdx, esi
       mov      rdx, qword ptr [r12+8*rdx]
       mov      rdi, qword ptr [rbx+0x10]
       movsxd   rsi, esi
       mov      rax, qword ptr [rbp-0x38]
       mov      rsi, qword ptr [rax+8*rsi]
       movzx    rsi, byte  ptr [rdi+rsi]
       xor      rsi, qword ptr [rbx+0x50]
       mov      rdi, 0x517CC1B727220A95
       imul     rsi, rdi
       lea      rdi, bword ptr [rbx+0x78]
       xor      rdx, rsi
       imul     rdx, qword ptr [rdi+0x08]
       mov      rsi, qword ptr [rdi]
       lea      rdi, [rbp-0x78]
       mulx     rsi, r11, rsi
       mov      qword ptr [rdi], r11
       test     r14d, r14d
       je       SHORT G_M000_IG17
 
G_M000_IG16:                ;; offset=0x0340
       cmp      rsi, r13
       jb       SHORT G_M000_IG17
       sub      esi, r13d
       mov      rdi, gword ptr [rbx+0x08]
       mov      r11, 0x7E60DCC600E8
       call     [r11]PtrHash.CSharp.Port.Storage.IRemappingStorage:Index(int):ulong:this
       mov      rsi, rax
 
G_M000_IG17:                ;; offset=0x035C
       mov      r9d, dword ptr [rbp-0x48]
       movsxd   rdi, r9d
       mov      rcx, bword ptr [rbp-0x90]
       mov      qword ptr [rcx+8*rdi], rsi
       inc      r9d
       cmp      r9d, r15d
       jl       G_M000_IG15
 
G_M000_IG18:                ;; offset=0x037A
       xor      edi, edi
       mov      bword ptr [rbp-0x40], rdi
 
G_M000_IG19:                ;; offset=0x0380
       mov      bword ptr [rbp-0x30], rdi
       cmp      qword ptr [rbp-0x98], 0xB2B29A4
       je       SHORT G_M000_IG20
       call     CORINFO_HELP_FAIL_FAST
 
G_M000_IG20:                ;; offset=0x0396
       nop      
 
G_M000_IG21:                ;; offset=0x0397
       lea      rsp, [rbp-0x28]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret      
 
G_M000_IG22:                ;; offset=0x03A6
       mov      rax, qword ptr [rbp-0x38]
       jmp      G_M000_IG11
 
G_M000_IG23:                ;; offset=0x03AF
       jmp      G_M000_IG14
 
G_M000_IG24:                ;; offset=0x03B4
       jmp      G_M000_IG06
 
G_M000_IG25:                ;; offset=0x03B9
       mov      esi, dword ptr [rbp-0x44]
       jmp      G_M000_IG07
 
G_M000_IG26:                ;; offset=0x03C1
       mov      rdi, 0x7E60DD9B5580
       call     CORINFO_HELP_NEWSFAST
       mov      rbx, rax
       mov      edi, 0x558
       mov      rsi, 0x7E60DD9FEA38
       caTest complete
ll     CORINFO_HELP_STRCNS
       mov      rsi, rax
       mov      rdi, rbx
       call     [System.ArgumentException:.ctor(System.String):this]
       mov      rdi, rbx
       call     CORINFO_HELP_THROW
       int3     
 
; Total bytes of code 1020

