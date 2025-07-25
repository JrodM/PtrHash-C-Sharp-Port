   77384:	e8 27 07 00 00       	call   77ab0 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>
   77389:	e8 f2 08 00 00       	call   77c80 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>
   7738e:	e8 8d 0e 00 00       	call   78220 <ASM_Analysis_AsmGeneration_Program__TestSingleLookups>
   77393:	e8 e8 11 00 00       	call   78580 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern>
   77398:	48 8d 3d d1 3a 1c 00 	lea    0x1c3ad1(%rip),%rdi        # 23ae70 <__Str_Assembly_generation_complete__E694E220ABB5E659C8FE3A93D59496D8C08AFB825EDBB706847AAF14012E93FD>
   7739f:	e8 ac 53 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   773a4:	48 8d 3d e5 43 1c 00 	lea    0x1c43e5(%rip),%rdi        # 23b790 <__Str_Check_output_for_JIT_generated_E88BF50A10FDFF15CB02EFCA372E5395BD12F2100779560FE4DB5574C46B7085>
   773ab:	e8 a0 53 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   773b0:	90                   	nop
   773b1:	48 83 c4 60          	add    $0x60,%rsp
   773b5:	5b                   	pop    %rbx
   773b6:	41 5d                	pop    %r13
   773b8:	41 5e                	pop    %r14
   773ba:	41 5f                	pop    %r15
   773bc:	5d                   	pop    %rbp
   773bd:	c3                   	ret
   773be:	e8 7d b4 01 00       	call   92840 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
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

   774ac:	e8 4f d1 08 00       	call   104600 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   774b1:	eb 0b                	jmp    774be <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xde>
   774b3:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   774b9:	e8 a2 d6 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   774be:	48 8b 0d 0b a6 1a 00 	mov    0x1aa60b(%rip),%rcx        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   774c5:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   774c9:	4d 85 ff             	test   %r15,%r15
   774cc:	75 06                	jne    774d4 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xf4>
   774ce:	33 f6                	xor    %esi,%esi
   774d0:	33 d2                	xor    %edx,%edx
   774d2:	eb 08                	jmp    774dc <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xfc>
   774d4:	49 8d 77 10          	lea    0x10(%r15),%rsi
   774d8:	41 8b 57 08          	mov    0x8(%r15),%edx
   774dc:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   774e0:	41 b8 64 00 00 00    	mov    $0x64,%r8d
   774e6:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   774ea:	74 0a                	je     774f6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x116>
   774ec:	45 33 c9             	xor    %r9d,%r9d
   774ef:	e8 0c d1 08 00       	call   104600 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   774f4:	eb 08                	jmp    774fe <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x11e>
   774f6:	45 33 c9             	xor    %r9d,%r9d
   774f9:	e8 62 d6 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   774fe:	48 8b 15 cb a5 1a 00 	mov    0x1aa5cb(%rip),%rdx        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77505:	4c 8b 72 18          	mov    0x18(%rdx),%r14
   77509:	4d 85 ff             	test   %r15,%r15
   7750c:	75 06                	jne    77514 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x134>
   7750e:	33 d2                	xor    %edx,%edx
   77510:	33 ff                	xor    %edi,%edi
   77512:	eb 08                	jmp    7751c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x13c>
   77514:	49 8d 57 10          	lea    0x10(%r15),%rdx
   77518:	41 8b 7f 08          	mov    0x8(%r15),%edi
   7751c:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   77520:	b8 64 00 00 00       	mov    $0x64,%eax
   77525:	41 80 7e 55 00       	cmpb   $0x0,0x55(%r14)
   7752a:	0f 84 b5 01 00 00    	je     776e5 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x305>
   77530:	3b f8                	cmp    %eax,%edi
   77532:	0f 85 21 05 00 00    	jne    77a59 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x679>
   77538:	41 0f b6 4e 54       	movzbl 0x54(%r14),%ecx
   7753d:	4d 8b 46 38          	mov    0x38(%r14),%r8
   77541:	45 33 c9             	xor    %r9d,%r9d
   77544:	85 ff                	test   %edi,%edi
   77546:	4c 0f 45 ca          	cmovne %rdx,%r9
   7754a:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
   7754e:	33 d2                	xor    %edx,%edx
   77550:	85 c0                	test   %eax,%eax
   77552:	48 0f 45 d6          	cmovne %rsi,%rdx
   77556:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   7755a:	48 8b f2             	mov    %rdx,%rsi
   7755d:	85 c9                	test   %ecx,%ecx
   7755f:	0f 84 c4 00 00 00    	je     77629 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x249>
   77565:	33 c0                	xor    %eax,%eax
   77567:	85 ff                	test   %edi,%edi
   77569:	0f 8e 67 01 00 00    	jle    776d6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   7756f:	4d 8d ae 80 00 00 00 	lea    0x80(%r14),%r13
   77576:	48 63 d0             	movslq %eax,%rdx
   77579:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   7757d:	49 33 56 48          	xor    0x48(%r14),%rdx
   77581:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77588:	c1 7c 51 
   7758b:	4c 8d 55 c0          	lea    -0x40(%rbp),%r10
   7758f:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77594:	4d 89 1a             	mov    %r11,(%r10)
   77597:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   7759b:	48 33 d1             	xor    %rcx,%rdx
   7759e:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   775a5:	c1 7c 51 
   775a8:	48 0f af d1          	imul   %rcx,%rdx
   775ac:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
   775b3:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   775b7:	4c 8d 55 b8          	lea    -0x48(%rbp),%r10
   775bb:	4c 8b 9d 28 ff ff ff 	mov    -0xd8(%rbp),%r11
   775c2:	48 8b d1             	mov    %rcx,%rdx
   775c5:	c4 c2 9b f6 d3       	mulx   %r11,%r12,%rdx
   775ca:	4d 89 22             	mov    %r12,(%r10)
   775cd:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   775d1:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   775d5:	49 33 56 48          	xor    0x48(%r14),%rdx
   775d9:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   775e0:	c1 7c 51 
   775e3:	48 0f af d1          	imul   %rcx,%rdx
   775e7:	49 8b cd             	mov    %r13,%rcx
   775ea:	49 33 d3             	xor    %r11,%rdx
   775ed:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   775f2:	48 8b 09             	mov    (%rcx),%rcx
   775f5:	4c 8d 55 b0          	lea    -0x50(%rbp),%r10
   775f9:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   775fe:	4d 89 1a             	mov    %r11,(%r10)
   77601:	49 3b d0             	cmp    %r8,%rdx
   77604:	72 0d                	jb     77613 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x233>
   77606:	41 2b d0             	sub    %r8d,%edx
   77609:	49 8b 4e 58          	mov    0x58(%r14),%rcx
   7760d:	48 63 d2             	movslq %edx,%rdx
   77610:	8b 14 91             	mov    (%rcx,%rdx,4),%edx
   77613:	48 63 c8             	movslq %eax,%rcx
   77616:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   7761a:	ff c0                	inc    %eax
   7761c:	3b c7                	cmp    %edi,%eax
   7761e:	0f 8c 52 ff ff ff    	jl     77576 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x196>
   77624:	e9 ad 00 00 00       	jmp    776d6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   77629:	33 c0                	xor    %eax,%eax
   7762b:	85 ff                	test   %edi,%edi
   7762d:	0f 8e a3 00 00 00    	jle    776d6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   77633:	4d 8d ae 80 00 00 00 	lea    0x80(%r14),%r13
   7763a:	48 63 d0             	movslq %eax,%rdx
   7763d:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77641:	49 33 56 48          	xor    0x48(%r14),%rdx
   77645:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   7764c:	c1 7c 51 
   7764f:	4c 8d 45 a8          	lea    -0x58(%rbp),%r8
   77653:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77658:	4d 89 10             	mov    %r10,(%r8)
   7765b:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
   7765f:	48 33 d1             	xor    %rcx,%rdx
   77662:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77669:	c1 7c 51 
   7766c:	48 0f af d1          	imul   %rcx,%rdx
   77670:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
   77677:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   7767b:	4c 8d 45 a0          	lea    -0x60(%rbp),%r8
   7767f:	4c 8b 95 20 ff ff ff 	mov    -0xe0(%rbp),%r10
   77686:	48 8b d1             	mov    %rcx,%rdx
   77689:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   7768e:	4d 89 18             	mov    %r11,(%r8)
   77691:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77695:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77699:	49 33 56 48          	xor    0x48(%r14),%rdx
   7769d:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   776a4:	c1 7c 51 
   776a7:	48 0f af d1          	imul   %rcx,%rdx
   776ab:	49 8b cd             	mov    %r13,%rcx
   776ae:	49 33 d2             	xor    %r10,%rdx
   776b1:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   776b6:	48 8b 09             	mov    (%rcx),%rcx
   776b9:	4c 8d 45 98          	lea    -0x68(%rbp),%r8
   776bd:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   776c2:	4d 89 10             	mov    %r10,(%r8)
   776c5:	48 63 c8             	movslq %eax,%rcx
   776c8:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   776cc:	ff c0                	inc    %eax
   776ce:	3b c7                	cmp    %edi,%eax
   776d0:	0f 8c 64 ff ff ff    	jl     7763a <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x25a>
   776d6:	33 d2                	xor    %edx,%edx
   776d8:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   776dc:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   776e0:	e9 62 02 00 00       	jmp    77947 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x567>
   776e5:	44 8b e7             	mov    %edi,%r12d
   776e8:	48 8b fe             	mov    %rsi,%rdi
   776eb:	8b f0                	mov    %eax,%esi
   776ed:	44 3b e6             	cmp    %esi,%r12d
   776f0:	0f 85 89 03 00 00    	jne    77a7f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x69f>
   776f6:	41 0f b6 46 54       	movzbl 0x54(%r14),%eax
   776fb:	49 8b 4e 38          	mov    0x38(%r14),%rcx
   776ff:	45 33 c0             	xor    %r8d,%r8d
   77702:	45 85 e4             	test   %r12d,%r12d
   77705:	4c 0f 45 c2          	cmovne %rdx,%r8
   77709:	4c 89 45 90          	mov    %r8,-0x70(%rbp)
   7770d:	4d 8b e8             	mov    %r8,%r13
   77710:	33 d2                	xor    %edx,%edx
   77712:	85 f6                	test   %esi,%esi
   77714:	48 0f 45 d7          	cmovne %rdi,%rdx
   77718:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   7771c:	4c 8b c2             	mov    %rdx,%r8
   7771f:	4c 89 45 80          	mov    %r8,-0x80(%rbp)
   77723:	85 c0                	test   %eax,%eax
   77725:	0f 84 22 01 00 00    	je     7784d <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x46d>
   7772b:	33 ff                	xor    %edi,%edi
   7772d:	45 85 e4             	test   %r12d,%r12d
   77730:	0f 8e 07 02 00 00    	jle    7793d <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   77736:	49 8d 76 78          	lea    0x78(%r14),%rsi
   7773a:	48 89 b5 00 ff ff ff 	mov    %rsi,-0x100(%rbp)
   77741:	49 8d 96 80 00 00 00 	lea    0x80(%r14),%rdx
   77748:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
   7774f:	48 63 c7             	movslq %edi,%rax
   77752:	49 8b 44 c5 00       	mov    0x0(%r13,%rax,8),%rax
   77757:	49 33 46 48          	xor    0x48(%r14),%rax
   7775b:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
   77762:	c1 7c 51 
   77765:	4c 8d 95 68 ff ff ff 	lea    -0x98(%rbp),%r10
   7776c:	48 8b d0             	mov    %rax,%rdx
   7776f:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
   77774:	4d 89 1a             	mov    %r11,(%r10)
   77777:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   7777e:	48 33 d0             	xor    %rax,%rdx
   77781:	49 0f af d1          	imul   %r9,%rdx
   77785:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
   7778c:	48 8b c6             	mov    %rsi,%rax
   7778f:	48 8b 00             	mov    (%rax),%rax
   77792:	4c 8d 8d 60 ff ff ff 	lea    -0xa0(%rbp),%r9
   77799:	4c 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%r10
   777a0:	48 8b d0             	mov    %rax,%rdx
   777a3:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   777a8:	4d 89 19             	mov    %r11,(%r9)
   777ab:	49 8b 46 08          	mov    0x8(%r14),%rax
   777af:	0f b6 14 10          	movzbl (%rax,%rdx,1),%edx
   777b3:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
   777ba:	49 8d 46 68          	lea    0x68(%r14),%rax
   777be:	48 8b 00             	mov    (%rax),%rax
   777c1:	4c 8d 8d 58 ff ff ff 	lea    -0xa8(%rbp),%r9
   777c8:	48 8b d0             	mov    %rax,%rdx
   777cb:	c4 c2 a3 f6 c2       	mulx   %r10,%r11,%rax
   777d0:	4d 89 19             	mov    %r11,(%r9)
   777d3:	49 0f af 46 18       	imul   0x18(%r14),%rax
   777d8:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
   777df:	49 33 56 48          	xor    0x48(%r14),%rdx
   777e3:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
   777ea:	c1 7c 51 
   777ed:	49 0f af d1          	imul   %r9,%rdx
   777f1:	4c 8b 8d 08 ff ff ff 	mov    -0xf8(%rbp),%r9
   777f8:	4d 8b d9             	mov    %r9,%r11
   777fb:	49 33 d2             	xor    %r10,%rdx
   777fe:	49 0f af 53 08       	imul   0x8(%r11),%rdx
   77803:	4d 8b 13             	mov    (%r11),%r10
   77806:	4c 8d 9d 50 ff ff ff 	lea    -0xb0(%rbp),%r11
   7780d:	c4 c2 cb f6 d2       	mulx   %r10,%rsi,%rdx
   77812:	49 89 33             	mov    %rsi,(%r11)
   77815:	48 03 c2             	add    %rdx,%rax
   77818:	48 3b c1             	cmp    %rcx,%rax
   7781b:	72 0b                	jb     77828 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x448>
   7781d:	2b c1                	sub    %ecx,%eax
   7781f:	49 8b 76 58          	mov    0x58(%r14),%rsi
   77823:	48 98                	cltq
   77825:	8b 04 86             	mov    (%rsi,%rax,4),%eax
   77828:	48 63 f7             	movslq %edi,%rsi
   7782b:	49 89 04 f0          	mov    %rax,(%r8,%rsi,8)
   7782f:	ff c7                	inc    %edi
   77831:	41 3b fc             	cmp    %r12d,%edi
   77834:	4c 89 8d 08 ff ff ff 	mov    %r9,-0xf8(%rbp)
   7783b:	48 8b b5 00 ff ff ff 	mov    -0x100(%rbp),%rsi
   77842:	0f 8c 07 ff ff ff    	jl     7774f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x36f>
   77848:	e9 f0 00 00 00       	jmp    7793d <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   7784d:	33 c0                	xor    %eax,%eax
   7784f:	45 85 e4             	test   %r12d,%r12d
   77852:	0f 8e e5 00 00 00    	jle    7793d <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   77858:	89 85 7c ff ff ff    	mov    %eax,-0x84(%rbp)
   7785e:	48 63 f8             	movslq %eax,%rdi
   77861:	49 8b 7c fd 00       	mov    0x0(%r13,%rdi,8),%rdi
   77866:	49 8b 76 48          	mov    0x48(%r14),%rsi
   7786a:	e8 81 29 00 00       	call   7a1f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__Hash>
   7786f:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
   77876:	49 8b fe             	mov    %r14,%rdi
   77879:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   77880:	e8 5b c3 08 00       	call   103be0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__Bucket>
   77885:	49 8b 7e 08          	mov    0x8(%r14),%rdi
   77889:	0f b6 04 07          	movzbl (%rdi,%rax,1),%eax
   7788d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
   77894:	49 8d 76 68          	lea    0x68(%r14),%rsi
   77898:	48 8b 36             	mov    (%rsi),%rsi
   7789b:	48 8b fe             	mov    %rsi,%rdi
   7789e:	33 f6                	xor    %esi,%esi
   778a0:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
   778a7:	33 c9                	xor    %ecx,%ecx
   778a9:	e8 92 c5 01 00       	call   93e40 <S_P_CoreLib_System_UInt128__op_Multiply>
   778ae:	48 8b f8             	mov    %rax,%rdi
   778b1:	48 8b f2             	mov    %rdx,%rsi
   778b4:	ba 40 00 00 00       	mov    $0x40,%edx
   778b9:	e8 c2 c5 01 00       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   778be:	49 0f af 46 18       	imul   0x18(%r14),%rax
   778c3:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
   778ca:	48 8b bd 48 ff ff ff 	mov    -0xb8(%rbp),%rdi
   778d1:	49 33 7e 48          	xor    0x48(%r14),%rdi
   778d5:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
   778dc:	c1 7c 51 
   778df:	48 0f af fe          	imul   %rsi,%rdi
   778e3:	4d 8d 8e 80 00 00 00 	lea    0x80(%r14),%r9
   778ea:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   778f1:	48 33 fe             	xor    %rsi,%rdi
   778f4:	49 0f af 79 08       	imul   0x8(%r9),%rdi
   778f9:	49 8b 11             	mov    (%r9),%rdx
   778fc:	33 f6                	xor    %esi,%esi
   778fe:	33 c9                	xor    %ecx,%ecx
   77900:	e8 3b c5 01 00       	call   93e40 <S_P_CoreLib_System_UInt128__op_Multiply>
   77905:	48 8b f8             	mov    %rax,%rdi
   77908:	48 8b f2             	mov    %rdx,%rsi
   7790b:	ba 40 00 00 00       	mov    $0x40,%edx
   77910:	e8 6b c5 01 00       	call   93e80 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   77915:	48 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%rdi
   7791c:	48 03 f8             	add    %rax,%rdi
   7791f:	8b b5 7c ff ff ff    	mov    -0x84(%rbp),%esi
   77925:	48 63 c6             	movslq %esi,%rax
   77928:	4c 8b 45 80          	mov    -0x80(%rbp),%r8
   7792c:	49 89 3c c0          	mov    %rdi,(%r8,%rax,8)
   77930:	ff c6                	inc    %esi
   77932:	41 3b f4             	cmp    %r12d,%esi
   77935:	8b c6                	mov    %esi,%eax
   77937:	0f 8c 1b ff ff ff    	jl     77858 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x478>
   7793d:	33 ff                	xor    %edi,%edi
   7793f:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
   77943:	48 89 7d 90          	mov    %rdi,-0x70(%rbp)
   77947:	48 8b 3d 82 a1 1a 00 	mov    0x1aa182(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   7794e:	4c 8b 77 18          	mov    0x18(%rdi),%r14
   77952:	4d 85 ff             	test   %r15,%r15
   77955:	75 08                	jne    7795f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x57f>
   77957:	45 33 ed             	xor    %r13d,%r13d
   7795a:	45 33 e4             	xor    %r12d,%r12d
   7795d:	eb 08                	jmp    77967 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x587>
   7795f:	4d 8d 6f 10          	lea    0x10(%r15),%r13
   77963:	45 8b 67 08          	mov    0x8(%r15),%r12d
   77967:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   7796b:	c5 fa 7f 85 30 ff ff 	vmovdqu %xmm0,-0xd0(%rbp)
   77972:	ff 
   77973:	48 8d bd 30 ff ff ff 	lea    -0xd0(%rbp),%rdi
   7797a:	48 8b f3             	mov    %rbx,%rsi
   7797d:	e8 4e 0b 09 00       	call   1084d0 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   77982:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
   77989:	44 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%r8d
   77990:	49 8b f5             	mov    %r13,%rsi
   77993:	41 8b d4             	mov    %r12d,%edx
   77996:	49 8b fe             	mov    %r14,%rdi
   77999:	45 33 c9             	xor    %r9d,%r9d
   7799c:	39 3f                	cmp    %edi,(%rdi)
   7799e:	e8 bd c3 08 00       	call   103d60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>
   779a3:	33 db                	xor    %ebx,%ebx
   779a5:	4d 85 ff             	test   %r15,%r15
   779a8:	74 42                	je     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   779aa:	41 83 7f 08 64       	cmpl   $0x64,0x8(%r15)
   779af:	7c 3b                	jl     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   779b1:	48 8b 3d 18 a1 1a 00 	mov    0x1aa118(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779b8:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779bc:	8b f3                	mov    %ebx,%esi
   779be:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   779c3:	39 3f                	cmp    %edi,(%rdi)
   779c5:	e8 a6 be 08 00       	call   103870 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   779ca:	48 8b 3d ff a0 1a 00 	mov    0x1aa0ff(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779d1:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779d5:	8b f3                	mov    %ebx,%esi
   779d7:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   779dc:	39 3f                	cmp    %edi,(%rdi)
   779de:	e8 5d c0 08 00       	call   103a40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   779e3:	ff c3                	inc    %ebx
   779e5:	83 fb 64             	cmp    $0x64,%ebx
   779e8:	7c c7                	jl     779b1 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x5d1>
   779ea:	eb 43                	jmp    77a2f <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x64f>
   779ec:	48 8b 3d dd a0 1a 00 	mov    0x1aa0dd(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   779f3:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   779f7:	41 3b 5f 08          	cmp    0x8(%r15),%ebx
   779fb:	0f 83 a4 00 00 00    	jae    77aa5 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x6c5>
   77a01:	8b f3                	mov    %ebx,%esi
   77a03:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77a08:	39 3f                	cmp    %edi,(%rdi)
   77a0a:	e8 61 be 08 00       	call   103870 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77a0f:	48 8b 3d ba a0 1a 00 	mov    0x1aa0ba(%rip),%rdi        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77a16:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77a1a:	8b f3                	mov    %ebx,%esi
   77a1c:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77a21:	39 3f                	cmp    %edi,(%rdi)
   77a23:	e8 18 c0 08 00       	call   103a40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77a28:	ff c3                	inc    %ebx
   77a2a:	83 fb 64             	cmp    $0x64,%ebx
   77a2d:	7c bd                	jl     779ec <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77a2f:	48 8d 3d 82 79 1c 00 	lea    0x1c7982(%rip),%rdi        # 23f3b8 <__Str_JIT_warmup_complete__0DAE2BD7E8651565932C6EA373EC942BC13BA8E721DA0F4E914F424C749DD85D>
   77a36:	e8 15 4d 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
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
   77a53:	e8 38 85 00 00       	call   7ff90 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   77a58:	cc                   	int3
   77a59:	48 8d 3d 78 a3 1d 00 	lea    0x1da378(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77a60:	e8 af da fe ff       	call   65514 <RhpNewFast>
   77a65:	48 8b d8             	mov    %rax,%rbx
   77a68:	48 8b fb             	mov    %rbx,%rdi
   77a6b:	48 8d 35 4e 7a 1c 00 	lea    0x1c7a4e(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77a72:	e8 f9 31 01 00       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77a77:	48 8b fb             	mov    %rbx,%rdi
   77a7a:	e8 ff dc fe ff       	call   6577e <RhpThrowEx>
   77a7f:	48 8d 3d 52 a3 1d 00 	lea    0x1da352(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77a86:	e8 89 da fe ff       	call   65514 <RhpNewFast>
   77a8b:	48 8b d8             	mov    %rax,%rbx
   77a8e:	48 8b fb             	mov    %rbx,%rdi
   77a91:	48 8d 35 28 7a 1c 00 	lea    0x1c7a28(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77a98:	e8 d3 31 01 00       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77a9d:	48 8b fb             	mov    %rbx,%rdi
   77aa0:	e8 d9 dc fe ff       	call   6577e <RhpThrowEx>
   77aa5:	e8 16 31 05 00       	call   cabc0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   77aaa:	cc                   	int3
   77aab:	90                   	nop
   77aac:	90                   	nop
   77aad:	90                   	nop
   77aae:	90                   	nop
   77aaf:	90                   	nop

0000000000077ab0 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>:
   77ab0:	55                   	push   %rbp
   77ab1:	41 57                	push   %r15
   77ab3:	41 56                	push   %r14
   77ab5:	53                   	push   %rbx
   77ab6:	48 83 ec 28          	sub    $0x28,%rsp
   77aba:	c5 f8 77             	vzeroupper
   77abd:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   77ac2:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
   77ac7:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
   77acc:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
   77ad1:	33 c0                	xor    %eax,%eax
   77ad3:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   77ad7:	48 8d 3d 7a bb 1c 00 	lea    0x1cbb7a(%rip),%rdi        # 243658 <__Str_Testing_GetIndicesStreamPrefet_DFEC981FE3992F56C08A364E99D8E9725ED1C914578F7F525692F9A2069E1387>
   77ade:	e8 6d 4c 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   77ae3:	48 8b 1d e6 9f 1a 00 	mov    0x1a9fe6(%rip),%rbx        # 221ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77aea:	4c 8b 7b 10          	mov    0x10(%rbx),%r15
   77aee:	41 8b 77 08          	mov    0x8(%r15),%esi
   77af2:	48 8d 3d 57 15 21 00 	lea    0x211557(%rip),%rdi        # 289050 <_ZTV16__Array<UIntPtr>>
   77af9:	e8 2c db fe ff       	call   6562a <RhpNewArray>
   77afe:	4c 8b f0             	mov    %rax,%r14
   77b01:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   77b05:	4d 85 ff             	test   %r15,%r15
   77b08:	75 06                	jne    77b10 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x60>
   77b0a:	33 f6                	xor    %esi,%esi
   77b0c:	33 d2                	xor    %edx,%edx
   77b0e:	eb 08                	jmp    77b18 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x68>
   77b10:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77b14:	41 8b 57 08          	mov    0x8(%r15),%edx
   77b18:	49 8d 4e 10          	lea    0x10(%r14),%rcx
   77b1c:	45 8b 46 08          	mov    0x8(%r14),%r8d
   77b20:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   77b24:	74 0d                	je     77b33 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x83>
   77b26:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77b2c:	e8 cf ca 08 00       	call   104600 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77b31:	eb 0b                	jmp    77b3e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x8e>
   77b33:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77b39:	e8 22 d0 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77b3e:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   77b42:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
   77b46:	48 85 c9             	test   %rcx,%rcx
   77b49:	75 06                	jne    77b51 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xa1>
   77b4b:	33 f6                	xor    %esi,%esi
   77b4d:	33 d2                	xor    %edx,%edx
   77b4f:	eb 07                	jmp    77b58 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xa8>
   77b51:	48 8d 71 10          	lea    0x10(%rcx),%rsi
   77b55:	8b 51 08             	mov    0x8(%rcx),%edx
   77b58:	49 8d 4e 10          	lea    0x10(%r14),%rcx
   77b5c:	45 8b 46 08          	mov    0x8(%r14),%r8d
   77b60:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   77b64:	74 0a                	je     77b70 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc0>
   77b66:	45 33 c9             	xor    %r9d,%r9d
   77b69:	e8 92 ca 08 00       	call   104600 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77b6e:	eb 08                	jmp    77b78 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc8>
   77b70:	45 33 c9             	xor    %r9d,%r9d
   77b73:	e8 e8 cf 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77b78:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77b7c:	be 22 00 00 00       	mov    $0x22,%esi
   77b81:	ba 01 00 00 00       	mov    $0x1,%edx
   77b86:	e8 75 93 04 00       	call   c0f00 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
   77b8b:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77b8e:	3b 7d e0             	cmp    -0x20(%rbp),%edi
   77b91:	0f 87 cd 00 00 00    	ja     77c64 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x1b4>
   77b97:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   77b9b:	8b c7                	mov    %edi,%eax
   77b9d:	48 8d 34 46          	lea    (%rsi,%rax,2),%rsi
   77ba1:	8b 45 e0             	mov    -0x20(%rbp),%eax
   77ba4:	2b c7                	sub    %edi,%eax
   77ba6:	83 f8 0c             	cmp    $0xc,%eax
   77ba9:	72 28                	jb     77bd3 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x123>
   77bab:	48 8d 3d ae fa 1b 00 	lea    0x1bfaae(%rip),%rdi        # 237660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77bb2:	48 83 c7 0c          	add    $0xc,%rdi
   77bb6:	c5 fa 6f 07          	vmovdqu (%rdi),%xmm0
   77bba:	c5 fa 6f 4f 08       	vmovdqu 0x8(%rdi),%xmm1
   77bbf:	c5 fa 7f 06          	vmovdqu %xmm0,(%rsi)
   77bc3:	c5 fa 7f 4e 08       	vmovdqu %xmm1,0x8(%rsi)
   77bc8:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77bcb:	83 c7 0c             	add    $0xc,%edi
   77bce:	89 7d d0             	mov    %edi,-0x30(%rbp)
   77bd1:	eb 10                	jmp    77be3 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x133>
   77bd3:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77bd7:	48 8d 35 82 fa 1b 00 	lea    0x1bfa82(%rip),%rsi        # 237660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77bde:	e8 fd 94 04 00       	call   c10e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77be3:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   77be7:	8b 76 08             	mov    0x8(%rsi),%esi
   77bea:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77bee:	e8 ed 7f 0b 00       	call   12fbe0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
   77bf3:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77bf6:	3b 7d e0             	cmp    -0x20(%rbp),%edi
   77bf9:	77 69                	ja     77c64 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x1b4>
   77bfb:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   77bff:	8b c7                	mov    %edi,%eax
   77c01:	48 8d 34 46          	lea    (%rsi,%rax,2),%rsi
   77c05:	8b 45 e0             	mov    -0x20(%rbp),%eax
   77c08:	2b c7                	sub    %edi,%eax
   77c0a:	83 f8 16             	cmp    $0x16,%eax
   77c0d:	72 28                	jb     77c37 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x187>
   77c0f:	48 8d 3d ca fe 1b 00 	lea    0x1bfeca(%rip),%rdi        # 237ae0 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77c16:	48 83 c7 0c          	add    $0xc,%rdi
   77c1a:	c5 fe 6f 07          	vmovdqu (%rdi),%ymm0
   77c1e:	c5 fa 6f 4f 1c       	vmovdqu 0x1c(%rdi),%xmm1
   77c23:	c5 fe 7f 06          	vmovdqu %ymm0,(%rsi)
   77c27:	c5 fa 7f 4e 1c       	vmovdqu %xmm1,0x1c(%rsi)
   77c2c:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77c2f:	83 c7 16             	add    $0x16,%edi
   77c32:	89 7d d0             	mov    %edi,-0x30(%rbp)
   77c35:	eb 10                	jmp    77c47 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x197>
   77c37:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77c3b:	48 8d 35 9e fe 1b 00 	lea    0x1bfe9e(%rip),%rsi        # 237ae0 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77c42:	e8 99 94 04 00       	call   c10e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77c47:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77c4b:	e8 50 93 04 00       	call   c0fa0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   77c50:	48 8b f8             	mov    %rax,%rdi
   77c53:	e8 f8 4a 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   77c58:	90                   	nop
   77c59:	48 83 c4 28          	add    $0x28,%rsp
   77c5d:	5b                   	pop    %rbx
   77c5e:	41 5e                	pop    %r14
   77c60:	41 5f                	pop    %r15
   77c62:	5d                   	pop    %rbp
   77c63:	c3                   	ret
   77c64:	e8 d7 ab 01 00       	call   92840 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   77c69:	cc                   	int3
   77c6a:	90                   	nop
   77c6b:	90                   	nop
   77c6c:	90                   	nop
   77c6d:	90                   	nop
   77c6e:	90                   	nop
   77c6f:	90                   	nop
   77c70:	90                   	nop
   77c71:	90                   	nop
   77c72:	90                   	nop
   77c73:	90                   	nop
   77c74:	90                   	nop
   77c75:	90                   	nop
   77c76:	90                   	nop
   77c77:	90                   	nop
   77c78:	90                   	nop
   77c79:	90                   	nop
   77c7a:	90                   	nop
   77c7b:	90                   	nop
   77c7c:	90                   	nop
   77c7d:	90                   	nop
   77c7e:	90                   	nop
   77c7f:	90                   	nop

   7867a:	e8 81 bf 08 00       	call   104600 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   7867f:	eb 0e                	jmp    7868f <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x10f>
   78681:	49 8b cc             	mov    %r12,%rcx
   78684:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   7868a:	e8 d1 c4 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7868f:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   78693:	4d 85 f6             	test   %r14,%r14
   78696:	75 06                	jne    7869e <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x11e>
   78698:	33 f6                	xor    %esi,%esi
   7869a:	33 d2                	xor    %edx,%edx
   7869c:	eb 08                	jmp    786a6 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x126>
   7869e:	49 8d 76 10          	lea    0x10(%r14),%rsi
   786a2:	41 8b 56 08          	mov    0x8(%r14),%edx
   786a6:	4c 8b 7d d0          	mov    -0x30(%rbp),%r15
   786aa:	49 83 c7 10          	add    $0x10,%r15
   786ae:	49 8b cf             	mov    %r15,%rcx
   786b1:	41 b8 00 02 00 00    	mov    $0x200,%r8d
   786b7:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   786bb:	74 0d                	je     786ca <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x14a>
   786bd:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   786c3:	e8 38 bf 08 00       	call   104600 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   786c8:	eb 0b                	jmp    786d5 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x155>
   786ca:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   786d0:	e8 8b c4 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   786d5:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   786d9:	4d 85 ed             	test   %r13,%r13
   786dc:	75 06                	jne    786e4 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x164>
   786de:	33 f6                	xor    %esi,%esi
   786e0:	33 d2                	xor    %edx,%edx
   786e2:	eb 08                	jmp    786ec <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x16c>
   786e4:	49 8d 75 10          	lea    0x10(%r13),%rsi
   786e8:	41 8b 55 08          	mov    0x8(%r13),%edx
   786ec:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
   786f0:	48 83 c3 10          	add    $0x10,%rbx
   786f4:	48 8b cb             	mov    %rbx,%rcx
   786f7:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
   786fd:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   78701:	74 0d                	je     78710 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x190>
   78703:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78709:	e8 f2 be 08 00       	call   104600 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   7870e:	eb 0b                	jmp    7871b <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x19b>
   78710:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78716:	e8 45 c4 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7871b:	48 8d 3d ae ef 1b 00 	lea    0x1befae(%rip),%rdi        # 2376d0 <__Str___Tested_prefetch_patterns_for_DE81E3DAF059C0B18D33D0B771E134E96E0008DA1110A965332E23E19D043BB8>
   78722:	e8 29 40 00 00       	call   7c750 <System_Console_System_Console__WriteLine_12>
   78727:	90                   	nop
   78728:	48 83 c4 18          	add    $0x18,%rsp
   7872c:	5b                   	pop    %rbx
   7872d:	41 5c                	pop    %r12
   7872f:	41 5d                	pop    %r13
   78731:	41 5e                	pop    %r14
   78733:	41 5f                	pop    %r15
   78735:	5d                   	pop    %rbp
   78736:	c3                   	ret
   78737:	bf 10 00 00 00       	mov    $0x10,%edi
   7873c:	e8 4f 78 00 00       	call   7ff90 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   78741:	cc                   	int3
   78742:	90                   	nop
   78743:	90                   	nop
   78744:	90                   	nop
   78745:	90                   	nop
   78746:	90                   	nop
   78747:	90                   	nop
   78748:	90                   	nop
   78749:	90                   	nop
   7874a:	90                   	nop
   7874b:	90                   	nop
   7874c:	90                   	nop
   7874d:	90                   	nop
   7874e:	90                   	nop
   7874f:	90                   	nop

0000000000104600 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>:
  104600:	55                   	push   %rbp
  104601:	41 57                	push   %r15
  104603:	41 56                	push   %r14
  104605:	41 55                	push   %r13
  104607:	41 54                	push   %r12
  104609:	53                   	push   %rbx
  10460a:	48 81 ec 08 01 00 00 	sub    $0x108,%rsp
  104611:	c5 f8 77             	vzeroupper
  104614:	48 8d ac 24 30 01 00 	lea    0x130(%rsp),%rbp
  10461b:	00 
  10461c:	33 c0                	xor    %eax,%eax
  10461e:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  104622:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  104626:	48 8b 05 e3 7d 0b 00 	mov    0xb7de3(%rip),%rax        # 1bc410 <__security_cookie>
  10462d:	48 89 85 e0 fe ff ff 	mov    %rax,-0x120(%rbp)
  104634:	48 8b df             	mov    %rdi,%rbx
  104637:	44 8b fa             	mov    %edx,%r15d
  10463a:	45 3b f8             	cmp    %r8d,%r15d
  10463d:	0f 85 f2 04 00 00    	jne    104b35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x535>
  104643:	45 84 c9             	test   %r9b,%r9b
  104646:	74 06                	je     10464e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x4e>
  104648:	0f b6 53 54          	movzbl 0x54(%rbx),%edx
  10464c:	eb 02                	jmp    104650 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x50>
  10464e:	33 d2                	xor    %edx,%edx
  104650:	44 0f b6 f2          	movzbl %dl,%r14d
  104654:	44 89 75 d4          	mov    %r14d,-0x2c(%rbp)
  104658:	4c 8b 6b 38          	mov    0x38(%rbx),%r13
  10465c:	4c 89 6d c8          	mov    %r13,-0x38(%rbp)
  104660:	85 24 24             	test   %esp,(%rsp)
  104663:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  10466a:	4c 8d 24 24          	lea    (%rsp),%r12
  10466e:	85 24 24             	test   %esp,(%rsp)
  104671:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  104678:	48 8d 04 24          	lea    (%rsp),%rax
  10467c:	4c 8b c6             	mov    %rsi,%r8
  10467f:	4c 89 85 f0 fe ff ff 	mov    %r8,-0x110(%rbp)
  104686:	48 89 8d e8 fe ff ff 	mov    %rcx,-0x118(%rbp)
  10468d:	4c 89 65 c0          	mov    %r12,-0x40(%rbp)
  104691:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  104695:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  104699:	41 8b d7             	mov    %r15d,%edx
  10469c:	bf 20 00 00 00       	mov    $0x20,%edi
  1046a1:	83 fa 20             	cmp    $0x20,%edx
  1046a4:	41 0f 4c ff          	cmovl  %r15d,%edi
  1046a8:	89 7d ac             	mov    %edi,-0x54(%rbp)
  1046ab:	8b f7                	mov    %edi,%esi
  1046ad:	83 e6 fc             	and    $0xfffffffc,%esi
  1046b0:	89 75 a8             	mov    %esi,-0x58(%rbp)
  1046b3:	45 33 c9             	xor    %r9d,%r9d
  1046b6:	85 f6                	test   %esi,%esi
  1046b8:	0f 8e 6f 04 00 00    	jle    104b2d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x52d>
  1046be:	4d 63 d1             	movslq %r9d,%r10
  1046c1:	4b 8b 14 d0          	mov    (%r8,%r10,8),%rdx
  1046c5:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  1046c9:	45 8d 59 01          	lea    0x1(%r9),%r11d
  1046cd:	4d 63 db             	movslq %r11d,%r11
  1046d0:	4b 8b 34 d8          	mov    (%r8,%r11,8),%rsi
  1046d4:	48 89 75 98          	mov    %rsi,-0x68(%rbp)
  1046d8:	41 8d 79 02          	lea    0x2(%r9),%edi
  1046dc:	48 63 ff             	movslq %edi,%rdi
  1046df:	49 8b 34 f8          	mov    (%r8,%rdi,8),%rsi
  1046e3:	48 89 75 90          	mov    %rsi,-0x70(%rbp)
  1046e7:	41 8d 71 03          	lea    0x3(%r9),%esi
  1046eb:	48 63 f6             	movslq %esi,%rsi
  1046ee:	49 8b 14 f0          	mov    (%r8,%rsi,8),%rdx
  1046f2:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
  1046f6:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  1046fa:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1046fe:	48 89 95 00 ff ff ff 	mov    %rdx,-0x100(%rbp)
  104705:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  10470c:	c1 7c 51 
  10470f:	48 89 95 d8 fe ff ff 	mov    %rdx,-0x128(%rbp)
  104716:	4c 8d ad 78 ff ff ff 	lea    -0x88(%rbp),%r13
  10471d:	48 8b 95 00 ff ff ff 	mov    -0x100(%rbp),%rdx
  104724:	4c 8b b5 d8 fe ff ff 	mov    -0x128(%rbp),%r14
  10472b:	c4 c2 f3 f6 d6       	mulx   %r14,%rcx,%rdx
  104730:	49 89 4d 00          	mov    %rcx,0x0(%r13)
  104734:	48 8b 8d 78 ff ff ff 	mov    -0x88(%rbp),%rcx
  10473b:	48 33 d1             	xor    %rcx,%rdx
  10473e:	49 0f af d6          	imul   %r14,%rdx
  104742:	4b 89 14 d4          	mov    %rdx,(%r12,%r10,8)
  104746:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
  10474a:	48 33 53 48          	xor    0x48(%rbx),%rdx
  10474e:	48 8d 8d 70 ff ff ff 	lea    -0x90(%rbp),%rcx
  104755:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  10475a:	4c 89 29             	mov    %r13,(%rcx)
  10475d:	48 8b 8d 70 ff ff ff 	mov    -0x90(%rbp),%rcx
  104764:	48 33 d1             	xor    %rcx,%rdx
  104767:	49 0f af d6          	imul   %r14,%rdx
  10476b:	4b 89 14 dc          	mov    %rdx,(%r12,%r11,8)
  10476f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  104773:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104777:	48 8d 8d 68 ff ff ff 	lea    -0x98(%rbp),%rcx
  10477e:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104783:	4c 89 29             	mov    %r13,(%rcx)
  104786:	48 8b 8d 68 ff ff ff 	mov    -0x98(%rbp),%rcx
  10478d:	48 33 d1             	xor    %rcx,%rdx
  104790:	49 0f af d6          	imul   %r14,%rdx
  104794:	49 89 14 fc          	mov    %rdx,(%r12,%rdi,8)
  104798:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
  10479c:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1047a0:	48 8d 8d 60 ff ff ff 	lea    -0xa0(%rbp),%rcx
  1047a7:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  1047ac:	4c 89 29             	mov    %r13,(%rcx)
  1047af:	48 8b 8d 60 ff ff ff 	mov    -0xa0(%rbp),%rcx
  1047b6:	48 33 d1             	xor    %rcx,%rdx
  1047b9:	49 0f af d6          	imul   %r14,%rdx
  1047bd:	49 89 14 f4          	mov    %rdx,(%r12,%rsi,8)
  1047c1:	4b 8b 0c d4          	mov    (%r12,%r10,8),%rcx
  1047c5:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  1047c9:	4c 8d b5 58 ff ff ff 	lea    -0xa8(%rbp),%r14
  1047d0:	c4 e2 93 f6 d1       	mulx   %rcx,%r13,%rdx
  1047d5:	4d 89 2e             	mov    %r13,(%r14)
  1047d8:	4a 89 14 d0          	mov    %rdx,(%rax,%r10,8)
  1047dc:	4b 8b 0c dc          	mov    (%r12,%r11,8),%rcx
  1047e0:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  1047e4:	4c 8d b5 50 ff ff ff 	lea    -0xb0(%rbp),%r14
  1047eb:	c4 e2 93 f6 d1       	mulx   %rcx,%r13,%rdx
  1047f0:	4d 89 2e             	mov    %r13,(%r14)
  1047f3:	4a 89 14 d8          	mov    %rdx,(%rax,%r11,8)
  1047f7:	49 8b 0c fc          	mov    (%r12,%rdi,8),%rcx
  1047fb:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  1047ff:	4c 8d b5 48 ff ff ff 	lea    -0xb8(%rbp),%r14
  104806:	c4 e2 93 f6 d1       	mulx   %rcx,%r13,%rdx
  10480b:	4d 89 2e             	mov    %r13,(%r14)
  10480e:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
  104812:	49 8b 0c f4          	mov    (%r12,%rsi,8),%rcx
  104816:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  10481a:	4c 8d b5 40 ff ff ff 	lea    -0xc0(%rbp),%r14
  104821:	c4 e2 93 f6 d1       	mulx   %rcx,%r13,%rdx
  104826:	4d 89 2e             	mov    %r13,(%r14)
  104829:	48 89 14 f0          	mov    %rdx,(%rax,%rsi,8)
  10482d:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104831:	48 8b ca             	mov    %rdx,%rcx
  104834:	4a 03 0c d0          	add    (%rax,%r10,8),%rcx
  104838:	0f 18 09             	prefetcht0 (%rcx)
  10483b:	48 8b ca             	mov    %rdx,%rcx
  10483e:	4a 03 0c d8          	add    (%rax,%r11,8),%rcx
  104842:	0f 18 09             	prefetcht0 (%rcx)
  104845:	48 8b ca             	mov    %rdx,%rcx
  104848:	48 03 0c f8          	add    (%rax,%rdi,8),%rcx
  10484c:	0f 18 09             	prefetcht0 (%rcx)
  10484f:	48 03 14 f0          	add    (%rax,%rsi,8),%rdx
  104853:	0f 18 0a             	prefetcht0 (%rdx)
  104856:	41 83 c1 04          	add    $0x4,%r9d
  10485a:	8b 75 a8             	mov    -0x58(%rbp),%esi
  10485d:	44 3b ce             	cmp    %esi,%r9d
  104860:	0f 8c c2 02 00 00    	jl     104b28 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x528>
  104866:	8b 7d ac             	mov    -0x54(%rbp),%edi
  104869:	3b f7                	cmp    %edi,%esi
  10486b:	7d 6c                	jge    1048d9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x2d9>
  10486d:	48 63 ce             	movslq %esi,%rcx
  104870:	49 8b 14 c8          	mov    (%r8,%rcx,8),%rdx
  104874:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104878:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
  10487f:	c1 7c 51 
  104882:	4c 8d 95 38 ff ff ff 	lea    -0xc8(%rbp),%r10
  104889:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
  10488e:	4d 89 1a             	mov    %r11,(%r10)
  104891:	4c 8b 8d 38 ff ff ff 	mov    -0xc8(%rbp),%r9
  104898:	49 33 d1             	xor    %r9,%rdx
  10489b:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
  1048a2:	c1 7c 51 
  1048a5:	49 0f af d1          	imul   %r9,%rdx
  1048a9:	49 89 14 cc          	mov    %rdx,(%r12,%rcx,8)
  1048ad:	4d 8b 0c cc          	mov    (%r12,%rcx,8),%r9
  1048b1:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  1048b5:	4c 8d 95 30 ff ff ff 	lea    -0xd0(%rbp),%r10
  1048bc:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
  1048c1:	4d 89 1a             	mov    %r11,(%r10)
  1048c4:	48 89 14 c8          	mov    %rdx,(%rax,%rcx,8)
  1048c8:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1048cc:	48 03 14 c8          	add    (%rax,%rcx,8),%rdx
  1048d0:	0f 18 0a             	prefetcht0 (%rdx)
  1048d3:	ff c6                	inc    %esi
  1048d5:	3b f7                	cmp    %edi,%esi
  1048d7:	7c 94                	jl     10486d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x26d>
  1048d9:	83 ff 20             	cmp    $0x20,%edi
  1048dc:	7d 19                	jge    1048f7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x2f7>
  1048de:	66 90                	xchg   %ax,%ax
  1048e0:	48 63 d7             	movslq %edi,%rdx
  1048e3:	33 f6                	xor    %esi,%esi
  1048e5:	49 89 34 d4          	mov    %rsi,(%r12,%rdx,8)
  1048e9:	48 63 d7             	movslq %edi,%rdx
  1048ec:	48 89 34 d0          	mov    %rsi,(%rax,%rdx,8)
  1048f0:	ff c7                	inc    %edi
  1048f2:	83 ff 20             	cmp    $0x20,%edi
  1048f5:	7c e9                	jl     1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x2e0>
  1048f7:	45 33 f6             	xor    %r14d,%r14d
  1048fa:	41 8d 57 e0          	lea    -0x20(%r15),%edx
  1048fe:	45 33 ed             	xor    %r13d,%r13d
  104901:	85 d2                	test   %edx,%edx
  104903:	44 0f 4f ea          	cmovg  %edx,%r13d
  104907:	45 85 ed             	test   %r13d,%r13d
  10490a:	0f 8e 13 02 00 00    	jle    104b23 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x523>
  104910:	41 8b d6             	mov    %r14d,%edx
  104913:	c1 fa 1f             	sar    $0x1f,%edx
  104916:	83 e2 1f             	and    $0x1f,%edx
  104919:	41 03 d6             	add    %r14d,%edx
  10491c:	83 e2 e0             	and    $0xffffffe0,%edx
  10491f:	41 8b fe             	mov    %r14d,%edi
  104922:	2b fa                	sub    %edx,%edi
  104924:	48 63 cf             	movslq %edi,%rcx
  104927:	48 89 8d f8 fe ff ff 	mov    %rcx,-0x108(%rbp)
  10492e:	4d 8b 0c cc          	mov    (%r12,%rcx,8),%r9
  104932:	4c 89 8d 08 ff ff ff 	mov    %r9,-0xf8(%rbp)
  104939:	4c 8b 14 c8          	mov    (%rax,%rcx,8),%r10
  10493d:	4c 89 55 80          	mov    %r10,-0x80(%rbp)
  104941:	41 8d 56 20          	lea    0x20(%r14),%edx
  104945:	48 63 d2             	movslq %edx,%rdx
  104948:	49 8b 14 d0          	mov    (%r8,%rdx,8),%rdx
  10494c:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104950:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104957:	c1 7c 51 
  10495a:	48 8d b5 28 ff ff ff 	lea    -0xd8(%rbp),%rsi
  104961:	c4 e2 a3 f6 d7       	mulx   %rdi,%r11,%rdx
  104966:	4c 89 1e             	mov    %r11,(%rsi)
  104969:	48 8b bd 28 ff ff ff 	mov    -0xd8(%rbp),%rdi
  104970:	48 33 d7             	xor    %rdi,%rdx
  104973:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  10497a:	c1 7c 51 
  10497d:	48 0f af d7          	imul   %rdi,%rdx
  104981:	49 89 14 cc          	mov    %rdx,(%r12,%rcx,8)
  104985:	49 8b 3c cc          	mov    (%r12,%rcx,8),%rdi
  104989:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  10498d:	48 8d b5 20 ff ff ff 	lea    -0xe0(%rbp),%rsi
  104994:	c4 e2 a3 f6 d7       	mulx   %rdi,%r11,%rdx
  104999:	4c 89 1e             	mov    %r11,(%rsi)
  10499c:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
  1049a0:	c5 f8 11 85 10 ff ff 	vmovups %xmm0,-0xf0(%rbp)
  1049a7:	ff 
  1049a8:	48 8d bd 10 ff ff ff 	lea    -0xf0(%rbp),%rdi
  1049af:	33 f6                	xor    %esi,%esi
  1049b1:	e8 6a f4 f8 ff       	call   93e20 <S_P_CoreLib_System_UInt128___ctor>
  1049b6:	48 8b bd 10 ff ff ff 	mov    -0xf0(%rbp),%rdi
  1049bd:	48 8b b5 18 ff ff ff 	mov    -0xe8(%rbp),%rsi
  1049c4:	e8 67 f4 f8 ff       	call   93e30 <S_P_CoreLib_System_UInt128__op_Explicit_14>
  1049c9:	48 8b 4d b8          	mov    -0x48(%rbp),%rcx
  1049cd:	48 8b b5 f8 fe ff ff 	mov    -0x108(%rbp),%rsi
  1049d4:	48 89 04 f1          	mov    %rax,(%rcx,%rsi,8)
  1049d8:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1049dc:	48 8b c7             	mov    %rdi,%rax
  1049df:	48 03 04 f1          	add    (%rcx,%rsi,8),%rax
  1049e3:	0f 18 08             	prefetcht0 (%rax)
  1049e6:	48 8b 75 80          	mov    -0x80(%rbp),%rsi
  1049ea:	40 0f b6 34 37       	rex movzbl (%rdi,%rsi,1),%esi
  1049ef:	48 8b fb             	mov    %rbx,%rdi
  1049f2:	e8 49 f3 ff ff       	call   103d40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__HashPilot>
  1049f7:	48 8b d0             	mov    %rax,%rdx
  1049fa:	48 8b b5 08 ff ff ff 	mov    -0xf8(%rbp),%rsi
  104a01:	48 8b fb             	mov    %rbx,%rdi
  104a04:	e8 f7 f2 ff ff       	call   103d00 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__SlotInPartHp>
  104a09:	48 8b d0             	mov    %rax,%rdx
  104a0c:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  104a10:	74 1f                	je     104a31 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x431>
  104a12:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  104a16:	48 3b d1             	cmp    %rcx,%rdx
  104a19:	0f 82 ff 00 00 00    	jb     104b1e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x51e>
  104a1f:	48 8b 7b 58          	mov    0x58(%rbx),%rdi
  104a23:	48 8b 73 60          	mov    0x60(%rbx),%rsi
  104a27:	2b d1                	sub    %ecx,%edx
  104a29:	e8 f2 55 f7 ff       	call   7a020 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage__Index>
  104a2e:	48 8b d0             	mov    %rax,%rdx
  104a31:	49 63 f6             	movslq %r14d,%rsi
  104a34:	48 8b 8d e8 fe ff ff 	mov    -0x118(%rbp),%rcx
  104a3b:	48 89 14 f1          	mov    %rdx,(%rcx,%rsi,8)
  104a3f:	41 ff c6             	inc    %r14d
  104a42:	45 3b f5             	cmp    %r13d,%r14d
  104a45:	4c 8b 85 f0 fe ff ff 	mov    -0x110(%rbp),%r8
  104a4c:	0f 8c c3 00 00 00    	jl     104b15 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x515>
  104a52:	45 3b f7             	cmp    %r15d,%r14d
  104a55:	0f 8d 86 00 00 00    	jge    104ae1 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x4e1>
  104a5b:	41 8b f6             	mov    %r14d,%esi
  104a5e:	c1 fe 1f             	sar    $0x1f,%esi
  104a61:	83 e6 1f             	and    $0x1f,%esi
  104a64:	41 03 f6             	add    %r14d,%esi
  104a67:	83 e6 e0             	and    $0xffffffe0,%esi
  104a6a:	41 8b fe             	mov    %r14d,%edi
  104a6d:	2b fe                	sub    %esi,%edi
  104a6f:	48 63 f7             	movslq %edi,%rsi
  104a72:	4d 8b 2c f4          	mov    (%r12,%rsi,8),%r13
  104a76:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  104a7a:	48 63 ff             	movslq %edi,%rdi
  104a7d:	48 8b 55 b8          	mov    -0x48(%rbp),%rdx
  104a81:	48 8b 3c fa          	mov    (%rdx,%rdi,8),%rdi
  104a85:	40 0f b6 34 3e       	rex movzbl (%rsi,%rdi,1),%esi
  104a8a:	48 8b fb             	mov    %rbx,%rdi
  104a8d:	e8 ae f2 ff ff       	call   103d40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__HashPilot>
  104a92:	48 8b d0             	mov    %rax,%rdx
  104a95:	49 8b f5             	mov    %r13,%rsi
  104a98:	48 8b fb             	mov    %rbx,%rdi
  104a9b:	e8 60 f2 ff ff       	call   103d00 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__SlotInPartHp>
  104aa0:	48 8b d0             	mov    %rax,%rdx
  104aa3:	44 8b 6d d4          	mov    -0x2c(%rbp),%r13d
  104aa7:	45 85 ed             	test   %r13d,%r13d
  104aaa:	74 1b                	je     104ac7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x4c7>
  104aac:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  104ab0:	48 3b d0             	cmp    %rax,%rdx
  104ab3:	72 5e                	jb     104b13 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x513>
  104ab5:	48 8b 7b 58          	mov    0x58(%rbx),%rdi
  104ab9:	48 8b 73 60          	mov    0x60(%rbx),%rsi
  104abd:	2b d0                	sub    %eax,%edx
  104abf:	e8 5c 55 f7 ff       	call   7a020 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage__Index>
  104ac4:	48 8b d0             	mov    %rax,%rdx
  104ac7:	49 63 fe             	movslq %r14d,%rdi
  104aca:	48 8b 8d e8 fe ff ff 	mov    -0x118(%rbp),%rcx
  104ad1:	48 89 14 f9          	mov    %rdx,(%rcx,%rdi,8)
  104ad5:	41 ff c6             	inc    %r14d
  104ad8:	45 3b f7             	cmp    %r15d,%r14d
  104adb:	0f 8c 7a ff ff ff    	jl     104a5b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x45b>
  104ae1:	33 ff                	xor    %edi,%edi
  104ae3:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
  104ae7:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  104aeb:	48 8d 3d 1e 79 0b 00 	lea    0xb791e(%rip),%rdi        # 1bc410 <__security_cookie>
  104af2:	48 8b 3f             	mov    (%rdi),%rdi
  104af5:	48 39 bd e0 fe ff ff 	cmp    %rdi,-0x120(%rbp)
  104afc:	74 05                	je     104b03 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x503>
  104afe:	e8 fd 53 f0 ff       	call   9f00 <RhpFallbackFailFast>
  104b03:	90                   	nop
  104b04:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  104b08:	5b                   	pop    %rbx
  104b09:	41 5c                	pop    %r12
  104b0b:	41 5d                	pop    %r13
  104b0d:	41 5e                	pop    %r14
  104b0f:	41 5f                	pop    %r15
  104b11:	5d                   	pop    %rbp
  104b12:	c3                   	ret
  104b13:	eb b2                	jmp    104ac7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x4c7>
  104b15:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  104b19:	e9 f2 fd ff ff       	jmp    104910 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x310>
  104b1e:	e9 0e ff ff ff       	jmp    104a31 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x431>
  104b23:	e9 2a ff ff ff       	jmp    104a52 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x452>
  104b28:	e9 91 fb ff ff       	jmp    1046be <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0xbe>
  104b2d:	8b 75 a8             	mov    -0x58(%rbp),%esi
  104b30:	e9 31 fd ff ff       	jmp    104866 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x266>
  104b35:	48 8d 3d 9c d2 14 00 	lea    0x14d29c(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104b3c:	e8 d3 09 f6 ff       	call   65514 <RhpNewFast>
  104b41:	48 8b d8             	mov    %rax,%rbx
  104b44:	48 8b fb             	mov    %rbx,%rdi
  104b47:	48 8d 35 72 a9 13 00 	lea    0x13a972(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104b4e:	e8 1d 61 f8 ff       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104b53:	48 8b fb             	mov    %rbx,%rdi
  104b56:	e8 23 0c f6 ff       	call   6577e <RhpThrowEx>
  104b5b:	cc                   	int3
  104b5c:	90                   	nop
  104b5d:	90                   	nop
  104b5e:	90                   	nop
  104b5f:	90                   	nop

0000000000104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>:
  104b60:	55                   	push   %rbp
  104b61:	41 57                	push   %r15
  104b63:	41 56                	push   %r14
  104b65:	41 55                	push   %r13
  104b67:	41 54                	push   %r12
  104b69:	53                   	push   %rbx
  104b6a:	48 81 ec a8 01 00 00 	sub    $0x1a8,%rsp
  104b71:	48 8d ac 24 d0 01 00 	lea    0x1d0(%rsp),%rbp
  104b78:	00 
  104b79:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104b7e:	c5 79 7f 45 a0       	vmovdqa %xmm8,-0x60(%rbp)
  104b83:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  104b88:	33 c0                	xor    %eax,%eax
  104b8a:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  104b8e:	48 8b 05 7b 78 0b 00 	mov    0xb787b(%rip),%rax        # 1bc410 <__security_cookie>
  104b95:	48 89 85 38 fe ff ff 	mov    %rax,-0x1c8(%rbp)
  104b9c:	48 8b df             	mov    %rdi,%rbx
  104b9f:	44 8b fa             	mov    %edx,%r15d
  104ba2:	45 3b f8             	cmp    %r8d,%r15d
  104ba5:	0f 85 3b 07 00 00    	jne    1052e6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x786>
  104bab:	45 84 c9             	test   %r9b,%r9b
  104bae:	74 06                	je     104bb6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x56>
  104bb0:	0f b6 53 54          	movzbl 0x54(%rbx),%edx
  104bb4:	eb 02                	jmp    104bb8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x58>
  104bb6:	33 d2                	xor    %edx,%edx
  104bb8:	44 0f b6 f2          	movzbl %dl,%r14d
  104bbc:	44 89 75 d4          	mov    %r14d,-0x2c(%rbp)
  104bc0:	4c 8b 6b 38          	mov    0x38(%rbx),%r13
  104bc4:	4c 89 6d c8          	mov    %r13,-0x38(%rbp)
  104bc8:	85 24 24             	test   %esp,(%rsp)
  104bcb:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  104bd2:	4c 8d 24 24          	lea    (%rsp),%r12
  104bd6:	85 24 24             	test   %esp,(%rsp)
  104bd9:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  104be0:	48 8d 04 24          	lea    (%rsp),%rax
  104be4:	85 24 24             	test   %esp,(%rsp)
  104be7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  104bee:	4c 8d 04 24          	lea    (%rsp),%r8
  104bf2:	4c 8b ce             	mov    %rsi,%r9
  104bf5:	4c 89 8d 48 fe ff ff 	mov    %r9,-0x1b8(%rbp)
  104bfc:	48 89 8d 40 fe ff ff 	mov    %rcx,-0x1c0(%rbp)
  104c03:	4c 89 65 c0          	mov    %r12,-0x40(%rbp)
  104c07:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  104c0b:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  104c0f:	4c 89 45 a0          	mov    %r8,-0x60(%rbp)
  104c13:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
  104c17:	41 8b d7             	mov    %r15d,%edx
  104c1a:	41 ba 20 00 00 00    	mov    $0x20,%r10d
  104c20:	83 fa 20             	cmp    $0x20,%edx
  104c23:	44 89 bd 7c fe ff ff 	mov    %r15d,-0x184(%rbp)
  104c2a:	45 0f 4c d7          	cmovl  %r15d,%r10d
  104c2e:	44 89 55 9c          	mov    %r10d,-0x64(%rbp)
  104c32:	45 8b da             	mov    %r10d,%r11d
  104c35:	41 83 e3 fc          	and    $0xfffffffc,%r11d
  104c39:	44 89 5d 98          	mov    %r11d,-0x68(%rbp)
  104c3d:	33 ff                	xor    %edi,%edi
  104c3f:	45 85 db             	test   %r11d,%r11d
  104c42:	0f 8e 95 06 00 00    	jle    1052dd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x77d>
  104c48:	48 63 f7             	movslq %edi,%rsi
  104c4b:	49 8b 14 f1          	mov    (%r9,%rsi,8),%rdx
  104c4f:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
  104c53:	44 8d 5f 01          	lea    0x1(%rdi),%r11d
  104c57:	4d 63 db             	movslq %r11d,%r11
  104c5a:	4f 8b 14 d9          	mov    (%r9,%r11,8),%r10
  104c5e:	4c 89 55 80          	mov    %r10,-0x80(%rbp)
  104c62:	44 8d 57 02          	lea    0x2(%rdi),%r10d
  104c66:	4d 63 d2             	movslq %r10d,%r10
  104c69:	4b 8b 14 d1          	mov    (%r9,%r10,8),%rdx
  104c6d:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
  104c74:	8d 57 03             	lea    0x3(%rdi),%edx
  104c77:	48 63 d2             	movslq %edx,%rdx
  104c7a:	48 89 95 50 fe ff ff 	mov    %rdx,-0x1b0(%rbp)
  104c81:	4d 8b 2c d1          	mov    (%r9,%rdx,8),%r13
  104c85:	4c 89 ad 70 ff ff ff 	mov    %r13,-0x90(%rbp)
  104c8c:	4c 8b 6d 88          	mov    -0x78(%rbp),%r13
  104c90:	4c 33 6b 48          	xor    0x48(%rbx),%r13
  104c94:	4c 89 ad 58 fe ff ff 	mov    %r13,-0x1a8(%rbp)
  104c9b:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  104ca2:	c1 7c 51 
  104ca5:	4c 8d b5 d8 fe ff ff 	lea    -0x128(%rbp),%r14
  104cac:	48 8b 95 58 fe ff ff 	mov    -0x1a8(%rbp),%rdx
  104cb3:	c4 c2 f3 f6 d5       	mulx   %r13,%rcx,%rdx
  104cb8:	49 89 0e             	mov    %rcx,(%r14)
  104cbb:	48 8b 8d d8 fe ff ff 	mov    -0x128(%rbp),%rcx
  104cc2:	48 33 d1             	xor    %rcx,%rdx
  104cc5:	49 0f af d5          	imul   %r13,%rdx
  104cc9:	49 89 14 f4          	mov    %rdx,(%r12,%rsi,8)
  104ccd:	48 8b 55 80          	mov    -0x80(%rbp),%rdx
  104cd1:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104cd5:	48 8d 8d d0 fe ff ff 	lea    -0x130(%rbp),%rcx
  104cdc:	c4 c2 8b f6 d5       	mulx   %r13,%r14,%rdx
  104ce1:	4c 89 31             	mov    %r14,(%rcx)
  104ce4:	48 8b 8d d0 fe ff ff 	mov    -0x130(%rbp),%rcx
  104ceb:	48 33 d1             	xor    %rcx,%rdx
  104cee:	49 0f af d5          	imul   %r13,%rdx
  104cf2:	4b 89 14 dc          	mov    %rdx,(%r12,%r11,8)
  104cf6:	48 8b 95 78 ff ff ff 	mov    -0x88(%rbp),%rdx
  104cfd:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104d01:	48 8d 8d c8 fe ff ff 	lea    -0x138(%rbp),%rcx
  104d08:	c4 c2 8b f6 d5       	mulx   %r13,%r14,%rdx
  104d0d:	4c 89 31             	mov    %r14,(%rcx)
  104d10:	48 8b 8d c8 fe ff ff 	mov    -0x138(%rbp),%rcx
  104d17:	48 33 d1             	xor    %rcx,%rdx
  104d1a:	49 0f af d5          	imul   %r13,%rdx
  104d1e:	4b 89 14 d4          	mov    %rdx,(%r12,%r10,8)
  104d22:	4c 8b ad 70 ff ff ff 	mov    -0x90(%rbp),%r13
  104d29:	49 8b d5             	mov    %r13,%rdx
  104d2c:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104d30:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
  104d37:	c1 7c 51 
  104d3a:	4c 8d b5 c0 fe ff ff 	lea    -0x140(%rbp),%r14
  104d41:	c4 e2 93 f6 d1       	mulx   %rcx,%r13,%rdx
  104d46:	4d 89 2e             	mov    %r13,(%r14)
  104d49:	48 8b 8d c0 fe ff ff 	mov    -0x140(%rbp),%rcx
  104d50:	48 33 d1             	xor    %rcx,%rdx
  104d53:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
  104d5a:	c1 7c 51 
  104d5d:	48 0f af d1          	imul   %rcx,%rdx
  104d61:	48 8b 8d 50 fe ff ff 	mov    -0x1b0(%rbp),%rcx
  104d68:	49 89 14 cc          	mov    %rdx,(%r12,%rcx,8)
  104d6c:	4d 8b 34 f4          	mov    (%r12,%rsi,8),%r14
  104d70:	4f 8b 2c dc          	mov    (%r12,%r11,8),%r13
  104d74:	4c 89 ad 68 ff ff ff 	mov    %r13,-0x98(%rbp)
  104d7b:	4b 8b 14 d4          	mov    (%r12,%r10,8),%rdx
  104d7f:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  104d86:	4d 8b 2c cc          	mov    (%r12,%rcx,8),%r13
  104d8a:	4c 89 ad 58 ff ff ff 	mov    %r13,-0xa8(%rbp)
  104d91:	4c 8b 6b 68          	mov    0x68(%rbx),%r13
  104d95:	48 8d 95 b8 fe ff ff 	lea    -0x148(%rbp),%rdx
  104d9c:	48 89 95 30 fe ff ff 	mov    %rdx,-0x1d0(%rbp)
  104da3:	4c 8b bd 30 fe ff ff 	mov    -0x1d0(%rbp),%r15
  104daa:	49 8b d5             	mov    %r13,%rdx
  104dad:	c4 c2 f3 f6 d6       	mulx   %r14,%rcx,%rdx
  104db2:	49 89 0f             	mov    %rcx,(%r15)
  104db5:	48 8b 8d b8 fe ff ff 	mov    -0x148(%rbp),%rcx
  104dbc:	48 89 95 50 ff ff ff 	mov    %rdx,-0xb0(%rbp)
  104dc3:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  104dca:	4c 8b 7b 68          	mov    0x68(%rbx),%r15
  104dce:	4c 8d b5 b0 fe ff ff 	lea    -0x150(%rbp),%r14
  104dd5:	4c 8b ad 68 ff ff ff 	mov    -0x98(%rbp),%r13
  104ddc:	49 8b d7             	mov    %r15,%rdx
  104ddf:	c4 c2 f3 f6 d5       	mulx   %r13,%rcx,%rdx
  104de4:	49 89 0e             	mov    %rcx,(%r14)
  104de7:	48 8b 8d b0 fe ff ff 	mov    -0x150(%rbp),%rcx
  104dee:	48 89 95 40 ff ff ff 	mov    %rdx,-0xc0(%rbp)
  104df5:	48 89 8d 38 ff ff ff 	mov    %rcx,-0xc8(%rbp)
  104dfc:	4c 8b 7b 68          	mov    0x68(%rbx),%r15
  104e00:	4c 8d b5 a8 fe ff ff 	lea    -0x158(%rbp),%r14
  104e07:	4c 8b ad 60 ff ff ff 	mov    -0xa0(%rbp),%r13
  104e0e:	49 8b d7             	mov    %r15,%rdx
  104e11:	c4 c2 f3 f6 d5       	mulx   %r13,%rcx,%rdx
  104e16:	49 89 0e             	mov    %rcx,(%r14)
  104e19:	48 8b 8d a8 fe ff ff 	mov    -0x158(%rbp),%rcx
  104e20:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
  104e27:	48 89 8d 28 ff ff ff 	mov    %rcx,-0xd8(%rbp)
  104e2e:	4c 8b 7b 68          	mov    0x68(%rbx),%r15
  104e32:	4c 8d b5 a0 fe ff ff 	lea    -0x160(%rbp),%r14
  104e39:	4c 8b ad 58 ff ff ff 	mov    -0xa8(%rbp),%r13
  104e40:	49 8b d7             	mov    %r15,%rdx
  104e43:	c4 c2 f3 f6 d5       	mulx   %r13,%rcx,%rdx
  104e48:	49 89 0e             	mov    %rcx,(%r14)
  104e4b:	48 8b 8d a0 fe ff ff 	mov    -0x160(%rbp),%rcx
  104e52:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
  104e59:	48 89 8d 18 ff ff ff 	mov    %rcx,-0xe8(%rbp)
  104e60:	4c 8b bd 50 ff ff ff 	mov    -0xb0(%rbp),%r15
  104e67:	4d 89 3c f0          	mov    %r15,(%r8,%rsi,8)
  104e6b:	4c 8b b5 40 ff ff ff 	mov    -0xc0(%rbp),%r14
  104e72:	4f 89 34 d8          	mov    %r14,(%r8,%r11,8)
  104e76:	4c 8b ad 30 ff ff ff 	mov    -0xd0(%rbp),%r13
  104e7d:	4f 89 2c d0          	mov    %r13,(%r8,%r10,8)
  104e81:	4c 8b ad 50 fe ff ff 	mov    -0x1b0(%rbp),%r13
  104e88:	4b 89 14 e8          	mov    %rdx,(%r8,%r13,8)
  104e8c:	4c 8b 73 70          	mov    0x70(%rbx),%r14
  104e90:	4c 8d bd 98 fe ff ff 	lea    -0x168(%rbp),%r15
  104e97:	48 8b 8d 48 ff ff ff 	mov    -0xb8(%rbp),%rcx
  104e9e:	49 8b d6             	mov    %r14,%rdx
  104ea1:	c4 e2 93 f6 c9       	mulx   %rcx,%r13,%rcx
  104ea6:	4d 89 2f             	mov    %r13,(%r15)
  104ea9:	48 89 8d 10 ff ff ff 	mov    %rcx,-0xf0(%rbp)
  104eb0:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  104eb4:	4c 8d bd 90 fe ff ff 	lea    -0x170(%rbp),%r15
  104ebb:	4c 8b b5 38 ff ff ff 	mov    -0xc8(%rbp),%r14
  104ec2:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104ec7:	4d 89 2f             	mov    %r13,(%r15)
  104eca:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
  104ed1:	4c 8b 7b 70          	mov    0x70(%rbx),%r15
  104ed5:	4c 8d b5 88 fe ff ff 	lea    -0x178(%rbp),%r14
  104edc:	4c 8b ad 28 ff ff ff 	mov    -0xd8(%rbp),%r13
  104ee3:	49 8b d7             	mov    %r15,%rdx
  104ee6:	c4 c2 f3 f6 d5       	mulx   %r13,%rcx,%rdx
  104eeb:	49 89 0e             	mov    %rcx,(%r14)
  104eee:	48 89 95 00 ff ff ff 	mov    %rdx,-0x100(%rbp)
  104ef5:	48 8b 4b 70          	mov    0x70(%rbx),%rcx
  104ef9:	4c 8d bd 80 fe ff ff 	lea    -0x180(%rbp),%r15
  104f00:	4c 8b b5 18 ff ff ff 	mov    -0xe8(%rbp),%r14
  104f07:	48 8b d1             	mov    %rcx,%rdx
  104f0a:	c4 c2 93 f6 ce       	mulx   %r14,%r13,%rcx
  104f0f:	4d 89 2f             	mov    %r13,(%r15)
  104f12:	4c 8b bd 50 ff ff ff 	mov    -0xb0(%rbp),%r15
  104f19:	4c 0f af 7b 28       	imul   0x28(%rbx),%r15
  104f1e:	4c 03 bd 10 ff ff ff 	add    -0xf0(%rbp),%r15
  104f25:	4c 89 3c f0          	mov    %r15,(%rax,%rsi,8)
  104f29:	4c 8b b5 40 ff ff ff 	mov    -0xc0(%rbp),%r14
  104f30:	4c 0f af 73 28       	imul   0x28(%rbx),%r14
  104f35:	4c 03 b5 08 ff ff ff 	add    -0xf8(%rbp),%r14
  104f3c:	4e 89 34 d8          	mov    %r14,(%rax,%r11,8)
  104f40:	4c 8b ad 30 ff ff ff 	mov    -0xd0(%rbp),%r13
  104f47:	4c 0f af 6b 28       	imul   0x28(%rbx),%r13
  104f4c:	4c 03 ad 00 ff ff ff 	add    -0x100(%rbp),%r13
  104f53:	4e 89 2c d0          	mov    %r13,(%rax,%r10,8)
  104f57:	48 8b 95 20 ff ff ff 	mov    -0xe0(%rbp),%rdx
  104f5e:	48 0f af 53 28       	imul   0x28(%rbx),%rdx
  104f63:	48 03 ca             	add    %rdx,%rcx
  104f66:	48 8b 95 50 fe ff ff 	mov    -0x1b0(%rbp),%rdx
  104f6d:	48 89 0c d0          	mov    %rcx,(%rax,%rdx,8)
  104f71:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  104f75:	4c 8b f9             	mov    %rcx,%r15
  104f78:	4c 03 3c f0          	add    (%rax,%rsi,8),%r15
  104f7c:	41 0f 18 0f          	prefetcht0 (%r15)
  104f80:	48 8b f1             	mov    %rcx,%rsi
  104f83:	4a 03 34 d8          	add    (%rax,%r11,8),%rsi
  104f87:	0f 18 0e             	prefetcht0 (%rsi)
  104f8a:	48 8b f1             	mov    %rcx,%rsi
  104f8d:	4a 03 34 d0          	add    (%rax,%r10,8),%rsi
  104f91:	0f 18 0e             	prefetcht0 (%rsi)
  104f94:	48 03 0c d0          	add    (%rax,%rdx,8),%rcx
  104f98:	0f 18 09             	prefetcht0 (%rcx)
  104f9b:	83 c7 04             	add    $0x4,%edi
  104f9e:	44 8b 7d 98          	mov    -0x68(%rbp),%r15d
  104fa2:	41 3b ff             	cmp    %r15d,%edi
  104fa5:	0f 8c 25 03 00 00    	jl     1052d0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x770>
  104fab:	44 8b 75 9c          	mov    -0x64(%rbp),%r14d
  104faf:	45 3b fe             	cmp    %r14d,%r15d
  104fb2:	0f 8d 0f 03 00 00    	jge    1052c7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x767>
  104fb8:	49 63 ff             	movslq %r15d,%rdi
  104fbb:	49 8b 3c f9          	mov    (%r9,%rdi,8),%rdi
  104fbf:	48 8b 73 48          	mov    0x48(%rbx),%rsi
  104fc3:	e8 28 52 f7 ff       	call   7a1f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__Hash>
  104fc8:	49 63 ff             	movslq %r15d,%rdi
  104fcb:	49 8d 3c fc          	lea    (%r12,%rdi,8),%rdi
  104fcf:	48 89 07             	mov    %rax,(%rdi)
  104fd2:	e8 09 52 f7 ff       	call   7a1e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_HashValue__High>
  104fd7:	48 8b f0             	mov    %rax,%rsi
  104fda:	48 8d 7b 68          	lea    0x68(%rbx),%rdi
  104fde:	e8 5d 5f f7 ff       	call   7af40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Computation_FastReduce__ReduceWithRemainder>
  104fe3:	4c 8b e8             	mov    %rax,%r13
  104fe6:	48 8b f2             	mov    %rdx,%rsi
  104fe9:	49 63 ff             	movslq %r15d,%rdi
  104fec:	48 8b 45 a8          	mov    -0x58(%rbp),%rax
  104ff0:	4c 89 2c f8          	mov    %r13,(%rax,%rdi,8)
  104ff4:	48 8b fb             	mov    %rbx,%rdi
  104ff7:	e8 24 ec ff ff       	call   103c20 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  104ffc:	4c 0f af 6b 28       	imul   0x28(%rbx),%r13
  105001:	49 03 c5             	add    %r13,%rax
  105004:	49 63 f7             	movslq %r15d,%rsi
  105007:	4c 8b 6d b8          	mov    -0x48(%rbp),%r13
  10500b:	49 89 44 f5 00       	mov    %rax,0x0(%r13,%rsi,8)
  105010:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  105014:	49 63 ff             	movslq %r15d,%rdi
  105017:	49 03 74 fd 00       	add    0x0(%r13,%rdi,8),%rsi
  10501c:	0f 18 0e             	prefetcht0 (%rsi)
  10501f:	41 ff c7             	inc    %r15d
  105022:	45 3b fe             	cmp    %r14d,%r15d
  105025:	0f 8c 90 02 00 00    	jl     1052bb <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x75b>
  10502b:	41 83 fe 20          	cmp    $0x20,%r14d
  10502f:	0f 8d 7d 02 00 00    	jge    1052b2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x752>
  105035:	49 63 f6             	movslq %r14d,%rsi
  105038:	33 ff                	xor    %edi,%edi
  10503a:	49 89 3c f4          	mov    %rdi,(%r12,%rsi,8)
  10503e:	49 89 7c f5 00       	mov    %rdi,0x0(%r13,%rsi,8)
  105043:	4c 8b 7d a8          	mov    -0x58(%rbp),%r15
  105047:	49 89 3c f7          	mov    %rdi,(%r15,%rsi,8)
  10504b:	41 ff c6             	inc    %r14d
  10504e:	41 83 fe 20          	cmp    $0x20,%r14d
  105052:	0f 8c 55 02 00 00    	jl     1052ad <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x74d>
  105058:	45 33 f6             	xor    %r14d,%r14d
  10505b:	8b 85 7c fe ff ff    	mov    -0x184(%rbp),%eax
  105061:	8d 70 e0             	lea    -0x20(%rax),%esi
  105064:	33 ff                	xor    %edi,%edi
  105066:	e8 c5 ea f7 ff       	call   83b30 <S_P_CoreLib_System_Math__Max_3>
  10506b:	89 45 94             	mov    %eax,-0x6c(%rbp)
  10506e:	85 c0                	test   %eax,%eax
  105070:	0f 8e 42 01 00 00    	jle    1051b8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x658>
  105076:	41 8b fe             	mov    %r14d,%edi
  105079:	c1 ff 1f             	sar    $0x1f,%edi
  10507c:	83 e7 1f             	and    $0x1f,%edi
  10507f:	41 03 fe             	add    %r14d,%edi
  105082:	83 e7 e0             	and    $0xffffffe0,%edi
  105085:	41 8b ce             	mov    %r14d,%ecx
  105088:	2b cf                	sub    %edi,%ecx
  10508a:	89 8d fc fe ff ff    	mov    %ecx,-0x104(%rbp)
  105090:	48 63 f9             	movslq %ecx,%rdi
  105093:	49 8b 14 fc          	mov    (%r12,%rdi,8),%rdx
  105097:	48 89 95 70 fe ff ff 	mov    %rdx,-0x190(%rbp)
  10509e:	48 63 f9             	movslq %ecx,%rdi
  1050a1:	4d 8b 44 fd 00       	mov    0x0(%r13,%rdi,8),%r8
  1050a6:	4c 89 85 f0 fe ff ff 	mov    %r8,-0x110(%rbp)
  1050ad:	48 63 f9             	movslq %ecx,%rdi
  1050b0:	4d 8b 0c ff          	mov    (%r15,%rdi,8),%r9
  1050b4:	4c 89 8d e8 fe ff ff 	mov    %r9,-0x118(%rbp)
  1050bb:	41 8d 7e 20          	lea    0x20(%r14),%edi
  1050bf:	48 63 ff             	movslq %edi,%rdi
  1050c2:	4c 8b 95 48 fe ff ff 	mov    -0x1b8(%rbp),%r10
  1050c9:	49 8b 3c fa          	mov    (%r10,%rdi,8),%rdi
  1050cd:	48 8b 73 48          	mov    0x48(%rbx),%rsi
  1050d1:	e8 1a 51 f7 ff       	call   7a1f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__Hash>
  1050d6:	48 63 bd fc fe ff ff 	movslq -0x104(%rbp),%rdi
  1050dd:	49 8d 3c fc          	lea    (%r12,%rdi,8),%rdi
  1050e1:	48 89 07             	mov    %rax,(%rdi)
  1050e4:	e8 f7 50 f7 ff       	call   7a1e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_HashValue__High>
  1050e9:	48 8b f0             	mov    %rax,%rsi
  1050ec:	48 8d 7b 68          	lea    0x68(%rbx),%rdi
  1050f0:	e8 4b 5e f7 ff       	call   7af40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Computation_FastReduce__ReduceWithRemainder>
  1050f5:	48 89 85 60 fe ff ff 	mov    %rax,-0x1a0(%rbp)
  1050fc:	48 8b f2             	mov    %rdx,%rsi
  1050ff:	48 63 bd fc fe ff ff 	movslq -0x104(%rbp),%rdi
  105106:	49 89 04 ff          	mov    %rax,(%r15,%rdi,8)
  10510a:	48 8b fb             	mov    %rbx,%rdi
  10510d:	e8 0e eb ff ff       	call   103c20 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  105112:	48 8b b5 60 fe ff ff 	mov    -0x1a0(%rbp),%rsi
  105119:	48 0f af 73 28       	imul   0x28(%rbx),%rsi
  10511e:	48 03 f0             	add    %rax,%rsi
  105121:	8b bd fc fe ff ff    	mov    -0x104(%rbp),%edi
  105127:	48 63 c7             	movslq %edi,%rax
  10512a:	49 89 74 c5 00       	mov    %rsi,0x0(%r13,%rax,8)
  10512f:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  105133:	48 63 ff             	movslq %edi,%rdi
  105136:	48 8b c6             	mov    %rsi,%rax
  105139:	49 03 44 fd 00       	add    0x0(%r13,%rdi,8),%rax
  10513e:	0f 18 08             	prefetcht0 (%rax)
  105141:	48 8b bd f0 fe ff ff 	mov    -0x110(%rbp),%rdi
  105148:	40 0f b6 34 3e       	rex movzbl (%rsi,%rdi,1),%esi
  10514d:	48 8b fb             	mov    %rbx,%rdi
  105150:	e8 eb eb ff ff       	call   103d40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__HashPilot>
  105155:	48 8b d0             	mov    %rax,%rdx
  105158:	48 8b b5 70 fe ff ff 	mov    -0x190(%rbp),%rsi
  10515f:	48 8b fb             	mov    %rbx,%rdi
  105162:	e8 99 eb ff ff       	call   103d00 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__SlotInPartHp>
  105167:	48 8b 95 e8 fe ff ff 	mov    -0x118(%rbp),%rdx
  10516e:	48 0f af 53 18       	imul   0x18(%rbx),%rdx
  105173:	48 03 d0             	add    %rax,%rdx
  105176:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  10517a:	74 1f                	je     10519b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x63b>
  10517c:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  105180:	48 3b d1             	cmp    %rcx,%rdx
  105183:	0f 82 1f 01 00 00    	jb     1052a8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x748>
  105189:	48 8b 7b 58          	mov    0x58(%rbx),%rdi
  10518d:	48 8b 73 60          	mov    0x60(%rbx),%rsi
  105191:	2b d1                	sub    %ecx,%edx
  105193:	e8 88 4e f7 ff       	call   7a020 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage__Index>
  105198:	48 8b d0             	mov    %rax,%rdx
  10519b:	49 63 f6             	movslq %r14d,%rsi
  10519e:	48 8b 8d 40 fe ff ff 	mov    -0x1c0(%rbp),%rcx
  1051a5:	48 89 14 f1          	mov    %rdx,(%rcx,%rsi,8)
  1051a9:	41 ff c6             	inc    %r14d
  1051ac:	8b 75 94             	mov    -0x6c(%rbp),%esi
  1051af:	44 3b f6             	cmp    %esi,%r14d
  1051b2:	0f 8c be fe ff ff    	jl     105076 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x516>
  1051b8:	44 3b b5 7c fe ff ff 	cmp    -0x184(%rbp),%r14d
  1051bf:	0f 8d ab 00 00 00    	jge    105270 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x710>
  1051c5:	41 8b f6             	mov    %r14d,%esi
  1051c8:	c1 fe 1f             	sar    $0x1f,%esi
  1051cb:	83 e6 1f             	and    $0x1f,%esi
  1051ce:	41 03 f6             	add    %r14d,%esi
  1051d1:	83 e6 e0             	and    $0xffffffe0,%esi
  1051d4:	41 8b fe             	mov    %r14d,%edi
  1051d7:	2b fe                	sub    %esi,%edi
  1051d9:	48 63 f7             	movslq %edi,%rsi
  1051dc:	4d 8b 04 f4          	mov    (%r12,%rsi,8),%r8
  1051e0:	4c 89 85 68 fe ff ff 	mov    %r8,-0x198(%rbp)
  1051e7:	49 8b 7c f5 00       	mov    0x0(%r13,%rsi,8),%rdi
  1051ec:	4d 8b 0c f7          	mov    (%r15,%rsi,8),%r9
  1051f0:	4c 89 8d e0 fe ff ff 	mov    %r9,-0x120(%rbp)
  1051f7:	48 8b 73 08          	mov    0x8(%rbx),%rsi
  1051fb:	40 0f b6 34 3e       	rex movzbl (%rsi,%rdi,1),%esi
  105200:	48 8b fb             	mov    %rbx,%rdi
  105203:	e8 38 eb ff ff       	call   103d40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__HashPilot>
  105208:	48 8b d0             	mov    %rax,%rdx
  10520b:	48 8b b5 68 fe ff ff 	mov    -0x198(%rbp),%rsi
  105212:	48 8b fb             	mov    %rbx,%rdi
  105215:	e8 e6 ea ff ff       	call   103d00 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__SlotInPartHp>
  10521a:	48 8b 95 e0 fe ff ff 	mov    -0x120(%rbp),%rdx
  105221:	48 0f af 53 18       	imul   0x18(%rbx),%rdx
  105226:	48 03 d0             	add    %rax,%rdx
  105229:	83 7d d4 00          	cmpl   $0x0,-0x2c(%rbp)
  10522d:	74 1b                	je     10524a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6ea>
  10522f:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  105233:	48 3b d1             	cmp    %rcx,%rdx
  105236:	72 6e                	jb     1052a6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x746>
  105238:	48 8b 7b 58          	mov    0x58(%rbx),%rdi
  10523c:	48 8b 73 60          	mov    0x60(%rbx),%rsi
  105240:	2b d1                	sub    %ecx,%edx
  105242:	e8 d9 4d f7 ff       	call   7a020 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage__Index>
  105247:	48 8b d0             	mov    %rax,%rdx
  10524a:	49 63 fe             	movslq %r14d,%rdi
  10524d:	48 8b 8d 40 fe ff ff 	mov    -0x1c0(%rbp),%rcx
  105254:	48 89 14 f9          	mov    %rdx,(%rcx,%rdi,8)
  105258:	41 ff c6             	inc    %r14d
  10525b:	8b bd 7c fe ff ff    	mov    -0x184(%rbp),%edi
  105261:	44 3b f7             	cmp    %edi,%r14d
  105264:	89 bd 7c fe ff ff    	mov    %edi,-0x184(%rbp)
  10526a:	0f 8c 55 ff ff ff    	jl     1051c5 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x665>
  105270:	33 ff                	xor    %edi,%edi
  105272:	48 89 7d a0          	mov    %rdi,-0x60(%rbp)
  105276:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
  10527a:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  10527e:	48 8d 3d 8b 71 0b 00 	lea    0xb718b(%rip),%rdi        # 1bc410 <__security_cookie>
  105285:	48 8b 3f             	mov    (%rdi),%rdi
  105288:	48 39 bd 38 fe ff ff 	cmp    %rdi,-0x1c8(%rbp)
  10528f:	74 05                	je     105296 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x736>
  105291:	e8 6a 4c f0 ff       	call   9f00 <RhpFallbackFailFast>
  105296:	90                   	nop
  105297:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  10529b:	5b                   	pop    %rbx
  10529c:	41 5c                	pop    %r12
  10529e:	41 5d                	pop    %r13
  1052a0:	41 5e                	pop    %r14
  1052a2:	41 5f                	pop    %r15
  1052a4:	5d                   	pop    %rbp
  1052a5:	c3                   	ret
  1052a6:	eb a2                	jmp    10524a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6ea>
  1052a8:	e9 ee fe ff ff       	jmp    10519b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x63b>
  1052ad:	e9 83 fd ff ff       	jmp    105035 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x4d5>
  1052b2:	4c 8b 7d a8          	mov    -0x58(%rbp),%r15
  1052b6:	e9 9d fd ff ff       	jmp    105058 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x4f8>
  1052bb:	4c 8b 8d 48 fe ff ff 	mov    -0x1b8(%rbp),%r9
  1052c2:	e9 f1 fc ff ff       	jmp    104fb8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x458>
  1052c7:	4c 8b 6d b8          	mov    -0x48(%rbp),%r13
  1052cb:	e9 5b fd ff ff       	jmp    10502b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x4cb>
  1052d0:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  1052d4:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
  1052d8:	e9 6b f9 ff ff       	jmp    104c48 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0xe8>
  1052dd:	44 8b 7d 98          	mov    -0x68(%rbp),%r15d
  1052e1:	e9 c5 fc ff ff       	jmp    104fab <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x44b>
  1052e6:	48 8d 3d eb ca 14 00 	lea    0x14caeb(%rip),%rdi        # 251dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1052ed:	e8 22 02 f6 ff       	call   65514 <RhpNewFast>
  1052f2:	48 8b d8             	mov    %rax,%rbx
  1052f5:	48 8b fb             	mov    %rbx,%rdi
  1052f8:	48 8d 35 c1 a1 13 00 	lea    0x13a1c1(%rip),%rsi        # 23f4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  1052ff:	e8 6c 59 f8 ff       	call   8ac70 <S_P_CoreLib_System_ArgumentException___ctor_0>
  105304:	48 8b fb             	mov    %rbx,%rdi
  105307:	e8 72 04 f6 ff       	call   6577e <RhpThrowEx>
  10530c:	cc                   	int3
  10530d:	90                   	nop
  10530e:	90                   	nop
  10530f:	90                   	nop
  105310:	90                   	nop
  105311:	90                   	nop
  105312:	90                   	nop
  105313:	90                   	nop
  105314:	90                   	nop
  105315:	90                   	nop
  105316:	90                   	nop
  105317:	90                   	nop
  105318:	90                   	nop
  105319:	90                   	nop
  10531a:	90                   	nop
  10531b:	90                   	nop
  10531c:	90                   	nop
  10531d:	90                   	nop
  10531e:	90                   	nop
  10531f:	90                   	nop

