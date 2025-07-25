   77384:	e8 27 07 00 00       	call   77ab0 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>
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

   774ac:	e8 8f d0 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   774b1:	eb 0b                	jmp    774be <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xde>
   774b3:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   774b9:	e8 22 d4 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   774be:	48 8b 0d 0b 96 1a 00 	mov    0x1a960b(%rip),%rcx        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
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
   774ef:	e8 4c d0 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   774f4:	eb 08                	jmp    774fe <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x11e>
   774f6:	45 33 c9             	xor    %r9d,%r9d
   774f9:	e8 e2 d3 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   774fe:	48 8b 15 cb 95 1a 00 	mov    0x1a95cb(%rip),%rdx        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
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
   7786a:	e8 61 29 00 00       	call   7a1d0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__Hash>
   7786f:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
   77876:	49 8b fe             	mov    %r14,%rdi
   77879:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   77880:	e8 fb c2 08 00       	call   103b80 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__Bucket>
   77885:	49 8b 7e 08          	mov    0x8(%r14),%rdi
   77889:	0f b6 04 07          	movzbl (%rdi,%rax,1),%eax
   7788d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
   77894:	49 8d 76 68          	lea    0x68(%r14),%rsi
   77898:	48 8b 36             	mov    (%rsi),%rsi
   7789b:	48 8b fe             	mov    %rsi,%rdi
   7789e:	33 f6                	xor    %esi,%esi
   778a0:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
   778a7:	33 c9                	xor    %ecx,%ecx
   778a9:	e8 22 c5 01 00       	call   93dd0 <S_P_CoreLib_System_UInt128__op_Multiply>
   778ae:	48 8b f8             	mov    %rax,%rdi
   778b1:	48 8b f2             	mov    %rdx,%rsi
   778b4:	ba 40 00 00 00       	mov    $0x40,%edx
   778b9:	e8 52 c5 01 00       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
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
   77900:	e8 cb c4 01 00       	call   93dd0 <S_P_CoreLib_System_UInt128__op_Multiply>
   77905:	48 8b f8             	mov    %rax,%rdi
   77908:	48 8b f2             	mov    %rdx,%rsi
   7790b:	ba 40 00 00 00       	mov    $0x40,%edx
   77910:	e8 fb c4 01 00       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
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
   77947:	48 8b 3d 82 91 1a 00 	mov    0x1a9182(%rip),%rdi        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
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
   7797d:	e8 ae 05 09 00       	call   107f30 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   77982:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
   77989:	44 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%r8d
   77990:	49 8b f5             	mov    %r13,%rsi
   77993:	41 8b d4             	mov    %r12d,%edx
   77996:	49 8b fe             	mov    %r14,%rdi
   77999:	45 33 c9             	xor    %r9d,%r9d
   7799c:	39 3f                	cmp    %edi,(%rdi)
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
   77ad7:	48 8d 3d 7a ab 1c 00 	lea    0x1cab7a(%rip),%rdi        # 242658 <__Str_Testing_GetIndicesStreamPrefet_DFEC981FE3992F56C08A364E99D8E9725ED1C914578F7F525692F9A2069E1387>
   77ade:	e8 0d 4c 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   77ae3:	48 8b 1d e6 8f 1a 00 	mov    0x1a8fe6(%rip),%rbx        # 220ad0 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77aea:	4c 8b 7b 10          	mov    0x10(%rbx),%r15
   77aee:	41 8b 77 08          	mov    0x8(%r15),%esi
   77af2:	48 8d 3d 57 05 21 00 	lea    0x210557(%rip),%rdi        # 288050 <_ZTV16__Array<UIntPtr>>
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
   77b2c:	e8 0f ca 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77b31:	eb 0b                	jmp    77b3e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x8e>
   77b33:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77b39:	e8 a2 cd 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
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
   77b69:	e8 d2 c9 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77b6e:	eb 08                	jmp    77b78 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc8>
   77b70:	45 33 c9             	xor    %r9d,%r9d
   77b73:	e8 68 cd 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77b78:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77b7c:	be 22 00 00 00       	mov    $0x22,%esi
   77b81:	ba 01 00 00 00       	mov    $0x1,%edx
   77b86:	e8 15 93 04 00       	call   c0ea0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
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
   77bab:	48 8d 3d ae ea 1b 00 	lea    0x1beaae(%rip),%rdi        # 236660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
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
   77bd7:	48 8d 35 82 ea 1b 00 	lea    0x1bea82(%rip),%rsi        # 236660 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77bde:	e8 9d 94 04 00       	call   c1080 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77be3:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   77be7:	8b 76 08             	mov    0x8(%rsi),%esi
   77bea:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77bee:	e8 4d 7a 0b 00       	call   12f640 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
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
   77c0f:	48 8d 3d ca ee 1b 00 	lea    0x1beeca(%rip),%rdi        # 236ae0 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
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
   77c3b:	48 8d 35 9e ee 1b 00 	lea    0x1bee9e(%rip),%rsi        # 236ae0 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77c42:	e8 39 94 04 00       	call   c1080 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77c47:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77c4b:	e8 f0 92 04 00       	call   c0f40 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   77c50:	48 8b f8             	mov    %rax,%rdi
   77c53:	e8 98 4a 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
   77c58:	90                   	nop
   77c59:	48 83 c4 28          	add    $0x28,%rsp
   77c5d:	5b                   	pop    %rbx
   77c5e:	41 5e                	pop    %r14
   77c60:	41 5f                	pop    %r15
   77c62:	5d                   	pop    %rbp
   77c63:	c3                   	ret
   77c64:	e8 77 ab 01 00       	call   927e0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
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

   7867a:	e8 c1 be 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   7867f:	eb 0e                	jmp    7868f <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x10f>
   78681:	49 8b cc             	mov    %r12,%rcx
   78684:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   7868a:	e8 51 c2 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
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
   786c3:	e8 78 be 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   786c8:	eb 0b                	jmp    786d5 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x155>
   786ca:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   786d0:	e8 0b c2 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
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
   78709:	e8 32 be 08 00       	call   104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   7870e:	eb 0b                	jmp    7871b <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x19b>
   78710:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78716:	e8 c5 c1 08 00       	call   1048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7871b:	48 8d 3d ae df 1b 00 	lea    0x1bdfae(%rip),%rdi        # 2366d0 <__Str___Tested_prefetch_patterns_for_DE81E3DAF059C0B18D33D0B771E134E96E0008DA1110A965332E23E19D043BB8>
   78722:	e8 c9 3f 00 00       	call   7c6f0 <System_Console_System_Console__WriteLine_12>
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
   7873c:	e8 ef 77 00 00       	call   7ff30 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
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

