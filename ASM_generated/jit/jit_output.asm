; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`2[ulong,PtrHash.CSharp.Port.KeyHashers.FxHasher]:GetIndicesStreamPrefetch(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this (Tier0)
; Emitting BLENDED_CODE for X64 with AVX512 - Unix
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
       movzx    rsi, byte  ptr [rsi+0x65]
       test     esi, esi
       je       SHORT G_M000_IG05
       mov      rsi, bword ptr [rbp-0x18]
       mov      rdx, qword ptr [rbp-0x10]
       mov      rcx, bword ptr [rbp-0x28]
       mov      r8, qword ptr [rbp-0x20]
       mov      r9d, dword ptr [rbp-0x2C]
       movzx    r9, r9b
       mov      rdi, gword ptr [rbp-0x08]
       call     [PtrHash.CSharp.Port.Core.PtrHash`2[ulong,PtrHash.CSharp.Port.KeyHashers.FxHasher]:GetIndicesStreamPrefetchSinglePart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
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
       call     [PtrHash.CSharp.Port.Core.PtrHash`2[ulong,PtrHash.CSharp.Port.KeyHashers.FxHasher]:GetIndicesStreamPrefetchMultiPart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this]
       nop      
 
G_M000_IG06:                ;; offset=0x007B
       add      rsp, 48
       pop      rbp
       ret      
 
; Total bytes of code 129

; Assembly listing for method PtrHash.CSharp.Port.Core.PtrHash`2[ulong,PtrHash.CSharp.Port.KeyHashers.FxHasher]:GetIndicesStreamPrefetchSinglePart(System.ReadOnlySpan`1[ulong],System.Span`1[ulong],bool):this (Tier0-FullOpts)
; Emitting BLENDED_CODE for X64 with AVX512 - Unix
; Tier-0 switched to FullOpts code
; optimized code
; rbp based frame
; fully interruptible
; No PGO data
; 0 inlinees with PGO data; 88 single block inlinees; 18 inlinees without PGO data

G_M000_IG01:                ;; offset=0x0000
       push     rbp
       push     r15
       push     r14
       push     r13
       push     r12
       push     rbx
       sub      rsp, 168
       vzeroupper 
       lea      rbp, [rsp+0xD0]
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
       mov      qword ptr [rbp-0xD0], 0xA806F70
       mov      rbx, rdi
       mov      r15d, edx
 
G_M000_IG02:                ;; offset=0x0061
       cmp      r15d, r8d
       jne      G_M000_IG34
       test     r9b, r9b
       je       SHORT G_M000_IG04
 
G_M000_IG03:                ;; offset=0x006F
       cmp      byte  ptr [rbx+0x64], 0
       je       SHORT G_M000_IG04
       xor      edi, edi
       cmp      gword ptr [rbx+0x10], 0
       setne    dil
       jmp      SHORT G_M000_IG05
       align    [6 bytes for IG13]
 
G_M000_IG04:                ;; offset=0x0088
       xor      edi, edi
 
G_M000_IG05:                ;; offset=0x008A
       movzx    r14, dil
       mov      r13, qword ptr [rbx+0x48]
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rdi, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu32 zmmword ptr [rdi], zmm0
       vmovdqu32 zmmword ptr [rdi+0x40], zmm0
       vmovdqu32 zmmword ptr [rdi+0x80], zmm0
       vmovdqu32 zmmword ptr [rdi+0xC0], zmm0
       mov      r12, rdi
       test     dword ptr [rsp], esp
       sub      rsp, 256
       lea      rdi, [rsp]
       vxorps   ymm0, ymm0, ymm0
       vmovdqu32 zmmword ptr [rdi], zmm0
       vmovdqu32 zmmword ptr [rdi+0x40], zmm0
       vmovdqu32 zmmword ptr [rdi+0x80], zmm0
       vmovdqu32 zmmword ptr [rdi+0xC0], zmm0
       mov      rax, rdi
       mov      rdx, rsi
       mov      bword ptr [rbp-0xB0], rdx
       mov      bword ptr [rbp-0xB8], rcx
       mov      bword ptr [rbp-0x30], r12
       mov      bword ptr [rbp-0x40], rax
       mov      qword ptr [rbp-0x38], rax
       mov      edi, r15d
       mov      esi, 32
       cmp      edi, 32
       cmovl    esi, r15d
       mov      dword ptr [rbp-0x44], esi
       xor      r8d, r8d
       test     esi, esi
       jle      SHORT G_M000_IG08
 
G_M000_IG06:                ;; offset=0x0128
       movsxd   rdi, r8d
       mov      rdi, qword ptr [rdx+8*rdi]
       mov      r11, qword ptr [rbx+0x58]
       rol      r11, 5
       xor      rdi, r11
       mov      r11, 0x517CC1B727220A95
       imul     rdi, r11
       movsxd   r11, r8d
       mov      qword ptr [r12+8*r11], rdi
       mov      dword ptr [rbp-0x50], r8d
       movsxd   rdi, r8d
       mov      r9, qword ptr [r12+8*rdi]
       mov      qword ptr [rbp-0x60], r9
       mov      rdi, gword ptr [rbx+0x08]
       mov      r11, 0x770D1E470100
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:get_IsLinear():bool:this
       test     eax, eax
       je       SHORT G_M000_IG09
 
G_M000_IG07:                ;; offset=0x0173
       mov      rdx, qword ptr [rbx+0x70]
       lea      rdi, [rbp-0x68]
       mov      rax, qword ptr [rbp-0x60]
       mulx     rcx, r11, rax
       mov      qword ptr [rdi], r11
       jmp      SHORT G_M000_IG11
 
G_M000_IG08:                ;; offset=0x0189
       mov      rax, qword ptr [rbp-0x38]
       mov      r11d, dword ptr [rbp-0x44]
       jmp      G_M000_IG12
 
G_M000_IG09:                ;; offset=0x0196
       mov      rdi, gword ptr [rbx+0x08]
       mov      r11, 0x770D1E470108
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:get_BOutput():bool:this
       test     eax, eax
       je       SHORT G_M000_IG10
       mov      rdi, gword ptr [rbx+0x08]
       mov      rsi, qword ptr [rbp-0x60]
       mov      r11, 0x770D1E470118
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:Call(ulong):ulong:this
       mov      rcx, rax
       jmp      SHORT G_M000_IG11
 
G_M000_IG10:                ;; offset=0x01C5
       lea      rax, bword ptr [rbx+0x70]
       mov      bword ptr [rbp-0xC0], rax
       mov      rdi, gword ptr [rbx+0x08]
       mov      rsi, qword ptr [rbp-0x60]
       mov      r11, 0x770D1E470110
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:Call(ulong):ulong:this
       mov      rdx, bword ptr [rbp-0xC0]
       mov      rdx, qword ptr [rdx]
       lea      rdi, [rbp-0x70]
       mulx     rcx, r11, rax
       mov      qword ptr [rdi], r11
 
G_M000_IG11:                ;; offset=0x01FB
       mov      edi, dword ptr [rbp-0x50]
       movsxd   r11, edi
       mov      rax, qword ptr [rbp-0x38]
       mov      qword ptr [rax+8*r11], rcx
       mov      r11, qword ptr [rbx+0x18]
       movsxd   rcx, edi
       add      r11, qword ptr [rax+8*rcx]
       prefetcht0 byte  ptr [r11]
       inc      edi
       mov      r11d, dword ptr [rbp-0x44]
       cmp      edi, r11d
       mov      r8d, edi
       jl       G_M000_IG19
 
G_M000_IG12:                ;; offset=0x022A
       cmp      r11d, 32
       jge      SHORT G_M000_IG15
 
G_M000_IG13:                ;; offset=0x0230
       movsxd   rdi, r11d
       xor      ecx, ecx
       mov      qword ptr [r12+8*rdi], rcx
       movsxd   rdi, r11d
 
G_M000_IG14:                ;; offset=0x023C
       mov      qword ptr [rax+8*rdi], rcx
       inc      r11d
       cmp      r11d, 32
       jl       SHORT G_M000_IG13
 
G_M000_IG15:                ;; offset=0x0249
       xor      ecx, ecx
       lea      edi, [r15-0x20]
       xor      edx, edx
       test     edi, edi
       cmovg    edx, edi
       mov      dword ptr [rbp-0x4C], edx
       test     edx, edx
       jle      G_M000_IG18
 
G_M000_IG16:                ;; offset=0x0261
       mov      edi, ecx
       sar      edi, 31
       and      edi, 31
       add      edi, ecx
       and      edi, -32
       mov      r11d, ecx
       sub      r11d, edi
       movsxd   rsi, r11d
       mov      qword ptr [rbp-0xA8], rsi
       mov      r8, qword ptr [r12+8*rsi]
       mov      qword ptr [rbp-0xA0], r8
       mov      r9, qword ptr [rax+8*rsi]
       mov      qword ptr [rbp-0x58], r9
       mov      dword ptr [rbp-0x48], ecx
       lea      edi, [rcx+0x20]
       movsxd   rdi, edi
       mov      r10, bword ptr [rbp-0xB0]
       mov      rdi, qword ptr [r10+8*rdi]
       mov      r11, qword ptr [rbx+0x58]
       rol      r11, 5
       xor      rdi, r11
       mov      r11, 0x517CC1B727220A95
       imul     rdi, r11
       mov      qword ptr [r12+8*rsi], rdi
       mov      r11, qword ptr [r12+8*rsi]
       mov      qword ptr [rbp-0x78], r11
       mov      rdi, gword ptr [rbx+0x08]
       mov      r11, 0x770D1E470120
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:get_IsLinear():bool:this
       test     eax, eax
       je       SHORT G_M000_IG20
 
G_M000_IG17:                ;; offset=0x02DF
       mov      rdx, qword ptr [rbx+0x70]
       lea      rdi, [rbp-0x80]
       mov      rax, qword ptr [rbp-0x78]
       mulx     rcx, r11, rax
       mov      qword ptr [rdi], r11
       jmp      SHORT G_M000_IG22
 
G_M000_IG18:                ;; offset=0x02F5
       mov      edx, ecx
       jmp      G_M000_IG25
 
G_M000_IG19:                ;; offset=0x02FC
       mov      rdx, bword ptr [rbp-0xB0]
       jmp      G_M000_IG06
 
G_M000_IG20:                ;; offset=0x0308
       mov      rdi, gword ptr [rbx+0x08]
       mov      r11, 0x770D1E470128
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:get_BOutput():bool:this
       test     eax, eax
       je       SHORT G_M000_IG21
       mov      rdi, gword ptr [rbx+0x08]
       mov      rsi, qword ptr [rbp-0x78]
       mov      r11, 0x770D1E470138
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:Call(ulong):ulong:this
       mov      rcx, rax
       jmp      SHORT G_M000_IG22
 
G_M000_IG21:                ;; offset=0x0337
       lea      rax, bword ptr [rbx+0x70]
       mov      bword ptr [rbp-0xC8], rax
       mov      rdi, gword ptr [rbx+0x08]
       mov      rsi, qword ptr [rbp-0x78]
       mov      r11, 0x770D1E470130
       call     [r11]PtrHash.CSharp.Port.BucketFunctions.IBucketFunction:Call(ulong):ulong:this
       mov      rdx, bword ptr [rbp-0xC8]
       mov      rdx, qword ptr [rdx]
       lea      rsi, [rbp-0x88]
       mulx     rcx, rdi, rax
       mov      qword ptr [rsi], rdi
 
G_M000_IG22:                ;; offset=0x0370
       mov      rax, qword ptr [rbp-0x38]
       mov      rdx, qword ptr [rbp-0xA8]
       mov      qword ptr [rax+8*rdx], rcx
       mov      rsi, qword ptr [rbx+0x18]
       mov      rdi, rsi
       add      rdi, qword ptr [rax+8*rdx]
       prefetcht0 byte  ptr [rdi]
       mov      rdx, qword ptr [rbp-0x58]
       movzx    rdx, byte  ptr [rsi+rdx]
       xor      rdx, qword ptr [rbx+0x58]
       mov      rsi, 0x517CC1B727220A95
       imul     rdx, rsi
       lea      rsi, bword ptr [rbx+0x80]
       mov      rdi, qword ptr [rbp-0xA0]
       xor      rdx, rdi
       imul     rdx, qword ptr [rsi+0x08]
       mov      rsi, qword ptr [rsi]
       lea      rdi, [rbp-0x90]
       mulx     rsi, r11, rsi
       mov      qword ptr [rdi], r11
       test     r14d, r14d
       je       SHORT G_M000_IG24
 
G_M000_IG23:                ;; offset=0x03D4
       cmp      rsi, r13
       jb       SHORT G_M000_IG24
       sub      esi, r13d
       mov      rdi, gword ptr [rbx+0x10]
       Test complete
mov      r11, 0x770D1E4700F0
       call     [r11]PtrHash.CSharp.Port.Storage.IRemappingStorage:Index(int):ulong:this
       mov      rsi, rax
 
G_M000_IG24:                ;; offset=0x03F0
       mov      edx, dword ptr [rbp-0x48]
       movsxd   rdi, edx
       mov      rcx, bword ptr [rbp-0xB8]
       mov      qword ptr [rcx+8*rdi], rsi
       inc      edx
       mov      esi, dword ptr [rbp-0x4C]
       cmp      edx, esi
       jl       G_M000_IG33
 
G_M000_IG25:                ;; offset=0x040E
       cmp      edx, r15d
       jge      G_M000_IG29
 
G_M000_IG26:                ;; offset=0x0417
       mov      esi, edx
       sar      esi, 31
       and      esi, 31
       add      esi, edx
       and      esi, -32
       mov      dword ptr [rbp-0x48], edx
       mov      edi, edx
       sub      edi, esi
       movsxd   rsi, edi
       mov      rsi, qword ptr [r12+8*rsi]
       mov      r11, qword ptr [rbx+0x18]
       movsxd   rdi, edi
       mov      rax, qword ptr [rbp-0x38]
       mov      rdi, qword ptr [rax+8*rdi]
       movzx    rdi, byte  ptr [r11+rdi]
       xor      rdi, qword ptr [rbx+0x58]
       mov      r11, 0x517CC1B727220A95
       imul     rdi, r11
       lea      r11, bword ptr [rbx+0x80]
       xor      rsi, rdi
       imul     rsi, qword ptr [r11+0x08]
       mov      rdi, qword ptr [r11]
       lea      r11, [rbp-0x98]
       mov      rdx, rsi
       mulx     rsi, r8, rdi
       mov      qword ptr [r11], r8
       test     r14d, r14d
       je       SHORT G_M000_IG28
 
G_M000_IG27:                ;; offset=0x0481
       cmp      rsi, r13
       jb       SHORT G_M000_IG28
       sub      esi, r13d
       mov      rdi, gword ptr [rbx+0x10]
       mov      r11, 0x770D1E4700F8
       call     [r11]PtrHash.CSharp.Port.Storage.IRemappingStorage:Index(int):ulong:this
       mov      rsi, rax
 
G_M000_IG28:                ;; offset=0x049D
       mov      edi, dword ptr [rbp-0x48]
       movsxd   rdx, edi
       mov      rcx, bword ptr [rbp-0xB8]
       mov      qword ptr [rcx+8*rdx], rsi
       inc      edi
       cmp      edi, r15d
       mov      edx, edi
       jl       G_M000_IG26
 
G_M000_IG29:                ;; offset=0x04BB
       xor      edi, edi
       mov      bword ptr [rbp-0x40], rdi
 
G_M000_IG30:                ;; offset=0x04C1
       mov      bword ptr [rbp-0x30], rdi
       cmp      qword ptr [rbp-0xD0], 0xA806F70
       je       SHORT G_M000_IG31
       call     CORINFO_HELP_FAIL_FAST
 
G_M000_IG31:                ;; offset=0x04D7
       nop      
 
G_M000_IG32:                ;; offset=0x04D8
       lea      rsp, [rbp-0x28]
       pop      rbx
       pop      r12
       pop      r13
       pop      r14
       pop      r15
       pop      rbp
       ret      
 
G_M000_IG33:                ;; offset=0x04E7
       mov      ecx, edx
       mov      rax, qword ptr [rbp-0x38]
       jmp      G_M000_IG16
 
G_M000_IG34:                ;; offset=0x04F2
       mov      rdi, 0x770D1F1C5580
       call     CORINFO_HELP_NEWSFAST
       mov      rbx, rax
       mov      edi, 0x558
       mov      rsi, 0x770D1F20EA38
       call     CORINFO_HELP_STRCNS
       mov      rsi, rax
       mov      rdi, rbx
       call     [System.ArgumentException:.ctor(System.String):this]
       mov      rdi, rbx
       call     CORINFO_HELP_THROW
       int3     
 
; Total bytes of code 1325

