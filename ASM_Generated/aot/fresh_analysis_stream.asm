   77389:	e8 f2 08 00 00       	call   77c80 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>
   7738e:	e8 8d 0e 00 00       	call   78220 <ASM_Analysis_AsmGeneration_Program__TestSingleLookups>
   77393:	e8 e8 11 00 00       	call   78580 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern>
   77398:	48 8d 3d d1 2a 1c 00 	lea    0x1c2ad1(%rip),%rdi        # 239e70 <__Str_Assembly_generation_complete__E694E220ABB5E659C8FE3A93D59496D8C08AFB825EDBB706847AAF14012E93FD>
   7739f:	e8 4c 53 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   773a4:	48 8d 3d e5 33 1c 00 	lea    0x1c33e5(%rip),%rdi        # 23a790 <__Str_Check_output_for_JIT_generated_E88BF50A10FDFF15CB02EFCA372E5395BD12F2100779560FE4DB5574C46B7085>
   773ab:	e8 40 53 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   773b0:	90                   	nop
   773b1:	48 83 c4 60          	add    $0x60,%rsp
   773b5:	5b                   	pop    %rbx
   773b6:	41 5d                	pop    %r13
   773b8:	41 5e                	pop    %r14
   773ba:	41 5f                	pop    %r15
   773bc:	5d                   	pop    %rbp
   773bd:	c3                   	ret
   773be:	e8 1d b4 01 00       	call   927e0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   773c3:	cc                   	int3
   773c4:	90                   	nop
   773c5:	90                   	nop
   773c6:	90                   	nop
   773c7:	90                   	nop
   773c8:	90                   	nop
   773c9:	90                   	nop
   773ca:	90                   	nop
   773cb:	90                   	nop
   773cc:	90                   	nop
   773cd:	90                   	nop
   773ce:	90                   	nop
   773cf:	90                   	nop
   773d0:	90                   	nop
   773d1:	90                   	nop
   773d2:	90                   	nop
   773d3:	90                   	nop
   773d4:	90                   	nop
   773d5:	90                   	nop
   773d6:	90                   	nop
   773d7:	90                   	nop
   773d8:	90                   	nop
   773d9:	90                   	nop
   773da:	90                   	nop
   773db:	90                   	nop
   773dc:	90                   	nop
   773dd:	90                   	nop
   773de:	90                   	nop
   773df:	90                   	nop

   7799e:	e8 fd c2 08 00       	call   103ca0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>
   779a3:	33 db                	xor    %ebx,%ebx
   779a5:	4d 85 ff             	test   %r15,%r15
   779a8:	74 42                	je     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   779aa:	41 83 7f 08 64       	cmpl   $0x64,0x8(%r15)
   779af:	7c 3b                	jl     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   779b1:	48 8b 3d 18 91 1a 00 	mov    0x1a9118(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779b8:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779bc:	8b f3                	mov    %ebx,%esi
   779be:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   779c3:	39 3f                	cmp    %edi,(%rdi)
   779c5:	e8 46 be 08 00       	call   103810 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   779ca:	48 8b 3d ff 90 1a 00 	mov    0x1a90ff(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779d1:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779d5:	8b f3                	mov    %ebx,%esi
   779d7:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   779dc:	39 3f                	cmp    %edi,(%rdi)
   779de:	e8 fd bf 08 00       	call   1039e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   779e3:	ff c3                	inc    %ebx
   779e5:	83 fb 64             	cmp    $0x64,%ebx
   779e8:	7c c7                	jl     779b1 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x5d1>
   779ea:	eb 43                	jmp    77a2f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x64f>
   779ec:	48 8b 3d dd 90 1a 00 	mov    0x1a90dd(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779f3:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779f7:	41 3b 5f 08          	cmp    0x8(%r15),%ebx
   779fb:	0f 83 a4 00 00 00    	jae    77aa5 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x6c5>
   77a01:	8b f3                	mov    %ebx,%esi
   77a03:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77a08:	39 3f                	cmp    %edi,(%rdi)
   77a0a:	e8 01 be 08 00       	call   103810 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77a0f:	48 8b 3d ba 90 1a 00 	mov    0x1a90ba(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77a16:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77a1a:	8b f3                	mov    %ebx,%esi
   77a1c:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77a21:	39 3f                	cmp    %edi,(%rdi)
   77a23:	e8 b8 bf 08 00       	call   1039e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77a28:	ff c3                	inc    %ebx
   77a2a:	83 fb 64             	cmp    $0x64,%ebx
   77a2d:	7c bd                	jl     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77a2f:	48 8d 3d 82 69 1c 00 	lea    0x1c6982(%rip),%rdi        # 23e3b8 <__Str_JIT_warmup_complete__0DAE2BD7E8651565932C6EA373EC942BC13BA8E721DA0F4E914F424C749DD85D>
   77a36:	e8 b5 4c 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   77a3b:	90                   	nop
   77a3c:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   77a43:	5b                   	pop    %rbx
   77a44:	41 5c                	pop    %r12
   77a46:	41 5d                	pop    %r13
   77a48:	41 5e                	pop    %r14
   77a4a:	41 5f                	pop    %r15
   77a4c:	5d                   	pop    %rbp
   77a4d:	c3                   	ret
   77a4e:	bf 10 00 00 00       	mov    $0x10,%edi
   77a53:	e8 d8 84 00 00       	call   7ff30 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   77a58:	cc                   	int3
   77a59:	48 8d 3d 78 93 1d 00 	lea    0x1d9378(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77a60:	e8 af da fe ff       	call   65514 <RhpNewFast>
   77a65:	48 8b d8             	mov    %rax,%rbx
   77a68:	48 8b fb             	mov    %rbx,%rdi
   77a6b:	48 8d 35 4e 6a 1c 00 	lea    0x1c6a4e(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77a72:	e8 99 31 01 00       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77a77:	48 8b fb             	mov    %rbx,%rdi
   77a7a:	e8 ff dc fe ff       	call   6577e <RhpThrowEx>
   77a7f:	48 8d 3d 52 93 1d 00 	lea    0x1d9352(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77a86:	e8 89 da fe ff       	call   65514 <RhpNewFast>
   77a8b:	48 8b d8             	mov    %rax,%rbx
   77a8e:	48 8b fb             	mov    %rbx,%rdi
   77a91:	48 8d 35 28 6a 1c 00 	lea    0x1c6a28(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77a98:	e8 73 31 01 00       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77a9d:	48 8b fb             	mov    %rbx,%rdi
   77aa0:	e8 d9 dc fe ff       	call   6577e <RhpThrowEx>
   77aa5:	e8 b6 30 05 00       	call   cab60 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   77aaa:	cc                   	int3
   77aab:	90                   	nop
   77aac:	90                   	nop
   77aad:	90                   	nop
   77aae:	90                   	nop
   77aaf:	90                   	nop

0000000000077c80 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>:
   77c80:	55                   	push   %rbp
   77c81:	41 57                	push   %r15
   77c83:	41 56                	push   %r14
   77c85:	41 55                	push   %r13
   77c87:	41 54                	push   %r12
   77c89:	53                   	push   %rbx
   77c8a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
   77c91:	c5 f8 77             	vzeroupper
   77c94:	48 8d ac 24 00 01 00 	lea    0x100(%rsp),%rbp
   77c9b:	00 
   77c9c:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
   77ca1:	c5 79 7f 85 20 ff ff 	vmovdqa %xmm8,-0xe0(%rbp)
   77ca8:	ff 
   77ca9:	c5 79 7f 85 30 ff ff 	vmovdqa %xmm8,-0xd0(%rbp)
   77cb0:	ff 
   77cb1:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
   77cb8:	ff ff ff 
   77cbb:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
   77cc1:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
   77cc7:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
   77ccd:	48 83 c0 30          	add    $0x30,%rax
   77cd1:	75 e8                	jne    77cbb <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3b>
   77cd3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   77cd7:	48 8d 3d 12 a9 1c 00 	lea    0x1ca912(%rip),%rdi        # 2425f0 <__Str_Testing_GetIndicesStream__no_p_3BADE5A8245CDE1F293826A4BEA915BC6A54827377AA32C6394D40F198A479BE>
   77cde:	e8 0d 4a 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   77ce3:	48 8b 35 e6 8d 1a 00 	mov    0x1a8de6(%rip),%rsi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77cea:	48 8b 5e 10          	mov    0x10(%rsi),%rbx
   77cee:	8b 73 08             	mov    0x8(%rbx),%esi
   77cf1:	48 8d 3d 58 03 21 00 	lea    0x210358(%rip),%rdi        # 288050 <_ZTV16__Array<UIntPtr>>
   77cf8:	e8 2d d9 fe ff       	call   6562a <RhpNewArray>
   77cfd:	4c 8b f8             	mov    %rax,%r15
   77d00:	48 8b 15 c9 8d 1a 00 	mov    0x1a8dc9(%rip),%rdx        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77d07:	4c 8b 72 18          	mov    0x18(%rdx),%r14
   77d0b:	48 85 db             	test   %rbx,%rbx
   77d0e:	75 06                	jne    77d16 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x96>
   77d10:	33 d2                	xor    %edx,%edx
   77d12:	33 ff                	xor    %edi,%edi
   77d14:	eb 07                	jmp    77d1d <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x9d>
   77d16:	48 8d 53 10          	lea    0x10(%rbx),%rdx
   77d1a:	8b 7b 08             	mov    0x8(%rbx),%edi
   77d1d:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77d21:	41 8b 47 08          	mov    0x8(%r15),%eax
   77d25:	41 80 7e 55 00       	cmpb   $0x0,0x55(%r14)
   77d2a:	0f 84 bb 01 00 00    	je     77eeb <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x26b>
   77d30:	3b f8                	cmp    %eax,%edi
   77d32:	0f 85 9a 04 00 00    	jne    781d2 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x552>
   77d38:	41 0f b6 4e 54       	movzbl 0x54(%r14),%ecx
   77d3d:	4d 8b 46 38          	mov    0x38(%r14),%r8
   77d41:	45 33 c9             	xor    %r9d,%r9d
   77d44:	85 ff                	test   %edi,%edi
   77d46:	4c 0f 45 ca          	cmovne %rdx,%r9
   77d4a:	4c 89 4d a8          	mov    %r9,-0x58(%rbp)
   77d4e:	33 d2                	xor    %edx,%edx
   77d50:	85 c0                	test   %eax,%eax
   77d52:	48 0f 45 d6          	cmovne %rsi,%rdx
   77d56:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   77d5a:	48 8b f2             	mov    %rdx,%rsi
   77d5d:	85 c9                	test   %ecx,%ecx
   77d5f:	0f 84 c4 00 00 00    	je     77e29 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x1a9>
   77d65:	33 c0                	xor    %eax,%eax
   77d67:	85 ff                	test   %edi,%edi
   77d69:	0f 8e 6d 01 00 00    	jle    77edc <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77d6f:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   77d76:	48 63 d0             	movslq %eax,%rdx
   77d79:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77d7d:	49 33 56 48          	xor    0x48(%r14),%rdx
   77d81:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77d88:	c1 7c 51 
   77d8b:	4c 8d 55 98          	lea    -0x68(%rbp),%r10
   77d8f:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77d94:	4d 89 1a             	mov    %r11,(%r10)
   77d97:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   77d9b:	48 33 d1             	xor    %rcx,%rdx
   77d9e:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77da5:	c1 7c 51 
   77da8:	48 0f af d1          	imul   %rcx,%rdx
   77dac:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
   77db3:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77db7:	4c 8d 55 90          	lea    -0x70(%rbp),%r10
   77dbb:	4c 8b 9d 18 ff ff ff 	mov    -0xe8(%rbp),%r11
   77dc2:	48 8b d1             	mov    %rcx,%rdx
   77dc5:	c4 c2 93 f6 d3       	mulx   %r11,%r13,%rdx
   77dca:	4d 89 2a             	mov    %r13,(%r10)
   77dcd:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77dd1:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77dd5:	49 33 56 48          	xor    0x48(%r14),%rdx
   77dd9:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77de0:	c1 7c 51 
   77de3:	48 0f af d1          	imul   %rcx,%rdx
   77de7:	48 8b cb             	mov    %rbx,%rcx
   77dea:	49 33 d3             	xor    %r11,%rdx
   77ded:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77df2:	48 8b 09             	mov    (%rcx),%rcx
   77df5:	4c 8d 55 88          	lea    -0x78(%rbp),%r10
   77df9:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77dfe:	4d 89 1a             	mov    %r11,(%r10)
   77e01:	49 3b d0             	cmp    %r8,%rdx
   77e04:	72 0d                	jb     77e13 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x193>
   77e06:	41 2b d0             	sub    %r8d,%edx
   77e09:	49 8b 4e 58          	mov    0x58(%r14),%rcx
   77e0d:	48 63 d2             	movslq %edx,%rdx
   77e10:	8b 14 91             	mov    (%rcx,%rdx,4),%edx
   77e13:	48 63 c8             	movslq %eax,%rcx
   77e16:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   77e1a:	ff c0                	inc    %eax
   77e1c:	3b c7                	cmp    %edi,%eax
   77e1e:	0f 8c 52 ff ff ff    	jl     77d76 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0xf6>
   77e24:	e9 b3 00 00 00       	jmp    77edc <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77e29:	33 c0                	xor    %eax,%eax
   77e2b:	85 ff                	test   %edi,%edi
   77e2d:	0f 8e a9 00 00 00    	jle    77edc <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77e33:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   77e3a:	48 63 d0             	movslq %eax,%rdx
   77e3d:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77e41:	49 33 56 48          	xor    0x48(%r14),%rdx
   77e45:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77e4c:	c1 7c 51 
   77e4f:	4c 8d 45 80          	lea    -0x80(%rbp),%r8
   77e53:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77e58:	4d 89 10             	mov    %r10,(%r8)
   77e5b:	48 8b 4d 80          	mov    -0x80(%rbp),%rcx
   77e5f:	48 33 d1             	xor    %rcx,%rdx
   77e62:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77e69:	c1 7c 51 
   77e6c:	48 0f af d1          	imul   %rcx,%rdx
   77e70:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
   77e77:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77e7b:	4c 8d 85 78 ff ff ff 	lea    -0x88(%rbp),%r8
   77e82:	4c 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%r10
   77e89:	48 8b d1             	mov    %rcx,%rdx
   77e8c:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   77e91:	4d 89 18             	mov    %r11,(%r8)
   77e94:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77e98:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77e9c:	49 33 56 48          	xor    0x48(%r14),%rdx
   77ea0:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77ea7:	c1 7c 51 
   77eaa:	48 0f af d1          	imul   %rcx,%rdx
   77eae:	48 8b cb             	mov    %rbx,%rcx
   77eb1:	49 33 d2             	xor    %r10,%rdx
   77eb4:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77eb9:	48 8b 09             	mov    (%rcx),%rcx
   77ebc:	4c 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%r8
   77ec3:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77ec8:	4d 89 10             	mov    %r10,(%r8)
   77ecb:	48 63 c8             	movslq %eax,%rcx
   77ece:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   77ed2:	ff c0                	inc    %eax
   77ed4:	3b c7                	cmp    %edi,%eax
   77ed6:	0f 8c 5e ff ff ff    	jl     77e3a <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x1ba>
   77edc:	33 d2                	xor    %edx,%edx
   77ede:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   77ee2:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
   77ee6:	e9 a3 01 00 00       	jmp    7808e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x40e>
   77eeb:	44 8b ef             	mov    %edi,%r13d
   77eee:	48 8b fe             	mov    %rsi,%rdi
   77ef1:	8b f0                	mov    %eax,%esi
   77ef3:	44 3b ee             	cmp    %esi,%r13d
   77ef6:	0f 85 fc 02 00 00    	jne    781f8 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x578>
   77efc:	41 0f b6 46 54       	movzbl 0x54(%r14),%eax
   77f01:	4d 8b 66 38          	mov    0x38(%r14),%r12
   77f05:	33 c9                	xor    %ecx,%ecx
   77f07:	45 85 ed             	test   %r13d,%r13d
   77f0a:	48 0f 45 ca          	cmovne %rdx,%rcx
   77f0e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   77f15:	48 8b d9             	mov    %rcx,%rbx
   77f18:	33 d2                	xor    %edx,%edx
   77f1a:	85 f6                	test   %esi,%esi
   77f1c:	48 0f 45 d7          	cmovne %rdi,%rdx
   77f20:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   77f27:	48 8b ca             	mov    %rdx,%rcx
   77f2a:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
   77f31:	85 c0                	test   %eax,%eax
   77f33:	0f 84 18 01 00 00    	je     78051 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3d1>
   77f39:	33 c0                	xor    %eax,%eax
   77f3b:	45 85 ed             	test   %r13d,%r13d
   77f3e:	0f 8e 3a 01 00 00    	jle    7807e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   77f44:	89 85 54 ff ff ff    	mov    %eax,-0xac(%rbp)
   77f4a:	48 63 d0             	movslq %eax,%rdx
   77f4d:	48 8b 14 d3          	mov    (%rbx,%rdx,8),%rdx
   77f51:	49 33 56 48          	xor    0x48(%r14),%rdx
   77f55:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
   77f5c:	c1 7c 51 
   77f5f:	48 8d b5 40 ff ff ff 	lea    -0xc0(%rbp),%rsi
   77f66:	c4 62 bb f6 cf       	mulx   %rdi,%r8,%r9
   77f6b:	4c 89 06             	mov    %r8,(%rsi)
   77f6e:	4c 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%r8
   77f75:	4d 33 c1             	xor    %r9,%r8
   77f78:	4c 0f af c7          	imul   %rdi,%r8
   77f7c:	49 8b f8             	mov    %r8,%rdi
   77f7f:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
   77f86:	49 8d 56 78          	lea    0x78(%r14),%rdx
   77f8a:	48 8b 12             	mov    (%rdx),%rdx
   77f8d:	48 8d b5 38 ff ff ff 	lea    -0xc8(%rbp),%rsi
   77f94:	c4 e2 bb f6 d7       	mulx   %rdi,%r8,%rdx
   77f99:	4c 89 06             	mov    %r8,(%rsi)
   77f9c:	49 8b 76 08          	mov    0x8(%r14),%rsi
   77fa0:	0f b6 14 16          	movzbl (%rsi,%rdx,1),%edx
   77fa4:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
   77fab:	49 8d 7e 68          	lea    0x68(%r14),%rdi
   77faf:	48 8b b5 08 ff ff ff 	mov    -0xf8(%rbp),%rsi
   77fb6:	e8 35 2f 00 00       	call   7aef0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Computation_FastReduce__Reduce>
   77fbb:	49 0f af 46 18       	imul   0x18(%r14),%rax
   77fc0:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
   77fc7:	48 8b bd 48 ff ff ff 	mov    -0xb8(%rbp),%rdi
   77fce:	49 33 7e 48          	xor    0x48(%r14),%rdi
   77fd2:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
   77fd9:	c1 7c 51 
   77fdc:	48 0f af fe          	imul   %rsi,%rdi
   77fe0:	49 8d b6 80 00 00 00 	lea    0x80(%r14),%rsi
   77fe7:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
   77fee:	48 33 fa             	xor    %rdx,%rdi
   77ff1:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
   77ff6:	48 8b 16             	mov    (%rsi),%rdx
   77ff9:	33 f6                	xor    %esi,%esi
   77ffb:	33 c9                	xor    %ecx,%ecx
   77ffd:	e8 ce bd 01 00       	call   93dd0 <S_P_CoreLib_System_UInt128__op_Multiply>
   78002:	48 8b f8             	mov    %rax,%rdi
   78005:	48 8b f2             	mov    %rdx,%rsi
   78008:	ba 40 00 00 00       	mov    $0x40,%edx
   7800d:	e8 fe bd 01 00       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   78012:	48 8b b5 30 ff ff ff 	mov    -0xd0(%rbp),%rsi
   78019:	48 03 f0             	add    %rax,%rsi
   7801c:	49 3b f4             	cmp    %r12,%rsi
   7801f:	72 0d                	jb     7802e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3ae>
   78021:	41 2b f4             	sub    %r12d,%esi
   78024:	49 8b 7e 58          	mov    0x58(%r14),%rdi
   78028:	48 63 f6             	movslq %esi,%rsi
   7802b:	8b 34 b7             	mov    (%rdi,%rsi,4),%esi
   7802e:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
   78034:	48 63 c7             	movslq %edi,%rax
   78037:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
   7803e:	48 89 34 c1          	mov    %rsi,(%rcx,%rax,8)
   78042:	ff c7                	inc    %edi
   78044:	41 3b fd             	cmp    %r13d,%edi
   78047:	8b c7                	mov    %edi,%eax
   78049:	0f 8c f5 fe ff ff    	jl     77f44 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x2c4>
   7804f:	eb 2d                	jmp    7807e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   78051:	45 33 e4             	xor    %r12d,%r12d
   78054:	45 85 ed             	test   %r13d,%r13d
   78057:	7e 25                	jle    7807e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   78059:	49 63 f4             	movslq %r12d,%rsi
   7805c:	48 8b 34 f3          	mov    (%rbx,%rsi,8),%rsi
   78060:	49 8b fe             	mov    %r14,%rdi
   78063:	e8 c8 b5 08 00       	call   103630 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
   78068:	49 63 fc             	movslq %r12d,%rdi
   7806b:	48 8b b5 58 ff ff ff 	mov    -0xa8(%rbp),%rsi
   78072:	48 89 04 fe          	mov    %rax,(%rsi,%rdi,8)
   78076:	41 ff c4             	inc    %r12d
   78079:	45 3b e5             	cmp    %r13d,%r12d
   7807c:	7c db                	jl     78059 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3d9>
   7807e:	33 ff                	xor    %edi,%edi
   78080:	48 89 bd 60 ff ff ff 	mov    %rdi,-0xa0(%rbp)
   78087:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
   7808e:	48 8b 3d 3b 8a 1a 00 	mov    0x1a8a3b(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   78095:	48 8b 5f 18          	mov    0x18(%rdi),%rbx
   78099:	48 8b 3d 30 8a 1a 00 	mov    0x1a8a30(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   780a0:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
   780a4:	48 85 ff             	test   %rdi,%rdi
   780a7:	75 08                	jne    780b1 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x431>
   780a9:	45 33 f6             	xor    %r14d,%r14d
   780ac:	45 33 ed             	xor    %r13d,%r13d
   780af:	eb 08                	jmp    780b9 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x439>
   780b1:	4c 8d 77 10          	lea    0x10(%rdi),%r14
   780b5:	44 8b 6f 08          	mov    0x8(%rdi),%r13d
   780b9:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   780bd:	c5 fa 7f 85 20 ff ff 	vmovdqu %xmm0,-0xe0(%rbp)
   780c4:	ff 
   780c5:	48 8d bd 20 ff ff ff 	lea    -0xe0(%rbp),%rdi
   780cc:	49 8b f7             	mov    %r15,%rsi
   780cf:	e8 5c fe 08 00       	call   107f30 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   780d4:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
   780db:	44 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%r8d
   780e2:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
   780e6:	74 13                	je     780fb <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x47b>
   780e8:	49 8b f6             	mov    %r14,%rsi
   780eb:	41 8b d5             	mov    %r13d,%edx
   780ee:	48 8b fb             	mov    %rbx,%rdi
   780f1:	45 33 c9             	xor    %r9d,%r9d
   780f4:	e8 67 bf 08 00       	call   104060 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart>
   780f9:	eb 11                	jmp    7810c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x48c>
   780fb:	49 8b f6             	mov    %r14,%rsi
   780fe:	41 8b d5             	mov    %r13d,%edx
   78101:	48 8b fb             	mov    %rbx,%rdi
   78104:	45 33 c9             	xor    %r9d,%r9d
   78107:	e8 74 c1 08 00       	call   104280 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart>
   7810c:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   78110:	be 25 00 00 00       	mov    $0x25,%esi
   78115:	ba 01 00 00 00       	mov    $0x1,%edx
   7811a:	e8 81 8d 04 00       	call   c0ea0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
   7811f:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   78123:	8b 75 c0             	mov    -0x40(%rbp),%esi
   78126:	e8 a5 1c 08 00       	call   f9dd0 <S_P_CoreLib_System_Span_1<Char>__Slice>
   7812b:	48 8b f0             	mov    %rax,%rsi
   7812e:	48 8d 3d 2b e5 1b 00 	lea    0x1be52b(%rip),%rdi        # 236660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   78135:	39 3f                	cmp    %edi,(%rdi)
   78137:	e8 44 c7 00 00       	call   84880 <String__TryCopyTo>
   7813c:	85 c0                	test   %eax,%eax
   7813e:	74 0b                	je     7814b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x4cb>
   78140:	8b 7d c0             	mov    -0x40(%rbp),%edi
   78143:	83 c7 0c             	add    $0xc,%edi
   78146:	89 7d c0             	mov    %edi,-0x40(%rbp)
   78149:	eb 10                	jmp    7815b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x4db>
   7814b:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   7814f:	48 8d 35 0a e5 1b 00 	lea    0x1be50a(%rip),%rsi        # 236660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   78156:	e8 25 8f 04 00       	call   c1080 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   7815b:	48 8b 35 6e 89 1a 00 	mov    0x1a896e(%rip),%rsi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   78162:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   78166:	8b 76 08             	mov    0x8(%rsi),%esi
   78169:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   7816d:	e8 ce 74 0b 00       	call   12f640 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
   78172:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   78176:	8b 75 c0             	mov    -0x40(%rbp),%esi
   78179:	e8 52 1c 08 00       	call   f9dd0 <S_P_CoreLib_System_Span_1<Char>__Slice>
   7817e:	48 8b f0             	mov    %rax,%rsi
   78181:	48 8d 3d a0 e9 1b 00 	lea    0x1be9a0(%rip),%rdi        # 236b28 <__Str__keys_without_prefetching_D8A361755FCD551AE19C922C947806AAE44FC92E986D052C498A0E8B5AAA0C53>
   78188:	39 3f                	cmp    %edi,(%rdi)
   7818a:	e8 f1 c6 00 00       	call   84880 <String__TryCopyTo>
   7818f:	85 c0                	test   %eax,%eax
   78191:	74 0b                	je     7819e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x51e>
   78193:	8b 7d c0             	mov    -0x40(%rbp),%edi
   78196:	83 c7 19             	add    $0x19,%edi
   78199:	89 7d c0             	mov    %edi,-0x40(%rbp)
   7819c:	eb 10                	jmp    781ae <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x52e>
   7819e:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   781a2:	48 8d 35 7f e9 1b 00 	lea    0x1be97f(%rip),%rsi        # 236b28 <__Str__keys_without_prefetching_D8A361755FCD551AE19C922C947806AAE44FC92E986D052C498A0E8B5AAA0C53>
   781a9:	e8 d2 8e 04 00       	call   c1080 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   781ae:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   781b2:	e8 89 8d 04 00       	call   c0f40 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   781b7:	48 8b f8             	mov    %rax,%rdi
   781ba:	e8 31 45 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   781bf:	90                   	nop
   781c0:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   781c7:	5b                   	pop    %rbx
   781c8:	41 5c                	pop    %r12
   781ca:	41 5d                	pop    %r13
   781cc:	41 5e                	pop    %r14
   781ce:	41 5f                	pop    %r15
   781d0:	5d                   	pop    %rbp
   781d1:	c3                   	ret
   781d2:	48 8d 3d ff 8b 1d 00 	lea    0x1d8bff(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   781d9:	e8 36 d3 fe ff       	call   65514 <RhpNewFast>
   781de:	48 8b d8             	mov    %rax,%rbx
   781e1:	48 8b fb             	mov    %rbx,%rdi
   781e4:	48 8d 35 d5 62 1c 00 	lea    0x1c62d5(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   781eb:	e8 20 2a 01 00       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
   781f0:	48 8b fb             	mov    %rbx,%rdi
   781f3:	e8 86 d5 fe ff       	call   6577e <RhpThrowEx>
   781f8:	48 8d 3d d9 8b 1d 00 	lea    0x1d8bd9(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   781ff:	e8 10 d3 fe ff       	call   65514 <RhpNewFast>
   78204:	48 8b d8             	mov    %rax,%rbx
   78207:	48 8b fb             	mov    %rbx,%rdi
   7820a:	48 8d 35 af 62 1c 00 	lea    0x1c62af(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   78211:	e8 fa 29 01 00       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
   78216:	48 8b fb             	mov    %rbx,%rdi
   78219:	e8 60 d5 fe ff       	call   6577e <RhpThrowEx>
   7821e:	cc                   	int3
   7821f:	90                   	nop

0000000000103ca0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>:
  103ca0:	55                   	push   %rbp
  103ca1:	41 57                	push   %r15
  103ca3:	41 56                	push   %r14
  103ca5:	41 55                	push   %r13
  103ca7:	41 54                	push   %r12
  103ca9:	53                   	push   %rbx
  103caa:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  103cb1:	c5 f8 77             	vzeroupper
  103cb4:	48 8d ac 24 b0 00 00 	lea    0xb0(%rsp),%rbp
  103cbb:	00 
  103cbc:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  103cc1:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  103cc8:	ff ff ff 
  103ccb:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  103cd1:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  103cd7:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  103cdd:	48 83 c0 30          	add    $0x30,%rax
  103ce1:	75 e8                	jne    103ccb <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2b>
  103ce3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  103ce7:	48 8b df             	mov    %rdi,%rbx
  103cea:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  103cee:	0f 84 2c 02 00 00    	je     103f20 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x280>
  103cf4:	44 8b fa             	mov    %edx,%r15d
  103cf7:	45 3b f8             	cmp    %r8d,%r15d
  103cfa:	0f 85 12 03 00 00    	jne    104012 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x372>
  103d00:	45 84 c9             	test   %r9b,%r9b
  103d03:	74 06                	je     103d0b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x6b>
  103d05:	0f b6 53 54          	movzbl 0x54(%rbx),%edx
  103d09:	eb 02                	jmp    103d0d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x6d>
  103d0b:	33 d2                	xor    %edx,%edx
  103d0d:	4c 8b 73 38          	mov    0x38(%rbx),%r14
  103d11:	33 ff                	xor    %edi,%edi
  103d13:	45 85 ff             	test   %r15d,%r15d
  103d16:	48 0f 45 fe          	cmovne %rsi,%rdi
  103d1a:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  103d1e:	4c 8b ef             	mov    %rdi,%r13
  103d21:	33 ff                	xor    %edi,%edi
  103d23:	45 85 c0             	test   %r8d,%r8d
  103d26:	48 0f 45 f9          	cmovne %rcx,%rdi
  103d2a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  103d2e:	4c 8b e7             	mov    %rdi,%r12
  103d31:	85 d2                	test   %edx,%edx
  103d33:	0f 84 dd 00 00 00    	je     103e16 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x176>
  103d39:	33 c0                	xor    %eax,%eax
  103d3b:	45 85 ff             	test   %r15d,%r15d
  103d3e:	0f 8e c0 01 00 00    	jle    103f04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  103d44:	89 45 c4             	mov    %eax,-0x3c(%rbp)
  103d47:	48 63 d0             	movslq %eax,%rdx
  103d4a:	49 8b 54 d5 00       	mov    0x0(%r13,%rdx,8),%rdx
  103d4f:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103d53:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103d5a:	c1 7c 51 
  103d5d:	48 8d 75 b8          	lea    -0x48(%rbp),%rsi
  103d61:	c4 e2 f3 f6 d7       	mulx   %rdi,%rcx,%rdx
  103d66:	48 89 0e             	mov    %rcx,(%rsi)
  103d69:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  103d6d:	48 33 d7             	xor    %rdi,%rdx
  103d70:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103d77:	c1 7c 51 
  103d7a:	48 0f af d7          	imul   %rdi,%rdx
  103d7e:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  103d85:	48 8b 7b 70          	mov    0x70(%rbx),%rdi
  103d89:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
  103d8d:	48 8b 8d 60 ff ff ff 	mov    -0xa0(%rbp),%rcx
  103d94:	48 8b d7             	mov    %rdi,%rdx
  103d97:	c4 e2 bb f6 d1       	mulx   %rcx,%r8,%rdx
  103d9c:	4c 89 06             	mov    %r8,(%rsi)
  103d9f:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  103da3:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  103da7:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103dab:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103db2:	c1 7c 51 
  103db5:	48 0f af d7          	imul   %rdi,%rdx
  103db9:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
  103dc0:	48 33 d1             	xor    %rcx,%rdx
  103dc3:	48 0f af 57 08       	imul   0x8(%rdi),%rdx
  103dc8:	48 8b 3f             	mov    (%rdi),%rdi
  103dcb:	48 8d 75 a8          	lea    -0x58(%rbp),%rsi
  103dcf:	c4 e2 f3 f6 ff       	mulx   %rdi,%rcx,%rdi
  103dd4:	48 89 0e             	mov    %rcx,(%rsi)
  103dd7:	48 8b f7             	mov    %rdi,%rsi
  103dda:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  103dde:	ba 40 00 00 00       	mov    $0x40,%edx
  103de3:	e8 28 00 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103de8:	49 3b c6             	cmp    %r14,%rax
  103deb:	72 0d                	jb     103dfa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x15a>
  103ded:	41 2b c6             	sub    %r14d,%eax
  103df0:	48 8b 53 58          	mov    0x58(%rbx),%rdx
  103df4:	48 63 f8             	movslq %eax,%rdi
  103df7:	8b 04 ba             	mov    (%rdx,%rdi,4),%eax
  103dfa:	8b 55 c4             	mov    -0x3c(%rbp),%edx
  103dfd:	48 63 fa             	movslq %edx,%rdi
  103e00:	49 89 04 fc          	mov    %rax,(%r12,%rdi,8)
  103e04:	ff c2                	inc    %edx
  103e06:	41 3b d7             	cmp    %r15d,%edx
  103e09:	8b c2                	mov    %edx,%eax
  103e0b:	0f 8c 33 ff ff ff    	jl     103d44 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0xa4>
  103e11:	e9 ee 00 00 00       	jmp    103f04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  103e16:	45 33 f6             	xor    %r14d,%r14d
  103e19:	45 85 ff             	test   %r15d,%r15d
  103e1c:	0f 8e e2 00 00 00    	jle    103f04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  103e22:	49 63 d6             	movslq %r14d,%rdx
  103e25:	49 8b 7c d5 00       	mov    0x0(%r13,%rdx,8),%rdi
  103e2a:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103e2e:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
  103e32:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  103e39:	c1 7c 51 
  103e3c:	e8 5f fc f7 ff       	call   83aa0 <S_P_CoreLib_System_Math__BigMul_0>
  103e41:	48 8b f0             	mov    %rax,%rsi
  103e44:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
  103e48:	c5 f8 11 45 90       	vmovups %xmm0,-0x70(%rbp)
  103e4d:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
  103e51:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  103e55:	e8 66 ff f8 ff       	call   93dc0 <S_P_CoreLib_System_UInt128___ctor>
  103e5a:	48 8b 45 90          	mov    -0x70(%rbp),%rax
  103e5e:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
  103e65:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
  103e69:	48 8b f8             	mov    %rax,%rdi
  103e6c:	ba 40 00 00 00       	mov    $0x40,%edx
  103e71:	e8 9a ff f8 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103e76:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
  103e7d:	48 33 c1             	xor    %rcx,%rax
  103e80:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
  103e87:	c1 7c 51 
  103e8a:	48 0f af c1          	imul   %rcx,%rax
  103e8e:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
  103e95:	48 8b fb             	mov    %rbx,%rdi
  103e98:	48 8b b5 50 ff ff ff 	mov    -0xb0(%rbp),%rsi
  103e9f:	e8 1c fd ff ff       	call   103bc0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  103ea4:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  103ea8:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  103ead:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103eb1:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  103eb8:	c1 7c 51 
  103ebb:	48 0f af fe          	imul   %rsi,%rdi
  103ebf:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  103ec6:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
  103ecd:	48 33 fa             	xor    %rdx,%rdi
  103ed0:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  103ed5:	48 8b 16             	mov    (%rsi),%rdx
  103ed8:	33 f6                	xor    %esi,%esi
  103eda:	33 c9                	xor    %ecx,%ecx
  103edc:	e8 ef fe f8 ff       	call   93dd0 <S_P_CoreLib_System_UInt128__op_Multiply>
  103ee1:	48 8b f8             	mov    %rax,%rdi
  103ee4:	48 8b f2             	mov    %rdx,%rsi
  103ee7:	ba 40 00 00 00       	mov    $0x40,%edx
  103eec:	e8 1f ff f8 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103ef1:	49 63 fe             	movslq %r14d,%rdi
  103ef4:	49 89 04 fc          	mov    %rax,(%r12,%rdi,8)
  103ef8:	41 ff c6             	inc    %r14d
  103efb:	45 3b f7             	cmp    %r15d,%r14d
  103efe:	0f 8c 1e ff ff ff    	jl     103e22 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x182>
  103f04:	33 ff                	xor    %edi,%edi
  103f06:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  103f0a:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  103f0e:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  103f15:	5b                   	pop    %rbx
  103f16:	41 5c                	pop    %r12
  103f18:	41 5d                	pop    %r13
  103f1a:	41 5e                	pop    %r14
  103f1c:	41 5f                	pop    %r15
  103f1e:	5d                   	pop    %rbp
  103f1f:	c3                   	ret
  103f20:	48 8b fe             	mov    %rsi,%rdi
  103f23:	44 8b fa             	mov    %edx,%r15d
  103f26:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
  103f2a:	44 89 45 88          	mov    %r8d,-0x78(%rbp)
  103f2e:	44 3b 7d 88          	cmp    -0x78(%rbp),%r15d
  103f32:	0f 85 00 01 00 00    	jne    104038 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x398>
  103f38:	45 84 c9             	test   %r9b,%r9b
  103f3b:	74 07                	je     103f44 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2a4>
  103f3d:	44 0f b6 73 54       	movzbl 0x54(%rbx),%r14d
  103f42:	eb 03                	jmp    103f47 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2a7>
  103f44:	45 33 f6             	xor    %r14d,%r14d
  103f47:	4c 8b 6b 38          	mov    0x38(%rbx),%r13
  103f4b:	33 c0                	xor    %eax,%eax
  103f4d:	45 85 ff             	test   %r15d,%r15d
  103f50:	48 0f 45 c7          	cmovne %rdi,%rax
  103f54:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  103f5b:	4c 8b e0             	mov    %rax,%r12
  103f5e:	48 8d 7d 80          	lea    -0x80(%rbp),%rdi
  103f62:	e8 e9 3f 00 00       	call   107f50 <S_P_CoreLib_System_Span_1<UIntPtr>__GetPinnableReference>
  103f67:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  103f6e:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  103f75:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
  103f7c:	45 85 f6             	test   %r14d,%r14d
  103f7f:	74 41                	je     103fc2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x322>
  103f81:	45 33 f6             	xor    %r14d,%r14d
  103f84:	45 85 ff             	test   %r15d,%r15d
  103f87:	7e 67                	jle    103ff0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  103f89:	49 63 f6             	movslq %r14d,%rsi
  103f8c:	49 8b 34 f4          	mov    (%r12,%rsi,8),%rsi
  103f90:	48 8b fb             	mov    %rbx,%rdi
  103f93:	e8 98 f6 ff ff       	call   103630 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
  103f98:	49 3b c5             	cmp    %r13,%rax
  103f9b:	72 0d                	jb     103faa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x30a>
  103f9d:	41 2b c5             	sub    %r13d,%eax
  103fa0:	48 8b 73 58          	mov    0x58(%rbx),%rsi
  103fa4:	48 63 f8             	movslq %eax,%rdi
  103fa7:	8b 04 be             	mov    (%rsi,%rdi,4),%eax
  103faa:	49 63 f6             	movslq %r14d,%rsi
  103fad:	48 8b 8d 68 ff ff ff 	mov    -0x98(%rbp),%rcx
  103fb4:	48 89 04 f1          	mov    %rax,(%rcx,%rsi,8)
  103fb8:	41 ff c6             	inc    %r14d
  103fbb:	45 3b f7             	cmp    %r15d,%r14d
  103fbe:	7c c9                	jl     103f89 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2e9>
  103fc0:	eb 2e                	jmp    103ff0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  103fc2:	45 33 f6             	xor    %r14d,%r14d
  103fc5:	45 85 ff             	test   %r15d,%r15d
  103fc8:	7e 26                	jle    103ff0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  103fca:	49 63 f6             	movslq %r14d,%rsi
  103fcd:	49 8b 34 f4          	mov    (%r12,%rsi,8),%rsi
  103fd1:	48 8b fb             	mov    %rbx,%rdi
  103fd4:	e8 57 f6 ff ff       	call   103630 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
  103fd9:	49 63 fe             	movslq %r14d,%rdi
  103fdc:	4c 8b ad 68 ff ff ff 	mov    -0x98(%rbp),%r13
  103fe3:	49 89 44 fd 00       	mov    %rax,0x0(%r13,%rdi,8)
  103fe8:	41 ff c6             	inc    %r14d
  103feb:	45 3b f7             	cmp    %r15d,%r14d
  103fee:	7c da                	jl     103fca <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x32a>
  103ff0:	33 ff                	xor    %edi,%edi
  103ff2:	48 89 bd 70 ff ff ff 	mov    %rdi,-0x90(%rbp)
  103ff9:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
  104000:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  104007:	5b                   	pop    %rbx
  104008:	41 5c                	pop    %r12
  10400a:	41 5d                	pop    %r13
  10400c:	41 5e                	pop    %r14
  10400e:	41 5f                	pop    %r15
  104010:	5d                   	pop    %rbp
  104011:	c3                   	ret
  104012:	48 8d 3d bf cd 14 00 	lea    0x14cdbf(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104019:	e8 f6 14 f6 ff       	call   65514 <RhpNewFast>
  10401e:	48 8b d8             	mov    %rax,%rbx
  104021:	48 8b fb             	mov    %rbx,%rdi
  104024:	48 8d 35 95 a4 13 00 	lea    0x13a495(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  10402b:	e8 e0 6b f8 ff       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104030:	48 8b fb             	mov    %rbx,%rdi
  104033:	e8 46 17 f6 ff       	call   6577e <RhpThrowEx>
  104038:	48 8d 3d 99 cd 14 00 	lea    0x14cd99(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  10403f:	e8 d0 14 f6 ff       	call   65514 <RhpNewFast>
  104044:	48 8b d8             	mov    %rax,%rbx
  104047:	48 8b fb             	mov    %rbx,%rdi
  10404a:	48 8d 35 6f a4 13 00 	lea    0x13a46f(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104051:	e8 ba 6b f8 ff       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104056:	48 8b fb             	mov    %rbx,%rdi
  104059:	e8 20 17 f6 ff       	call   6577e <RhpThrowEx>
  10405e:	cc                   	int3
  10405f:	90                   	nop

0000000000104060 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart>:
  104060:	55                   	push   %rbp
  104061:	41 57                	push   %r15
  104063:	53                   	push   %rbx
  104064:	48 83 ec 60          	sub    $0x60,%rsp
  104068:	48 8d 6c 24 70       	lea    0x70(%rsp),%rbp
  10406d:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104072:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  104077:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  10407c:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  104081:	c5 79 7f 45 e0       	vmovdqa %xmm8,-0x20(%rbp)
  104086:	41 3b d0             	cmp    %r8d,%edx
  104089:	0f 85 b9 01 00 00    	jne    104248 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1e8>
  10408f:	45 84 c9             	test   %r9b,%r9b
  104092:	74 06                	je     10409a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x3a>
  104094:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  104098:	eb 02                	jmp    10409c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x3c>
  10409a:	33 c0                	xor    %eax,%eax
  10409c:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
  1040a0:	45 33 d2             	xor    %r10d,%r10d
  1040a3:	85 d2                	test   %edx,%edx
  1040a5:	4c 0f 45 d6          	cmovne %rsi,%r10
  1040a9:	4c 89 55 e8          	mov    %r10,-0x18(%rbp)
  1040ad:	49 8b f2             	mov    %r10,%rsi
  1040b0:	45 33 d2             	xor    %r10d,%r10d
  1040b3:	45 85 c0             	test   %r8d,%r8d
  1040b6:	4c 0f 45 d1          	cmovne %rcx,%r10
  1040ba:	4c 89 55 e0          	mov    %r10,-0x20(%rbp)
  1040be:	49 8b ca             	mov    %r10,%rcx
  1040c1:	85 c0                	test   %eax,%eax
  1040c3:	0f 84 c2 00 00 00    	je     10418b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x12b>
  1040c9:	33 c0                	xor    %eax,%eax
  1040cb:	89 55 ac             	mov    %edx,-0x54(%rbp)
  1040ce:	85 d2                	test   %edx,%edx
  1040d0:	0f 8e 5f 01 00 00    	jle    104235 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  1040d6:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  1040dd:	4c 63 d0             	movslq %eax,%r10
  1040e0:	4e 8b 14 d6          	mov    (%rsi,%r10,8),%r10
  1040e4:	4c 33 57 48          	xor    0x48(%rdi),%r10
  1040e8:	49 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r11
  1040ef:	c1 7c 51 
  1040f2:	48 8d 5d d8          	lea    -0x28(%rbp),%rbx
  1040f6:	49 8b d2             	mov    %r10,%rdx
  1040f9:	c4 c2 83 f6 d3       	mulx   %r11,%r15,%rdx
  1040fe:	4c 89 3b             	mov    %r15,(%rbx)
  104101:	4c 8b 55 d8          	mov    -0x28(%rbp),%r10
  104105:	49 33 d2             	xor    %r10,%rdx
  104108:	49 0f af d3          	imul   %r11,%rdx
  10410c:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  104110:	4c 8b 57 70          	mov    0x70(%rdi),%r10
  104114:	4c 8d 5d d0          	lea    -0x30(%rbp),%r11
  104118:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  10411c:	49 8b d2             	mov    %r10,%rdx
  10411f:	c4 e2 83 f6 d3       	mulx   %rbx,%r15,%rdx
  104124:	4d 89 3b             	mov    %r15,(%r11)
  104127:	4c 8b 57 08          	mov    0x8(%rdi),%r10
  10412b:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  104130:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104134:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  10413b:	c1 7c 51 
  10413e:	49 0f af d2          	imul   %r10,%rdx
  104142:	4d 8b d0             	mov    %r8,%r10
  104145:	48 33 d3             	xor    %rbx,%rdx
  104148:	49 0f af 52 08       	imul   0x8(%r10),%rdx
  10414d:	4d 8b 12             	mov    (%r10),%r10
  104150:	4c 8d 5d c8          	lea    -0x38(%rbp),%r11
  104154:	c4 c2 e3 f6 d2       	mulx   %r10,%rbx,%rdx
  104159:	49 89 1b             	mov    %rbx,(%r11)
  10415c:	49 3b d1             	cmp    %r9,%rdx
  10415f:	72 0e                	jb     10416f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x10f>
  104161:	41 2b d1             	sub    %r9d,%edx
  104164:	4c 8b 57 58          	mov    0x58(%rdi),%r10
  104168:	48 63 d2             	movslq %edx,%rdx
  10416b:	41 8b 14 92          	mov    (%r10,%rdx,4),%edx
  10416f:	4c 63 d0             	movslq %eax,%r10
  104172:	4a 89 14 d1          	mov    %rdx,(%rcx,%r10,8)
  104176:	ff c0                	inc    %eax
  104178:	8b 55 ac             	mov    -0x54(%rbp),%edx
  10417b:	3b c2                	cmp    %edx,%eax
  10417d:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104180:	0f 8c 57 ff ff ff    	jl     1040dd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x7d>
  104186:	e9 aa 00 00 00       	jmp    104235 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  10418b:	33 c0                	xor    %eax,%eax
  10418d:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104190:	85 d2                	test   %edx,%edx
  104192:	0f 8e 9d 00 00 00    	jle    104235 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104198:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  10419f:	4c 63 c8             	movslq %eax,%r9
  1041a2:	4e 8b 0c ce          	mov    (%rsi,%r9,8),%r9
  1041a6:	4c 33 4f 48          	xor    0x48(%rdi),%r9
  1041aa:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  1041b1:	c1 7c 51 
  1041b4:	4c 8d 5d c0          	lea    -0x40(%rbp),%r11
  1041b8:	49 8b d1             	mov    %r9,%rdx
  1041bb:	c4 c2 e3 f6 d2       	mulx   %r10,%rbx,%rdx
  1041c0:	49 89 1b             	mov    %rbx,(%r11)
  1041c3:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
  1041c7:	49 33 d1             	xor    %r9,%rdx
  1041ca:	49 0f af d2          	imul   %r10,%rdx
  1041ce:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  1041d2:	4c 8b 4f 70          	mov    0x70(%rdi),%r9
  1041d6:	4c 8d 55 b8          	lea    -0x48(%rbp),%r10
  1041da:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
  1041de:	49 8b d1             	mov    %r9,%rdx
  1041e1:	c4 c2 e3 f6 d3       	mulx   %r11,%rbx,%rdx
  1041e6:	49 89 1a             	mov    %rbx,(%r10)
  1041e9:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
  1041ed:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  1041f2:	48 33 57 48          	xor    0x48(%rdi),%rdx
  1041f6:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
  1041fd:	c1 7c 51 
  104200:	49 0f af d1          	imul   %r9,%rdx
  104204:	4d 8b c8             	mov    %r8,%r9
  104207:	49 33 d3             	xor    %r11,%rdx
  10420a:	49 0f af 51 08       	imul   0x8(%r9),%rdx
  10420f:	4d 8b 09             	mov    (%r9),%r9
  104212:	4c 8d 55 b0          	lea    -0x50(%rbp),%r10
  104216:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
  10421b:	4d 89 1a             	mov    %r11,(%r10)
  10421e:	4c 63 c8             	movslq %eax,%r9
  104221:	4a 89 14 c9          	mov    %rdx,(%rcx,%r9,8)
  104225:	ff c0                	inc    %eax
  104227:	8b 55 ac             	mov    -0x54(%rbp),%edx
  10422a:	3b c2                	cmp    %edx,%eax
  10422c:	89 55 ac             	mov    %edx,-0x54(%rbp)
  10422f:	0f 8c 6a ff ff ff    	jl     10419f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x13f>
  104235:	33 ff                	xor    %edi,%edi
  104237:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  10423b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  10423f:	48 83 c4 60          	add    $0x60,%rsp
  104243:	5b                   	pop    %rbx
  104244:	41 5f                	pop    %r15
  104246:	5d                   	pop    %rbp
  104247:	c3                   	ret
  104248:	48 8d 3d 89 cb 14 00 	lea    0x14cb89(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  10424f:	e8 c0 12 f6 ff       	call   65514 <RhpNewFast>
  104254:	48 8b d8             	mov    %rax,%rbx
  104257:	48 8b fb             	mov    %rbx,%rdi
  10425a:	48 8d 35 5f a2 13 00 	lea    0x13a25f(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104261:	e8 aa 69 f8 ff       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104266:	48 8b fb             	mov    %rbx,%rdi
  104269:	e8 10 15 f6 ff       	call   6577e <RhpThrowEx>
  10426e:	cc                   	int3
  10426f:	90                   	nop
  104270:	90                   	nop
  104271:	90                   	nop
  104272:	90                   	nop
  104273:	90                   	nop
  104274:	90                   	nop
  104275:	90                   	nop
  104276:	90                   	nop
  104277:	90                   	nop
  104278:	90                   	nop
  104279:	90                   	nop
  10427a:	90                   	nop
  10427b:	90                   	nop
  10427c:	90                   	nop
  10427d:	90                   	nop
  10427e:	90                   	nop
  10427f:	90                   	nop

0000000000104280 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart>:
  104280:	55                   	push   %rbp
  104281:	41 57                	push   %r15
  104283:	41 56                	push   %r14
  104285:	41 55                	push   %r13
  104287:	53                   	push   %rbx
  104288:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
  10428f:	48 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%rbp
  104296:	00 
  104297:	33 c0                	xor    %eax,%eax
  104299:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  1042a0:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  1042a5:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  1042ac:	ff ff ff 
  1042af:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  1042b5:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  1042bb:	c5 79 7f 04 28       	vmovdqa %xmm8,(%rax,%rbp,1)
  1042c0:	48 83 c0 30          	add    $0x30,%rax
  1042c4:	75 e9                	jne    1042af <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x2f>
  1042c6:	41 3b d0             	cmp    %r8d,%edx
  1042c9:	0f 85 48 02 00 00    	jne    104517 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x297>
  1042cf:	45 84 c9             	test   %r9b,%r9b
  1042d2:	74 06                	je     1042da <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x5a>
  1042d4:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  1042d8:	eb 02                	jmp    1042dc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x5c>
  1042da:	33 c0                	xor    %eax,%eax
  1042dc:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
  1042e0:	45 33 d2             	xor    %r10d,%r10d
  1042e3:	85 d2                	test   %edx,%edx
  1042e5:	4c 0f 45 d6          	cmovne %rsi,%r10
  1042e9:	4c 89 55 d8          	mov    %r10,-0x28(%rbp)
  1042ed:	49 8b f2             	mov    %r10,%rsi
  1042f0:	45 33 d2             	xor    %r10d,%r10d
  1042f3:	45 85 c0             	test   %r8d,%r8d
  1042f6:	4c 0f 45 d1          	cmovne %rcx,%r10
  1042fa:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
  1042fe:	49 8b ca             	mov    %r10,%rcx
  104301:	85 c0                	test   %eax,%eax
  104303:	0f 84 09 01 00 00    	je     104412 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x192>
  104309:	33 c0                	xor    %eax,%eax
  10430b:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104311:	85 d2                	test   %edx,%edx
  104313:	0f 8e e4 01 00 00    	jle    1044fd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104319:	4c 8d 47 78          	lea    0x78(%rdi),%r8
  10431d:	4c 8d 57 68          	lea    0x68(%rdi),%r10
  104321:	4c 8d 9f 80 00 00 00 	lea    0x80(%rdi),%r11
  104328:	48 63 d8             	movslq %eax,%rbx
  10432b:	48 8b 1c de          	mov    (%rsi,%rbx,8),%rbx
  10432f:	48 33 5f 48          	xor    0x48(%rdi),%rbx
  104333:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  10433a:	c1 7c 51 
  10433d:	4c 8d 75 c0          	lea    -0x40(%rbp),%r14
  104341:	48 8b d3             	mov    %rbx,%rdx
  104344:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104349:	4d 89 2e             	mov    %r13,(%r14)
  10434c:	48 8b 5d c0          	mov    -0x40(%rbp),%rbx
  104350:	48 33 d3             	xor    %rbx,%rdx
  104353:	49 0f af d7          	imul   %r15,%rdx
  104357:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  10435e:	49 8b d8             	mov    %r8,%rbx
  104361:	48 8b 1b             	mov    (%rbx),%rbx
  104364:	4c 8d 7d b8          	lea    -0x48(%rbp),%r15
  104368:	4c 8b b5 68 ff ff ff 	mov    -0x98(%rbp),%r14
  10436f:	48 8b d3             	mov    %rbx,%rdx
  104372:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104377:	4d 89 2f             	mov    %r13,(%r15)
  10437a:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  10437e:	0f b6 14 13          	movzbl (%rbx,%rdx,1),%edx
  104382:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  104386:	49 8b da             	mov    %r10,%rbx
  104389:	48 8b 1b             	mov    (%rbx),%rbx
  10438c:	4c 8d 7d a8          	lea    -0x58(%rbp),%r15
  104390:	48 8b d3             	mov    %rbx,%rdx
  104393:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104398:	4d 89 2f             	mov    %r13,(%r15)
  10439b:	48 0f af 57 18       	imul   0x18(%rdi),%rdx
  1043a0:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
  1043a4:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
  1043a8:	48 33 5f 48          	xor    0x48(%rdi),%rbx
  1043ac:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  1043b3:	c1 7c 51 
  1043b6:	49 0f af df          	imul   %r15,%rbx
  1043ba:	4d 8b fb             	mov    %r11,%r15
  1043bd:	49 33 de             	xor    %r14,%rbx
  1043c0:	49 0f af 5f 08       	imul   0x8(%r15),%rbx
  1043c5:	4d 8b 3f             	mov    (%r15),%r15
  1043c8:	4c 8d 75 a0          	lea    -0x60(%rbp),%r14
  1043cc:	48 8b d3             	mov    %rbx,%rdx
  1043cf:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  1043d4:	4d 89 2e             	mov    %r13,(%r14)
  1043d7:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
  1043db:	48 03 d3             	add    %rbx,%rdx
  1043de:	49 3b d1             	cmp    %r9,%rdx
  1043e1:	72 0d                	jb     1043f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x170>
  1043e3:	41 2b d1             	sub    %r9d,%edx
  1043e6:	48 8b 5f 58          	mov    0x58(%rdi),%rbx
  1043ea:	48 63 d2             	movslq %edx,%rdx
  1043ed:	8b 14 93             	mov    (%rbx,%rdx,4),%edx
  1043f0:	48 63 d8             	movslq %eax,%rbx
  1043f3:	48 89 14 d9          	mov    %rdx,(%rcx,%rbx,8)
  1043f7:	ff c0                	inc    %eax
  1043f9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  1043ff:	3b c2                	cmp    %edx,%eax
  104401:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104407:	0f 8c 1b ff ff ff    	jl     104328 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0xa8>
  10440d:	e9 eb 00 00 00       	jmp    1044fd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104412:	33 c0                	xor    %eax,%eax
  104414:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  10441a:	85 d2                	test   %edx,%edx
  10441c:	0f 8e db 00 00 00    	jle    1044fd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104422:	4c 8d 47 78          	lea    0x78(%rdi),%r8
  104426:	4c 8d 57 68          	lea    0x68(%rdi),%r10
  10442a:	4c 8d 9f 80 00 00 00 	lea    0x80(%rdi),%r11
  104431:	4c 63 c8             	movslq %eax,%r9
  104434:	4e 8b 0c ce          	mov    (%rsi,%r9,8),%r9
  104438:	4c 33 4f 48          	xor    0x48(%rdi),%r9
  10443c:	48 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rbx
  104443:	c1 7c 51 
  104446:	4c 8d 7d 90          	lea    -0x70(%rbp),%r15
  10444a:	49 8b d1             	mov    %r9,%rdx
  10444d:	c4 e2 8b f6 d3       	mulx   %rbx,%r14,%rdx
  104452:	4d 89 37             	mov    %r14,(%r15)
  104455:	4c 8b 4d 90          	mov    -0x70(%rbp),%r9
  104459:	49 33 d1             	xor    %r9,%rdx
  10445c:	48 0f af d3          	imul   %rbx,%rdx
  104460:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  104467:	4d 8b c8             	mov    %r8,%r9
  10446a:	4d 8b 09             	mov    (%r9),%r9
  10446d:	48 8d 5d 88          	lea    -0x78(%rbp),%rbx
  104471:	4c 8b bd 60 ff ff ff 	mov    -0xa0(%rbp),%r15
  104478:	49 8b d1             	mov    %r9,%rdx
  10447b:	c4 c2 8b f6 d7       	mulx   %r15,%r14,%rdx
  104480:	4c 89 33             	mov    %r14,(%rbx)
  104483:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
  104487:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  10448c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  104490:	4d 8b ca             	mov    %r10,%r9
  104493:	4d 8b 09             	mov    (%r9),%r9
  104496:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
  10449a:	49 8b d1             	mov    %r9,%rdx
  10449d:	c4 42 8b f6 cf       	mulx   %r15,%r14,%r9
  1044a2:	4c 89 33             	mov    %r14,(%rbx)
  1044a5:	4c 0f af 4f 18       	imul   0x18(%rdi),%r9
  1044aa:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
  1044ae:	48 33 57 48          	xor    0x48(%rdi),%rdx
  1044b2:	48 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rbx
  1044b9:	c1 7c 51 
  1044bc:	48 0f af d3          	imul   %rbx,%rdx
  1044c0:	49 8b db             	mov    %r11,%rbx
  1044c3:	49 33 d7             	xor    %r15,%rdx
  1044c6:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  1044cb:	48 8b 1b             	mov    (%rbx),%rbx
  1044ce:	4c 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%r15
  1044d5:	c4 e2 8b f6 d3       	mulx   %rbx,%r14,%rdx
  1044da:	4d 89 37             	mov    %r14,(%r15)
  1044dd:	49 03 d1             	add    %r9,%rdx
  1044e0:	4c 63 c8             	movslq %eax,%r9
  1044e3:	4a 89 14 c9          	mov    %rdx,(%rcx,%r9,8)
  1044e7:	ff c0                	inc    %eax
  1044e9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  1044ef:	3b c2                	cmp    %edx,%eax
  1044f1:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  1044f7:	0f 8c 34 ff ff ff    	jl     104431 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x1b1>
  1044fd:	33 ff                	xor    %edi,%edi
  1044ff:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  104503:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  104507:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
  10450e:	5b                   	pop    %rbx
  10450f:	41 5d                	pop    %r13
  104511:	41 5e                	pop    %r14
  104513:	41 5f                	pop    %r15
  104515:	5d                   	pop    %rbp
  104516:	c3                   	ret
  104517:	48 8d 3d ba c8 14 00 	lea    0x14c8ba(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  10451e:	e8 f1 0f f6 ff       	call   65514 <RhpNewFast>
  104523:	48 8b d8             	mov    %rax,%rbx
  104526:	48 8b fb             	mov    %rbx,%rdi
  104529:	48 8d 35 90 9f 13 00 	lea    0x139f90(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104530:	e8 db 66 f8 ff       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104535:	48 8b fb             	mov    %rbx,%rdi
  104538:	e8 41 12 f6 ff       	call   6577e <RhpThrowEx>
  10453d:	cc                   	int3
  10453e:	90                   	nop
  10453f:	90                   	nop