0000000000104540 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>:
  104540:	55                   	push   %rbp
  104541:	41 57                	push   %r15
  104543:	41 56                	push   %r14
  104545:	41 55                	push   %r13
  104547:	41 54                	push   %r12
  104549:	53                   	push   %rbx
  10454a:	48 83 ec 68          	sub    $0x68,%rsp
  10454e:	c5 f8 77             	vzeroupper
  104551:	48 8d ac 24 90 00 00 	lea    0x90(%rsp),%rbp
  104558:	00 
  104559:	33 c0                	xor    %eax,%eax
  10455b:	48 89 45 88          	mov    %rax,-0x78(%rbp)
  10455f:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104564:	c5 79 7f 45 90       	vmovdqa %xmm8,-0x70(%rbp)
  104569:	c5 79 7f 45 a0       	vmovdqa %xmm8,-0x60(%rbp)
  10456e:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  104573:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  104578:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  10457c:	48 8b 05 cd 6d 0b 00 	mov    0xb6dcd(%rip),%rax        # 1bb350 <__security_cookie>
  104583:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  10458a:	41 3b d0             	cmp    %r8d,%edx
  10458d:	0f 85 24 03 00 00    	jne    1048b7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x377>
  104593:	45 84 c9             	test   %r9b,%r9b
  104596:	74 06                	je     10459e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x5e>
  104598:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  10459c:	eb 02                	jmp    1045a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x60>
  10459e:	33 c0                	xor    %eax,%eax
  1045a0:	0f b6 c0             	movzbl %al,%eax
  1045a3:	4c 8b 47 38          	mov    0x38(%rdi),%r8
  1045a7:	85 24 24             	test   %esp,(%rsp)
  1045aa:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1045b1:	4c 8d 0c 24          	lea    (%rsp),%r9
  1045b5:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1045b9:	62 d1 7e 48 7f 01    	vmovdqu32 %zmm0,(%r9)
  1045bf:	62 d1 7e 48 7f 41 01 	vmovdqu32 %zmm0,0x40(%r9)
  1045c6:	62 d1 7e 48 7f 41 02 	vmovdqu32 %zmm0,0x80(%r9)
  1045cd:	62 d1 7e 48 7f 41 03 	vmovdqu32 %zmm0,0xc0(%r9)
  1045d4:	85 24 24             	test   %esp,(%rsp)
  1045d7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1045de:	4c 8d 14 24          	lea    (%rsp),%r10
  1045e2:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1045e6:	62 d1 7e 48 7f 02    	vmovdqu32 %zmm0,(%r10)
  1045ec:	62 d1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%r10)
  1045f3:	62 d1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%r10)
  1045fa:	62 d1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%r10)
  104601:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
  104605:	4c 89 55 c8          	mov    %r10,-0x38(%rbp)
  104609:	44 8b da             	mov    %edx,%r11d
  10460c:	bb 20 00 00 00       	mov    $0x20,%ebx
  104611:	41 83 fb 20          	cmp    $0x20,%r11d
  104615:	89 55 84             	mov    %edx,-0x7c(%rbp)
  104618:	0f 4c da             	cmovl  %edx,%ebx
  10461b:	89 5d c4             	mov    %ebx,-0x3c(%rbp)
  10461e:	45 33 db             	xor    %r11d,%r11d
  104621:	85 db                	test   %ebx,%ebx
  104623:	0f 8e 86 02 00 00    	jle    1048af <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x36f>
  104629:	4d 63 fb             	movslq %r11d,%r15
  10462c:	4e 8b 34 fe          	mov    (%rsi,%r15,8),%r14
  104630:	4c 33 77 48          	xor    0x48(%rdi),%r14
  104634:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  10463b:	c1 7c 51 
  10463e:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
  104642:	49 8b d6             	mov    %r14,%rdx
  104645:	c4 c2 e3 f6 d5       	mulx   %r13,%rbx,%rdx
  10464a:	49 89 1c 24          	mov    %rbx,(%r12)
  10464e:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
  104652:	48 33 d3             	xor    %rbx,%rdx
  104655:	49 0f af d5          	imul   %r13,%rdx
  104659:	4b 89 14 f9          	mov    %rdx,(%r9,%r15,8)
  10465d:	4b 8b 1c f9          	mov    (%r9,%r15,8),%rbx
  104661:	48 8b 57 70          	mov    0x70(%rdi),%rdx
  104665:	4c 8d 75 a8          	lea    -0x58(%rbp),%r14
  104669:	c4 e2 93 f6 d3       	mulx   %rbx,%r13,%rdx
  10466e:	4d 89 2e             	mov    %r13,(%r14)
  104671:	4b 89 14 fa          	mov    %rdx,(%r10,%r15,8)
  104675:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  104679:	4b 03 14 fa          	add    (%r10,%r15,8),%rdx
  10467d:	0f 18 0a             	prefetcht0 (%rdx)
  104680:	41 ff c3             	inc    %r11d
  104683:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
  104686:	44 3b db             	cmp    %ebx,%r11d
  104689:	0f 8c 1b 02 00 00    	jl     1048aa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x36a>
  10468f:	83 fb 20             	cmp    $0x20,%ebx
  104692:	7d 24                	jge    1046b8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x178>
  104694:	0f 1f 40 00          	nopl   0x0(%rax)
  104698:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  10469f:	00 
  1046a0:	48 63 d3             	movslq %ebx,%rdx
  1046a3:	45 33 db             	xor    %r11d,%r11d
  1046a6:	4d 89 1c d1          	mov    %r11,(%r9,%rdx,8)
  1046aa:	48 63 d3             	movslq %ebx,%rdx
  1046ad:	4d 89 1c d2          	mov    %r11,(%r10,%rdx,8)
  1046b1:	ff c3                	inc    %ebx
  1046b3:	83 fb 20             	cmp    $0x20,%ebx
  1046b6:	7c e8                	jl     1046a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x160>
  1046b8:	45 33 db             	xor    %r11d,%r11d
  1046bb:	8b 55 84             	mov    -0x7c(%rbp),%edx
  1046be:	8d 5a e0             	lea    -0x20(%rdx),%ebx
  1046c1:	45 33 ff             	xor    %r15d,%r15d
  1046c4:	85 db                	test   %ebx,%ebx
  1046c6:	44 0f 4f fb          	cmovg  %ebx,%r15d
  1046ca:	44 89 7d c0          	mov    %r15d,-0x40(%rbp)
  1046ce:	45 85 ff             	test   %r15d,%r15d
  1046d1:	0f 8e 06 01 00 00    	jle    1047dd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x29d>
  1046d7:	48 8d 9f 80 00 00 00 	lea    0x80(%rdi),%rbx
  1046de:	45 8b f3             	mov    %r11d,%r14d
  1046e1:	41 c1 fe 1f          	sar    $0x1f,%r14d
  1046e5:	41 83 e6 1f          	and    $0x1f,%r14d
  1046e9:	45 03 f3             	add    %r11d,%r14d
  1046ec:	41 83 e6 e0          	and    $0xffffffe0,%r14d
  1046f0:	45 8b eb             	mov    %r11d,%r13d
  1046f3:	45 2b ee             	sub    %r14d,%r13d
  1046f6:	4d 63 f5             	movslq %r13d,%r14
  1046f9:	4f 8b 2c f1          	mov    (%r9,%r14,8),%r13
  1046fd:	4c 89 ad 78 ff ff ff 	mov    %r13,-0x88(%rbp)
  104704:	4f 8b 24 f2          	mov    (%r10,%r14,8),%r12
  104708:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
  10470c:	41 8d 53 20          	lea    0x20(%r11),%edx
  104710:	48 63 d2             	movslq %edx,%rdx
  104713:	48 8b 14 d6          	mov    (%rsi,%rdx,8),%rdx
  104717:	48 33 57 48          	xor    0x48(%rdi),%rdx
  10471b:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104722:	c1 7c 51 
  104725:	4c 8d 6d a0          	lea    -0x60(%rbp),%r13
  104729:	c4 c2 9b f6 d7       	mulx   %r15,%r12,%rdx
  10472e:	4d 89 65 00          	mov    %r12,0x0(%r13)
  104732:	4c 8b 7d a0          	mov    -0x60(%rbp),%r15
  104736:	49 33 d7             	xor    %r15,%rdx
  104739:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104740:	c1 7c 51 
  104743:	49 0f af d7          	imul   %r15,%rdx
  104747:	4b 89 14 f1          	mov    %rdx,(%r9,%r14,8)
  10474b:	4f 8b 3c f1          	mov    (%r9,%r14,8),%r15
  10474f:	48 8b 57 70          	mov    0x70(%rdi),%rdx
  104753:	4c 8d 6d 98          	lea    -0x68(%rbp),%r13
  104757:	c4 c2 9b f6 d7       	mulx   %r15,%r12,%rdx
  10475c:	4d 89 65 00          	mov    %r12,0x0(%r13)
  104760:	4b 89 14 f2          	mov    %rdx,(%r10,%r14,8)
  104764:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  104768:	4c 8b fa             	mov    %rdx,%r15
  10476b:	4f 03 3c f2          	add    (%r10,%r14,8),%r15
  10476f:	41 0f 18 0f          	prefetcht0 (%r15)
  104773:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
  104777:	42 0f b6 14 22       	movzbl (%rdx,%r12,1),%edx
  10477c:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104780:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104787:	c1 7c 51 
  10478a:	49 0f af d7          	imul   %r15,%rdx
  10478e:	4c 8b fb             	mov    %rbx,%r15
  104791:	4c 8b ad 78 ff ff ff 	mov    -0x88(%rbp),%r13
  104798:	49 33 d5             	xor    %r13,%rdx
  10479b:	49 0f af 57 08       	imul   0x8(%r15),%rdx
  1047a0:	4d 8b 3f             	mov    (%r15),%r15
  1047a3:	4c 8d 75 90          	lea    -0x70(%rbp),%r14
  1047a7:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  1047ac:	4d 89 2e             	mov    %r13,(%r14)
  1047af:	85 c0                	test   %eax,%eax
  1047b1:	74 13                	je     1047c6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x286>
  1047b3:	49 3b d0             	cmp    %r8,%rdx
  1047b6:	72 0e                	jb     1047c6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x286>
  1047b8:	4c 8b 7f 58          	mov    0x58(%rdi),%r15
  1047bc:	41 2b d0             	sub    %r8d,%edx
  1047bf:	48 63 d2             	movslq %edx,%rdx
  1047c2:	41 8b 14 97          	mov    (%r15,%rdx,4),%edx
  1047c6:	4d 63 fb             	movslq %r11d,%r15
  1047c9:	4a 89 14 f9          	mov    %rdx,(%rcx,%r15,8)
  1047cd:	41 ff c3             	inc    %r11d
  1047d0:	44 8b 7d c0          	mov    -0x40(%rbp),%r15d
  1047d4:	45 3b df             	cmp    %r15d,%r11d
  1047d7:	0f 8c 01 ff ff ff    	jl     1046de <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x19e>
  1047dd:	44 3b 5d 84          	cmp    -0x7c(%rbp),%r11d
  1047e1:	0f 8d 91 00 00 00    	jge    104878 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x338>
  1047e7:	48 8d 9f 80 00 00 00 	lea    0x80(%rdi),%rbx
  1047ee:	41 8b f3             	mov    %r11d,%esi
  1047f1:	c1 fe 1f             	sar    $0x1f,%esi
  1047f4:	83 e6 1f             	and    $0x1f,%esi
  1047f7:	41 03 f3             	add    %r11d,%esi
  1047fa:	83 e6 e0             	and    $0xffffffe0,%esi
  1047fd:	45 8b fb             	mov    %r11d,%r15d
  104800:	44 2b fe             	sub    %esi,%r15d
  104803:	49 63 f7             	movslq %r15d,%rsi
  104806:	49 8b 34 f1          	mov    (%r9,%rsi,8),%rsi
  10480a:	4c 8b 77 08          	mov    0x8(%rdi),%r14
  10480e:	4d 63 ff             	movslq %r15d,%r15
  104811:	4f 8b 3c fa          	mov    (%r10,%r15,8),%r15
  104815:	47 0f b6 3c 3e       	movzbl (%r14,%r15,1),%r15d
  10481a:	4c 33 7f 48          	xor    0x48(%rdi),%r15
  10481e:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  104825:	c1 7c 51 
  104828:	4d 0f af fe          	imul   %r14,%r15
  10482c:	4c 8b f3             	mov    %rbx,%r14
  10482f:	49 33 f7             	xor    %r15,%rsi
  104832:	49 0f af 76 08       	imul   0x8(%r14),%rsi
  104837:	4d 8b 3e             	mov    (%r14),%r15
  10483a:	4c 8d 75 88          	lea    -0x78(%rbp),%r14
  10483e:	48 8b d6             	mov    %rsi,%rdx
  104841:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104846:	4d 89 2e             	mov    %r13,(%r14)
  104849:	85 c0                	test   %eax,%eax
  10484b:	74 12                	je     10485f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x31f>
  10484d:	49 3b d0             	cmp    %r8,%rdx
  104850:	72 0d                	jb     10485f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x31f>
  104852:	48 8b 77 58          	mov    0x58(%rdi),%rsi
  104856:	41 2b d0             	sub    %r8d,%edx
  104859:	48 63 d2             	movslq %edx,%rdx
  10485c:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  10485f:	49 63 f3             	movslq %r11d,%rsi
  104862:	48 89 14 f1          	mov    %rdx,(%rcx,%rsi,8)
  104866:	41 ff c3             	inc    %r11d
  104869:	8b 55 84             	mov    -0x7c(%rbp),%edx
  10486c:	44 3b da             	cmp    %edx,%r11d
  10486f:	89 55 84             	mov    %edx,-0x7c(%rbp)
  104872:	0f 8c 76 ff ff ff    	jl     1047ee <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x2ae>
  104878:	33 ff                	xor    %edi,%edi
  10487a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10487e:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  104882:	48 8d 3d c7 6a 0b 00 	lea    0xb6ac7(%rip),%rdi        # 1bb350 <__security_cookie>
  104889:	48 8b 3f             	mov    (%rdi),%rdi
  10488c:	48 39 bd 70 ff ff ff 	cmp    %rdi,-0x90(%rbp)
  104893:	74 05                	je     10489a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x35a>
  104895:	e8 66 56 f0 ff       	call   9f00 <RhpFallbackFailFast>
  10489a:	90                   	nop
  10489b:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  10489f:	5b                   	pop    %rbx
  1048a0:	41 5c                	pop    %r12
  1048a2:	41 5d                	pop    %r13
  1048a4:	41 5e                	pop    %r14
  1048a6:	41 5f                	pop    %r15
  1048a8:	5d                   	pop    %rbp
  1048a9:	c3                   	ret
  1048aa:	e9 7a fd ff ff       	jmp    104629 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0xe9>
  1048af:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
  1048b2:	e9 d8 fd ff ff       	jmp    10468f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x14f>
  1048b7:	48 8d 3d 1a c5 14 00 	lea    0x14c51a(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1048be:	e8 51 0c f6 ff       	call   65514 <RhpNewFast>
  1048c3:	48 8b d8             	mov    %rax,%rbx
  1048c6:	48 8b fb             	mov    %rbx,%rdi
  1048c9:	48 8d 35 f0 9b 13 00 	lea    0x139bf0(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  1048d0:	e8 3b 63 f8 ff       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
  1048d5:	48 8b fb             	mov    %rbx,%rdi
  1048d8:	e8 a1 0e f6 ff       	call   6577e <RhpThrowEx>
  1048dd:	cc                   	int3
  1048de:	90                   	nop
  1048df:	90                   	nop

00000000001048e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>:
  1048e0:	55                   	push   %rbp
  1048e1:	41 57                	push   %r15
  1048e3:	41 56                	push   %r14
  1048e5:	41 55                	push   %r13
  1048e7:	41 54                	push   %r12
  1048e9:	53                   	push   %rbx
  1048ea:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
  1048f1:	c5 f8 77             	vzeroupper
  1048f4:	48 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%rbp
  1048fb:	00 
  1048fc:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104901:	c5 79 7f 85 60 ff ff 	vmovdqa %xmm8,-0xa0(%rbp)
  104908:	ff 
  104909:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  104910:	ff ff ff 
  104913:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  104919:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  10491f:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  104925:	48 83 c0 30          	add    $0x30,%rax
  104929:	75 e8                	jne    104913 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x33>
  10492b:	48 8b 05 1e 6a 0b 00 	mov    0xb6a1e(%rip),%rax        # 1bb350 <__security_cookie>
  104932:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  104939:	41 3b d0             	cmp    %r8d,%edx
  10493c:	0f 85 16 04 00 00    	jne    104d58 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x478>
  104942:	45 84 c9             	test   %r9b,%r9b
  104945:	74 06                	je     10494d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6d>
  104947:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  10494b:	eb 02                	jmp    10494f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6f>
  10494d:	33 c0                	xor    %eax,%eax
  10494f:	0f b6 c0             	movzbl %al,%eax
  104952:	4c 8b 47 38          	mov    0x38(%rdi),%r8
  104956:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
  10495a:	85 24 24             	test   %esp,(%rsp)
  10495d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  104964:	4c 8d 0c 24          	lea    (%rsp),%r9
  104968:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  10496c:	62 d1 7e 48 7f 01    	vmovdqu32 %zmm0,(%r9)
  104972:	62 d1 7e 48 7f 41 01 	vmovdqu32 %zmm0,0x40(%r9)
  104979:	62 d1 7e 48 7f 41 02 	vmovdqu32 %zmm0,0x80(%r9)
  104980:	62 d1 7e 48 7f 41 03 	vmovdqu32 %zmm0,0xc0(%r9)
  104987:	85 24 24             	test   %esp,(%rsp)
  10498a:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  104991:	4c 8d 14 24          	lea    (%rsp),%r10
  104995:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  104999:	62 d1 7e 48 7f 02    	vmovdqu32 %zmm0,(%r10)
  10499f:	62 d1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%r10)
  1049a6:	62 d1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%r10)
  1049ad:	62 d1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%r10)
  1049b4:	85 24 24             	test   %esp,(%rsp)
  1049b7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1049be:	4c 8d 1c 24          	lea    (%rsp),%r11
  1049c2:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1049c6:	62 d1 7e 48 7f 03    	vmovdqu32 %zmm0,(%r11)
  1049cc:	62 d1 7e 48 7f 43 01 	vmovdqu32 %zmm0,0x40(%r11)
  1049d3:	62 d1 7e 48 7f 43 02 	vmovdqu32 %zmm0,0x80(%r11)
  1049da:	62 d1 7e 48 7f 43 03 	vmovdqu32 %zmm0,0xc0(%r11)
  1049e1:	48 89 8d 40 ff ff ff 	mov    %rcx,-0xc0(%rbp)
  1049e8:	4c 89 4d c8          	mov    %r9,-0x38(%rbp)
  1049ec:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
  1049f0:	4c 89 5d b8          	mov    %r11,-0x48(%rbp)
  1049f4:	8b da                	mov    %edx,%ebx
  1049f6:	41 bf 20 00 00 00    	mov    $0x20,%r15d
  1049fc:	83 fb 20             	cmp    $0x20,%ebx
  1049ff:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%rbp)
  104a05:	44 0f 4c fa          	cmovl  %edx,%r15d
  104a09:	44 89 7d b4          	mov    %r15d,-0x4c(%rbp)
  104a0d:	33 db                	xor    %ebx,%ebx
  104a0f:	45 85 ff             	test   %r15d,%r15d
  104a12:	0f 8e 37 03 00 00    	jle    104d4f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x46f>
  104a18:	4c 63 f3             	movslq %ebx,%r14
  104a1b:	4e 8b 2c f6          	mov    (%rsi,%r14,8),%r13
  104a1f:	4c 33 6f 48          	xor    0x48(%rdi),%r13
  104a23:	49 bc 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r12
  104a2a:	c1 7c 51 
  104a2d:	4c 8d 7d 98          	lea    -0x68(%rbp),%r15
  104a31:	49 8b d5             	mov    %r13,%rdx
  104a34:	c4 c2 f3 f6 d4       	mulx   %r12,%rcx,%rdx
  104a39:	49 89 0f             	mov    %rcx,(%r15)
  104a3c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  104a40:	48 33 d1             	xor    %rcx,%rdx
  104a43:	49 0f af d4          	imul   %r12,%rdx
  104a47:	4b 89 14 f1          	mov    %rdx,(%r9,%r14,8)
  104a4b:	4b 8b 0c f1          	mov    (%r9,%r14,8),%rcx
  104a4f:	48 8b 57 68          	mov    0x68(%rdi),%rdx
  104a53:	4c 8d 7d 90          	lea    -0x70(%rbp),%r15
  104a57:	c4 e2 93 f6 c9       	mulx   %rcx,%r13,%rcx
  104a5c:	4d 89 2f             	mov    %r13,(%r15)
  104a5f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  104a63:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
  104a6a:	4b 89 0c f3          	mov    %rcx,(%r11,%r14,8)
  104a6e:	4c 8b 7f 70          	mov    0x70(%rdi),%r15
  104a72:	4c 8d 6d 88          	lea    -0x78(%rbp),%r13
  104a76:	4c 8b a5 48 ff ff ff 	mov    -0xb8(%rbp),%r12
  104a7d:	49 8b d7             	mov    %r15,%rdx
  104a80:	c4 c2 bb f6 d4       	mulx   %r12,%r8,%rdx
  104a85:	4d 89 45 00          	mov    %r8,0x0(%r13)
  104a89:	48 0f af 4f 28       	imul   0x28(%rdi),%rcx
  104a8e:	48 03 d1             	add    %rcx,%rdx
  104a91:	4b 89 14 f2          	mov    %rdx,(%r10,%r14,8)
  104a95:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  104a99:	4b 03 14 f2          	add    (%r10,%r14,8),%rdx
  104a9d:	0f 18 0a             	prefetcht0 (%rdx)
  104aa0:	ff c3                	inc    %ebx
  104aa2:	44 8b 7d b4          	mov    -0x4c(%rbp),%r15d
  104aa6:	41 3b df             	cmp    %r15d,%ebx
  104aa9:	0f 8c 9b 02 00 00    	jl     104d4a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x46a>
  104aaf:	41 83 ff 20          	cmp    $0x20,%r15d
  104ab3:	7d 25                	jge    104ada <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1fa>
  104ab5:	66 66 66 0f 1f 84 00 	data16 data16 nopw 0x0(%rax,%rax,1)
  104abc:	00 00 00 00 
  104ac0:	49 63 d7             	movslq %r15d,%rdx
  104ac3:	33 c9                	xor    %ecx,%ecx
  104ac5:	49 89 0c d1          	mov    %rcx,(%r9,%rdx,8)
  104ac9:	49 89 0c d2          	mov    %rcx,(%r10,%rdx,8)
  104acd:	49 89 0c d3          	mov    %rcx,(%r11,%rdx,8)
  104ad1:	41 ff c7             	inc    %r15d
  104ad4:	41 83 ff 20          	cmp    $0x20,%r15d
  104ad8:	7c e6                	jl     104ac0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1e0>
  104ada:	33 c9                	xor    %ecx,%ecx
  104adc:	8b 95 5c ff ff ff    	mov    -0xa4(%rbp),%edx
  104ae2:	44 8d 42 e0          	lea    -0x20(%rdx),%r8d
  104ae6:	33 db                	xor    %ebx,%ebx
  104ae8:	45 85 c0             	test   %r8d,%r8d
  104aeb:	41 0f 4f d8          	cmovg  %r8d,%ebx
  104aef:	89 5d b0             	mov    %ebx,-0x50(%rbp)
  104af2:	85 db                	test   %ebx,%ebx
  104af4:	0f 8e 44 02 00 00    	jle    104d3e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x45e>
  104afa:	44 8b c1             	mov    %ecx,%r8d
  104afd:	41 c1 f8 1f          	sar    $0x1f,%r8d
  104b01:	41 83 e0 1f          	and    $0x1f,%r8d
  104b05:	44 03 c1             	add    %ecx,%r8d
  104b08:	41 83 e0 e0          	and    $0xffffffe0,%r8d
  104b0c:	44 8b f9             	mov    %ecx,%r15d
  104b0f:	45 2b f8             	sub    %r8d,%r15d
  104b12:	4d 63 c7             	movslq %r15d,%r8
  104b15:	4f 8b 3c c1          	mov    (%r9,%r8,8),%r15
  104b19:	4c 89 bd 50 ff ff ff 	mov    %r15,-0xb0(%rbp)
  104b20:	4f 8b 34 c2          	mov    (%r10,%r8,8),%r14
  104b24:	4f 8b 2c c3          	mov    (%r11,%r8,8),%r13
  104b28:	4c 89 6d a8          	mov    %r13,-0x58(%rbp)
  104b2c:	44 8d 61 20          	lea    0x20(%rcx),%r12d
  104b30:	4d 63 e4             	movslq %r12d,%r12
  104b33:	4e 8b 24 e6          	mov    (%rsi,%r12,8),%r12
  104b37:	4c 33 67 48          	xor    0x48(%rdi),%r12
  104b3b:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  104b42:	c1 7c 51 
  104b45:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
  104b4c:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
  104b50:	4c 8b ad 30 ff ff ff 	mov    -0xd0(%rbp),%r13
  104b57:	49 8b d4             	mov    %r12,%rdx
  104b5a:	c4 c2 83 f6 d5       	mulx   %r13,%r15,%rdx
  104b5f:	4c 89 3b             	mov    %r15,(%rbx)
  104b62:	48 8b 5d 80          	mov    -0x80(%rbp),%rbx
  104b66:	48 33 d3             	xor    %rbx,%rdx
  104b69:	49 0f af d5          	imul   %r13,%rdx
  104b6d:	4b 89 14 c1          	mov    %rdx,(%r9,%r8,8)
  104b71:	4b 8b 1c c1          	mov    (%r9,%r8,8),%rbx
  104b75:	48 8b 57 68          	mov    0x68(%rdi),%rdx
  104b79:	4c 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%r15
  104b80:	c4 e2 93 f6 d3       	mulx   %rbx,%r13,%rdx
  104b85:	4d 89 2f             	mov    %r13,(%r15)
  104b88:	48 8b 9d 78 ff ff ff 	mov    -0x88(%rbp),%rbx
  104b8f:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  104b93:	4b 89 14 c3          	mov    %rdx,(%r11,%r8,8)
  104b97:	4c 8b 7f 70          	mov    0x70(%rdi),%r15
  104b9b:	4c 8d ad 70 ff ff ff 	lea    -0x90(%rbp),%r13
  104ba2:	49 8b d7             	mov    %r15,%rdx
  104ba5:	c4 e2 9b f6 d3       	mulx   %rbx,%r12,%rdx
  104baa:	4d 89 65 00          	mov    %r12,0x0(%r13)
  104bae:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  104bb2:	48 0f af 5f 28       	imul   0x28(%rdi),%rbx
  104bb7:	48 03 d3             	add    %rbx,%rdx
  104bba:	4b 89 14 c2          	mov    %rdx,(%r10,%r8,8)
  104bbe:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  104bc2:	48 8b da             	mov    %rdx,%rbx
  104bc5:	4b 03 1c c2          	add    (%r10,%r8,8),%rbx
  104bc9:	0f 18 0b             	prefetcht0 (%rbx)
  104bcc:	42 0f b6 14 32       	movzbl (%rdx,%r14,1),%edx
  104bd1:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104bd5:	49 b8 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r8
  104bdc:	c1 7c 51 
  104bdf:	49 0f af d0          	imul   %r8,%rdx
  104be3:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  104bea:	4c 8b bd 50 ff ff ff 	mov    -0xb0(%rbp),%r15
  104bf1:	49 33 d7             	xor    %r15,%rdx
  104bf4:	49 0f af 50 08       	imul   0x8(%r8),%rdx
  104bf9:	4d 8b 00             	mov    (%r8),%r8
  104bfc:	48 8d 9d 68 ff ff ff 	lea    -0x98(%rbp),%rbx
  104c03:	c4 c2 83 f6 d0       	mulx   %r8,%r15,%rdx
  104c08:	4c 89 3b             	mov    %r15,(%rbx)
  104c0b:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  104c0f:	4c 0f af 6f 18       	imul   0x18(%rdi),%r13
  104c14:	49 03 d5             	add    %r13,%rdx
  104c17:	85 c0                	test   %eax,%eax
  104c19:	74 1a                	je     104c35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x355>
  104c1b:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
  104c1f:	49 3b d0             	cmp    %r8,%rdx
  104c22:	0f 82 11 01 00 00    	jb     104d39 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x459>
  104c28:	48 8b 5f 58          	mov    0x58(%rdi),%rbx
  104c2c:	41 2b d0             	sub    %r8d,%edx
  104c2f:	48 63 d2             	movslq %edx,%rdx
  104c32:	8b 14 93             	mov    (%rbx,%rdx,4),%edx
  104c35:	48 63 d9             	movslq %ecx,%rbx
  104c38:	4c 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%r15
  104c3f:	49 89 14 df          	mov    %rdx,(%r15,%rbx,8)
  104c43:	ff c1                	inc    %ecx
  104c45:	8b 5d b0             	mov    -0x50(%rbp),%ebx
  104c48:	3b cb                	cmp    %ebx,%ecx
  104c4a:	0f 8c e4 00 00 00    	jl     104d34 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x454>
  104c50:	3b 8d 5c ff ff ff    	cmp    -0xa4(%rbp),%ecx
  104c56:	0f 8d a0 00 00 00    	jge    104cfc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x41c>
  104c5c:	8b f1                	mov    %ecx,%esi
  104c5e:	c1 fe 1f             	sar    $0x1f,%esi
  104c61:	83 e6 1f             	and    $0x1f,%esi
  104c64:	03 f1                	add    %ecx,%esi
  104c66:	83 e6 e0             	and    $0xffffffe0,%esi
  104c69:	8b d9                	mov    %ecx,%ebx
  104c6b:	2b de                	sub    %esi,%ebx
  104c6d:	48 63 f3             	movslq %ebx,%rsi
  104c70:	49 8b 1c f1          	mov    (%r9,%rsi,8),%rbx
  104c74:	4d 8b 34 f2          	mov    (%r10,%rsi,8),%r14
  104c78:	49 8b 34 f3          	mov    (%r11,%rsi,8),%rsi
  104c7c:	4c 8b 6f 08          	mov    0x8(%rdi),%r13
  104c80:	47 0f b6 34 2e       	movzbl (%r14,%r13,1),%r14d
  104c85:	4c 33 77 48          	xor    0x48(%rdi),%r14
  104c89:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  104c90:	c1 7c 51 
  104c93:	4d 0f af f5          	imul   %r13,%r14
  104c97:	4c 8d af 80 00 00 00 	lea    0x80(%rdi),%r13
  104c9e:	49 33 de             	xor    %r14,%rbx
  104ca1:	49 0f af 5d 08       	imul   0x8(%r13),%rbx
  104ca6:	4d 8b 75 00          	mov    0x0(%r13),%r14
  104caa:	4c 8d ad 60 ff ff ff 	lea    -0xa0(%rbp),%r13
  104cb1:	48 8b d3             	mov    %rbx,%rdx
  104cb4:	c4 c2 9b f6 d6       	mulx   %r14,%r12,%rdx
  104cb9:	4d 89 65 00          	mov    %r12,0x0(%r13)
  104cbd:	48 0f af 77 18       	imul   0x18(%rdi),%rsi
  104cc2:	48 03 d6             	add    %rsi,%rdx
  104cc5:	85 c0                	test   %eax,%eax
  104cc7:	74 16                	je     104cdf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x3ff>
  104cc9:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
  104ccd:	49 3b d0             	cmp    %r8,%rdx
  104cd0:	72 60                	jb     104d32 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x452>
  104cd2:	48 8b 77 58          	mov    0x58(%rdi),%rsi
  104cd6:	41 2b d0             	sub    %r8d,%edx
  104cd9:	48 63 d2             	movslq %edx,%rdx
  104cdc:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  104cdf:	48 63 f1             	movslq %ecx,%rsi
  104ce2:	49 89 14 f7          	mov    %rdx,(%r15,%rsi,8)
  104ce6:	ff c1                	inc    %ecx
  104ce8:	8b 95 5c ff ff ff    	mov    -0xa4(%rbp),%edx
  104cee:	3b ca                	cmp    %edx,%ecx
  104cf0:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%rbp)
  104cf6:	0f 8c 60 ff ff ff    	jl     104c5c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x37c>
  104cfc:	33 ff                	xor    %edi,%edi
  104cfe:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  104d02:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  104d06:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  104d0a:	48 8d 3d 3f 66 0b 00 	lea    0xb663f(%rip),%rdi        # 1bb350 <__security_cookie>
  104d11:	48 8b 3f             	mov    (%rdi),%rdi
  104d14:	48 39 bd 38 ff ff ff 	cmp    %rdi,-0xc8(%rbp)
  104d1b:	74 05                	je     104d22 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x442>
  104d1d:	e8 de 51 f0 ff       	call   9f00 <RhpFallbackFailFast>
  104d22:	90                   	nop
  104d23:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  104d27:	5b                   	pop    %rbx
  104d28:	41 5c                	pop    %r12
  104d2a:	41 5d                	pop    %r13
  104d2c:	41 5e                	pop    %r14
  104d2e:	41 5f                	pop    %r15
  104d30:	5d                   	pop    %rbp
  104d31:	c3                   	ret
  104d32:	eb ab                	jmp    104cdf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x3ff>
  104d34:	e9 c1 fd ff ff       	jmp    104afa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x21a>
  104d39:	e9 f7 fe ff ff       	jmp    104c35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x355>
  104d3e:	4c 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%r15
  104d45:	e9 06 ff ff ff       	jmp    104c50 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x370>
  104d4a:	e9 c9 fc ff ff       	jmp    104a18 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x138>
  104d4f:	44 8b 7d b4          	mov    -0x4c(%rbp),%r15d
  104d53:	e9 57 fd ff ff       	jmp    104aaf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1cf>
  104d58:	48 8d 3d 79 c0 14 00 	lea    0x14c079(%rip),%rdi        # 250dd8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104d5f:	e8 b0 07 f6 ff       	call   65514 <RhpNewFast>
  104d64:	48 8b d8             	mov    %rax,%rbx
  104d67:	48 8b fb             	mov    %rbx,%rdi
  104d6a:	48 8d 35 4f 97 13 00 	lea    0x13974f(%rip),%rsi        # 23e4c0 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104d71:	e8 9a 5e f8 ff       	call   8ac10 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104d76:	48 8b fb             	mov    %rbx,%rdi
  104d79:	e8 00 0a f6 ff       	call   6577e <RhpThrowEx>
  104d7e:	cc                   	int3
  104d7f:	90                   	nop

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

0000000000098860 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds>:
   98860:	55                   	push   %rbp
   98861:	48 8b ec             	mov    %rsp,%rbp
   98864:	8b c6                	mov    %esi,%eax
   98866:	33 c9                	xor    %ecx,%ecx
   98868:	c6 02 00             	movb   $0x0,(%rdx)
   9886b:	8b 77 08             	mov    0x8(%rdi),%esi
   9886e:	3b f0                	cmp    %eax,%esi
   98870:	7e 74                	jle    988e6 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x86>
   98872:	3b c6                	cmp    %esi,%eax
   98874:	73 77                	jae    988ed <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   98876:	44 8b c0             	mov    %eax,%r8d
   98879:	46 0f b7 44 47 0c    	movzwl 0xc(%rdi,%r8,2),%r8d
   9887f:	41 83 f8 48          	cmp    $0x48,%r8d
   98883:	77 14                	ja     98899 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x39>
   98885:	41 83 f8 20          	cmp    $0x20,%r8d
   98889:	74 4c                	je     988d7 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x77>
   9888b:	41 83 f8 27          	cmp    $0x27,%r8d
   9888f:	74 2a                	je     988bb <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x5b>
   98891:	41 83 f8 48          	cmp    $0x48,%r8d
   98895:	74 45                	je     988dc <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98897:	eb 47                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98899:	41 83 f8 68          	cmp    $0x68,%r8d
   9889d:	77 0e                	ja     988ad <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x4d>
   9889f:	41 83 f8 5c          	cmp    $0x5c,%r8d
   988a3:	74 20                	je     988c5 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x65>
   988a5:	41 83 f8 68          	cmp    $0x68,%r8d
   988a9:	74 31                	je     988dc <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988ab:	eb 33                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988ad:	41 83 f8 6d          	cmp    $0x6d,%r8d
   988b1:	74 29                	je     988dc <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988b3:	41 83 f8 74          	cmp    $0x74,%r8d
   988b7:	74 23                	je     988dc <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988b9:	eb 25                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988bb:	85 c9                	test   %ecx,%ecx
   988bd:	0f 94 c1             	sete   %cl
   988c0:	0f b6 c9             	movzbl %cl,%ecx
   988c3:	eb 1b                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988c5:	ff c0                	inc    %eax
   988c7:	3b c6                	cmp    %esi,%eax
   988c9:	73 22                	jae    988ed <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   988cb:	44 8b c0             	mov    %eax,%r8d
   988ce:	66 42 83 7c 47 0c 20 	cmpw   $0x20,0xc(%rdi,%r8,2)
   988d5:	75 09                	jne    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988d7:	c6 02 01             	movb   $0x1,(%rdx)
   988da:	eb 04                	jmp    988e0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988dc:	85 c9                	test   %ecx,%ecx
   988de:	74 0b                	je     988eb <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8b>
   988e0:	ff c0                	inc    %eax
   988e2:	3b f0                	cmp    %eax,%esi
   988e4:	7f 8c                	jg     98872 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x12>
   988e6:	c6 02 00             	movb   $0x0,(%rdx)
   988e9:	5d                   	pop    %rbp
   988ea:	c3                   	ret
   988eb:	5d                   	pop    %rbp
   988ec:	c3                   	ret
   988ed:	e8 6e 22 03 00       	call   cab60 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   988f2:	cc                   	int3
   988f3:	90                   	nop
   988f4:	90                   	nop
   988f5:	90                   	nop
   988f6:	90                   	nop
   988f7:	90                   	nop
   988f8:	90                   	nop
   988f9:	90                   	nop
   988fa:	90                   	nop
   988fb:	90                   	nop
   988fc:	90                   	nop
   988fd:	90                   	nop
   988fe:	90                   	nop
   988ff:	90                   	nop

0000000000098900 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek>:
   98900:	55                   	push   %rbp
   98901:	53                   	push   %rbx
   98902:	50                   	push   %rax
   98903:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   98908:	48 8b df             	mov    %rdi,%rbx
   9890b:	83 bb 98 01 00 00 ff 	cmpl   $0xffffffff,0x198(%rbx)
   98912:	75 2e                	jne    98942 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x42>
   98914:	48 8d 3d 65 3f 1b 00 	lea    0x1b3f65(%rip),%rdi        # 24c880 <__NONGCSTATICSS_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   9891b:	48 83 7f f8 00       	cmpq   $0x0,-0x8(%rdi)
   98920:	75 2d                	jne    9894f <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x4f>
   98922:	33 ff                	xor    %edi,%edi
   98924:	89 7d f0             	mov    %edi,-0x10(%rbp)
   98927:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   9892b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
   9892f:	be 0c 10 00 00       	mov    $0x100c,%esi
   98934:	e8 57 39 03 00       	call   cc290 <S_P_CoreLib_Interop_Globalization__GetLocaleInfoInt>
   98939:	8b 45 f0             	mov    -0x10(%rbp),%eax
   9893c:	89 83 98 01 00 00    	mov    %eax,0x198(%rbx)
   98942:	8b 83 98 01 00 00    	mov    0x198(%rbx),%eax
   98948:	48 83 c4 08          	add    $0x8,%rsp
   9894c:	5b                   	pop    %rbx
   9894d:	5d                   	pop    %rbp
   9894e:	c3                   	ret
   9894f:	e8 66 f7 f6 ff       	call   80ba <__GetNonGCStaticBase_S_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   98954:	eb cc                	jmp    98922 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x22>
   98956:	90                   	nop
   98957:	90                   	nop
   98958:	90                   	nop
--
00000000000ac960 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>:
   ac960:	55                   	push   %rbp
   ac961:	c5 f8 77             	vzeroupper
   ac964:	48 8b ec             	mov    %rsp,%rbp
   ac967:	48 8b c7             	mov    %rdi,%rax
   ac96a:	48 81 fe 80 00 00 00 	cmp    $0x80,%rsi
   ac971:	72 5a                	jb     ac9cd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x6d>
   ac973:	62 f1 7c 48 10 00    	vmovups (%rax),%zmm0
   ac979:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   ac97f:	c4 e1 fb 93 c9       	kmovq  %k1,%rcx
   ac984:	0f 1f 00             	nopl   (%rax)
   ac987:	48 85 c9             	test   %rcx,%rcx
   ac98a:	0f 85 d7 00 00 00    	jne    aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ac990:	48 8d 4c 30 c0       	lea    -0x40(%rax,%rsi,1),%rcx
   ac995:	48 8d 78 40          	lea    0x40(%rax),%rdi
   ac999:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   ac99d:	62 f1 7d 48 6f 07    	vmovdqa32 (%rdi),%zmm0
   ac9a3:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   ac9a9:	c4 e1 fb 93 d1       	kmovq  %k1,%rdx
   ac9ae:	0f 1f 00             	nopl   (%rax)
   ac9b1:	48 85 d2             	test   %rdx,%rdx
   ac9b4:	75 09                	jne    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ac9b6:	48 83 c7 40          	add    $0x40,%rdi
   ac9ba:	48 3b f9             	cmp    %rcx,%rdi
   ac9bd:	76 de                	jbe    ac99d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x3d>
   ac9bf:	48 2b f7             	sub    %rdi,%rsi
   ac9c2:	48 03 f0             	add    %rax,%rsi
   ac9c5:	e9 9d 00 00 00       	jmp    aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ac9ca:	0f 1f 00             	nopl   (%rax)
   ac9cd:	48 83 fe 40          	cmp    $0x40,%rsi
   ac9d1:	72 34                	jb     aca07 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xa7>
   ac9d3:	c5 fc 10 00          	vmovups (%rax),%ymm0
   ac9d7:	c5 fd d7 c8          	vpmovmskb %ymm0,%ecx
   ac9db:	85 c9                	test   %ecx,%ecx
   ac9dd:	0f 85 84 00 00 00    	jne    aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ac9e3:	48 8d 4c 30 e0       	lea    -0x20(%rax,%rsi,1),%rcx
   ac9e8:	48 8d 78 20          	lea    0x20(%rax),%rdi
   ac9ec:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   ac9f0:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
   ac9f4:	c5 fd d7 d0          	vpmovmskb %ymm0,%edx
   ac9f8:	85 d2                	test   %edx,%edx
   ac9fa:	75 c3                	jne    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ac9fc:	48 83 c7 20          	add    $0x20,%rdi
   aca00:	48 3b f9             	cmp    %rcx,%rdi
   aca03:	76 eb                	jbe    ac9f0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x90>
   aca05:	eb b8                	jmp    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca07:	48 83 fe 20          	cmp    $0x20,%rsi
   aca0b:	72 5a                	jb     aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   aca0d:	c5 f8 10 05 8b 6c 0d 	vmovups 0xd6c8b(%rip),%xmm0        # 1836a0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   aca14:	00 
   aca15:	c4 e2 79 17 00       	vptest (%rax),%xmm0
   aca1a:	75 4b                	jne    aca67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   aca1c:	48 8d 4c 30 f0       	lea    -0x10(%rax,%rsi,1),%rcx
   aca21:	48 8d 78 10          	lea    0x10(%rax),%rdi
   aca25:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   aca29:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   aca2e:	75 8f                	jne    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca30:	48 83 c7 10          	add    $0x10,%rdi
   aca34:	48 3b f9             	cmp    %rcx,%rdi
   aca37:	76 f0                	jbe    aca29 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xc9>
   aca39:	eb 84                	jmp    ac9bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   aca3b:	8b 0f                	mov    (%rdi),%ecx
   aca3d:	8b 57 04             	mov    0x4(%rdi),%edx
   aca40:	44 8b c1             	mov    %ecx,%r8d
   aca43:	44 0b c2             	or     %edx,%r8d
   aca46:	41 f7 c0 80 80 80 80 	test   $0x80808080,%r8d
   aca4d:	74 10                	je     aca5f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xff>
   aca4f:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   aca55:	75 5e                	jne    acab5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   aca57:	8b ca                	mov    %edx,%ecx
   aca59:	48 83 c7 04          	add    $0x4,%rdi
   aca5d:	eb 56                	jmp    acab5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   aca5f:	48 83 c7 08          	add    $0x8,%rdi
   aca63:	48 83 c6 f8          	add    $0xfffffffffffffff8,%rsi
   aca67:	48 83 fe 08          	cmp    $0x8,%rsi
   aca6b:	73 ce                	jae    aca3b <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xdb>
   aca6d:	40 f6 c6 04          	test   $0x4,%sil
   aca71:	74 0e                	je     aca81 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x121>
   aca73:	8b 0f                	mov    (%rdi),%ecx
   aca75:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   aca7b:	75 38                	jne    acab5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   aca7d:	48 83 c7 04          	add    $0x4,%rdi
   aca81:	40 f6 c6 02          	test   $0x2,%sil
   aca85:	74 0f                	je     aca96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x136>
   aca87:	0f b7 0f             	movzwl (%rdi),%ecx
   aca8a:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   aca90:	75 23                	jne    acab5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   aca92:	48 83 c7 02          	add    $0x2,%rdi
   aca96:	40 f6 c6 01          	test   $0x1,%sil
   aca9a:	74 0b                	je     acaa7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x147>
   aca9c:	48 8d 4f 01          	lea    0x1(%rdi),%rcx
   acaa0:	80 3f 00             	cmpb   $0x0,(%rdi)
   acaa3:	48 0f 4d f9          	cmovge %rcx,%rdi
   acaa7:	48 8b cf             	mov    %rdi,%rcx
   acaaa:	48 2b c8             	sub    %rax,%rcx
   acaad:	48 8b c1             	mov    %rcx,%rax
   acab0:	c5 f8 77             	vzeroupper
   acab3:	5d                   	pop    %rbp
   acab4:	c3                   	ret
   acab5:	81 e1 80 80 80 80    	and    $0x80808080,%ecx
   acabb:	f3 0f bc c9          	tzcnt  %ecx,%ecx
--
00000000000acae0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>:
   acae0:	55                   	push   %rbp
   acae1:	c5 f8 77             	vzeroupper
   acae4:	48 8b ec             	mov    %rsp,%rbp
   acae7:	48 8b cf             	mov    %rdi,%rcx
   acaea:	48 83 fe 40          	cmp    $0x40,%rsi
   acaee:	72 57                	jb     acb47 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x67>
   acaf0:	62 f1 7c 48 10 05 c6 	vmovups 0xd6bc6(%rip),%zmm0        # 1836c0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acaf7:	6b 0d 00 
   acafa:	62 f2 fd 48 26 09    	vptestmw (%rcx),%zmm0,%k1
   acb00:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   acb05:	0f 1f 00             	nopl   (%rax)
   acb08:	0f 85 d1 00 00 00    	jne    acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb0e:	48 8d 44 71 c0       	lea    -0x40(%rcx,%rsi,2),%rax
   acb13:	48 8d 79 40          	lea    0x40(%rcx),%rdi
   acb17:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   acb1b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   acb20:	62 f2 fd 48 26 0f    	vptestmw (%rdi),%zmm0,%k1
   acb26:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   acb2b:	75 09                	jne    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acb2d:	48 83 c7 40          	add    $0x40,%rdi
   acb31:	48 3b f8             	cmp    %rax,%rdi
   acb34:	76 ea                	jbe    acb20 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x40>
   acb36:	48 8b c7             	mov    %rdi,%rax
   acb39:	48 2b c1             	sub    %rcx,%rax
   acb3c:	48 d1 e8             	shr    $1,%rax
   acb3f:	48 2b f0             	sub    %rax,%rsi
   acb42:	e9 98 00 00 00       	jmp    acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb47:	48 83 fe 20          	cmp    $0x20,%rsi
   acb4b:	72 32                	jb     acb7f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x9f>
   acb4d:	c5 fc 10 05 6b 6b 0d 	vmovups 0xd6b6b(%rip),%ymm0        # 1836c0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acb54:	00 
   acb55:	c4 e2 7d 17 01       	vptest (%rcx),%ymm0
   acb5a:	0f 85 7f 00 00 00    	jne    acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb60:	48 8d 44 71 e0       	lea    -0x20(%rcx,%rsi,2),%rax
   acb65:	48 8d 79 20          	lea    0x20(%rcx),%rdi
   acb69:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   acb6d:	c4 e2 7d 17 07       	vptest (%rdi),%ymm0
   acb72:	75 c2                	jne    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acb74:	48 83 c7 20          	add    $0x20,%rdi
   acb78:	48 3b f8             	cmp    %rax,%rdi
   acb7b:	76 f0                	jbe    acb6d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x8d>
   acb7d:	eb b7                	jmp    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acb7f:	48 83 fe 10          	cmp    $0x10,%rsi
   acb83:	72 5a                	jb     acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb85:	c5 f8 10 05 33 6b 0d 	vmovups 0xd6b33(%rip),%xmm0        # 1836c0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   acb8c:	00 
   acb8d:	c4 e2 79 17 01       	vptest (%rcx),%xmm0
   acb92:	75 4b                	jne    acbdf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acb94:	48 8d 44 71 f0       	lea    -0x10(%rcx,%rsi,2),%rax
   acb99:	48 8d 79 10          	lea    0x10(%rcx),%rdi
   acb9d:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   acba1:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   acba6:	75 8e                	jne    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acba8:	48 83 c7 10          	add    $0x10,%rdi
   acbac:	48 3b f8             	cmp    %rax,%rdi
   acbaf:	76 f0                	jbe    acba1 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xc1>
   acbb1:	eb 83                	jmp    acb36 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acbb3:	8b 17                	mov    (%rdi),%edx
   acbb5:	8b 47 04             	mov    0x4(%rdi),%eax
   acbb8:	44 8b c2             	mov    %edx,%r8d
   acbbb:	44 0b c0             	or     %eax,%r8d
   acbbe:	41 f7 c0 80 ff 80 ff 	test   $0xff80ff80,%r8d
   acbc5:	74 10                	je     acbd7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xf7>
   acbc7:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acbcd:	75 48                	jne    acc17 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acbcf:	8b d0                	mov    %eax,%edx
   acbd1:	48 83 c7 04          	add    $0x4,%rdi
   acbd5:	eb 40                	jmp    acc17 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acbd7:	48 83 c7 08          	add    $0x8,%rdi
   acbdb:	48 83 c6 fc          	add    $0xfffffffffffffffc,%rsi
   acbdf:	48 83 fe 04          	cmp    $0x4,%rsi
   acbe3:	73 ce                	jae    acbb3 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xd3>
   acbe5:	40 f6 c6 02          	test   $0x2,%sil
   acbe9:	74 0e                	je     acbf9 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x119>
   acbeb:	8b 17                	mov    (%rdi),%edx
   acbed:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acbf3:	75 22                	jne    acc17 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acbf5:	48 83 c7 04          	add    $0x4,%rdi
   acbf9:	40 f6 c6 01          	test   $0x1,%sil
   acbfd:	74 0a                	je     acc09 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acbff:	66 83 3f 7f          	cmpw   $0x7f,(%rdi)
   acc03:	77 04                	ja     acc09 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acc05:	48 83 c7 02          	add    $0x2,%rdi
   acc09:	48 8b c7             	mov    %rdi,%rax
   acc0c:	48 2b c1             	sub    %rcx,%rax
   acc0f:	48 d1 e8             	shr    $1,%rax
   acc12:	c5 f8 77             	vzeroupper
   acc15:	5d                   	pop    %rbp
   acc16:	c3                   	ret
   acc17:	f7 c2 80 ff 00 00    	test   $0xff80,%edx
   acc1d:	74 e6                	je     acc05 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x125>
   acc1f:	eb e8                	jmp    acc09 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acc21:	90                   	nop
   acc22:	90                   	nop
   acc23:	90                   	nop
   acc24:	90                   	nop
   acc25:	90                   	nop
   acc26:	90                   	nop
   acc27:	90                   	nop
   acc28:	90                   	nop
--
00000000000b2a80 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>:
   b2a80:	55                   	push   %rbp
   b2a81:	41 57                	push   %r15
   b2a83:	53                   	push   %rbx
   b2a84:	c5 f8 77             	vzeroupper
   b2a87:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   b2a8c:	48 8b df             	mov    %rdi,%rbx
   b2a8f:	48 85 f6             	test   %rsi,%rsi
   b2a92:	75 07                	jne    b2a9b <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x1b>
   b2a94:	33 c0                	xor    %eax,%eax
   b2a96:	5b                   	pop    %rbx
   b2a97:	41 5f                	pop    %r15
   b2a99:	5d                   	pop    %rbp
   b2a9a:	c3                   	ret
   b2a9b:	4c 8b fb             	mov    %rbx,%r15
   b2a9e:	48 83 fe 08          	cmp    $0x8,%rsi
   b2aa2:	0f 82 0b 01 00 00    	jb     b2bb3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x133>
   b2aa8:	c5 f8 10 05 d0 0c 0d 	vmovups 0xd0cd0(%rip),%xmm0        # 183780 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2aaf:	00 
   b2ab0:	c4 c1 78 10 0f       	vmovups (%r15),%xmm1
   b2ab5:	c5 f1 dd 0d d3 0c 0d 	vpaddusw 0xd0cd3(%rip),%xmm1,%xmm1        # 183790 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2abc:	00 
   b2abd:	c5 f9 d7 f9          	vpmovmskb %xmm1,%edi
   b2ac1:	f7 c7 aa aa 00 00    	test   $0xaaaa,%edi
   b2ac7:	0f 85 c2 00 00 00    	jne    b2b8f <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10f>
   b2acd:	48 03 f6             	add    %rsi,%rsi
   b2ad0:	48 83 fe 20          	cmp    $0x20,%rsi
   b2ad4:	72 5c                	jb     b2b32 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb2>
   b2ad6:	49 8d 5f 10          	lea    0x10(%r15),%rbx
   b2ada:	48 83 e3 f0          	and    $0xfffffffffffffff0,%rbx
   b2ade:	49 03 f7             	add    %r15,%rsi
   b2ae1:	48 2b f3             	sub    %rbx,%rsi
   b2ae4:	48 83 fe 20          	cmp    $0x20,%rsi
   b2ae8:	72 33                	jb     b2b1d <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x9d>
   b2aea:	48 8d 04 33          	lea    (%rbx,%rsi,1),%rax
   b2aee:	48 83 e8 20          	sub    $0x20,%rax
   b2af2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2af9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2b00:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2b04:	c5 f9 6f 53 10       	vmovdqa 0x10(%rbx),%xmm2
   b2b09:	c5 f1 eb da          	vpor   %xmm2,%xmm1,%xmm3
   b2b0d:	c4 e2 79 17 d8       	vptest %xmm0,%xmm3
   b2b12:	75 5c                	jne    b2b70 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xf0>
   b2b14:	48 83 c3 20          	add    $0x20,%rbx
   b2b18:	48 3b d8             	cmp    %rax,%rbx
   b2b1b:	76 e3                	jbe    b2b00 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x80>
   b2b1d:	40 f6 c6 10          	test   $0x10,%sil
   b2b21:	74 13                	je     b2b36 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb6>
   b2b23:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2b27:	c4 e2 79 17 0d 50 0c 	vptest 0xd0c50(%rip),%xmm1        # 183780 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2b2e:	0d 00 
   b2b30:	75 51                	jne    b2b83 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2b32:	48 83 c3 10          	add    $0x10,%rbx
   b2b36:	40 0f b6 c6          	movzbl %sil,%eax
   b2b3a:	a8 0f                	test   $0xf,%al
   b2b3c:	74 24                	je     b2b62 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2b3e:	48 8b c6             	mov    %rsi,%rax
   b2b41:	48 83 e0 0f          	and    $0xf,%rax
   b2b45:	48 03 c3             	add    %rbx,%rax
   b2b48:	48 8b d8             	mov    %rax,%rbx
   b2b4b:	48 83 eb 10          	sub    $0x10,%rbx
   b2b4f:	c5 f8 10 0b          	vmovups (%rbx),%xmm1
   b2b53:	c4 e2 79 17 0d 24 0c 	vptest 0xd0c24(%rip),%xmm1        # 183780 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2b5a:	0d 00 
   b2b5c:	75 25                	jne    b2b83 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2b5e:	48 83 c3 10          	add    $0x10,%rbx
   b2b62:	48 8b c3             	mov    %rbx,%rax
   b2b65:	49 2b c7             	sub    %r15,%rax
   b2b68:	48 d1 e8             	shr    $1,%rax
   b2b6b:	5b                   	pop    %rbx
   b2b6c:	41 5f                	pop    %r15
   b2b6e:	5d                   	pop    %rbp
   b2b6f:	c3                   	ret
   b2b70:	c4 e2 79 17 0d 07 0c 	vptest 0xd0c07(%rip),%xmm1        # 183780 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2b77:	0d 00 
   b2b79:	75 08                	jne    b2b83 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2b7b:	48 83 c3 10          	add    $0x10,%rbx
   b2b7f:	c5 f8 28 ca          	vmovaps %xmm2,%xmm1
   b2b83:	c5 f1 dd 05 05 0c 0d 	vpaddusw 0xd0c05(%rip),%xmm1,%xmm0        # 183790 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2b8a:	00 
   b2b8b:	c5 f9 d7 f8          	vpmovmskb %xmm0,%edi
   b2b8f:	81 e7 aa aa 00 00    	and    $0xaaaa,%edi
   b2b95:	33 f6                	xor    %esi,%esi
   b2b97:	f3 0f bc f7          	tzcnt  %edi,%esi
   b2b9b:	8b fe                	mov    %esi,%edi
   b2b9d:	48 8d 5c 3b ff       	lea    -0x1(%rbx,%rdi,1),%rbx
   b2ba2:	eb be                	jmp    b2b62 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2ba4:	e8 37 03 00 00       	call   b2ee0 <S_P_CoreLib_System_Text_Latin1Utility__FirstCharInUInt32IsLatin1>
   b2ba9:	85 c0                	test   %eax,%eax
   b2bab:	74 b5                	je     b2b62 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2bad:	48 83 c3 02          	add    $0x2,%rbx
   b2bb1:	eb af                	jmp    b2b62 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2bb3:	40 f6 c6 04          	test   $0x4,%sil
   b2bb7:	74 2a                	je     b2be3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x163>
   b2bb9:	49 8b 3f             	mov    (%r15),%rdi
   b2bbc:	48 b8 00 ff 00 ff 00 	movabs $0xff00ff00ff00ff00,%rax
   b2bc3:	ff 00 ff 
   b2bc6:	48 23 f8             	and    %rax,%rdi
   b2bc9:	74 14                	je     b2bdf <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x15f>
   b2bcb:	33 db                	xor    %ebx,%ebx
   b2bcd:	f3 48 0f bc df       	tzcnt  %rdi,%rbx
--
0000000000103630 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>:
  103630:	55                   	push   %rbp
  103631:	41 57                	push   %r15
  103633:	41 56                	push   %r14
  103635:	41 55                	push   %r13
  103637:	53                   	push   %rbx
  103638:	48 83 ec 20          	sub    $0x20,%rsp
  10363c:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
  103641:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  103646:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  10364b:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  103650:	48 8b df             	mov    %rdi,%rbx
  103653:	48 8b d6             	mov    %rsi,%rdx
  103656:	48 33 53 48          	xor    0x48(%rbx),%rdx
  10365a:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103661:	c1 7c 51 
  103664:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  103668:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10366d:	48 89 06             	mov    %rax,(%rsi)
  103670:	48 8b f7             	mov    %rdi,%rsi
  103673:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  103677:	49 8b ff             	mov    %r15,%rdi
  10367a:	ba 40 00 00 00       	mov    $0x40,%edx
  10367f:	e8 8c 07 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103684:	4c 33 f8             	xor    %rax,%r15
  103687:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10368e:	c1 7c 51 
  103691:	4d 0f af fe          	imul   %r14,%r15
  103695:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  103699:	48 8b 12             	mov    (%rdx),%rdx
  10369c:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  1036a0:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1036a5:	48 89 37             	mov    %rsi,(%rdi)
  1036a8:	48 8b f2             	mov    %rdx,%rsi
  1036ab:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1036af:	ba 40 00 00 00       	mov    $0x40,%edx
  1036b4:	e8 57 07 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1036b9:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1036bd:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  1036c2:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  1036c6:	48 8b 12             	mov    (%rdx),%rdx
  1036c9:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  1036cd:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1036d2:	48 89 37             	mov    %rsi,(%rdi)
  1036d5:	48 8b f2             	mov    %rdx,%rsi
  1036d8:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  1036dc:	ba 40 00 00 00       	mov    $0x40,%edx
  1036e1:	e8 2a 07 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1036e6:	4c 8b e8             	mov    %rax,%r13
  1036e9:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  1036ee:	4c 33 73 48          	xor    0x48(%rbx),%r14
  1036f2:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  1036f9:	c1 7c 51 
  1036fc:	49 0f af d6          	imul   %r14,%rdx
  103700:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  103707:	49 33 d7             	xor    %r15,%rdx
  10370a:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  10370f:	48 8b 3b             	mov    (%rbx),%rdi
  103712:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  103716:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10371b:	48 89 06             	mov    %rax,(%rsi)
  10371e:	48 8b f7             	mov    %rdi,%rsi
  103721:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  103725:	ba 40 00 00 00       	mov    $0x40,%edx
  10372a:	e8 e1 06 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  10372f:	49 03 c5             	add    %r13,%rax
  103732:	48 83 c4 20          	add    $0x20,%rsp
  103736:	5b                   	pop    %rbx
  103737:	41 5d                	pop    %r13
  103739:	41 5e                	pop    %r14
  10373b:	41 5f                	pop    %r15
  10373d:	5d                   	pop    %rbp
  10373e:	c3                   	ret
  10373f:	90                   	nop

0000000000103740 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapSinglePart>:
  103740:	55                   	push   %rbp
  103741:	41 57                	push   %r15
  103743:	41 56                	push   %r14
  103745:	53                   	push   %rbx
  103746:	48 83 ec 18          	sub    $0x18,%rsp
  10374a:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  10374f:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  103754:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  103759:	33 c0                	xor    %eax,%eax
  10375b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  10375f:	48 8b df             	mov    %rdi,%rbx
  103762:	48 8b d6             	mov    %rsi,%rdx
  103765:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103769:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103770:	c1 7c 51 
  103773:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  103777:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10377c:	48 89 06             	mov    %rax,(%rsi)
  10377f:	48 8b f7             	mov    %rdi,%rsi
  103782:	4c 8b 7d e0          	mov    -0x20(%rbp),%r15
  103786:	49 8b ff             	mov    %r15,%rdi
  103789:	ba 40 00 00 00       	mov    $0x40,%edx
  10378e:	e8 7d 06 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103793:	4c 33 f8             	xor    %rax,%r15
  103796:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10379d:	c1 7c 51 
  1037a0:	4d 0f af fe          	imul   %r14,%r15
  1037a4:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  1037a8:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  1037ac:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1037b1:	48 89 37             	mov    %rsi,(%rdi)
  1037b4:	48 8b f2             	mov    %rdx,%rsi
  1037b7:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
  1037bb:	ba 40 00 00 00       	mov    $0x40,%edx
  1037c0:	e8 4b 06 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1037c5:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  1037c9:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
  1037cd:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1037d1:	49 0f af d6          	imul   %r14,%rdx
  1037d5:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  1037dc:	49 33 d7             	xor    %r15,%rdx
  1037df:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  1037e4:	48 8b 3b             	mov    (%rbx),%rdi
  1037e7:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  1037eb:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1037f0:	48 89 06             	mov    %rax,(%rsi)
  1037f3:	48 8b f7             	mov    %rdi,%rsi
  1037f6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1037fa:	ba 40 00 00 00       	mov    $0x40,%edx
  1037ff:	e8 0c 06 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103804:	90                   	nop
  103805:	48 83 c4 18          	add    $0x18,%rsp
  103809:	5b                   	pop    %rbx
  10380a:	41 5e                	pop    %r14
  10380c:	41 5f                	pop    %r15
  10380e:	5d                   	pop    %rbp
  10380f:	c3                   	ret

0000000000103810 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>:
  103810:	55                   	push   %rbp
  103811:	41 57                	push   %r15
  103813:	41 56                	push   %r14
  103815:	41 55                	push   %r13
  103817:	53                   	push   %rbx
  103818:	48 83 ec 30          	sub    $0x30,%rsp
  10381c:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  103821:	48 8b df             	mov    %rdi,%rbx
  103824:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  103828:	0f 85 fe 00 00 00    	jne    10392c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex+0x11c>
  10382e:	48 8b d6             	mov    %rsi,%rdx
  103831:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103835:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  10383c:	c1 7c 51 
  10383f:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  103843:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103848:	48 89 06             	mov    %rax,(%rsi)
  10384b:	48 8b f7             	mov    %rdi,%rsi
  10384e:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  103852:	49 8b ff             	mov    %r15,%rdi
  103855:	ba 40 00 00 00       	mov    $0x40,%edx
  10385a:	e8 b1 05 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  10385f:	4c 33 f8             	xor    %rax,%r15
  103862:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  103869:	c1 7c 51 
  10386c:	4d 0f af fe          	imul   %r14,%r15
  103870:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  103874:	48 8b 12             	mov    (%rdx),%rdx
  103877:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  10387b:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103880:	48 89 37             	mov    %rsi,(%rdi)
  103883:	48 8b f2             	mov    %rdx,%rsi
  103886:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10388a:	ba 40 00 00 00       	mov    $0x40,%edx
  10388f:	e8 7c 05 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103894:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  103898:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  10389d:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  1038a1:	48 8b 12             	mov    (%rdx),%rdx
  1038a4:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  1038a8:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
--
00000000001039e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>:
  1039e0:	55                   	push   %rbp
  1039e1:	41 57                	push   %r15
  1039e3:	41 56                	push   %r14
  1039e5:	41 55                	push   %r13
  1039e7:	53                   	push   %rbx
  1039e8:	48 83 ec 30          	sub    $0x30,%rsp
  1039ec:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  1039f1:	48 8b df             	mov    %rdi,%rbx
  1039f4:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  1039f8:	0f 85 ec 00 00 00    	jne    103aea <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap+0x10a>
  1039fe:	48 8b d6             	mov    %rsi,%rdx
  103a01:	48 33 53 48          	xor    0x48(%rbx),%rdx
  103a05:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  103a0c:	c1 7c 51 
  103a0f:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  103a13:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103a18:	48 89 06             	mov    %rax,(%rsi)
  103a1b:	48 8b f7             	mov    %rdi,%rsi
  103a1e:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  103a22:	49 8b ff             	mov    %r15,%rdi
  103a25:	ba 40 00 00 00       	mov    $0x40,%edx
  103a2a:	e8 e1 03 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103a2f:	4c 33 f8             	xor    %rax,%r15
  103a32:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  103a39:	c1 7c 51 
  103a3c:	4d 0f af fe          	imul   %r14,%r15
  103a40:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  103a44:	48 8b 12             	mov    (%rdx),%rdx
  103a47:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  103a4b:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103a50:	48 89 37             	mov    %rsi,(%rdi)
  103a53:	48 8b f2             	mov    %rdx,%rsi
  103a56:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  103a5a:	ba 40 00 00 00       	mov    $0x40,%edx
  103a5f:	e8 ac 03 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103a64:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  103a68:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  103a6d:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  103a71:	48 8b 12             	mov    (%rdx),%rdx
  103a74:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  103a78:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  103a7d:	48 89 37             	mov    %rsi,(%rdi)
  103a80:	48 8b f2             	mov    %rdx,%rsi
  103a83:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  103a87:	ba 40 00 00 00       	mov    $0x40,%edx
  103a8c:	e8 7f 03 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103a91:	4c 8b e8             	mov    %rax,%r13
  103a94:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  103a99:	4c 33 73 48          	xor    0x48(%rbx),%r14
  103a9d:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  103aa4:	c1 7c 51 
  103aa7:	49 0f af d6          	imul   %r14,%rdx
  103aab:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  103ab2:	49 33 d7             	xor    %r15,%rdx
  103ab5:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  103aba:	48 8b 3b             	mov    (%rbx),%rdi
  103abd:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  103ac1:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  103ac6:	48 89 06             	mov    %rax,(%rsi)
  103ac9:	48 8b f7             	mov    %rdi,%rsi
  103acc:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  103ad0:	ba 40 00 00 00       	mov    $0x40,%edx
  103ad5:	e8 36 03 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103ada:	49 03 c5             	add    %r13,%rax
  103add:	48 83 c4 30          	add    $0x30,%rsp
  103ae1:	5b                   	pop    %rbx
  103ae2:	41 5d                	pop    %r13
  103ae4:	41 5e                	pop    %r14
  103ae6:	41 5f                	pop    %r15
  103ae8:	5d                   	pop    %rbp
  103ae9:	c3                   	ret
  103aea:	48 8b fe             	mov    %rsi,%rdi
  103aed:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103af1:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
  103af5:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  103afc:	c1 7c 51 
  103aff:	e8 9c ff f7 ff       	call   83aa0 <S_P_CoreLib_System_Math__BigMul_0>
  103b04:	48 8b f0             	mov    %rax,%rsi
  103b07:	4c 8b 7d b8          	mov    -0x48(%rbp),%r15
  103b0b:	49 8b ff             	mov    %r15,%rdi
  103b0e:	ba 40 00 00 00       	mov    $0x40,%edx
  103b13:	e8 f8 02 f9 ff       	call   93e10 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  103b18:	4c 33 f8             	xor    %rax,%r15
  103b1b:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  103b22:	c1 7c 51 
  103b25:	4d 0f af fe          	imul   %r14,%r15
  103b29:	48 8b fb             	mov    %rbx,%rdi
  103b2c:	49 8b f7             	mov    %r15,%rsi
  103b2f:	e8 8c 00 00 00       	call   103bc0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  103b34:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  103b38:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  103b3d:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  103b41:	49 0f af fe          	imul   %r14,%rdi
  103b45:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  103b4c:	49 33 ff             	xor    %r15,%rdi
  103b4f:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  103b54:	48 8b 16             	mov    (%rsi),%rdx
  103b57:	33 f6                	xor    %esi,%esi
  103b59:	33 c9                	xor    %ecx,%ecx
  103b5b:	e8 70 02 f9 ff       	call   93dd0 <S_P_CoreLib_System_UInt128__op_Multiply>
