   774f7:	e8 34 07 00 00       	call   77c30 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>
   774fc:	e8 ff 08 00 00       	call   77e00 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>
   77501:	e8 9a 0e 00 00       	call   783a0 <ASM_Analysis_AsmGeneration_Program__TestSingleLookups>
   77506:	e8 f5 11 00 00       	call   78700 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern>
   7750b:	e8 c0 13 00 00       	call   788d0 <ASM_Analysis_AsmGeneration_Program__TestDictionaryMethods>
   77510:	48 8d 3d 89 e5 1c 00 	lea    0x1ce589(%rip),%rdi        # 245aa0 <__Str_Assembly_generation_complete__E694E220ABB5E659C8FE3A93D59496D8C08AFB825EDBB706847AAF14012E93FD>
   77517:	e8 14 55 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   7751c:	48 8d 3d 9d ee 1c 00 	lea    0x1cee9d(%rip),%rdi        # 2463c0 <__Str_Check_output_for_JIT_generated_E88BF50A10FDFF15CB02EFCA372E5395BD12F2100779560FE4DB5574C46B7085>
   77523:	e8 08 55 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77528:	90                   	nop
   77529:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   77530:	5b                   	pop    %rbx
   77531:	41 5c                	pop    %r12
   77533:	41 5d                	pop    %r13
   77535:	41 5e                	pop    %r14
   77537:	41 5f                	pop    %r15
   77539:	5d                   	pop    %rbp
   7753a:	c3                   	ret
   7753b:	e8 e0 b5 01 00       	call   92b20 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   77540:	cc                   	int3
   77541:	90                   	nop
   77542:	90                   	nop
   77543:	90                   	nop
   77544:	90                   	nop
   77545:	90                   	nop
   77546:	90                   	nop
   77547:	90                   	nop
   77548:	90                   	nop
   77549:	90                   	nop
   7754a:	90                   	nop
   7754b:	90                   	nop
   7754c:	90                   	nop
   7754d:	90                   	nop
   7754e:	90                   	nop
   7754f:	90                   	nop
   77550:	90                   	nop
   77551:	90                   	nop
   77552:	90                   	nop
   77553:	90                   	nop
   77554:	90                   	nop
   77555:	90                   	nop
   77556:	90                   	nop
   77557:	90                   	nop
   77558:	90                   	nop
   77559:	90                   	nop
   7755a:	90                   	nop
   7755b:	90                   	nop
   7755c:	90                   	nop
   7755d:	90                   	nop
   7755e:	90                   	nop
   7755f:	90                   	nop

   7762c:	e8 0f da 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77631:	eb 0b                	jmp    7763e <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xde>
   77633:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77639:	e8 a2 dd 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7763e:	48 8b 0d e3 44 1b 00 	mov    0x1b44e3(%rip),%rcx        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77645:	48 8b 79 18          	mov    0x18(%rcx),%rdi
   77649:	4d 85 ff             	test   %r15,%r15
   7764c:	75 06                	jne    77654 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xf4>
   7764e:	33 f6                	xor    %esi,%esi
   77650:	33 d2                	xor    %edx,%edx
   77652:	eb 08                	jmp    7765c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0xfc>
   77654:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77658:	41 8b 57 08          	mov    0x8(%r15),%edx
   7765c:	48 8d 4b 10          	lea    0x10(%rbx),%rcx
   77660:	41 b8 64 00 00 00    	mov    $0x64,%r8d
   77666:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   7766a:	74 0a                	je     77676 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x116>
   7766c:	45 33 c9             	xor    %r9d,%r9d
   7766f:	e8 cc d9 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77674:	eb 08                	jmp    7767e <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x11e>
   77676:	45 33 c9             	xor    %r9d,%r9d
   77679:	e8 62 dd 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7767e:	48 8b 15 a3 44 1b 00 	mov    0x1b44a3(%rip),%rdx        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77685:	4c 8b 72 18          	mov    0x18(%rdx),%r14
   77689:	4d 85 ff             	test   %r15,%r15
   7768c:	75 06                	jne    77694 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x134>
   7768e:	33 d2                	xor    %edx,%edx
   77690:	33 ff                	xor    %edi,%edi
   77692:	eb 08                	jmp    7769c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x13c>
   77694:	49 8d 57 10          	lea    0x10(%r15),%rdx
   77698:	41 8b 7f 08          	mov    0x8(%r15),%edi
   7769c:	48 8d 73 10          	lea    0x10(%rbx),%rsi
   776a0:	b8 64 00 00 00       	mov    $0x64,%eax
   776a5:	41 80 7e 55 00       	cmpb   $0x0,0x55(%r14)
   776aa:	0f 84 b5 01 00 00    	je     77865 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x305>
   776b0:	3b f8                	cmp    %eax,%edi
   776b2:	0f 85 21 05 00 00    	jne    77bd9 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x679>
   776b8:	41 0f b6 4e 54       	movzbl 0x54(%r14),%ecx
   776bd:	4d 8b 46 38          	mov    0x38(%r14),%r8
   776c1:	45 33 c9             	xor    %r9d,%r9d
   776c4:	85 ff                	test   %edi,%edi
   776c6:	4c 0f 45 ca          	cmovne %rdx,%r9
   776ca:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
   776ce:	33 d2                	xor    %edx,%edx
   776d0:	85 c0                	test   %eax,%eax
   776d2:	48 0f 45 d6          	cmovne %rsi,%rdx
   776d6:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   776da:	48 8b f2             	mov    %rdx,%rsi
   776dd:	85 c9                	test   %ecx,%ecx
   776df:	0f 84 c4 00 00 00    	je     777a9 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x249>
   776e5:	33 c0                	xor    %eax,%eax
   776e7:	85 ff                	test   %edi,%edi
   776e9:	0f 8e 67 01 00 00    	jle    77856 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   776ef:	4d 8d ae 80 00 00 00 	lea    0x80(%r14),%r13
   776f6:	48 63 d0             	movslq %eax,%rdx
   776f9:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   776fd:	49 33 56 48          	xor    0x48(%r14),%rdx
   77701:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77708:	c1 7c 51 
   7770b:	4c 8d 55 c0          	lea    -0x40(%rbp),%r10
   7770f:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77714:	4d 89 1a             	mov    %r11,(%r10)
   77717:	48 8b 4d c0          	mov    -0x40(%rbp),%rcx
   7771b:	48 33 d1             	xor    %rcx,%rdx
   7771e:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77725:	c1 7c 51 
   77728:	48 0f af d1          	imul   %rcx,%rdx
   7772c:	48 89 95 28 ff ff ff 	mov    %rdx,-0xd8(%rbp)
   77733:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77737:	4c 8d 55 b8          	lea    -0x48(%rbp),%r10
   7773b:	4c 8b 9d 28 ff ff ff 	mov    -0xd8(%rbp),%r11
   77742:	48 8b d1             	mov    %rcx,%rdx
   77745:	c4 c2 9b f6 d3       	mulx   %r11,%r12,%rdx
   7774a:	4d 89 22             	mov    %r12,(%r10)
   7774d:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77751:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77755:	49 33 56 48          	xor    0x48(%r14),%rdx
   77759:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77760:	c1 7c 51 
   77763:	48 0f af d1          	imul   %rcx,%rdx
   77767:	49 8b cd             	mov    %r13,%rcx
   7776a:	49 33 d3             	xor    %r11,%rdx
   7776d:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77772:	48 8b 09             	mov    (%rcx),%rcx
   77775:	4c 8d 55 b0          	lea    -0x50(%rbp),%r10
   77779:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   7777e:	4d 89 1a             	mov    %r11,(%r10)
   77781:	49 3b d0             	cmp    %r8,%rdx
   77784:	72 0d                	jb     77793 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x233>
   77786:	41 2b d0             	sub    %r8d,%edx
   77789:	49 8b 4e 58          	mov    0x58(%r14),%rcx
   7778d:	48 63 d2             	movslq %edx,%rdx
   77790:	8b 14 91             	mov    (%rcx,%rdx,4),%edx
   77793:	48 63 c8             	movslq %eax,%rcx
   77796:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   7779a:	ff c0                	inc    %eax
   7779c:	3b c7                	cmp    %edi,%eax
   7779e:	0f 8c 52 ff ff ff    	jl     776f6 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x196>
   777a4:	e9 ad 00 00 00       	jmp    77856 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   777a9:	33 c0                	xor    %eax,%eax
   777ab:	85 ff                	test   %edi,%edi
   777ad:	0f 8e a3 00 00 00    	jle    77856 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x2f6>
   777b3:	4d 8d ae 80 00 00 00 	lea    0x80(%r14),%r13
   777ba:	48 63 d0             	movslq %eax,%rdx
   777bd:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   777c1:	49 33 56 48          	xor    0x48(%r14),%rdx
   777c5:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   777cc:	c1 7c 51 
   777cf:	4c 8d 45 a8          	lea    -0x58(%rbp),%r8
   777d3:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   777d8:	4d 89 10             	mov    %r10,(%r8)
   777db:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
   777df:	48 33 d1             	xor    %rcx,%rdx
   777e2:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   777e9:	c1 7c 51 
   777ec:	48 0f af d1          	imul   %rcx,%rdx
   777f0:	48 89 95 20 ff ff ff 	mov    %rdx,-0xe0(%rbp)
   777f7:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   777fb:	4c 8d 45 a0          	lea    -0x60(%rbp),%r8
   777ff:	4c 8b 95 20 ff ff ff 	mov    -0xe0(%rbp),%r10
   77806:	48 8b d1             	mov    %rcx,%rdx
   77809:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   7780e:	4d 89 18             	mov    %r11,(%r8)
   77811:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77815:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77819:	49 33 56 48          	xor    0x48(%r14),%rdx
   7781d:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77824:	c1 7c 51 
   77827:	48 0f af d1          	imul   %rcx,%rdx
   7782b:	49 8b cd             	mov    %r13,%rcx
   7782e:	49 33 d2             	xor    %r10,%rdx
   77831:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77836:	48 8b 09             	mov    (%rcx),%rcx
   77839:	4c 8d 45 98          	lea    -0x68(%rbp),%r8
   7783d:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77842:	4d 89 10             	mov    %r10,(%r8)
   77845:	48 63 c8             	movslq %eax,%rcx
   77848:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   7784c:	ff c0                	inc    %eax
   7784e:	3b c7                	cmp    %edi,%eax
   77850:	0f 8c 64 ff ff ff    	jl     777ba <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x25a>
   77856:	33 d2                	xor    %edx,%edx
   77858:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
   7785c:	48 89 55 d0          	mov    %rdx,-0x30(%rbp)
   77860:	e9 62 02 00 00       	jmp    77ac7 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x567>
   77865:	44 8b e7             	mov    %edi,%r12d
   77868:	48 8b fe             	mov    %rsi,%rdi
   7786b:	8b f0                	mov    %eax,%esi
   7786d:	44 3b e6             	cmp    %esi,%r12d
   77870:	0f 85 89 03 00 00    	jne    77bff <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x69f>
   77876:	41 0f b6 46 54       	movzbl 0x54(%r14),%eax
   7787b:	49 8b 4e 38          	mov    0x38(%r14),%rcx
   7787f:	45 33 c0             	xor    %r8d,%r8d
   77882:	45 85 e4             	test   %r12d,%r12d
   77885:	4c 0f 45 c2          	cmovne %rdx,%r8
   77889:	4c 89 45 90          	mov    %r8,-0x70(%rbp)
   7788d:	4d 8b e8             	mov    %r8,%r13
   77890:	33 d2                	xor    %edx,%edx
   77892:	85 f6                	test   %esi,%esi
   77894:	48 0f 45 d7          	cmovne %rdi,%rdx
   77898:	48 89 55 88          	mov    %rdx,-0x78(%rbp)
   7789c:	4c 8b c2             	mov    %rdx,%r8
   7789f:	4c 89 45 80          	mov    %r8,-0x80(%rbp)
   778a3:	85 c0                	test   %eax,%eax
   778a5:	0f 84 22 01 00 00    	je     779cd <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x46d>
   778ab:	33 ff                	xor    %edi,%edi
   778ad:	45 85 e4             	test   %r12d,%r12d
   778b0:	0f 8e 07 02 00 00    	jle    77abd <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   778b6:	49 8d 76 78          	lea    0x78(%r14),%rsi
   778ba:	48 89 b5 00 ff ff ff 	mov    %rsi,-0x100(%rbp)
   778c1:	49 8d 96 80 00 00 00 	lea    0x80(%r14),%rdx
   778c8:	48 89 95 08 ff ff ff 	mov    %rdx,-0xf8(%rbp)
   778cf:	48 63 c7             	movslq %edi,%rax
   778d2:	49 8b 44 c5 00       	mov    0x0(%r13,%rax,8),%rax
   778d7:	49 33 46 48          	xor    0x48(%r14),%rax
   778db:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
   778e2:	c1 7c 51 
   778e5:	4c 8d 95 68 ff ff ff 	lea    -0x98(%rbp),%r10
   778ec:	48 8b d0             	mov    %rax,%rdx
   778ef:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
   778f4:	4d 89 1a             	mov    %r11,(%r10)
   778f7:	48 8b 85 68 ff ff ff 	mov    -0x98(%rbp),%rax
   778fe:	48 33 d0             	xor    %rax,%rdx
   77901:	49 0f af d1          	imul   %r9,%rdx
   77905:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
   7790c:	48 8b c6             	mov    %rsi,%rax
   7790f:	48 8b 00             	mov    (%rax),%rax
   77912:	4c 8d 8d 60 ff ff ff 	lea    -0xa0(%rbp),%r9
   77919:	4c 8b 95 18 ff ff ff 	mov    -0xe8(%rbp),%r10
   77920:	48 8b d0             	mov    %rax,%rdx
   77923:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   77928:	4d 89 19             	mov    %r11,(%r9)
   7792b:	49 8b 46 08          	mov    0x8(%r14),%rax
   7792f:	0f b6 14 10          	movzbl (%rax,%rdx,1),%edx
   77933:	48 89 95 70 ff ff ff 	mov    %rdx,-0x90(%rbp)
   7793a:	49 8d 46 68          	lea    0x68(%r14),%rax
   7793e:	48 8b 00             	mov    (%rax),%rax
   77941:	4c 8d 8d 58 ff ff ff 	lea    -0xa8(%rbp),%r9
   77948:	48 8b d0             	mov    %rax,%rdx
   7794b:	c4 c2 a3 f6 c2       	mulx   %r10,%r11,%rax
   77950:	4d 89 19             	mov    %r11,(%r9)
   77953:	49 0f af 46 18       	imul   0x18(%r14),%rax
   77958:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
   7795f:	49 33 56 48          	xor    0x48(%r14),%rdx
   77963:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
   7796a:	c1 7c 51 
   7796d:	49 0f af d1          	imul   %r9,%rdx
   77971:	4c 8b 8d 08 ff ff ff 	mov    -0xf8(%rbp),%r9
   77978:	4d 8b d9             	mov    %r9,%r11
   7797b:	49 33 d2             	xor    %r10,%rdx
   7797e:	49 0f af 53 08       	imul   0x8(%r11),%rdx
   77983:	4d 8b 13             	mov    (%r11),%r10
   77986:	4c 8d 9d 50 ff ff ff 	lea    -0xb0(%rbp),%r11
   7798d:	c4 c2 cb f6 d2       	mulx   %r10,%rsi,%rdx
   77992:	49 89 33             	mov    %rsi,(%r11)
   77995:	48 03 c2             	add    %rdx,%rax
   77998:	48 3b c1             	cmp    %rcx,%rax
   7799b:	72 0b                	jb     779a8 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x448>
   7799d:	2b c1                	sub    %ecx,%eax
   7799f:	49 8b 76 58          	mov    0x58(%r14),%rsi
   779a3:	48 98                	cltq
   779a5:	8b 04 86             	mov    (%rsi,%rax,4),%eax
   779a8:	48 63 f7             	movslq %edi,%rsi
   779ab:	49 89 04 f0          	mov    %rax,(%r8,%rsi,8)
   779af:	ff c7                	inc    %edi
   779b1:	41 3b fc             	cmp    %r12d,%edi
   779b4:	4c 89 8d 08 ff ff ff 	mov    %r9,-0xf8(%rbp)
   779bb:	48 8b b5 00 ff ff ff 	mov    -0x100(%rbp),%rsi
   779c2:	0f 8c 07 ff ff ff    	jl     778cf <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x36f>
   779c8:	e9 f0 00 00 00       	jmp    77abd <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   779cd:	33 c0                	xor    %eax,%eax
   779cf:	45 85 e4             	test   %r12d,%r12d
   779d2:	0f 8e e5 00 00 00    	jle    77abd <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x55d>
   779d8:	89 85 7c ff ff ff    	mov    %eax,-0x84(%rbp)
   779de:	48 63 f8             	movslq %eax,%rdi
   779e1:	49 8b 7c fd 00       	mov    0x0(%r13,%rdi,8),%rdi
   779e6:	49 8b 76 48          	mov    0x48(%r14),%rsi
   779ea:	e8 31 2b 00 00       	call   7a520 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__Hash>
   779ef:	48 89 85 10 ff ff ff 	mov    %rax,-0xf0(%rbp)
   779f6:	49 8b fe             	mov    %r14,%rdi
   779f9:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   77a00:	e8 1b cc 08 00       	call   104620 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__Bucket>
   77a05:	49 8b 7e 08          	mov    0x8(%r14),%rdi
   77a09:	0f b6 04 07          	movzbl (%rdi,%rax,1),%eax
   77a0d:	48 89 85 48 ff ff ff 	mov    %rax,-0xb8(%rbp)
   77a14:	49 8d 76 68          	lea    0x68(%r14),%rsi
   77a18:	48 8b 36             	mov    (%rsi),%rsi
   77a1b:	48 8b fe             	mov    %rsi,%rdi
   77a1e:	33 f6                	xor    %esi,%esi
   77a20:	48 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%rdx
   77a27:	33 c9                	xor    %ecx,%ecx
   77a29:	e8 02 c7 01 00       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
   77a2e:	48 8b f8             	mov    %rax,%rdi
   77a31:	48 8b f2             	mov    %rdx,%rsi
   77a34:	ba 40 00 00 00       	mov    $0x40,%edx
   77a39:	e8 42 c7 01 00       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   77a3e:	49 0f af 46 18       	imul   0x18(%r14),%rax
   77a43:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
   77a4a:	48 8b bd 48 ff ff ff 	mov    -0xb8(%rbp),%rdi
   77a51:	49 33 7e 48          	xor    0x48(%r14),%rdi
   77a55:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
   77a5c:	c1 7c 51 
   77a5f:	48 0f af fe          	imul   %rsi,%rdi
   77a63:	4d 8d 8e 80 00 00 00 	lea    0x80(%r14),%r9
   77a6a:	48 8b b5 10 ff ff ff 	mov    -0xf0(%rbp),%rsi
   77a71:	48 33 fe             	xor    %rsi,%rdi
   77a74:	49 0f af 79 08       	imul   0x8(%r9),%rdi
   77a79:	49 8b 11             	mov    (%r9),%rdx
   77a7c:	33 f6                	xor    %esi,%esi
   77a7e:	33 c9                	xor    %ecx,%ecx
   77a80:	e8 ab c6 01 00       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
   77a85:	48 8b f8             	mov    %rax,%rdi
   77a88:	48 8b f2             	mov    %rdx,%rsi
   77a8b:	ba 40 00 00 00       	mov    $0x40,%edx
   77a90:	e8 eb c6 01 00       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   77a95:	48 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%rdi
   77a9c:	48 03 f8             	add    %rax,%rdi
   77a9f:	8b b5 7c ff ff ff    	mov    -0x84(%rbp),%esi
   77aa5:	48 63 c6             	movslq %esi,%rax
   77aa8:	4c 8b 45 80          	mov    -0x80(%rbp),%r8
   77aac:	49 89 3c c0          	mov    %rdi,(%r8,%rax,8)
   77ab0:	ff c6                	inc    %esi
   77ab2:	41 3b f4             	cmp    %r12d,%esi
   77ab5:	8b c6                	mov    %esi,%eax
   77ab7:	0f 8c 1b ff ff ff    	jl     779d8 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x478>
   77abd:	33 ff                	xor    %edi,%edi
   77abf:	48 89 7d 88          	mov    %rdi,-0x78(%rbp)
   77ac3:	48 89 7d 90          	mov    %rdi,-0x70(%rbp)
   77ac7:	48 8b 3d 5a 40 1b 00 	mov    0x1b405a(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77ace:	4c 8b 77 18          	mov    0x18(%rdi),%r14
   77ad2:	4d 85 ff             	test   %r15,%r15
   77ad5:	75 08                	jne    77adf <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x57f>
   77ad7:	45 33 ed             	xor    %r13d,%r13d
   77ada:	45 33 e4             	xor    %r12d,%r12d
   77add:	eb 08                	jmp    77ae7 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x587>
   77adf:	4d 8d 6f 10          	lea    0x10(%r15),%r13
   77ae3:	45 8b 67 08          	mov    0x8(%r15),%r12d
   77ae7:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   77aeb:	c5 fa 7f 85 30 ff ff 	vmovdqu %xmm0,-0xd0(%rbp)
   77af2:	ff 
   77af3:	48 8d bd 30 ff ff ff 	lea    -0xd0(%rbp),%rdi
   77afa:	48 8b f3             	mov    %rbx,%rsi
   77afd:	e8 6e 37 09 00       	call   10b270 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   77b02:	48 8b 8d 30 ff ff ff 	mov    -0xd0(%rbp),%rcx
   77b09:	44 8b 85 38 ff ff ff 	mov    -0xc8(%rbp),%r8d
   77b10:	49 8b f5             	mov    %r13,%rsi
   77b13:	41 8b d4             	mov    %r12d,%edx
   77b16:	49 8b fe             	mov    %r14,%rdi
   77b19:	45 33 c9             	xor    %r9d,%r9d
   77b1c:	39 3f                	cmp    %edi,(%rdi)
   77b1e:	e8 7d cc 08 00       	call   1047a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>
   77b23:	33 db                	xor    %ebx,%ebx
   77b25:	4d 85 ff             	test   %r15,%r15
   77b28:	74 42                	je     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77b2a:	41 83 7f 08 64       	cmpl   $0x64,0x8(%r15)
   77b2f:	7c 3b                	jl     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77b31:	48 8b 3d f0 3f 1b 00 	mov    0x1b3ff0(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b38:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b3c:	8b f3                	mov    %ebx,%esi
   77b3e:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b43:	39 3f                	cmp    %edi,(%rdi)
   77b45:	e8 66 c7 08 00       	call   1042b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77b4a:	48 8b 3d d7 3f 1b 00 	mov    0x1b3fd7(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b51:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b55:	8b f3                	mov    %ebx,%esi
   77b57:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b5c:	39 3f                	cmp    %edi,(%rdi)
   77b5e:	e8 1d c9 08 00       	call   104480 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77b63:	ff c3                	inc    %ebx
   77b65:	83 fb 64             	cmp    $0x64,%ebx
   77b68:	7c c7                	jl     77b31 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x5d1>
   77b6a:	eb 43                	jmp    77baf <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x64f>
   77b6c:	48 8b 3d b5 3f 1b 00 	mov    0x1b3fb5(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b73:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b77:	41 3b 5f 08          	cmp    0x8(%r15),%ebx
   77b7b:	0f 83 a4 00 00 00    	jae    77c25 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x6c5>
   77b81:	8b f3                	mov    %ebx,%esi
   77b83:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b88:	39 3f                	cmp    %edi,(%rdi)
   77b8a:	e8 21 c7 08 00       	call   1042b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77b8f:	48 8b 3d 92 3f 1b 00 	mov    0x1b3f92(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b96:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b9a:	8b f3                	mov    %ebx,%esi
   77b9c:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77ba1:	39 3f                	cmp    %edi,(%rdi)
   77ba3:	e8 d8 c8 08 00       	call   104480 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77ba8:	ff c3                	inc    %ebx
   77baa:	83 fb 64             	cmp    $0x64,%ebx
   77bad:	7c bd                	jl     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77baf:	48 8d 3d 32 24 1d 00 	lea    0x1d2432(%rip),%rdi        # 249fe8 <__Str_JIT_warmup_complete__0DAE2BD7E8651565932C6EA373EC942BC13BA8E721DA0F4E914F424C749DD85D>
   77bb6:	e8 75 4e 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77bbb:	90                   	nop
   77bbc:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   77bc3:	5b                   	pop    %rbx
   77bc4:	41 5c                	pop    %r12
   77bc6:	41 5d                	pop    %r13
   77bc8:	41 5e                	pop    %r14
   77bca:	41 5f                	pop    %r15
   77bcc:	5d                   	pop    %rbp
   77bcd:	c3                   	ret
   77bce:	bf 10 00 00 00       	mov    $0x10,%edi
   77bd3:	e8 98 86 00 00       	call   80270 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   77bd8:	cc                   	int3
   77bd9:	48 8d 3d 28 56 1e 00 	lea    0x1e5628(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77be0:	e8 bf d9 fe ff       	call   655a4 <RhpNewFast>
   77be5:	48 8b d8             	mov    %rax,%rbx
   77be8:	48 8b fb             	mov    %rbx,%rdi
   77beb:	48 8d 35 6e 25 1d 00 	lea    0x1d256e(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77bf2:	e8 59 33 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77bf7:	48 8b fb             	mov    %rbx,%rdi
   77bfa:	e8 0f dc fe ff       	call   6580e <RhpThrowEx>
   77bff:	48 8d 3d 02 56 1e 00 	lea    0x1e5602(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77c06:	e8 99 d9 fe ff       	call   655a4 <RhpNewFast>
   77c0b:	48 8b d8             	mov    %rax,%rbx
   77c0e:	48 8b fb             	mov    %rbx,%rdi
   77c11:	48 8d 35 48 25 1d 00 	lea    0x1d2548(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77c18:	e8 33 33 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77c1d:	48 8b fb             	mov    %rbx,%rdi
   77c20:	e8 e9 db fe ff       	call   6580e <RhpThrowEx>
   77c25:	e8 96 32 05 00       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   77c2a:	cc                   	int3
   77c2b:	90                   	nop
   77c2c:	90                   	nop
   77c2d:	90                   	nop
   77c2e:	90                   	nop
   77c2f:	90                   	nop

0000000000077c30 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch>:
   77c30:	55                   	push   %rbp
   77c31:	41 57                	push   %r15
   77c33:	41 56                	push   %r14
   77c35:	53                   	push   %rbx
   77c36:	48 83 ec 28          	sub    $0x28,%rsp
   77c3a:	c5 f8 77             	vzeroupper
   77c3d:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   77c42:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
   77c47:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
   77c4c:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
   77c51:	33 c0                	xor    %eax,%eax
   77c53:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
   77c57:	48 8d 3d fa 66 1d 00 	lea    0x1d66fa(%rip),%rdi        # 24e358 <__Str_Testing_GetIndicesStreamPrefet_DFEC981FE3992F56C08A364E99D8E9725ED1C914578F7F525692F9A2069E1387>
   77c5e:	e8 cd 4d 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77c63:	48 8b 1d be 3e 1b 00 	mov    0x1b3ebe(%rip),%rbx        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77c6a:	4c 8b 7b 10          	mov    0x10(%rbx),%r15
   77c6e:	41 8b 77 08          	mov    0x8(%r15),%esi
   77c72:	48 8d 3d a7 d6 21 00 	lea    0x21d6a7(%rip),%rdi        # 295320 <_ZTV16__Array<UIntPtr>>
   77c79:	e8 3c da fe ff       	call   656ba <RhpNewArray>
   77c7e:	4c 8b f0             	mov    %rax,%r14
   77c81:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   77c85:	4d 85 ff             	test   %r15,%r15
   77c88:	75 06                	jne    77c90 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x60>
   77c8a:	33 f6                	xor    %esi,%esi
   77c8c:	33 d2                	xor    %edx,%edx
   77c8e:	eb 08                	jmp    77c98 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x68>
   77c90:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77c94:	41 8b 57 08          	mov    0x8(%r15),%edx
   77c98:	49 8d 4e 10          	lea    0x10(%r14),%rcx
   77c9c:	45 8b 46 08          	mov    0x8(%r14),%r8d
   77ca0:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   77ca4:	74 0d                	je     77cb3 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x83>
   77ca6:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77cac:	e8 8f d3 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77cb1:	eb 0b                	jmp    77cbe <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x8e>
   77cb3:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   77cb9:	e8 22 d7 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77cbe:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   77cc2:	48 8b 4b 10          	mov    0x10(%rbx),%rcx
   77cc6:	48 85 c9             	test   %rcx,%rcx
   77cc9:	75 06                	jne    77cd1 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xa1>
   77ccb:	33 f6                	xor    %esi,%esi
   77ccd:	33 d2                	xor    %edx,%edx
   77ccf:	eb 07                	jmp    77cd8 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xa8>
   77cd1:	48 8d 71 10          	lea    0x10(%rcx),%rsi
   77cd5:	8b 51 08             	mov    0x8(%rcx),%edx
   77cd8:	49 8d 4e 10          	lea    0x10(%r14),%rcx
   77cdc:	45 8b 46 08          	mov    0x8(%r14),%r8d
   77ce0:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   77ce4:	74 0a                	je     77cf0 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc0>
   77ce6:	45 33 c9             	xor    %r9d,%r9d
   77ce9:	e8 52 d3 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   77cee:	eb 08                	jmp    77cf8 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0xc8>
   77cf0:	45 33 c9             	xor    %r9d,%r9d
   77cf3:	e8 e8 d6 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   77cf8:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77cfc:	be 22 00 00 00       	mov    $0x22,%esi
   77d01:	ba 01 00 00 00       	mov    $0x1,%edx
   77d06:	e8 f5 94 04 00       	call   c1200 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
   77d0b:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77d0e:	3b 7d e0             	cmp    -0x20(%rbp),%edi
   77d11:	0f 87 cd 00 00 00    	ja     77de4 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x1b4>
   77d17:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   77d1b:	8b c7                	mov    %edi,%eax
   77d1d:	48 8d 34 46          	lea    (%rsi,%rax,2),%rsi
   77d21:	8b 45 e0             	mov    -0x20(%rbp),%eax
   77d24:	2b c7                	sub    %edi,%eax
   77d26:	83 f8 0c             	cmp    $0xc,%eax
   77d29:	72 28                	jb     77d53 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x123>
   77d2b:	48 8d 3d e6 a4 1c 00 	lea    0x1ca4e6(%rip),%rdi        # 242218 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77d32:	48 83 c7 0c          	add    $0xc,%rdi
   77d36:	c5 fa 6f 07          	vmovdqu (%rdi),%xmm0
   77d3a:	c5 fa 6f 4f 08       	vmovdqu 0x8(%rdi),%xmm1
   77d3f:	c5 fa 7f 06          	vmovdqu %xmm0,(%rsi)
   77d43:	c5 fa 7f 4e 08       	vmovdqu %xmm1,0x8(%rsi)
   77d48:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77d4b:	83 c7 0c             	add    $0xc,%edi
   77d4e:	89 7d d0             	mov    %edi,-0x30(%rbp)
   77d51:	eb 10                	jmp    77d63 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x133>
   77d53:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77d57:	48 8d 35 ba a4 1c 00 	lea    0x1ca4ba(%rip),%rsi        # 242218 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   77d5e:	e8 7d 96 04 00       	call   c13e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77d63:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   77d67:	8b 76 08             	mov    0x8(%rsi),%esi
   77d6a:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77d6e:	e8 ed be 0b 00       	call   133c60 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
   77d73:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77d76:	3b 7d e0             	cmp    -0x20(%rbp),%edi
   77d79:	77 69                	ja     77de4 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x1b4>
   77d7b:	48 8b 75 d8          	mov    -0x28(%rbp),%rsi
   77d7f:	8b c7                	mov    %edi,%eax
   77d81:	48 8d 34 46          	lea    (%rsi,%rax,2),%rsi
   77d85:	8b 45 e0             	mov    -0x20(%rbp),%eax
   77d88:	2b c7                	sub    %edi,%eax
   77d8a:	83 f8 16             	cmp    $0x16,%eax
   77d8d:	72 28                	jb     77db7 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x187>
   77d8f:	48 8d 3d 7a a9 1c 00 	lea    0x1ca97a(%rip),%rdi        # 242710 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77d96:	48 83 c7 0c          	add    $0xc,%rdi
   77d9a:	c5 fe 6f 07          	vmovdqu (%rdi),%ymm0
   77d9e:	c5 fa 6f 4f 1c       	vmovdqu 0x1c(%rdi),%xmm1
   77da3:	c5 fe 7f 06          	vmovdqu %ymm0,(%rsi)
   77da7:	c5 fa 7f 4e 1c       	vmovdqu %xmm1,0x1c(%rsi)
   77dac:	8b 7d d0             	mov    -0x30(%rbp),%edi
   77daf:	83 c7 16             	add    $0x16,%edi
   77db2:	89 7d d0             	mov    %edi,-0x30(%rbp)
   77db5:	eb 10                	jmp    77dc7 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStreamPrefetch+0x197>
   77db7:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77dbb:	48 8d 35 4e a9 1c 00 	lea    0x1ca94e(%rip),%rsi        # 242710 <__Str__keys_with_prefetching_7D74716B97304C78AC45626F98B1BB0F1083D62C00EA0EBE1B5AB87B36CE273A>
   77dc2:	e8 19 96 04 00       	call   c13e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   77dc7:	48 8d 7d c0          	lea    -0x40(%rbp),%rdi
   77dcb:	e8 d0 94 04 00       	call   c12a0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   77dd0:	48 8b f8             	mov    %rax,%rdi
   77dd3:	e8 58 4c 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77dd8:	90                   	nop
   77dd9:	48 83 c4 28          	add    $0x28,%rsp
   77ddd:	5b                   	pop    %rbx
   77dde:	41 5e                	pop    %r14
   77de0:	41 5f                	pop    %r15
   77de2:	5d                   	pop    %rbp
   77de3:	c3                   	ret
   77de4:	e8 37 ad 01 00       	call   92b20 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   77de9:	cc                   	int3
   77dea:	90                   	nop
   77deb:	90                   	nop
   77dec:	90                   	nop
   77ded:	90                   	nop
   77dee:	90                   	nop
   77def:	90                   	nop
   77df0:	90                   	nop
   77df1:	90                   	nop
   77df2:	90                   	nop
   77df3:	90                   	nop
   77df4:	90                   	nop
   77df5:	90                   	nop
   77df6:	90                   	nop
   77df7:	90                   	nop
   77df8:	90                   	nop
   77df9:	90                   	nop
   77dfa:	90                   	nop
   77dfb:	90                   	nop
   77dfc:	90                   	nop
   77dfd:	90                   	nop
   77dfe:	90                   	nop
   77dff:	90                   	nop

   787fa:	e8 41 c8 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   787ff:	eb 0e                	jmp    7880f <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x10f>
   78801:	49 8b cc             	mov    %r12,%rcx
   78804:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   7880a:	e8 d1 cb 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7880f:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   78813:	4d 85 f6             	test   %r14,%r14
   78816:	75 06                	jne    7881e <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x11e>
   78818:	33 f6                	xor    %esi,%esi
   7881a:	33 d2                	xor    %edx,%edx
   7881c:	eb 08                	jmp    78826 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x126>
   7881e:	49 8d 76 10          	lea    0x10(%r14),%rsi
   78822:	41 8b 56 08          	mov    0x8(%r14),%edx
   78826:	4c 8b 7d d0          	mov    -0x30(%rbp),%r15
   7882a:	49 83 c7 10          	add    $0x10,%r15
   7882e:	49 8b cf             	mov    %r15,%rcx
   78831:	41 b8 00 02 00 00    	mov    $0x200,%r8d
   78837:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   7883b:	74 0d                	je     7884a <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x14a>
   7883d:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78843:	e8 f8 c7 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   78848:	eb 0b                	jmp    78855 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x155>
   7884a:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78850:	e8 8b cb 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   78855:	48 8b 7b 18          	mov    0x18(%rbx),%rdi
   78859:	4d 85 ed             	test   %r13,%r13
   7885c:	75 06                	jne    78864 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x164>
   7885e:	33 f6                	xor    %esi,%esi
   78860:	33 d2                	xor    %edx,%edx
   78862:	eb 08                	jmp    7886c <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x16c>
   78864:	49 8d 75 10          	lea    0x10(%r13),%rsi
   78868:	41 8b 55 08          	mov    0x8(%r13),%edx
   7886c:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
   78870:	48 83 c3 10          	add    $0x10,%rbx
   78874:	48 8b cb             	mov    %rbx,%rcx
   78877:	41 b8 00 10 00 00    	mov    $0x1000,%r8d
   7887d:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
   78881:	74 0d                	je     78890 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x190>
   78883:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78889:	e8 b2 c7 08 00       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
   7888e:	eb 0b                	jmp    7889b <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern+0x19b>
   78890:	41 b9 01 00 00 00    	mov    $0x1,%r9d
   78896:	e8 45 cb 08 00       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
   7889b:	48 8d 3d 5e 9a 1c 00 	lea    0x1c9a5e(%rip),%rdi        # 242300 <__Str___Tested_prefetch_patterns_for_DE81E3DAF059C0B18D33D0B771E134E96E0008DA1110A965332E23E19D043BB8>
   788a2:	e8 89 41 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   788a7:	90                   	nop
   788a8:	48 83 c4 18          	add    $0x18,%rsp
   788ac:	5b                   	pop    %rbx
   788ad:	41 5c                	pop    %r12
   788af:	41 5d                	pop    %r13
   788b1:	41 5e                	pop    %r14
   788b3:	41 5f                	pop    %r15
   788b5:	5d                   	pop    %rbp
   788b6:	c3                   	ret
   788b7:	bf 10 00 00 00       	mov    $0x10,%edi
   788bc:	e8 af 79 00 00       	call   80270 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   788c1:	cc                   	int3
   788c2:	90                   	nop
   788c3:	90                   	nop
   788c4:	90                   	nop
   788c5:	90                   	nop
   788c6:	90                   	nop
   788c7:	90                   	nop
   788c8:	90                   	nop
   788c9:	90                   	nop
   788ca:	90                   	nop
   788cb:	90                   	nop
   788cc:	90                   	nop
   788cd:	90                   	nop
   788ce:	90                   	nop
   788cf:	90                   	nop

0000000000105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>:
  105040:	55                   	push   %rbp
  105041:	41 57                	push   %r15
  105043:	41 56                	push   %r14
  105045:	41 55                	push   %r13
  105047:	41 54                	push   %r12
  105049:	53                   	push   %rbx
  10504a:	48 83 ec 68          	sub    $0x68,%rsp
  10504e:	c5 f8 77             	vzeroupper
  105051:	48 8d ac 24 90 00 00 	lea    0x90(%rsp),%rbp
  105058:	00 
  105059:	33 c0                	xor    %eax,%eax
  10505b:	48 89 45 88          	mov    %rax,-0x78(%rbp)
  10505f:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  105064:	c5 79 7f 45 90       	vmovdqa %xmm8,-0x70(%rbp)
  105069:	c5 79 7f 45 a0       	vmovdqa %xmm8,-0x60(%rbp)
  10506e:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  105073:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  105078:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  10507c:	48 8b 05 fd e5 0b 00 	mov    0xbe5fd(%rip),%rax        # 1c3680 <__security_cookie>
  105083:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  10508a:	41 3b d0             	cmp    %r8d,%edx
  10508d:	0f 85 24 03 00 00    	jne    1053b7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x377>
  105093:	45 84 c9             	test   %r9b,%r9b
  105096:	74 06                	je     10509e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x5e>
  105098:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  10509c:	eb 02                	jmp    1050a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x60>
  10509e:	33 c0                	xor    %eax,%eax
  1050a0:	0f b6 c0             	movzbl %al,%eax
  1050a3:	4c 8b 47 38          	mov    0x38(%rdi),%r8
  1050a7:	85 24 24             	test   %esp,(%rsp)
  1050aa:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1050b1:	4c 8d 0c 24          	lea    (%rsp),%r9
  1050b5:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1050b9:	62 d1 7e 48 7f 01    	vmovdqu32 %zmm0,(%r9)
  1050bf:	62 d1 7e 48 7f 41 01 	vmovdqu32 %zmm0,0x40(%r9)
  1050c6:	62 d1 7e 48 7f 41 02 	vmovdqu32 %zmm0,0x80(%r9)
  1050cd:	62 d1 7e 48 7f 41 03 	vmovdqu32 %zmm0,0xc0(%r9)
  1050d4:	85 24 24             	test   %esp,(%rsp)
  1050d7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1050de:	4c 8d 14 24          	lea    (%rsp),%r10
  1050e2:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1050e6:	62 d1 7e 48 7f 02    	vmovdqu32 %zmm0,(%r10)
  1050ec:	62 d1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%r10)
  1050f3:	62 d1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%r10)
  1050fa:	62 d1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%r10)
  105101:	4c 89 4d d0          	mov    %r9,-0x30(%rbp)
  105105:	4c 89 55 c8          	mov    %r10,-0x38(%rbp)
  105109:	44 8b da             	mov    %edx,%r11d
  10510c:	bb 20 00 00 00       	mov    $0x20,%ebx
  105111:	41 83 fb 20          	cmp    $0x20,%r11d
  105115:	89 55 84             	mov    %edx,-0x7c(%rbp)
  105118:	0f 4c da             	cmovl  %edx,%ebx
  10511b:	89 5d c4             	mov    %ebx,-0x3c(%rbp)
  10511e:	45 33 db             	xor    %r11d,%r11d
  105121:	85 db                	test   %ebx,%ebx
  105123:	0f 8e 86 02 00 00    	jle    1053af <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x36f>
  105129:	4d 63 fb             	movslq %r11d,%r15
  10512c:	4e 8b 34 fe          	mov    (%rsi,%r15,8),%r14
  105130:	4c 33 77 48          	xor    0x48(%rdi),%r14
  105134:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  10513b:	c1 7c 51 
  10513e:	4c 8d 65 b0          	lea    -0x50(%rbp),%r12
  105142:	49 8b d6             	mov    %r14,%rdx
  105145:	c4 c2 e3 f6 d5       	mulx   %r13,%rbx,%rdx
  10514a:	49 89 1c 24          	mov    %rbx,(%r12)
  10514e:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
  105152:	48 33 d3             	xor    %rbx,%rdx
  105155:	49 0f af d5          	imul   %r13,%rdx
  105159:	4b 89 14 f9          	mov    %rdx,(%r9,%r15,8)
  10515d:	4b 8b 1c f9          	mov    (%r9,%r15,8),%rbx
  105161:	48 8b 57 70          	mov    0x70(%rdi),%rdx
  105165:	4c 8d 75 a8          	lea    -0x58(%rbp),%r14
  105169:	c4 e2 93 f6 d3       	mulx   %rbx,%r13,%rdx
  10516e:	4d 89 2e             	mov    %r13,(%r14)
  105171:	4b 89 14 fa          	mov    %rdx,(%r10,%r15,8)
  105175:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  105179:	4b 03 14 fa          	add    (%r10,%r15,8),%rdx
  10517d:	0f 18 0a             	prefetcht0 (%rdx)
  105180:	41 ff c3             	inc    %r11d
  105183:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
  105186:	44 3b db             	cmp    %ebx,%r11d
  105189:	0f 8c 1b 02 00 00    	jl     1053aa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x36a>
  10518f:	83 fb 20             	cmp    $0x20,%ebx
  105192:	7d 24                	jge    1051b8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x178>
  105194:	0f 1f 40 00          	nopl   0x0(%rax)
  105198:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  10519f:	00 
  1051a0:	48 63 d3             	movslq %ebx,%rdx
  1051a3:	45 33 db             	xor    %r11d,%r11d
  1051a6:	4d 89 1c d1          	mov    %r11,(%r9,%rdx,8)
  1051aa:	48 63 d3             	movslq %ebx,%rdx
  1051ad:	4d 89 1c d2          	mov    %r11,(%r10,%rdx,8)
  1051b1:	ff c3                	inc    %ebx
  1051b3:	83 fb 20             	cmp    $0x20,%ebx
  1051b6:	7c e8                	jl     1051a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x160>
  1051b8:	45 33 db             	xor    %r11d,%r11d
  1051bb:	8b 55 84             	mov    -0x7c(%rbp),%edx
  1051be:	8d 5a e0             	lea    -0x20(%rdx),%ebx
  1051c1:	45 33 ff             	xor    %r15d,%r15d
  1051c4:	85 db                	test   %ebx,%ebx
  1051c6:	44 0f 4f fb          	cmovg  %ebx,%r15d
  1051ca:	44 89 7d c0          	mov    %r15d,-0x40(%rbp)
  1051ce:	45 85 ff             	test   %r15d,%r15d
  1051d1:	0f 8e 06 01 00 00    	jle    1052dd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x29d>
  1051d7:	48 8d 9f 80 00 00 00 	lea    0x80(%rdi),%rbx
  1051de:	45 8b f3             	mov    %r11d,%r14d
  1051e1:	41 c1 fe 1f          	sar    $0x1f,%r14d
  1051e5:	41 83 e6 1f          	and    $0x1f,%r14d
  1051e9:	45 03 f3             	add    %r11d,%r14d
  1051ec:	41 83 e6 e0          	and    $0xffffffe0,%r14d
  1051f0:	45 8b eb             	mov    %r11d,%r13d
  1051f3:	45 2b ee             	sub    %r14d,%r13d
  1051f6:	4d 63 f5             	movslq %r13d,%r14
  1051f9:	4f 8b 2c f1          	mov    (%r9,%r14,8),%r13
  1051fd:	4c 89 ad 78 ff ff ff 	mov    %r13,-0x88(%rbp)
  105204:	4f 8b 24 f2          	mov    (%r10,%r14,8),%r12
  105208:	4c 89 65 b8          	mov    %r12,-0x48(%rbp)
  10520c:	41 8d 53 20          	lea    0x20(%r11),%edx
  105210:	48 63 d2             	movslq %edx,%rdx
  105213:	48 8b 14 d6          	mov    (%rsi,%rdx,8),%rdx
  105217:	48 33 57 48          	xor    0x48(%rdi),%rdx
  10521b:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  105222:	c1 7c 51 
  105225:	4c 8d 6d a0          	lea    -0x60(%rbp),%r13
  105229:	c4 c2 9b f6 d7       	mulx   %r15,%r12,%rdx
  10522e:	4d 89 65 00          	mov    %r12,0x0(%r13)
  105232:	4c 8b 7d a0          	mov    -0x60(%rbp),%r15
  105236:	49 33 d7             	xor    %r15,%rdx
  105239:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  105240:	c1 7c 51 
  105243:	49 0f af d7          	imul   %r15,%rdx
  105247:	4b 89 14 f1          	mov    %rdx,(%r9,%r14,8)
  10524b:	4f 8b 3c f1          	mov    (%r9,%r14,8),%r15
  10524f:	48 8b 57 70          	mov    0x70(%rdi),%rdx
  105253:	4c 8d 6d 98          	lea    -0x68(%rbp),%r13
  105257:	c4 c2 9b f6 d7       	mulx   %r15,%r12,%rdx
  10525c:	4d 89 65 00          	mov    %r12,0x0(%r13)
  105260:	4b 89 14 f2          	mov    %rdx,(%r10,%r14,8)
  105264:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  105268:	4c 8b fa             	mov    %rdx,%r15
  10526b:	4f 03 3c f2          	add    (%r10,%r14,8),%r15
  10526f:	41 0f 18 0f          	prefetcht0 (%r15)
  105273:	4c 8b 65 b8          	mov    -0x48(%rbp),%r12
  105277:	42 0f b6 14 22       	movzbl (%rdx,%r12,1),%edx
  10527c:	48 33 57 48          	xor    0x48(%rdi),%rdx
  105280:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  105287:	c1 7c 51 
  10528a:	49 0f af d7          	imul   %r15,%rdx
  10528e:	4c 8b fb             	mov    %rbx,%r15
  105291:	4c 8b ad 78 ff ff ff 	mov    -0x88(%rbp),%r13
  105298:	49 33 d5             	xor    %r13,%rdx
  10529b:	49 0f af 57 08       	imul   0x8(%r15),%rdx
  1052a0:	4d 8b 3f             	mov    (%r15),%r15
  1052a3:	4c 8d 75 90          	lea    -0x70(%rbp),%r14
  1052a7:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  1052ac:	4d 89 2e             	mov    %r13,(%r14)
  1052af:	85 c0                	test   %eax,%eax
  1052b1:	74 13                	je     1052c6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x286>
  1052b3:	49 3b d0             	cmp    %r8,%rdx
  1052b6:	72 0e                	jb     1052c6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x286>
  1052b8:	4c 8b 7f 58          	mov    0x58(%rdi),%r15
  1052bc:	41 2b d0             	sub    %r8d,%edx
  1052bf:	48 63 d2             	movslq %edx,%rdx
  1052c2:	41 8b 14 97          	mov    (%r15,%rdx,4),%edx
  1052c6:	4d 63 fb             	movslq %r11d,%r15
  1052c9:	4a 89 14 f9          	mov    %rdx,(%rcx,%r15,8)
  1052cd:	41 ff c3             	inc    %r11d
  1052d0:	44 8b 7d c0          	mov    -0x40(%rbp),%r15d
  1052d4:	45 3b df             	cmp    %r15d,%r11d
  1052d7:	0f 8c 01 ff ff ff    	jl     1051de <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x19e>
  1052dd:	44 3b 5d 84          	cmp    -0x7c(%rbp),%r11d
  1052e1:	0f 8d 91 00 00 00    	jge    105378 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x338>
  1052e7:	48 8d 9f 80 00 00 00 	lea    0x80(%rdi),%rbx
  1052ee:	41 8b f3             	mov    %r11d,%esi
  1052f1:	c1 fe 1f             	sar    $0x1f,%esi
  1052f4:	83 e6 1f             	and    $0x1f,%esi
  1052f7:	41 03 f3             	add    %r11d,%esi
  1052fa:	83 e6 e0             	and    $0xffffffe0,%esi
  1052fd:	45 8b fb             	mov    %r11d,%r15d
  105300:	44 2b fe             	sub    %esi,%r15d
  105303:	49 63 f7             	movslq %r15d,%rsi
  105306:	49 8b 34 f1          	mov    (%r9,%rsi,8),%rsi
  10530a:	4c 8b 77 08          	mov    0x8(%rdi),%r14
  10530e:	4d 63 ff             	movslq %r15d,%r15
  105311:	4f 8b 3c fa          	mov    (%r10,%r15,8),%r15
  105315:	47 0f b6 3c 3e       	movzbl (%r14,%r15,1),%r15d
  10531a:	4c 33 7f 48          	xor    0x48(%rdi),%r15
  10531e:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  105325:	c1 7c 51 
  105328:	4d 0f af fe          	imul   %r14,%r15
  10532c:	4c 8b f3             	mov    %rbx,%r14
  10532f:	49 33 f7             	xor    %r15,%rsi
  105332:	49 0f af 76 08       	imul   0x8(%r14),%rsi
  105337:	4d 8b 3e             	mov    (%r14),%r15
  10533a:	4c 8d 75 88          	lea    -0x78(%rbp),%r14
  10533e:	48 8b d6             	mov    %rsi,%rdx
  105341:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  105346:	4d 89 2e             	mov    %r13,(%r14)
  105349:	85 c0                	test   %eax,%eax
  10534b:	74 12                	je     10535f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x31f>
  10534d:	49 3b d0             	cmp    %r8,%rdx
  105350:	72 0d                	jb     10535f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x31f>
  105352:	48 8b 77 58          	mov    0x58(%rdi),%rsi
  105356:	41 2b d0             	sub    %r8d,%edx
  105359:	48 63 d2             	movslq %edx,%rdx
  10535c:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  10535f:	49 63 f3             	movslq %r11d,%rsi
  105362:	48 89 14 f1          	mov    %rdx,(%rcx,%rsi,8)
  105366:	41 ff c3             	inc    %r11d
  105369:	8b 55 84             	mov    -0x7c(%rbp),%edx
  10536c:	44 3b da             	cmp    %edx,%r11d
  10536f:	89 55 84             	mov    %edx,-0x7c(%rbp)
  105372:	0f 8c 76 ff ff ff    	jl     1052ee <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x2ae>
  105378:	33 ff                	xor    %edi,%edi
  10537a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10537e:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  105382:	48 8d 3d f7 e2 0b 00 	lea    0xbe2f7(%rip),%rdi        # 1c3680 <__security_cookie>
  105389:	48 8b 3f             	mov    (%rdi),%rdi
  10538c:	48 39 bd 70 ff ff ff 	cmp    %rdi,-0x90(%rbp)
  105393:	74 05                	je     10539a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x35a>
  105395:	e8 f6 4b f0 ff       	call   9f90 <RhpFallbackFailFast>
  10539a:	90                   	nop
  10539b:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  10539f:	5b                   	pop    %rbx
  1053a0:	41 5c                	pop    %r12
  1053a2:	41 5d                	pop    %r13
  1053a4:	41 5e                	pop    %r14
  1053a6:	41 5f                	pop    %r15
  1053a8:	5d                   	pop    %rbp
  1053a9:	c3                   	ret
  1053aa:	e9 7a fd ff ff       	jmp    105129 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0xe9>
  1053af:	8b 5d c4             	mov    -0x3c(%rbp),%ebx
  1053b2:	e9 d8 fd ff ff       	jmp    10518f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart+0x14f>
  1053b7:	48 8d 3d 4a 7e 15 00 	lea    0x157e4a(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1053be:	e8 e1 01 f6 ff       	call   655a4 <RhpNewFast>
  1053c3:	48 8b d8             	mov    %rax,%rbx
  1053c6:	48 8b fb             	mov    %rbx,%rdi
  1053c9:	48 8d 35 90 4d 14 00 	lea    0x144d90(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  1053d0:	e8 7b 5b f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  1053d5:	48 8b fb             	mov    %rbx,%rdi
  1053d8:	e8 31 04 f6 ff       	call   6580e <RhpThrowEx>
  1053dd:	cc                   	int3
  1053de:	90                   	nop
  1053df:	90                   	nop

00000000001053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>:
  1053e0:	55                   	push   %rbp
  1053e1:	41 57                	push   %r15
  1053e3:	41 56                	push   %r14
  1053e5:	41 55                	push   %r13
  1053e7:	41 54                	push   %r12
  1053e9:	53                   	push   %rbx
  1053ea:	48 81 ec a8 00 00 00 	sub    $0xa8,%rsp
  1053f1:	c5 f8 77             	vzeroupper
  1053f4:	48 8d ac 24 d0 00 00 	lea    0xd0(%rsp),%rbp
  1053fb:	00 
  1053fc:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  105401:	c5 79 7f 85 60 ff ff 	vmovdqa %xmm8,-0xa0(%rbp)
  105408:	ff 
  105409:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  105410:	ff ff ff 
  105413:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  105419:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  10541f:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  105425:	48 83 c0 30          	add    $0x30,%rax
  105429:	75 e8                	jne    105413 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x33>
  10542b:	48 8b 05 4e e2 0b 00 	mov    0xbe24e(%rip),%rax        # 1c3680 <__security_cookie>
  105432:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  105439:	41 3b d0             	cmp    %r8d,%edx
  10543c:	0f 85 16 04 00 00    	jne    105858 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x478>
  105442:	45 84 c9             	test   %r9b,%r9b
  105445:	74 06                	je     10544d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6d>
  105447:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  10544b:	eb 02                	jmp    10544f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x6f>
  10544d:	33 c0                	xor    %eax,%eax
  10544f:	0f b6 c0             	movzbl %al,%eax
  105452:	4c 8b 47 38          	mov    0x38(%rdi),%r8
  105456:	4c 89 45 d0          	mov    %r8,-0x30(%rbp)
  10545a:	85 24 24             	test   %esp,(%rsp)
  10545d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105464:	4c 8d 0c 24          	lea    (%rsp),%r9
  105468:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  10546c:	62 d1 7e 48 7f 01    	vmovdqu32 %zmm0,(%r9)
  105472:	62 d1 7e 48 7f 41 01 	vmovdqu32 %zmm0,0x40(%r9)
  105479:	62 d1 7e 48 7f 41 02 	vmovdqu32 %zmm0,0x80(%r9)
  105480:	62 d1 7e 48 7f 41 03 	vmovdqu32 %zmm0,0xc0(%r9)
  105487:	85 24 24             	test   %esp,(%rsp)
  10548a:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105491:	4c 8d 14 24          	lea    (%rsp),%r10
  105495:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  105499:	62 d1 7e 48 7f 02    	vmovdqu32 %zmm0,(%r10)
  10549f:	62 d1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%r10)
  1054a6:	62 d1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%r10)
  1054ad:	62 d1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%r10)
  1054b4:	85 24 24             	test   %esp,(%rsp)
  1054b7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1054be:	4c 8d 1c 24          	lea    (%rsp),%r11
  1054c2:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1054c6:	62 d1 7e 48 7f 03    	vmovdqu32 %zmm0,(%r11)
  1054cc:	62 d1 7e 48 7f 43 01 	vmovdqu32 %zmm0,0x40(%r11)
  1054d3:	62 d1 7e 48 7f 43 02 	vmovdqu32 %zmm0,0x80(%r11)
  1054da:	62 d1 7e 48 7f 43 03 	vmovdqu32 %zmm0,0xc0(%r11)
  1054e1:	48 89 8d 40 ff ff ff 	mov    %rcx,-0xc0(%rbp)
  1054e8:	4c 89 4d c8          	mov    %r9,-0x38(%rbp)
  1054ec:	4c 89 55 c0          	mov    %r10,-0x40(%rbp)
  1054f0:	4c 89 5d b8          	mov    %r11,-0x48(%rbp)
  1054f4:	8b da                	mov    %edx,%ebx
  1054f6:	41 bf 20 00 00 00    	mov    $0x20,%r15d
  1054fc:	83 fb 20             	cmp    $0x20,%ebx
  1054ff:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%rbp)
  105505:	44 0f 4c fa          	cmovl  %edx,%r15d
  105509:	44 89 7d b4          	mov    %r15d,-0x4c(%rbp)
  10550d:	33 db                	xor    %ebx,%ebx
  10550f:	45 85 ff             	test   %r15d,%r15d
  105512:	0f 8e 37 03 00 00    	jle    10584f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x46f>
  105518:	4c 63 f3             	movslq %ebx,%r14
  10551b:	4e 8b 2c f6          	mov    (%rsi,%r14,8),%r13
  10551f:	4c 33 6f 48          	xor    0x48(%rdi),%r13
  105523:	49 bc 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r12
  10552a:	c1 7c 51 
  10552d:	4c 8d 7d 98          	lea    -0x68(%rbp),%r15
  105531:	49 8b d5             	mov    %r13,%rdx
  105534:	c4 c2 f3 f6 d4       	mulx   %r12,%rcx,%rdx
  105539:	49 89 0f             	mov    %rcx,(%r15)
  10553c:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
  105540:	48 33 d1             	xor    %rcx,%rdx
  105543:	49 0f af d4          	imul   %r12,%rdx
  105547:	4b 89 14 f1          	mov    %rdx,(%r9,%r14,8)
  10554b:	4b 8b 0c f1          	mov    (%r9,%r14,8),%rcx
  10554f:	48 8b 57 68          	mov    0x68(%rdi),%rdx
  105553:	4c 8d 7d 90          	lea    -0x70(%rbp),%r15
  105557:	c4 e2 93 f6 c9       	mulx   %rcx,%r13,%rcx
  10555c:	4d 89 2f             	mov    %r13,(%r15)
  10555f:	48 8b 55 90          	mov    -0x70(%rbp),%rdx
  105563:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
  10556a:	4b 89 0c f3          	mov    %rcx,(%r11,%r14,8)
  10556e:	4c 8b 7f 70          	mov    0x70(%rdi),%r15
  105572:	4c 8d 6d 88          	lea    -0x78(%rbp),%r13
  105576:	4c 8b a5 48 ff ff ff 	mov    -0xb8(%rbp),%r12
  10557d:	49 8b d7             	mov    %r15,%rdx
  105580:	c4 c2 bb f6 d4       	mulx   %r12,%r8,%rdx
  105585:	4d 89 45 00          	mov    %r8,0x0(%r13)
  105589:	48 0f af 4f 28       	imul   0x28(%rdi),%rcx
  10558e:	48 03 d1             	add    %rcx,%rdx
  105591:	4b 89 14 f2          	mov    %rdx,(%r10,%r14,8)
  105595:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  105599:	4b 03 14 f2          	add    (%r10,%r14,8),%rdx
  10559d:	0f 18 0a             	prefetcht0 (%rdx)
  1055a0:	ff c3                	inc    %ebx
  1055a2:	44 8b 7d b4          	mov    -0x4c(%rbp),%r15d
  1055a6:	41 3b df             	cmp    %r15d,%ebx
  1055a9:	0f 8c 9b 02 00 00    	jl     10584a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x46a>
  1055af:	41 83 ff 20          	cmp    $0x20,%r15d
  1055b3:	7d 25                	jge    1055da <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1fa>
  1055b5:	66 66 66 0f 1f 84 00 	data16 data16 nopw 0x0(%rax,%rax,1)
  1055bc:	00 00 00 00 
  1055c0:	49 63 d7             	movslq %r15d,%rdx
  1055c3:	33 c9                	xor    %ecx,%ecx
  1055c5:	49 89 0c d1          	mov    %rcx,(%r9,%rdx,8)
  1055c9:	49 89 0c d2          	mov    %rcx,(%r10,%rdx,8)
  1055cd:	49 89 0c d3          	mov    %rcx,(%r11,%rdx,8)
  1055d1:	41 ff c7             	inc    %r15d
  1055d4:	41 83 ff 20          	cmp    $0x20,%r15d
  1055d8:	7c e6                	jl     1055c0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1e0>
  1055da:	33 c9                	xor    %ecx,%ecx
  1055dc:	8b 95 5c ff ff ff    	mov    -0xa4(%rbp),%edx
  1055e2:	44 8d 42 e0          	lea    -0x20(%rdx),%r8d
  1055e6:	33 db                	xor    %ebx,%ebx
  1055e8:	45 85 c0             	test   %r8d,%r8d
  1055eb:	41 0f 4f d8          	cmovg  %r8d,%ebx
  1055ef:	89 5d b0             	mov    %ebx,-0x50(%rbp)
  1055f2:	85 db                	test   %ebx,%ebx
  1055f4:	0f 8e 44 02 00 00    	jle    10583e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x45e>
  1055fa:	44 8b c1             	mov    %ecx,%r8d
  1055fd:	41 c1 f8 1f          	sar    $0x1f,%r8d
  105601:	41 83 e0 1f          	and    $0x1f,%r8d
  105605:	44 03 c1             	add    %ecx,%r8d
  105608:	41 83 e0 e0          	and    $0xffffffe0,%r8d
  10560c:	44 8b f9             	mov    %ecx,%r15d
  10560f:	45 2b f8             	sub    %r8d,%r15d
  105612:	4d 63 c7             	movslq %r15d,%r8
  105615:	4f 8b 3c c1          	mov    (%r9,%r8,8),%r15
  105619:	4c 89 bd 50 ff ff ff 	mov    %r15,-0xb0(%rbp)
  105620:	4f 8b 34 c2          	mov    (%r10,%r8,8),%r14
  105624:	4f 8b 2c c3          	mov    (%r11,%r8,8),%r13
  105628:	4c 89 6d a8          	mov    %r13,-0x58(%rbp)
  10562c:	44 8d 61 20          	lea    0x20(%rcx),%r12d
  105630:	4d 63 e4             	movslq %r12d,%r12
  105633:	4e 8b 24 e6          	mov    (%rsi,%r12,8),%r12
  105637:	4c 33 67 48          	xor    0x48(%rdi),%r12
  10563b:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  105642:	c1 7c 51 
  105645:	48 89 95 30 ff ff ff 	mov    %rdx,-0xd0(%rbp)
  10564c:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
  105650:	4c 8b ad 30 ff ff ff 	mov    -0xd0(%rbp),%r13
  105657:	49 8b d4             	mov    %r12,%rdx
  10565a:	c4 c2 83 f6 d5       	mulx   %r13,%r15,%rdx
  10565f:	4c 89 3b             	mov    %r15,(%rbx)
  105662:	48 8b 5d 80          	mov    -0x80(%rbp),%rbx
  105666:	48 33 d3             	xor    %rbx,%rdx
  105669:	49 0f af d5          	imul   %r13,%rdx
  10566d:	4b 89 14 c1          	mov    %rdx,(%r9,%r8,8)
  105671:	4b 8b 1c c1          	mov    (%r9,%r8,8),%rbx
  105675:	48 8b 57 68          	mov    0x68(%rdi),%rdx
  105679:	4c 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%r15
  105680:	c4 e2 93 f6 d3       	mulx   %rbx,%r13,%rdx
  105685:	4d 89 2f             	mov    %r13,(%r15)
  105688:	48 8b 9d 78 ff ff ff 	mov    -0x88(%rbp),%rbx
  10568f:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  105693:	4b 89 14 c3          	mov    %rdx,(%r11,%r8,8)
  105697:	4c 8b 7f 70          	mov    0x70(%rdi),%r15
  10569b:	4c 8d ad 70 ff ff ff 	lea    -0x90(%rbp),%r13
  1056a2:	49 8b d7             	mov    %r15,%rdx
  1056a5:	c4 e2 9b f6 d3       	mulx   %rbx,%r12,%rdx
  1056aa:	4d 89 65 00          	mov    %r12,0x0(%r13)
  1056ae:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  1056b2:	48 0f af 5f 28       	imul   0x28(%rdi),%rbx
  1056b7:	48 03 d3             	add    %rbx,%rdx
  1056ba:	4b 89 14 c2          	mov    %rdx,(%r10,%r8,8)
  1056be:	48 8b 57 08          	mov    0x8(%rdi),%rdx
  1056c2:	48 8b da             	mov    %rdx,%rbx
  1056c5:	4b 03 1c c2          	add    (%r10,%r8,8),%rbx
  1056c9:	0f 18 0b             	prefetcht0 (%rbx)
  1056cc:	42 0f b6 14 32       	movzbl (%rdx,%r14,1),%edx
  1056d1:	48 33 57 48          	xor    0x48(%rdi),%rdx
  1056d5:	49 b8 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r8
  1056dc:	c1 7c 51 
  1056df:	49 0f af d0          	imul   %r8,%rdx
  1056e3:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  1056ea:	4c 8b bd 50 ff ff ff 	mov    -0xb0(%rbp),%r15
  1056f1:	49 33 d7             	xor    %r15,%rdx
  1056f4:	49 0f af 50 08       	imul   0x8(%r8),%rdx
  1056f9:	4d 8b 00             	mov    (%r8),%r8
  1056fc:	48 8d 9d 68 ff ff ff 	lea    -0x98(%rbp),%rbx
  105703:	c4 c2 83 f6 d0       	mulx   %r8,%r15,%rdx
  105708:	4c 89 3b             	mov    %r15,(%rbx)
  10570b:	4c 8b 6d a8          	mov    -0x58(%rbp),%r13
  10570f:	4c 0f af 6f 18       	imul   0x18(%rdi),%r13
  105714:	49 03 d5             	add    %r13,%rdx
  105717:	85 c0                	test   %eax,%eax
  105719:	74 1a                	je     105735 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x355>
  10571b:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
  10571f:	49 3b d0             	cmp    %r8,%rdx
  105722:	0f 82 11 01 00 00    	jb     105839 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x459>
  105728:	48 8b 5f 58          	mov    0x58(%rdi),%rbx
  10572c:	41 2b d0             	sub    %r8d,%edx
  10572f:	48 63 d2             	movslq %edx,%rdx
  105732:	8b 14 93             	mov    (%rbx,%rdx,4),%edx
  105735:	48 63 d9             	movslq %ecx,%rbx
  105738:	4c 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%r15
  10573f:	49 89 14 df          	mov    %rdx,(%r15,%rbx,8)
  105743:	ff c1                	inc    %ecx
  105745:	8b 5d b0             	mov    -0x50(%rbp),%ebx
  105748:	3b cb                	cmp    %ebx,%ecx
  10574a:	0f 8c e4 00 00 00    	jl     105834 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x454>
  105750:	3b 8d 5c ff ff ff    	cmp    -0xa4(%rbp),%ecx
  105756:	0f 8d a0 00 00 00    	jge    1057fc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x41c>
  10575c:	8b f1                	mov    %ecx,%esi
  10575e:	c1 fe 1f             	sar    $0x1f,%esi
  105761:	83 e6 1f             	and    $0x1f,%esi
  105764:	03 f1                	add    %ecx,%esi
  105766:	83 e6 e0             	and    $0xffffffe0,%esi
  105769:	8b d9                	mov    %ecx,%ebx
  10576b:	2b de                	sub    %esi,%ebx
  10576d:	48 63 f3             	movslq %ebx,%rsi
  105770:	49 8b 1c f1          	mov    (%r9,%rsi,8),%rbx
  105774:	4d 8b 34 f2          	mov    (%r10,%rsi,8),%r14
  105778:	49 8b 34 f3          	mov    (%r11,%rsi,8),%rsi
  10577c:	4c 8b 6f 08          	mov    0x8(%rdi),%r13
  105780:	47 0f b6 34 2e       	movzbl (%r14,%r13,1),%r14d
  105785:	4c 33 77 48          	xor    0x48(%rdi),%r14
  105789:	49 bd 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r13
  105790:	c1 7c 51 
  105793:	4d 0f af f5          	imul   %r13,%r14
  105797:	4c 8d af 80 00 00 00 	lea    0x80(%rdi),%r13
  10579e:	49 33 de             	xor    %r14,%rbx
  1057a1:	49 0f af 5d 08       	imul   0x8(%r13),%rbx
  1057a6:	4d 8b 75 00          	mov    0x0(%r13),%r14
  1057aa:	4c 8d ad 60 ff ff ff 	lea    -0xa0(%rbp),%r13
  1057b1:	48 8b d3             	mov    %rbx,%rdx
  1057b4:	c4 c2 9b f6 d6       	mulx   %r14,%r12,%rdx
  1057b9:	4d 89 65 00          	mov    %r12,0x0(%r13)
  1057bd:	48 0f af 77 18       	imul   0x18(%rdi),%rsi
  1057c2:	48 03 d6             	add    %rsi,%rdx
  1057c5:	85 c0                	test   %eax,%eax
  1057c7:	74 16                	je     1057df <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x3ff>
  1057c9:	4c 8b 45 d0          	mov    -0x30(%rbp),%r8
  1057cd:	49 3b d0             	cmp    %r8,%rdx
  1057d0:	72 60                	jb     105832 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x452>
  1057d2:	48 8b 77 58          	mov    0x58(%rdi),%rsi
  1057d6:	41 2b d0             	sub    %r8d,%edx
  1057d9:	48 63 d2             	movslq %edx,%rdx
  1057dc:	8b 14 96             	mov    (%rsi,%rdx,4),%edx
  1057df:	48 63 f1             	movslq %ecx,%rsi
  1057e2:	49 89 14 f7          	mov    %rdx,(%r15,%rsi,8)
  1057e6:	ff c1                	inc    %ecx
  1057e8:	8b 95 5c ff ff ff    	mov    -0xa4(%rbp),%edx
  1057ee:	3b ca                	cmp    %edx,%ecx
  1057f0:	89 95 5c ff ff ff    	mov    %edx,-0xa4(%rbp)
  1057f6:	0f 8c 60 ff ff ff    	jl     10575c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x37c>
  1057fc:	33 ff                	xor    %edi,%edi
  1057fe:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  105802:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  105806:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10580a:	48 8d 3d 6f de 0b 00 	lea    0xbde6f(%rip),%rdi        # 1c3680 <__security_cookie>
  105811:	48 8b 3f             	mov    (%rdi),%rdi
  105814:	48 39 bd 38 ff ff ff 	cmp    %rdi,-0xc8(%rbp)
  10581b:	74 05                	je     105822 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x442>
  10581d:	e8 6e 47 f0 ff       	call   9f90 <RhpFallbackFailFast>
  105822:	90                   	nop
  105823:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  105827:	5b                   	pop    %rbx
  105828:	41 5c                	pop    %r12
  10582a:	41 5d                	pop    %r13
  10582c:	41 5e                	pop    %r14
  10582e:	41 5f                	pop    %r15
  105830:	5d                   	pop    %rbp
  105831:	c3                   	ret
  105832:	eb ab                	jmp    1057df <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x3ff>
  105834:	e9 c1 fd ff ff       	jmp    1055fa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x21a>
  105839:	e9 f7 fe ff ff       	jmp    105735 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x355>
  10583e:	4c 8b bd 40 ff ff ff 	mov    -0xc0(%rbp),%r15
  105845:	e9 06 ff ff ff       	jmp    105750 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x370>
  10584a:	e9 c9 fc ff ff       	jmp    105518 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x138>
  10584f:	44 8b 7d b4          	mov    -0x4c(%rbp),%r15d
  105853:	e9 57 fd ff ff       	jmp    1055af <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart+0x1cf>
  105858:	48 8d 3d a9 79 15 00 	lea    0x1579a9(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  10585f:	e8 40 fd f5 ff       	call   655a4 <RhpNewFast>
  105864:	48 8b d8             	mov    %rax,%rbx
  105867:	48 8b fb             	mov    %rbx,%rdi
  10586a:	48 8d 35 ef 48 14 00 	lea    0x1448ef(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  105871:	e8 da 56 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  105876:	48 8b fb             	mov    %rbx,%rdi
  105879:	e8 90 ff f5 ff       	call   6580e <RhpThrowEx>
  10587e:	cc                   	int3
  10587f:	90                   	nop

  109aae:	e8 8d b5 ff ff       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
  109ab3:	eb 14                	jmp    109ac9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0xa9>
  109ab5:	48 8b c8             	mov    %rax,%rcx
  109ab8:	49 8b f6             	mov    %r14,%rsi
  109abb:	41 8b d7             	mov    %r15d,%edx
  109abe:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  109ac4:	e8 17 b9 ff ff       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
  109ac9:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  109acd:	33 f6                	xor    %esi,%esi
  109acf:	45 85 ff             	test   %r15d,%r15d
  109ad2:	7e 5f                	jle    109b33 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x113>
  109ad4:	8b c6                	mov    %esi,%eax
  109ad6:	8b 0c c7             	mov    (%rdi,%rax,8),%ecx
  109ad9:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  109add:	39 4a 08             	cmp    %ecx,0x8(%rdx)
  109ae0:	76 39                	jbe    109b1b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0xfb>
  109ae2:	3b 4a 08             	cmp    0x8(%rdx),%ecx
  109ae5:	0f 83 fe 01 00 00    	jae    109ce9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2c9>
  109aeb:	8b c9                	mov    %ecx,%ecx
  109aed:	48 c1 e1 04          	shl    $0x4,%rcx
  109af1:	48 8d 4c 0a 10       	lea    0x10(%rdx,%rcx,1),%rcx
  109af6:	48 8b 53 18          	mov    0x18(%rbx),%rdx
  109afa:	4d 8b 04 c6          	mov    (%r14,%rax,8),%r8
  109afe:	4c 8b 09             	mov    (%rcx),%r9
  109b01:	38 12                	cmp    %dl,(%rdx)
  109b03:	4d 3b c1             	cmp    %r9,%r8
  109b06:	75 13                	jne    109b1b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0xfb>
  109b08:	41 3b f5             	cmp    %r13d,%esi
  109b0b:	0f 83 d8 01 00 00    	jae    109ce9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2c9>
  109b11:	48 8b 49 08          	mov    0x8(%rcx),%rcx
  109b15:	49 89 0c c4          	mov    %rcx,(%r12,%rax,8)
  109b19:	eb 11                	jmp    109b2c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x10c>
  109b1b:	41 3b f5             	cmp    %r13d,%esi
  109b1e:	0f 83 c5 01 00 00    	jae    109ce9 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2c9>
  109b24:	48 8b 4b 20          	mov    0x20(%rbx),%rcx
  109b28:	49 89 0c c4          	mov    %rcx,(%r12,%rax,8)
  109b2c:	ff c6                	inc    %esi
  109b2e:	41 3b f7             	cmp    %r15d,%esi
  109b31:	7c a1                	jl     109ad4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0xb4>
  109b33:	48 8d 3d 46 9b 0b 00 	lea    0xb9b46(%rip),%rdi        # 1c3680 <__security_cookie>
  109b3a:	48 8b 3f             	mov    (%rdi),%rdi
  109b3d:	48 39 7d a8          	cmp    %rdi,-0x58(%rbp)
  109b41:	74 05                	je     109b48 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x128>
  109b43:	e8 48 04 f0 ff       	call   9f90 <RhpFallbackFailFast>
  109b48:	90                   	nop
  109b49:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  109b4d:	5b                   	pop    %rbx
  109b4e:	41 5c                	pop    %r12
  109b50:	41 5d                	pop    %r13
  109b52:	41 5e                	pop    %r14
  109b54:	41 5f                	pop    %r15
  109b56:	5d                   	pop    %rbp
  109b57:	c3                   	ret
  109b58:	48 8d 3d 41 ec 14 00 	lea    0x14ec41(%rip),%rdi        # 2587a0 <__NONGCSTATICSS_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109b5f:	48 83 7f f8 00       	cmpq   $0x0,-0x8(%rdi)
  109b64:	0f 85 75 01 00 00    	jne    109cdf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2bf>
  109b6a:	48 8b 05 07 26 12 00 	mov    0x122607(%rip),%rax        # 22c178 <__GCSTATICSS_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109b71:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
  109b75:	48 8b 78 08          	mov    0x8(%rax),%rdi
  109b79:	41 8b f7             	mov    %r15d,%esi
  109b7c:	39 3f                	cmp    %edi,(%rdi)
  109b7e:	e8 1d 18 00 00       	call   10b3a0 <S_P_CoreLib_System_Buffers_SharedArrayPool_1<UIntPtr>__Rent>
  109b83:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  109b87:	48 85 c0             	test   %rax,%rax
  109b8a:	75 11                	jne    109b9d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x17d>
  109b8c:	45 85 ff             	test   %r15d,%r15d
  109b8f:	0f 85 d0 00 00 00    	jne    109c65 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x245>
  109b95:	45 33 d2             	xor    %r10d,%r10d
  109b98:	45 33 db             	xor    %r11d,%r11d
  109b9b:	eb 15                	jmp    109bb2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x192>
  109b9d:	44 39 78 08          	cmp    %r15d,0x8(%rax)
  109ba1:	0f 82 be 00 00 00    	jb     109c65 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x245>
  109ba7:	4c 8d 50 10          	lea    0x10(%rax),%r10
  109bab:	45 8b df             	mov    %r15d,%r11d
  109bae:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  109bb2:	4c 89 55 b8          	mov    %r10,-0x48(%rbp)
  109bb6:	44 89 5d d4          	mov    %r11d,-0x2c(%rbp)
  109bba:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  109bbe:	80 7f 55 00          	cmpb   $0x0,0x55(%rdi)
  109bc2:	74 19                	je     109bdd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x1bd>
  109bc4:	49 8b ca             	mov    %r10,%rcx
  109bc7:	45 8b c3             	mov    %r11d,%r8d
  109bca:	49 8b f6             	mov    %r14,%rsi
  109bcd:	41 8b d7             	mov    %r15d,%edx
  109bd0:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  109bd6:	e8 65 b4 ff ff       	call   105040 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchSinglePart>
  109bdb:	eb 17                	jmp    109bf4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x1d4>
  109bdd:	49 8b ca             	mov    %r10,%rcx
  109be0:	45 8b c3             	mov    %r11d,%r8d
  109be3:	49 8b f6             	mov    %r14,%rsi
  109be6:	41 8b d7             	mov    %r15d,%edx
  109be9:	41 b9 01 00 00 00    	mov    $0x1,%r9d
  109bef:	e8 ec b7 ff ff       	call   1053e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamPrefetchMultiPart>
  109bf4:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  109bf8:	8b 75 d4             	mov    -0x2c(%rbp),%esi
  109bfb:	49 8b d6             	mov    %r14,%rdx
  109bfe:	41 8b c7             	mov    %r15d,%eax
  109c01:	49 8b cc             	mov    %r12,%rcx
  109c04:	45 8b c5             	mov    %r13d,%r8d
  109c07:	45 33 c9             	xor    %r9d,%r9d
  109c0a:	85 c0                	test   %eax,%eax
  109c0c:	7e 6c                	jle    109c7a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x25a>
  109c0e:	44 3b ce             	cmp    %esi,%r9d
  109c11:	73 4d                	jae    109c60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x240>
  109c13:	45 8b d1             	mov    %r9d,%r10d
  109c16:	46 8b 1c d7          	mov    (%rdi,%r10,8),%r11d
  109c1a:	4c 8b 7b 10          	mov    0x10(%rbx),%r15
  109c1e:	45 39 5f 08          	cmp    %r11d,0x8(%r15)
  109c22:	76 47                	jbe    109c6b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x24b>
  109c24:	45 3b 5f 08          	cmp    0x8(%r15),%r11d
  109c28:	73 36                	jae    109c60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x240>
  109c2a:	45 8b db             	mov    %r11d,%r11d
  109c2d:	49 c1 e3 04          	shl    $0x4,%r11
  109c31:	4f 8d 5c 1f 10       	lea    0x10(%r15,%r11,1),%r11
  109c36:	4c 8b 73 18          	mov    0x18(%rbx),%r14
  109c3a:	4e 8b 2c d2          	mov    (%rdx,%r10,8),%r13
  109c3e:	4d 8b 23             	mov    (%r11),%r12
  109c41:	45 38 36             	cmp    %r14b,(%r14)
  109c44:	4d 3b ec             	cmp    %r12,%r13
  109c47:	75 22                	jne    109c6b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x24b>
  109c49:	45 3b c8             	cmp    %r8d,%r9d
  109c4c:	73 12                	jae    109c60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x240>
  109c4e:	4d 8b 5b 08          	mov    0x8(%r11),%r11
  109c52:	4e 89 1c d1          	mov    %r11,(%rcx,%r10,8)
  109c56:	41 ff c1             	inc    %r9d
  109c59:	44 3b c8             	cmp    %eax,%r9d
  109c5c:	7c b0                	jl     109c0e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x1ee>
  109c5e:	eb 1a                	jmp    109c7a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x25a>
  109c60:	e8 5b 12 fc ff       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
  109c65:	e8 b6 8e f8 ff       	call   92b20 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
  109c6a:	cc                   	int3
  109c6b:	45 3b c8             	cmp    %r8d,%r9d
  109c6e:	73 f0                	jae    109c60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x240>
  109c70:	4c 8b 5b 20          	mov    0x20(%rbx),%r11
  109c74:	4e 89 1c d1          	mov    %r11,(%rcx,%r10,8)
  109c78:	eb dc                	jmp    109c56 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x236>
  109c7a:	4c 8b 7d b0          	mov    -0x50(%rbp),%r15
  109c7e:	49 8b 7f 08          	mov    0x8(%r15),%rdi
  109c82:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
  109c86:	33 d2                	xor    %edx,%edx
  109c88:	39 3f                	cmp    %edi,(%rdi)
  109c8a:	e8 91 19 00 00       	call   10b620 <S_P_CoreLib_System_Buffers_SharedArrayPool_1<UIntPtr>__Return>
  109c8f:	48 8d 3d ea 99 0b 00 	lea    0xb99ea(%rip),%rdi        # 1c3680 <__security_cookie>
  109c96:	48 8b 3f             	mov    (%rdi),%rdi
  109c99:	48 39 7d a8          	cmp    %rdi,-0x58(%rbp)
  109c9d:	74 05                	je     109ca4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x284>
  109c9f:	e8 ec 02 f0 ff       	call   9f90 <RhpFallbackFailFast>
  109ca4:	90                   	nop
  109ca5:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  109ca9:	5b                   	pop    %rbx
  109caa:	41 5c                	pop    %r12
  109cac:	41 5d                	pop    %r13
  109cae:	41 5e                	pop    %r14
  109cb0:	41 5f                	pop    %r15
  109cb2:	5d                   	pop    %rbp
  109cb3:	c3                   	ret
  109cb4:	e8 d7 11 fc ff       	call   cae90 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowOverflowException>
  109cb9:	48 8d 3d 48 35 15 00 	lea    0x153548(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  109cc0:	e8 df b8 f5 ff       	call   655a4 <RhpNewFast>
  109cc5:	48 8b d8             	mov    %rax,%rbx
  109cc8:	48 8b fb             	mov    %rbx,%rdi
  109ccb:	48 8d 35 1e 04 14 00 	lea    0x14041e(%rip),%rsi        # 24a0f0 <__Str_Key_and_value_spans_must_have__E5F69F0C03A0FBD9E1FD3A9E1354D228FFEDD0EE3D99CA68EDD54E9F85DA3BA8>
  109cd2:	e8 79 12 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  109cd7:	48 8b fb             	mov    %rbx,%rdi
  109cda:	e8 2f bb f5 ff       	call   6580e <RhpThrowEx>
  109cdf:	e8 3e ee ef ff       	call   8b22 <__GetGCStaticBase_S_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109ce4:	e9 81 fe ff ff       	jmp    109b6a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x14a>
  109ce9:	e8 d2 11 fc ff       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
  109cee:	cc                   	int3
  109cef:	55                   	push   %rbp
  109cf0:	41 57                	push   %r15
  109cf2:	41 56                	push   %r14
  109cf4:	41 55                	push   %r13
  109cf6:	41 54                	push   %r12
  109cf8:	53                   	push   %rbx
  109cf9:	50                   	push   %rax
  109cfa:	48 8d 05 9f ea 14 00 	lea    0x14ea9f(%rip),%rax        # 2587a0 <__NONGCSTATICSS_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109d01:	48 83 78 f8 00       	cmpq   $0x0,-0x8(%rax)
  109d06:	74 05                	je     109d0d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Collections_PtrHashDictionary_5<UInt64__UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__TryGetValueStream+0x2ed>
  109d08:	e8 15 ee ef ff       	call   8b22 <__GetGCStaticBase_S_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109d0d:	4c 8b 3d 64 24 12 00 	mov    0x122464(%rip),%r15        # 22c178 <__GCSTATICSS_P_CoreLib_System_Buffers_ArrayPool_1<UIntPtr>>
  109d14:	49 8b 7f 08          	mov    0x8(%r15),%rdi
  109d18:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
  109d1c:	33 d2                	xor    %edx,%edx
  109d1e:	39 3f                	cmp    %edi,(%rdi)
  109d20:	e8 fb 18 00 00       	call   10b620 <S_P_CoreLib_System_Buffers_SharedArrayPool_1<UIntPtr>__Return>
  109d25:	90                   	nop
  109d26:	48 83 c4 08          	add    $0x8,%rsp
  109d2a:	5b                   	pop    %rbx
  109d2b:	41 5c                	pop    %r12
  109d2d:	41 5d                	pop    %r13
  109d2f:	41 5e                	pop    %r14
  109d31:	41 5f                	pop    %r15
  109d33:	5d                   	pop    %rbp
  109d34:	c3                   	ret
  109d35:	90                   	nop
  109d36:	90                   	nop
  109d37:	90                   	nop
  109d38:	90                   	nop
  109d39:	90                   	nop
  109d3a:	90                   	nop
  109d3b:	90                   	nop
  109d3c:	90                   	nop
  109d3d:	90                   	nop
  109d3e:	90                   	nop
  109d3f:	90                   	nop

   774fc:	e8 ff 08 00 00       	call   77e00 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>
   77501:	e8 9a 0e 00 00       	call   783a0 <ASM_Analysis_AsmGeneration_Program__TestSingleLookups>
   77506:	e8 f5 11 00 00       	call   78700 <ASM_Analysis_AsmGeneration_Program__TestSpecificPrefetchPattern>
   7750b:	e8 c0 13 00 00       	call   788d0 <ASM_Analysis_AsmGeneration_Program__TestDictionaryMethods>
   77510:	48 8d 3d 89 e5 1c 00 	lea    0x1ce589(%rip),%rdi        # 245aa0 <__Str_Assembly_generation_complete__E694E220ABB5E659C8FE3A93D59496D8C08AFB825EDBB706847AAF14012E93FD>
   77517:	e8 14 55 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   7751c:	48 8d 3d 9d ee 1c 00 	lea    0x1cee9d(%rip),%rdi        # 2463c0 <__Str_Check_output_for_JIT_generated_E88BF50A10FDFF15CB02EFCA372E5395BD12F2100779560FE4DB5574C46B7085>
   77523:	e8 08 55 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77528:	90                   	nop
   77529:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
   77530:	5b                   	pop    %rbx
   77531:	41 5c                	pop    %r12
   77533:	41 5d                	pop    %r13
   77535:	41 5e                	pop    %r14
   77537:	41 5f                	pop    %r15
   77539:	5d                   	pop    %rbp
   7753a:	c3                   	ret
   7753b:	e8 e0 b5 01 00       	call   92b20 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException>
   77540:	cc                   	int3
   77541:	90                   	nop
   77542:	90                   	nop
   77543:	90                   	nop
   77544:	90                   	nop
   77545:	90                   	nop
   77546:	90                   	nop
   77547:	90                   	nop
   77548:	90                   	nop
   77549:	90                   	nop
   7754a:	90                   	nop
   7754b:	90                   	nop
   7754c:	90                   	nop
   7754d:	90                   	nop
   7754e:	90                   	nop
   7754f:	90                   	nop
   77550:	90                   	nop
   77551:	90                   	nop
   77552:	90                   	nop
   77553:	90                   	nop
   77554:	90                   	nop
   77555:	90                   	nop
   77556:	90                   	nop
   77557:	90                   	nop
   77558:	90                   	nop
   77559:	90                   	nop
   7755a:	90                   	nop
   7755b:	90                   	nop
   7755c:	90                   	nop
   7755d:	90                   	nop
   7755e:	90                   	nop
   7755f:	90                   	nop

   77b1e:	e8 7d cc 08 00       	call   1047a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>
   77b23:	33 db                	xor    %ebx,%ebx
   77b25:	4d 85 ff             	test   %r15,%r15
   77b28:	74 42                	je     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77b2a:	41 83 7f 08 64       	cmpl   $0x64,0x8(%r15)
   77b2f:	7c 3b                	jl     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77b31:	48 8b 3d f0 3f 1b 00 	mov    0x1b3ff0(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b38:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b3c:	8b f3                	mov    %ebx,%esi
   77b3e:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b43:	39 3f                	cmp    %edi,(%rdi)
   77b45:	e8 66 c7 08 00       	call   1042b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77b4a:	48 8b 3d d7 3f 1b 00 	mov    0x1b3fd7(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b51:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b55:	8b f3                	mov    %ebx,%esi
   77b57:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b5c:	39 3f                	cmp    %edi,(%rdi)
   77b5e:	e8 1d c9 08 00       	call   104480 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77b63:	ff c3                	inc    %ebx
   77b65:	83 fb 64             	cmp    $0x64,%ebx
   77b68:	7c c7                	jl     77b31 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x5d1>
   77b6a:	eb 43                	jmp    77baf <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x64f>
   77b6c:	48 8b 3d b5 3f 1b 00 	mov    0x1b3fb5(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b73:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b77:	41 3b 5f 08          	cmp    0x8(%r15),%ebx
   77b7b:	0f 83 a4 00 00 00    	jae    77c25 <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x6c5>
   77b81:	8b f3                	mov    %ebx,%esi
   77b83:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77b88:	39 3f                	cmp    %edi,(%rdi)
   77b8a:	e8 21 c7 08 00       	call   1042b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>
   77b8f:	48 8b 3d 92 3f 1b 00 	mov    0x1b3f92(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77b96:	48 8b 7f 18          	mov    0x18(%rdi),%rdi
   77b9a:	8b f3                	mov    %ebx,%esi
   77b9c:	49 8b 74 f7 10       	mov    0x10(%r15,%rsi,8),%rsi
   77ba1:	39 3f                	cmp    %edi,(%rdi)
   77ba3:	e8 d8 c8 08 00       	call   104480 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>
   77ba8:	ff c3                	inc    %ebx
   77baa:	83 fb 64             	cmp    $0x64,%ebx
   77bad:	7c bd                	jl     77b6c <ASM_Analysis_AsmGeneration_Program__WarmupMethods+0x60c>
   77baf:	48 8d 3d 32 24 1d 00 	lea    0x1d2432(%rip),%rdi        # 249fe8 <__Str_JIT_warmup_complete__0DAE2BD7E8651565932C6EA373EC942BC13BA8E721DA0F4E914F424C749DD85D>
   77bb6:	e8 75 4e 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77bbb:	90                   	nop
   77bbc:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   77bc3:	5b                   	pop    %rbx
   77bc4:	41 5c                	pop    %r12
   77bc6:	41 5d                	pop    %r13
   77bc8:	41 5e                	pop    %r14
   77bca:	41 5f                	pop    %r15
   77bcc:	5d                   	pop    %rbp
   77bcd:	c3                   	ret
   77bce:	bf 10 00 00 00       	mov    $0x10,%edi
   77bd3:	e8 98 86 00 00       	call   80270 <System_Linq_System_Linq_ThrowHelper__ThrowArgumentNullException>
   77bd8:	cc                   	int3
   77bd9:	48 8d 3d 28 56 1e 00 	lea    0x1e5628(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77be0:	e8 bf d9 fe ff       	call   655a4 <RhpNewFast>
   77be5:	48 8b d8             	mov    %rax,%rbx
   77be8:	48 8b fb             	mov    %rbx,%rdi
   77beb:	48 8d 35 6e 25 1d 00 	lea    0x1d256e(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77bf2:	e8 59 33 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77bf7:	48 8b fb             	mov    %rbx,%rdi
   77bfa:	e8 0f dc fe ff       	call   6580e <RhpThrowEx>
   77bff:	48 8d 3d 02 56 1e 00 	lea    0x1e5602(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   77c06:	e8 99 d9 fe ff       	call   655a4 <RhpNewFast>
   77c0b:	48 8b d8             	mov    %rax,%rbx
   77c0e:	48 8b fb             	mov    %rbx,%rdi
   77c11:	48 8d 35 48 25 1d 00 	lea    0x1d2548(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   77c18:	e8 33 33 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   77c1d:	48 8b fb             	mov    %rbx,%rdi
   77c20:	e8 e9 db fe ff       	call   6580e <RhpThrowEx>
   77c25:	e8 96 32 05 00       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   77c2a:	cc                   	int3
   77c2b:	90                   	nop
   77c2c:	90                   	nop
   77c2d:	90                   	nop
   77c2e:	90                   	nop
   77c2f:	90                   	nop

0000000000077e00 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream>:
   77e00:	55                   	push   %rbp
   77e01:	41 57                	push   %r15
   77e03:	41 56                	push   %r14
   77e05:	41 55                	push   %r13
   77e07:	41 54                	push   %r12
   77e09:	53                   	push   %rbx
   77e0a:	48 81 ec d8 00 00 00 	sub    $0xd8,%rsp
   77e11:	c5 f8 77             	vzeroupper
   77e14:	48 8d ac 24 00 01 00 	lea    0x100(%rsp),%rbp
   77e1b:	00 
   77e1c:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
   77e21:	c5 79 7f 85 20 ff ff 	vmovdqa %xmm8,-0xe0(%rbp)
   77e28:	ff 
   77e29:	c5 79 7f 85 30 ff ff 	vmovdqa %xmm8,-0xd0(%rbp)
   77e30:	ff 
   77e31:	48 b8 70 ff ff ff ff 	movabs $0xffffffffffffff70,%rax
   77e38:	ff ff ff 
   77e3b:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
   77e41:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
   77e47:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
   77e4d:	48 83 c0 30          	add    $0x30,%rax
   77e51:	75 e8                	jne    77e3b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3b>
   77e53:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   77e57:	48 8d 3d 92 64 1d 00 	lea    0x1d6492(%rip),%rdi        # 24e2f0 <__Str_Testing_GetIndicesStream__no_p_3BADE5A8245CDE1F293826A4BEA915BC6A54827377AA32C6394D40F198A479BE>
   77e5e:	e8 cd 4b 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   77e63:	48 8b 35 be 3c 1b 00 	mov    0x1b3cbe(%rip),%rsi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77e6a:	48 8b 5e 10          	mov    0x10(%rsi),%rbx
   77e6e:	8b 73 08             	mov    0x8(%rbx),%esi
   77e71:	48 8d 3d a8 d4 21 00 	lea    0x21d4a8(%rip),%rdi        # 295320 <_ZTV16__Array<UIntPtr>>
   77e78:	e8 3d d8 fe ff       	call   656ba <RhpNewArray>
   77e7d:	4c 8b f8             	mov    %rax,%r15
   77e80:	48 8b 15 a1 3c 1b 00 	mov    0x1b3ca1(%rip),%rdx        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   77e87:	4c 8b 72 18          	mov    0x18(%rdx),%r14
   77e8b:	48 85 db             	test   %rbx,%rbx
   77e8e:	75 06                	jne    77e96 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x96>
   77e90:	33 d2                	xor    %edx,%edx
   77e92:	33 ff                	xor    %edi,%edi
   77e94:	eb 07                	jmp    77e9d <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x9d>
   77e96:	48 8d 53 10          	lea    0x10(%rbx),%rdx
   77e9a:	8b 7b 08             	mov    0x8(%rbx),%edi
   77e9d:	49 8d 77 10          	lea    0x10(%r15),%rsi
   77ea1:	41 8b 47 08          	mov    0x8(%r15),%eax
   77ea5:	41 80 7e 55 00       	cmpb   $0x0,0x55(%r14)
   77eaa:	0f 84 bb 01 00 00    	je     7806b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x26b>
   77eb0:	3b f8                	cmp    %eax,%edi
   77eb2:	0f 85 9a 04 00 00    	jne    78352 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x552>
   77eb8:	41 0f b6 4e 54       	movzbl 0x54(%r14),%ecx
   77ebd:	4d 8b 46 38          	mov    0x38(%r14),%r8
   77ec1:	45 33 c9             	xor    %r9d,%r9d
   77ec4:	85 ff                	test   %edi,%edi
   77ec6:	4c 0f 45 ca          	cmovne %rdx,%r9
   77eca:	4c 89 4d a8          	mov    %r9,-0x58(%rbp)
   77ece:	33 d2                	xor    %edx,%edx
   77ed0:	85 c0                	test   %eax,%eax
   77ed2:	48 0f 45 d6          	cmovne %rsi,%rdx
   77ed6:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   77eda:	48 8b f2             	mov    %rdx,%rsi
   77edd:	85 c9                	test   %ecx,%ecx
   77edf:	0f 84 c4 00 00 00    	je     77fa9 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x1a9>
   77ee5:	33 c0                	xor    %eax,%eax
   77ee7:	85 ff                	test   %edi,%edi
   77ee9:	0f 8e 6d 01 00 00    	jle    7805c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77eef:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   77ef6:	48 63 d0             	movslq %eax,%rdx
   77ef9:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77efd:	49 33 56 48          	xor    0x48(%r14),%rdx
   77f01:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77f08:	c1 7c 51 
   77f0b:	4c 8d 55 98          	lea    -0x68(%rbp),%r10
   77f0f:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77f14:	4d 89 1a             	mov    %r11,(%r10)
   77f17:	48 8b 4d 98          	mov    -0x68(%rbp),%rcx
   77f1b:	48 33 d1             	xor    %rcx,%rdx
   77f1e:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77f25:	c1 7c 51 
   77f28:	48 0f af d1          	imul   %rcx,%rdx
   77f2c:	48 89 95 18 ff ff ff 	mov    %rdx,-0xe8(%rbp)
   77f33:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77f37:	4c 8d 55 90          	lea    -0x70(%rbp),%r10
   77f3b:	4c 8b 9d 18 ff ff ff 	mov    -0xe8(%rbp),%r11
   77f42:	48 8b d1             	mov    %rcx,%rdx
   77f45:	c4 c2 93 f6 d3       	mulx   %r11,%r13,%rdx
   77f4a:	4d 89 2a             	mov    %r13,(%r10)
   77f4d:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   77f51:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   77f55:	49 33 56 48          	xor    0x48(%r14),%rdx
   77f59:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77f60:	c1 7c 51 
   77f63:	48 0f af d1          	imul   %rcx,%rdx
   77f67:	48 8b cb             	mov    %rbx,%rcx
   77f6a:	49 33 d3             	xor    %r11,%rdx
   77f6d:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   77f72:	48 8b 09             	mov    (%rcx),%rcx
   77f75:	4c 8d 55 88          	lea    -0x78(%rbp),%r10
   77f79:	c4 e2 a3 f6 d1       	mulx   %rcx,%r11,%rdx
   77f7e:	4d 89 1a             	mov    %r11,(%r10)
   77f81:	49 3b d0             	cmp    %r8,%rdx
   77f84:	72 0d                	jb     77f93 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x193>
   77f86:	41 2b d0             	sub    %r8d,%edx
   77f89:	49 8b 4e 58          	mov    0x58(%r14),%rcx
   77f8d:	48 63 d2             	movslq %edx,%rdx
   77f90:	8b 14 91             	mov    (%rcx,%rdx,4),%edx
   77f93:	48 63 c8             	movslq %eax,%rcx
   77f96:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   77f9a:	ff c0                	inc    %eax
   77f9c:	3b c7                	cmp    %edi,%eax
   77f9e:	0f 8c 52 ff ff ff    	jl     77ef6 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0xf6>
   77fa4:	e9 b3 00 00 00       	jmp    7805c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77fa9:	33 c0                	xor    %eax,%eax
   77fab:	85 ff                	test   %edi,%edi
   77fad:	0f 8e a9 00 00 00    	jle    7805c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x25c>
   77fb3:	49 8d 9e 80 00 00 00 	lea    0x80(%r14),%rbx
   77fba:	48 63 d0             	movslq %eax,%rdx
   77fbd:	49 8b 14 d1          	mov    (%r9,%rdx,8),%rdx
   77fc1:	49 33 56 48          	xor    0x48(%r14),%rdx
   77fc5:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77fcc:	c1 7c 51 
   77fcf:	4c 8d 45 80          	lea    -0x80(%rbp),%r8
   77fd3:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   77fd8:	4d 89 10             	mov    %r10,(%r8)
   77fdb:	48 8b 4d 80          	mov    -0x80(%rbp),%rcx
   77fdf:	48 33 d1             	xor    %rcx,%rdx
   77fe2:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   77fe9:	c1 7c 51 
   77fec:	48 0f af d1          	imul   %rcx,%rdx
   77ff0:	48 89 95 10 ff ff ff 	mov    %rdx,-0xf0(%rbp)
   77ff7:	49 8b 4e 70          	mov    0x70(%r14),%rcx
   77ffb:	4c 8d 85 78 ff ff ff 	lea    -0x88(%rbp),%r8
   78002:	4c 8b 95 10 ff ff ff 	mov    -0xf0(%rbp),%r10
   78009:	48 8b d1             	mov    %rcx,%rdx
   7800c:	c4 c2 a3 f6 d2       	mulx   %r10,%r11,%rdx
   78011:	4d 89 18             	mov    %r11,(%r8)
   78014:	49 8b 4e 08          	mov    0x8(%r14),%rcx
   78018:	0f b6 14 11          	movzbl (%rcx,%rdx,1),%edx
   7801c:	49 33 56 48          	xor    0x48(%r14),%rdx
   78020:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
   78027:	c1 7c 51 
   7802a:	48 0f af d1          	imul   %rcx,%rdx
   7802e:	48 8b cb             	mov    %rbx,%rcx
   78031:	49 33 d2             	xor    %r10,%rdx
   78034:	48 0f af 51 08       	imul   0x8(%rcx),%rdx
   78039:	48 8b 09             	mov    (%rcx),%rcx
   7803c:	4c 8d 85 70 ff ff ff 	lea    -0x90(%rbp),%r8
   78043:	c4 e2 ab f6 d1       	mulx   %rcx,%r10,%rdx
   78048:	4d 89 10             	mov    %r10,(%r8)
   7804b:	48 63 c8             	movslq %eax,%rcx
   7804e:	48 89 14 ce          	mov    %rdx,(%rsi,%rcx,8)
   78052:	ff c0                	inc    %eax
   78054:	3b c7                	cmp    %edi,%eax
   78056:	0f 8c 5e ff ff ff    	jl     77fba <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x1ba>
   7805c:	33 d2                	xor    %edx,%edx
   7805e:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
   78062:	48 89 55 a8          	mov    %rdx,-0x58(%rbp)
   78066:	e9 a3 01 00 00       	jmp    7820e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x40e>
   7806b:	44 8b ef             	mov    %edi,%r13d
   7806e:	48 8b fe             	mov    %rsi,%rdi
   78071:	8b f0                	mov    %eax,%esi
   78073:	44 3b ee             	cmp    %esi,%r13d
   78076:	0f 85 fc 02 00 00    	jne    78378 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x578>
   7807c:	41 0f b6 46 54       	movzbl 0x54(%r14),%eax
   78081:	4d 8b 66 38          	mov    0x38(%r14),%r12
   78085:	33 c9                	xor    %ecx,%ecx
   78087:	45 85 ed             	test   %r13d,%r13d
   7808a:	48 0f 45 ca          	cmovne %rdx,%rcx
   7808e:	48 89 8d 68 ff ff ff 	mov    %rcx,-0x98(%rbp)
   78095:	48 8b d9             	mov    %rcx,%rbx
   78098:	33 d2                	xor    %edx,%edx
   7809a:	85 f6                	test   %esi,%esi
   7809c:	48 0f 45 d7          	cmovne %rdi,%rdx
   780a0:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
   780a7:	48 8b ca             	mov    %rdx,%rcx
   780aa:	48 89 8d 58 ff ff ff 	mov    %rcx,-0xa8(%rbp)
   780b1:	85 c0                	test   %eax,%eax
   780b3:	0f 84 18 01 00 00    	je     781d1 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3d1>
   780b9:	33 c0                	xor    %eax,%eax
   780bb:	45 85 ed             	test   %r13d,%r13d
   780be:	0f 8e 3a 01 00 00    	jle    781fe <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   780c4:	89 85 54 ff ff ff    	mov    %eax,-0xac(%rbp)
   780ca:	48 63 d0             	movslq %eax,%rdx
   780cd:	48 8b 14 d3          	mov    (%rbx,%rdx,8),%rdx
   780d1:	49 33 56 48          	xor    0x48(%r14),%rdx
   780d5:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
   780dc:	c1 7c 51 
   780df:	48 8d b5 40 ff ff ff 	lea    -0xc0(%rbp),%rsi
   780e6:	c4 62 bb f6 cf       	mulx   %rdi,%r8,%r9
   780eb:	4c 89 06             	mov    %r8,(%rsi)
   780ee:	4c 8b 85 40 ff ff ff 	mov    -0xc0(%rbp),%r8
   780f5:	4d 33 c1             	xor    %r9,%r8
   780f8:	4c 0f af c7          	imul   %rdi,%r8
   780fc:	49 8b f8             	mov    %r8,%rdi
   780ff:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
   78106:	49 8d 56 78          	lea    0x78(%r14),%rdx
   7810a:	48 8b 12             	mov    (%rdx),%rdx
   7810d:	48 8d b5 38 ff ff ff 	lea    -0xc8(%rbp),%rsi
   78114:	c4 e2 bb f6 d7       	mulx   %rdi,%r8,%rdx
   78119:	4c 89 06             	mov    %r8,(%rsi)
   7811c:	49 8b 76 08          	mov    0x8(%r14),%rsi
   78120:	0f b6 14 16          	movzbl (%rsi,%rdx,1),%edx
   78124:	48 89 95 48 ff ff ff 	mov    %rdx,-0xb8(%rbp)
   7812b:	49 8d 7e 68          	lea    0x68(%r14),%rdi
   7812f:	48 8b b5 08 ff ff ff 	mov    -0xf8(%rbp),%rsi
   78136:	e8 f5 30 00 00       	call   7b230 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Computation_FastReduce__Reduce>
   7813b:	49 0f af 46 18       	imul   0x18(%r14),%rax
   78140:	48 89 85 30 ff ff ff 	mov    %rax,-0xd0(%rbp)
   78147:	48 8b bd 48 ff ff ff 	mov    -0xb8(%rbp),%rdi
   7814e:	49 33 7e 48          	xor    0x48(%r14),%rdi
   78152:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
   78159:	c1 7c 51 
   7815c:	48 0f af fe          	imul   %rsi,%rdi
   78160:	49 8d b6 80 00 00 00 	lea    0x80(%r14),%rsi
   78167:	48 8b 95 08 ff ff ff 	mov    -0xf8(%rbp),%rdx
   7816e:	48 33 fa             	xor    %rdx,%rdi
   78171:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
   78176:	48 8b 16             	mov    (%rsi),%rdx
   78179:	33 f6                	xor    %esi,%esi
   7817b:	33 c9                	xor    %ecx,%ecx
   7817d:	e8 ae bf 01 00       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
   78182:	48 8b f8             	mov    %rax,%rdi
   78185:	48 8b f2             	mov    %rdx,%rsi
   78188:	ba 40 00 00 00       	mov    $0x40,%edx
   7818d:	e8 ee bf 01 00       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
   78192:	48 8b b5 30 ff ff ff 	mov    -0xd0(%rbp),%rsi
   78199:	48 03 f0             	add    %rax,%rsi
   7819c:	49 3b f4             	cmp    %r12,%rsi
   7819f:	72 0d                	jb     781ae <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3ae>
   781a1:	41 2b f4             	sub    %r12d,%esi
   781a4:	49 8b 7e 58          	mov    0x58(%r14),%rdi
   781a8:	48 63 f6             	movslq %esi,%rsi
   781ab:	8b 34 b7             	mov    (%rdi,%rsi,4),%esi
   781ae:	8b bd 54 ff ff ff    	mov    -0xac(%rbp),%edi
   781b4:	48 63 c7             	movslq %edi,%rax
   781b7:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
   781be:	48 89 34 c1          	mov    %rsi,(%rcx,%rax,8)
   781c2:	ff c7                	inc    %edi
   781c4:	41 3b fd             	cmp    %r13d,%edi
   781c7:	8b c7                	mov    %edi,%eax
   781c9:	0f 8c f5 fe ff ff    	jl     780c4 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x2c4>
   781cf:	eb 2d                	jmp    781fe <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   781d1:	45 33 e4             	xor    %r12d,%r12d
   781d4:	45 85 ed             	test   %r13d,%r13d
   781d7:	7e 25                	jle    781fe <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3fe>
   781d9:	49 63 f4             	movslq %r12d,%rsi
   781dc:	48 8b 34 f3          	mov    (%rbx,%rsi,8),%rsi
   781e0:	49 8b fe             	mov    %r14,%rdi
   781e3:	e8 f8 bd 08 00       	call   103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
   781e8:	49 63 fc             	movslq %r12d,%rdi
   781eb:	48 8b b5 58 ff ff ff 	mov    -0xa8(%rbp),%rsi
   781f2:	48 89 04 fe          	mov    %rax,(%rsi,%rdi,8)
   781f6:	41 ff c4             	inc    %r12d
   781f9:	45 3b e5             	cmp    %r13d,%r12d
   781fc:	7c db                	jl     781d9 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x3d9>
   781fe:	33 ff                	xor    %edi,%edi
   78200:	48 89 bd 60 ff ff ff 	mov    %rdi,-0xa0(%rbp)
   78207:	48 89 bd 68 ff ff ff 	mov    %rdi,-0x98(%rbp)
   7820e:	48 8b 3d 13 39 1b 00 	mov    0x1b3913(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   78215:	48 8b 5f 18          	mov    0x18(%rdi),%rbx
   78219:	48 8b 3d 08 39 1b 00 	mov    0x1b3908(%rip),%rdi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   78220:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
   78224:	48 85 ff             	test   %rdi,%rdi
   78227:	75 08                	jne    78231 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x431>
   78229:	45 33 f6             	xor    %r14d,%r14d
   7822c:	45 33 ed             	xor    %r13d,%r13d
   7822f:	eb 08                	jmp    78239 <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x439>
   78231:	4c 8d 77 10          	lea    0x10(%rdi),%r14
   78235:	44 8b 6f 08          	mov    0x8(%rdi),%r13d
   78239:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
   7823d:	c5 fa 7f 85 20 ff ff 	vmovdqu %xmm0,-0xe0(%rbp)
   78244:	ff 
   78245:	48 8d bd 20 ff ff ff 	lea    -0xe0(%rbp),%rdi
   7824c:	49 8b f7             	mov    %r15,%rsi
   7824f:	e8 1c 30 09 00       	call   10b270 <S_P_CoreLib_System_Span_1<UIntPtr>___ctor>
   78254:	48 8b 8d 20 ff ff ff 	mov    -0xe0(%rbp),%rcx
   7825b:	44 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%r8d
   78262:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
   78266:	74 13                	je     7827b <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x47b>
   78268:	49 8b f6             	mov    %r14,%rsi
   7826b:	41 8b d5             	mov    %r13d,%edx
   7826e:	48 8b fb             	mov    %rbx,%rdi
   78271:	45 33 c9             	xor    %r9d,%r9d
   78274:	e8 e7 c8 08 00       	call   104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart>
   78279:	eb 11                	jmp    7828c <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x48c>
   7827b:	49 8b f6             	mov    %r14,%rsi
   7827e:	41 8b d5             	mov    %r13d,%edx
   78281:	48 8b fb             	mov    %rbx,%rdi
   78284:	45 33 c9             	xor    %r9d,%r9d
   78287:	e8 f4 ca 08 00       	call   104d80 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart>
   7828c:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   78290:	be 25 00 00 00       	mov    $0x25,%esi
   78295:	ba 01 00 00 00       	mov    $0x1,%edx
   7829a:	e8 61 8f 04 00       	call   c1200 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler___ctor>
   7829f:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   782a3:	8b 75 c0             	mov    -0x40(%rbp),%esi
   782a6:	e8 85 1e 08 00       	call   fa130 <S_P_CoreLib_System_Span_1<Char>__Slice>
   782ab:	48 8b f0             	mov    %rax,%rsi
   782ae:	48 8d 3d 63 9f 1c 00 	lea    0x1c9f63(%rip),%rdi        # 242218 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   782b5:	39 3f                	cmp    %edi,(%rdi)
   782b7:	e8 04 c9 00 00       	call   84bc0 <String__TryCopyTo>
   782bc:	85 c0                	test   %eax,%eax
   782be:	74 0b                	je     782cb <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x4cb>
   782c0:	8b 7d c0             	mov    -0x40(%rbp),%edi
   782c3:	83 c7 0c             	add    $0xc,%edi
   782c6:	89 7d c0             	mov    %edi,-0x40(%rbp)
   782c9:	eb 10                	jmp    782db <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x4db>
   782cb:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   782cf:	48 8d 35 42 9f 1c 00 	lea    0x1c9f42(%rip),%rsi        # 242218 <__Str___Processed__B0BC990A94906B16D341A9E9AC86F812F54FD5B8FC75277F26E80FA20B646174>
   782d6:	e8 05 91 04 00       	call   c13e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   782db:	48 8b 35 46 38 1b 00 	mov    0x1b3846(%rip),%rsi        # 22bb28 <__GCSTATICSASM_Analysis_AsmGeneration_Program>
   782e2:	48 8b 76 10          	mov    0x10(%rsi),%rsi
   782e6:	8b 76 08             	mov    0x8(%rsi),%esi
   782e9:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   782ed:	e8 6e b9 0b 00       	call   133c60 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__AppendFormatted<Int32>>
   782f2:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
   782f6:	8b 75 c0             	mov    -0x40(%rbp),%esi
   782f9:	e8 32 1e 08 00       	call   fa130 <S_P_CoreLib_System_Span_1<Char>__Slice>
   782fe:	48 8b f0             	mov    %rax,%rsi
   78301:	48 8d 3d 50 a4 1c 00 	lea    0x1ca450(%rip),%rdi        # 242758 <__Str__keys_without_prefetching_D8A361755FCD551AE19C922C947806AAE44FC92E986D052C498A0E8B5AAA0C53>
   78308:	39 3f                	cmp    %edi,(%rdi)
   7830a:	e8 b1 c8 00 00       	call   84bc0 <String__TryCopyTo>
   7830f:	85 c0                	test   %eax,%eax
   78311:	74 0b                	je     7831e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x51e>
   78313:	8b 7d c0             	mov    -0x40(%rbp),%edi
   78316:	83 c7 19             	add    $0x19,%edi
   78319:	89 7d c0             	mov    %edi,-0x40(%rbp)
   7831c:	eb 10                	jmp    7832e <ASM_Analysis_AsmGeneration_Program__TestGetIndicesStream+0x52e>
   7831e:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   78322:	48 8d 35 2f a4 1c 00 	lea    0x1ca42f(%rip),%rsi        # 242758 <__Str__keys_without_prefetching_D8A361755FCD551AE19C922C947806AAE44FC92E986D052C498A0E8B5AAA0C53>
   78329:	e8 b2 90 04 00       	call   c13e0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__GrowThenCopyString>
   7832e:	48 8d 7d b0          	lea    -0x50(%rbp),%rdi
   78332:	e8 69 8f 04 00       	call   c12a0 <S_P_CoreLib_System_Runtime_CompilerServices_DefaultInterpolatedStringHandler__ToStringAndClear>
   78337:	48 8b f8             	mov    %rax,%rdi
   7833a:	e8 f1 46 00 00       	call   7ca30 <System_Console_System_Console__WriteLine_12>
   7833f:	90                   	nop
   78340:	48 81 c4 d8 00 00 00 	add    $0xd8,%rsp
   78347:	5b                   	pop    %rbx
   78348:	41 5c                	pop    %r12
   7834a:	41 5d                	pop    %r13
   7834c:	41 5e                	pop    %r14
   7834e:	41 5f                	pop    %r15
   78350:	5d                   	pop    %rbp
   78351:	c3                   	ret
   78352:	48 8d 3d af 4e 1e 00 	lea    0x1e4eaf(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   78359:	e8 46 d2 fe ff       	call   655a4 <RhpNewFast>
   7835e:	48 8b d8             	mov    %rax,%rbx
   78361:	48 8b fb             	mov    %rbx,%rdi
   78364:	48 8d 35 f5 1d 1d 00 	lea    0x1d1df5(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   7836b:	e8 e0 2b 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   78370:	48 8b fb             	mov    %rbx,%rdi
   78373:	e8 96 d4 fe ff       	call   6580e <RhpThrowEx>
   78378:	48 8d 3d 89 4e 1e 00 	lea    0x1e4e89(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
   7837f:	e8 20 d2 fe ff       	call   655a4 <RhpNewFast>
   78384:	48 8b d8             	mov    %rax,%rbx
   78387:	48 8b fb             	mov    %rbx,%rdi
   7838a:	48 8d 35 cf 1d 1d 00 	lea    0x1d1dcf(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
   78391:	e8 ba 2b 01 00       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
   78396:	48 8b fb             	mov    %rbx,%rdi
   78399:	e8 70 d4 fe ff       	call   6580e <RhpThrowEx>
   7839e:	cc                   	int3
   7839f:	90                   	nop

00000000001047a0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream>:
  1047a0:	55                   	push   %rbp
  1047a1:	41 57                	push   %r15
  1047a3:	41 56                	push   %r14
  1047a5:	41 55                	push   %r13
  1047a7:	41 54                	push   %r12
  1047a9:	53                   	push   %rbx
  1047aa:	48 81 ec 88 00 00 00 	sub    $0x88,%rsp
  1047b1:	c5 f8 77             	vzeroupper
  1047b4:	48 8d ac 24 b0 00 00 	lea    0xb0(%rsp),%rbp
  1047bb:	00 
  1047bc:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  1047c1:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  1047c8:	ff ff ff 
  1047cb:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  1047d1:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  1047d7:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  1047dd:	48 83 c0 30          	add    $0x30,%rax
  1047e1:	75 e8                	jne    1047cb <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2b>
  1047e3:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  1047e7:	48 8b df             	mov    %rdi,%rbx
  1047ea:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  1047ee:	0f 84 2c 02 00 00    	je     104a20 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x280>
  1047f4:	44 8b fa             	mov    %edx,%r15d
  1047f7:	45 3b f8             	cmp    %r8d,%r15d
  1047fa:	0f 85 12 03 00 00    	jne    104b12 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x372>
  104800:	45 84 c9             	test   %r9b,%r9b
  104803:	74 06                	je     10480b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x6b>
  104805:	0f b6 53 54          	movzbl 0x54(%rbx),%edx
  104809:	eb 02                	jmp    10480d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x6d>
  10480b:	33 d2                	xor    %edx,%edx
  10480d:	4c 8b 73 38          	mov    0x38(%rbx),%r14
  104811:	33 ff                	xor    %edi,%edi
  104813:	45 85 ff             	test   %r15d,%r15d
  104816:	48 0f 45 fe          	cmovne %rsi,%rdi
  10481a:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  10481e:	4c 8b ef             	mov    %rdi,%r13
  104821:	33 ff                	xor    %edi,%edi
  104823:	45 85 c0             	test   %r8d,%r8d
  104826:	48 0f 45 f9          	cmovne %rcx,%rdi
  10482a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10482e:	4c 8b e7             	mov    %rdi,%r12
  104831:	85 d2                	test   %edx,%edx
  104833:	0f 84 dd 00 00 00    	je     104916 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x176>
  104839:	33 c0                	xor    %eax,%eax
  10483b:	45 85 ff             	test   %r15d,%r15d
  10483e:	0f 8e c0 01 00 00    	jle    104a04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  104844:	89 45 c4             	mov    %eax,-0x3c(%rbp)
  104847:	48 63 d0             	movslq %eax,%rdx
  10484a:	49 8b 54 d5 00       	mov    0x0(%r13,%rdx,8),%rdx
  10484f:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104853:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  10485a:	c1 7c 51 
  10485d:	48 8d 75 b8          	lea    -0x48(%rbp),%rsi
  104861:	c4 e2 f3 f6 d7       	mulx   %rdi,%rcx,%rdx
  104866:	48 89 0e             	mov    %rcx,(%rsi)
  104869:	48 8b 7d b8          	mov    -0x48(%rbp),%rdi
  10486d:	48 33 d7             	xor    %rdi,%rdx
  104870:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104877:	c1 7c 51 
  10487a:	48 0f af d7          	imul   %rdi,%rdx
  10487e:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  104885:	48 8b 7b 70          	mov    0x70(%rbx),%rdi
  104889:	48 8d 75 b0          	lea    -0x50(%rbp),%rsi
  10488d:	48 8b 8d 60 ff ff ff 	mov    -0xa0(%rbp),%rcx
  104894:	48 8b d7             	mov    %rdi,%rdx
  104897:	c4 e2 bb f6 d1       	mulx   %rcx,%r8,%rdx
  10489c:	4c 89 06             	mov    %r8,(%rsi)
  10489f:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1048a3:	0f b6 14 17          	movzbl (%rdi,%rdx,1),%edx
  1048a7:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1048ab:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1048b2:	c1 7c 51 
  1048b5:	48 0f af d7          	imul   %rdi,%rdx
  1048b9:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
  1048c0:	48 33 d1             	xor    %rcx,%rdx
  1048c3:	48 0f af 57 08       	imul   0x8(%rdi),%rdx
  1048c8:	48 8b 3f             	mov    (%rdi),%rdi
  1048cb:	48 8d 75 a8          	lea    -0x58(%rbp),%rsi
  1048cf:	c4 e2 f3 f6 ff       	mulx   %rdi,%rcx,%rdi
  1048d4:	48 89 0e             	mov    %rcx,(%rsi)
  1048d7:	48 8b f7             	mov    %rdi,%rsi
  1048da:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1048de:	ba 40 00 00 00       	mov    $0x40,%edx
  1048e3:	e8 98 f8 f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1048e8:	49 3b c6             	cmp    %r14,%rax
  1048eb:	72 0d                	jb     1048fa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x15a>
  1048ed:	41 2b c6             	sub    %r14d,%eax
  1048f0:	48 8b 53 58          	mov    0x58(%rbx),%rdx
  1048f4:	48 63 f8             	movslq %eax,%rdi
  1048f7:	8b 04 ba             	mov    (%rdx,%rdi,4),%eax
  1048fa:	8b 55 c4             	mov    -0x3c(%rbp),%edx
  1048fd:	48 63 fa             	movslq %edx,%rdi
  104900:	49 89 04 fc          	mov    %rax,(%r12,%rdi,8)
  104904:	ff c2                	inc    %edx
  104906:	41 3b d7             	cmp    %r15d,%edx
  104909:	8b c2                	mov    %edx,%eax
  10490b:	0f 8c 33 ff ff ff    	jl     104844 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0xa4>
  104911:	e9 ee 00 00 00       	jmp    104a04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  104916:	45 33 f6             	xor    %r14d,%r14d
  104919:	45 85 ff             	test   %r15d,%r15d
  10491c:	0f 8e e2 00 00 00    	jle    104a04 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x264>
  104922:	49 63 d6             	movslq %r14d,%rdx
  104925:	49 8b 7c d5 00       	mov    0x0(%r13,%rdx,8),%rdi
  10492a:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  10492e:	48 8d 55 a0          	lea    -0x60(%rbp),%rdx
  104932:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  104939:	c1 7c 51 
  10493c:	e8 9f f4 f7 ff       	call   83de0 <S_P_CoreLib_System_Math__BigMul_0>
  104941:	48 8b f0             	mov    %rax,%rsi
  104944:	c5 f8 57 c0          	vxorps %xmm0,%xmm0,%xmm0
  104948:	c5 f8 11 45 90       	vmovups %xmm0,-0x70(%rbp)
  10494d:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
  104951:	48 8b 55 a0          	mov    -0x60(%rbp),%rdx
  104955:	e8 a6 f7 f8 ff       	call   94100 <S_P_CoreLib_System_UInt128___ctor>
  10495a:	48 8b 45 90          	mov    -0x70(%rbp),%rax
  10495e:	48 89 85 58 ff ff ff 	mov    %rax,-0xa8(%rbp)
  104965:	48 8b 75 98          	mov    -0x68(%rbp),%rsi
  104969:	48 8b f8             	mov    %rax,%rdi
  10496c:	ba 40 00 00 00       	mov    $0x40,%edx
  104971:	e8 0a f8 f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104976:	48 8b 8d 58 ff ff ff 	mov    -0xa8(%rbp),%rcx
  10497d:	48 33 c1             	xor    %rcx,%rax
  104980:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
  104987:	c1 7c 51 
  10498a:	48 0f af c1          	imul   %rcx,%rax
  10498e:	48 89 85 50 ff ff ff 	mov    %rax,-0xb0(%rbp)
  104995:	48 8b fb             	mov    %rbx,%rdi
  104998:	48 8b b5 50 ff ff ff 	mov    -0xb0(%rbp),%rsi
  10499f:	e8 bc fc ff ff       	call   104660 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  1049a4:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1049a8:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  1049ad:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  1049b1:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  1049b8:	c1 7c 51 
  1049bb:	48 0f af fe          	imul   %rsi,%rdi
  1049bf:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  1049c6:	48 8b 95 50 ff ff ff 	mov    -0xb0(%rbp),%rdx
  1049cd:	48 33 fa             	xor    %rdx,%rdi
  1049d0:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  1049d5:	48 8b 16             	mov    (%rsi),%rdx
  1049d8:	33 f6                	xor    %esi,%esi
  1049da:	33 c9                	xor    %ecx,%ecx
  1049dc:	e8 4f f7 f8 ff       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
  1049e1:	48 8b f8             	mov    %rax,%rdi
  1049e4:	48 8b f2             	mov    %rdx,%rsi
  1049e7:	ba 40 00 00 00       	mov    $0x40,%edx
  1049ec:	e8 8f f7 f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1049f1:	49 63 fe             	movslq %r14d,%rdi
  1049f4:	49 89 04 fc          	mov    %rax,(%r12,%rdi,8)
  1049f8:	41 ff c6             	inc    %r14d
  1049fb:	45 3b f7             	cmp    %r15d,%r14d
  1049fe:	0f 8c 1e ff ff ff    	jl     104922 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x182>
  104a04:	33 ff                	xor    %edi,%edi
  104a06:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  104a0a:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  104a0e:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  104a15:	5b                   	pop    %rbx
  104a16:	41 5c                	pop    %r12
  104a18:	41 5d                	pop    %r13
  104a1a:	41 5e                	pop    %r14
  104a1c:	41 5f                	pop    %r15
  104a1e:	5d                   	pop    %rbp
  104a1f:	c3                   	ret
  104a20:	48 8b fe             	mov    %rsi,%rdi
  104a23:	44 8b fa             	mov    %edx,%r15d
  104a26:	48 89 4d 80          	mov    %rcx,-0x80(%rbp)
  104a2a:	44 89 45 88          	mov    %r8d,-0x78(%rbp)
  104a2e:	44 3b 7d 88          	cmp    -0x78(%rbp),%r15d
  104a32:	0f 85 00 01 00 00    	jne    104b38 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x398>
  104a38:	45 84 c9             	test   %r9b,%r9b
  104a3b:	74 07                	je     104a44 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2a4>
  104a3d:	44 0f b6 73 54       	movzbl 0x54(%rbx),%r14d
  104a42:	eb 03                	jmp    104a47 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2a7>
  104a44:	45 33 f6             	xor    %r14d,%r14d
  104a47:	4c 8b 6b 38          	mov    0x38(%rbx),%r13
  104a4b:	33 c0                	xor    %eax,%eax
  104a4d:	45 85 ff             	test   %r15d,%r15d
  104a50:	48 0f 45 c7          	cmovne %rdi,%rax
  104a54:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  104a5b:	4c 8b e0             	mov    %rax,%r12
  104a5e:	48 8d 7d 80          	lea    -0x80(%rbp),%rdi
  104a62:	e8 29 68 00 00       	call   10b290 <S_P_CoreLib_System_Span_1<UIntPtr>__GetPinnableReference>
  104a67:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  104a6e:	48 8b 85 70 ff ff ff 	mov    -0x90(%rbp),%rax
  104a75:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
  104a7c:	45 85 f6             	test   %r14d,%r14d
  104a7f:	74 41                	je     104ac2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x322>
  104a81:	45 33 f6             	xor    %r14d,%r14d
  104a84:	45 85 ff             	test   %r15d,%r15d
  104a87:	7e 67                	jle    104af0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  104a89:	49 63 f6             	movslq %r14d,%rsi
  104a8c:	49 8b 34 f4          	mov    (%r12,%rsi,8),%rsi
  104a90:	48 8b fb             	mov    %rbx,%rdi
  104a93:	e8 48 f5 ff ff       	call   103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
  104a98:	49 3b c5             	cmp    %r13,%rax
  104a9b:	72 0d                	jb     104aaa <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x30a>
  104a9d:	41 2b c5             	sub    %r13d,%eax
  104aa0:	48 8b 73 58          	mov    0x58(%rbx),%rsi
  104aa4:	48 63 f8             	movslq %eax,%rdi
  104aa7:	8b 04 be             	mov    (%rsi,%rdi,4),%eax
  104aaa:	49 63 f6             	movslq %r14d,%rsi
  104aad:	48 8b 8d 68 ff ff ff 	mov    -0x98(%rbp),%rcx
  104ab4:	48 89 04 f1          	mov    %rax,(%rcx,%rsi,8)
  104ab8:	41 ff c6             	inc    %r14d
  104abb:	45 3b f7             	cmp    %r15d,%r14d
  104abe:	7c c9                	jl     104a89 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x2e9>
  104ac0:	eb 2e                	jmp    104af0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  104ac2:	45 33 f6             	xor    %r14d,%r14d
  104ac5:	45 85 ff             	test   %r15d,%r15d
  104ac8:	7e 26                	jle    104af0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x350>
  104aca:	49 63 f6             	movslq %r14d,%rsi
  104acd:	49 8b 34 f4          	mov    (%r12,%rsi,8),%rsi
  104ad1:	48 8b fb             	mov    %rbx,%rdi
  104ad4:	e8 07 f5 ff ff       	call   103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>
  104ad9:	49 63 fe             	movslq %r14d,%rdi
  104adc:	4c 8b ad 68 ff ff ff 	mov    -0x98(%rbp),%r13
  104ae3:	49 89 44 fd 00       	mov    %rax,0x0(%r13,%rdi,8)
  104ae8:	41 ff c6             	inc    %r14d
  104aeb:	45 3b f7             	cmp    %r15d,%r14d
  104aee:	7c da                	jl     104aca <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStream+0x32a>
  104af0:	33 ff                	xor    %edi,%edi
  104af2:	48 89 bd 70 ff ff ff 	mov    %rdi,-0x90(%rbp)
  104af9:	48 89 bd 78 ff ff ff 	mov    %rdi,-0x88(%rbp)
  104b00:	48 81 c4 88 00 00 00 	add    $0x88,%rsp
  104b07:	5b                   	pop    %rbx
  104b08:	41 5c                	pop    %r12
  104b0a:	41 5d                	pop    %r13
  104b0c:	41 5e                	pop    %r14
  104b0e:	41 5f                	pop    %r15
  104b10:	5d                   	pop    %rbp
  104b11:	c3                   	ret
  104b12:	48 8d 3d ef 86 15 00 	lea    0x1586ef(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104b19:	e8 86 0a f6 ff       	call   655a4 <RhpNewFast>
  104b1e:	48 8b d8             	mov    %rax,%rbx
  104b21:	48 8b fb             	mov    %rbx,%rdi
  104b24:	48 8d 35 35 56 14 00 	lea    0x145635(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104b2b:	e8 20 64 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104b30:	48 8b fb             	mov    %rbx,%rdi
  104b33:	e8 d6 0c f6 ff       	call   6580e <RhpThrowEx>
  104b38:	48 8d 3d c9 86 15 00 	lea    0x1586c9(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104b3f:	e8 60 0a f6 ff       	call   655a4 <RhpNewFast>
  104b44:	48 8b d8             	mov    %rax,%rbx
  104b47:	48 8b fb             	mov    %rbx,%rdi
  104b4a:	48 8d 35 0f 56 14 00 	lea    0x14560f(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104b51:	e8 fa 63 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104b56:	48 8b fb             	mov    %rbx,%rdi
  104b59:	e8 b0 0c f6 ff       	call   6580e <RhpThrowEx>
  104b5e:	cc                   	int3
  104b5f:	90                   	nop

0000000000104b60 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart>:
  104b60:	55                   	push   %rbp
  104b61:	41 57                	push   %r15
  104b63:	53                   	push   %rbx
  104b64:	48 83 ec 60          	sub    $0x60,%rsp
  104b68:	48 8d 6c 24 70       	lea    0x70(%rsp),%rbp
  104b6d:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104b72:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  104b77:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  104b7c:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  104b81:	c5 79 7f 45 e0       	vmovdqa %xmm8,-0x20(%rbp)
  104b86:	41 3b d0             	cmp    %r8d,%edx
  104b89:	0f 85 b9 01 00 00    	jne    104d48 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1e8>
  104b8f:	45 84 c9             	test   %r9b,%r9b
  104b92:	74 06                	je     104b9a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x3a>
  104b94:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  104b98:	eb 02                	jmp    104b9c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x3c>
  104b9a:	33 c0                	xor    %eax,%eax
  104b9c:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
  104ba0:	45 33 d2             	xor    %r10d,%r10d
  104ba3:	85 d2                	test   %edx,%edx
  104ba5:	4c 0f 45 d6          	cmovne %rsi,%r10
  104ba9:	4c 89 55 e8          	mov    %r10,-0x18(%rbp)
  104bad:	49 8b f2             	mov    %r10,%rsi
  104bb0:	45 33 d2             	xor    %r10d,%r10d
  104bb3:	45 85 c0             	test   %r8d,%r8d
  104bb6:	4c 0f 45 d1          	cmovne %rcx,%r10
  104bba:	4c 89 55 e0          	mov    %r10,-0x20(%rbp)
  104bbe:	49 8b ca             	mov    %r10,%rcx
  104bc1:	85 c0                	test   %eax,%eax
  104bc3:	0f 84 c2 00 00 00    	je     104c8b <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x12b>
  104bc9:	33 c0                	xor    %eax,%eax
  104bcb:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104bce:	85 d2                	test   %edx,%edx
  104bd0:	0f 8e 5f 01 00 00    	jle    104d35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104bd6:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  104bdd:	4c 63 d0             	movslq %eax,%r10
  104be0:	4e 8b 14 d6          	mov    (%rsi,%r10,8),%r10
  104be4:	4c 33 57 48          	xor    0x48(%rdi),%r10
  104be8:	49 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r11
  104bef:	c1 7c 51 
  104bf2:	48 8d 5d d8          	lea    -0x28(%rbp),%rbx
  104bf6:	49 8b d2             	mov    %r10,%rdx
  104bf9:	c4 c2 83 f6 d3       	mulx   %r11,%r15,%rdx
  104bfe:	4c 89 3b             	mov    %r15,(%rbx)
  104c01:	4c 8b 55 d8          	mov    -0x28(%rbp),%r10
  104c05:	49 33 d2             	xor    %r10,%rdx
  104c08:	49 0f af d3          	imul   %r11,%rdx
  104c0c:	48 89 55 a0          	mov    %rdx,-0x60(%rbp)
  104c10:	4c 8b 57 70          	mov    0x70(%rdi),%r10
  104c14:	4c 8d 5d d0          	lea    -0x30(%rbp),%r11
  104c18:	48 8b 5d a0          	mov    -0x60(%rbp),%rbx
  104c1c:	49 8b d2             	mov    %r10,%rdx
  104c1f:	c4 e2 83 f6 d3       	mulx   %rbx,%r15,%rdx
  104c24:	4d 89 3b             	mov    %r15,(%r11)
  104c27:	4c 8b 57 08          	mov    0x8(%rdi),%r10
  104c2b:	41 0f b6 14 12       	movzbl (%r10,%rdx,1),%edx
  104c30:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104c34:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  104c3b:	c1 7c 51 
  104c3e:	49 0f af d2          	imul   %r10,%rdx
  104c42:	4d 8b d0             	mov    %r8,%r10
  104c45:	48 33 d3             	xor    %rbx,%rdx
  104c48:	49 0f af 52 08       	imul   0x8(%r10),%rdx
  104c4d:	4d 8b 12             	mov    (%r10),%r10
  104c50:	4c 8d 5d c8          	lea    -0x38(%rbp),%r11
  104c54:	c4 c2 e3 f6 d2       	mulx   %r10,%rbx,%rdx
  104c59:	49 89 1b             	mov    %rbx,(%r11)
  104c5c:	49 3b d1             	cmp    %r9,%rdx
  104c5f:	72 0e                	jb     104c6f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x10f>
  104c61:	41 2b d1             	sub    %r9d,%edx
  104c64:	4c 8b 57 58          	mov    0x58(%rdi),%r10
  104c68:	48 63 d2             	movslq %edx,%rdx
  104c6b:	41 8b 14 92          	mov    (%r10,%rdx,4),%edx
  104c6f:	4c 63 d0             	movslq %eax,%r10
  104c72:	4a 89 14 d1          	mov    %rdx,(%rcx,%r10,8)
  104c76:	ff c0                	inc    %eax
  104c78:	8b 55 ac             	mov    -0x54(%rbp),%edx
  104c7b:	3b c2                	cmp    %edx,%eax
  104c7d:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104c80:	0f 8c 57 ff ff ff    	jl     104bdd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x7d>
  104c86:	e9 aa 00 00 00       	jmp    104d35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104c8b:	33 c0                	xor    %eax,%eax
  104c8d:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104c90:	85 d2                	test   %edx,%edx
  104c92:	0f 8e 9d 00 00 00    	jle    104d35 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x1d5>
  104c98:	4c 8d 87 80 00 00 00 	lea    0x80(%rdi),%r8
  104c9f:	4c 63 c8             	movslq %eax,%r9
  104ca2:	4e 8b 0c ce          	mov    (%rsi,%r9,8),%r9
  104ca6:	4c 33 4f 48          	xor    0x48(%rdi),%r9
  104caa:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  104cb1:	c1 7c 51 
  104cb4:	4c 8d 5d c0          	lea    -0x40(%rbp),%r11
  104cb8:	49 8b d1             	mov    %r9,%rdx
  104cbb:	c4 c2 e3 f6 d2       	mulx   %r10,%rbx,%rdx
  104cc0:	49 89 1b             	mov    %rbx,(%r11)
  104cc3:	4c 8b 4d c0          	mov    -0x40(%rbp),%r9
  104cc7:	49 33 d1             	xor    %r9,%rdx
  104cca:	49 0f af d2          	imul   %r10,%rdx
  104cce:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  104cd2:	4c 8b 4f 70          	mov    0x70(%rdi),%r9
  104cd6:	4c 8d 55 b8          	lea    -0x48(%rbp),%r10
  104cda:	4c 8b 5d 98          	mov    -0x68(%rbp),%r11
  104cde:	49 8b d1             	mov    %r9,%rdx
  104ce1:	c4 c2 e3 f6 d3       	mulx   %r11,%rbx,%rdx
  104ce6:	49 89 1a             	mov    %rbx,(%r10)
  104ce9:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
  104ced:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  104cf2:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104cf6:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
  104cfd:	c1 7c 51 
  104d00:	49 0f af d1          	imul   %r9,%rdx
  104d04:	4d 8b c8             	mov    %r8,%r9
  104d07:	49 33 d3             	xor    %r11,%rdx
  104d0a:	49 0f af 51 08       	imul   0x8(%r9),%rdx
  104d0f:	4d 8b 09             	mov    (%r9),%r9
  104d12:	4c 8d 55 b0          	lea    -0x50(%rbp),%r10
  104d16:	c4 c2 a3 f6 d1       	mulx   %r9,%r11,%rdx
  104d1b:	4d 89 1a             	mov    %r11,(%r10)
  104d1e:	4c 63 c8             	movslq %eax,%r9
  104d21:	4a 89 14 c9          	mov    %rdx,(%rcx,%r9,8)
  104d25:	ff c0                	inc    %eax
  104d27:	8b 55 ac             	mov    -0x54(%rbp),%edx
  104d2a:	3b c2                	cmp    %edx,%eax
  104d2c:	89 55 ac             	mov    %edx,-0x54(%rbp)
  104d2f:	0f 8c 6a ff ff ff    	jl     104c9f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamSinglePart+0x13f>
  104d35:	33 ff                	xor    %edi,%edi
  104d37:	48 89 7d e0          	mov    %rdi,-0x20(%rbp)
  104d3b:	48 89 7d e8          	mov    %rdi,-0x18(%rbp)
  104d3f:	48 83 c4 60          	add    $0x60,%rsp
  104d43:	5b                   	pop    %rbx
  104d44:	41 5f                	pop    %r15
  104d46:	5d                   	pop    %rbp
  104d47:	c3                   	ret
  104d48:	48 8d 3d b9 84 15 00 	lea    0x1584b9(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  104d4f:	e8 50 08 f6 ff       	call   655a4 <RhpNewFast>
  104d54:	48 8b d8             	mov    %rax,%rbx
  104d57:	48 8b fb             	mov    %rbx,%rdi
  104d5a:	48 8d 35 ff 53 14 00 	lea    0x1453ff(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  104d61:	e8 ea 61 f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  104d66:	48 8b fb             	mov    %rbx,%rdi
  104d69:	e8 a0 0a f6 ff       	call   6580e <RhpThrowEx>
  104d6e:	cc                   	int3
  104d6f:	90                   	nop
  104d70:	90                   	nop
  104d71:	90                   	nop
  104d72:	90                   	nop
  104d73:	90                   	nop
  104d74:	90                   	nop
  104d75:	90                   	nop
  104d76:	90                   	nop
  104d77:	90                   	nop
  104d78:	90                   	nop
  104d79:	90                   	nop
  104d7a:	90                   	nop
  104d7b:	90                   	nop
  104d7c:	90                   	nop
  104d7d:	90                   	nop
  104d7e:	90                   	nop
  104d7f:	90                   	nop

0000000000104d80 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart>:
  104d80:	55                   	push   %rbp
  104d81:	41 57                	push   %r15
  104d83:	41 56                	push   %r14
  104d85:	41 55                	push   %r13
  104d87:	53                   	push   %rbx
  104d88:	48 81 ec 80 00 00 00 	sub    $0x80,%rsp
  104d8f:	48 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%rbp
  104d96:	00 
  104d97:	33 c0                	xor    %eax,%eax
  104d99:	48 89 85 78 ff ff ff 	mov    %rax,-0x88(%rbp)
  104da0:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104da5:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  104dac:	ff ff ff 
  104daf:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  104db5:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  104dbb:	c5 79 7f 04 28       	vmovdqa %xmm8,(%rax,%rbp,1)
  104dc0:	48 83 c0 30          	add    $0x30,%rax
  104dc4:	75 e9                	jne    104daf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x2f>
  104dc6:	41 3b d0             	cmp    %r8d,%edx
  104dc9:	0f 85 48 02 00 00    	jne    105017 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x297>
  104dcf:	45 84 c9             	test   %r9b,%r9b
  104dd2:	74 06                	je     104dda <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x5a>
  104dd4:	0f b6 47 54          	movzbl 0x54(%rdi),%eax
  104dd8:	eb 02                	jmp    104ddc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x5c>
  104dda:	33 c0                	xor    %eax,%eax
  104ddc:	4c 8b 4f 38          	mov    0x38(%rdi),%r9
  104de0:	45 33 d2             	xor    %r10d,%r10d
  104de3:	85 d2                	test   %edx,%edx
  104de5:	4c 0f 45 d6          	cmovne %rsi,%r10
  104de9:	4c 89 55 d8          	mov    %r10,-0x28(%rbp)
  104ded:	49 8b f2             	mov    %r10,%rsi
  104df0:	45 33 d2             	xor    %r10d,%r10d
  104df3:	45 85 c0             	test   %r8d,%r8d
  104df6:	4c 0f 45 d1          	cmovne %rcx,%r10
  104dfa:	4c 89 55 d0          	mov    %r10,-0x30(%rbp)
  104dfe:	49 8b ca             	mov    %r10,%rcx
  104e01:	85 c0                	test   %eax,%eax
  104e03:	0f 84 09 01 00 00    	je     104f12 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x192>
  104e09:	33 c0                	xor    %eax,%eax
  104e0b:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104e11:	85 d2                	test   %edx,%edx
  104e13:	0f 8e e4 01 00 00    	jle    104ffd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104e19:	4c 8d 47 78          	lea    0x78(%rdi),%r8
  104e1d:	4c 8d 57 68          	lea    0x68(%rdi),%r10
  104e21:	4c 8d 9f 80 00 00 00 	lea    0x80(%rdi),%r11
  104e28:	48 63 d8             	movslq %eax,%rbx
  104e2b:	48 8b 1c de          	mov    (%rsi,%rbx,8),%rbx
  104e2f:	48 33 5f 48          	xor    0x48(%rdi),%rbx
  104e33:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104e3a:	c1 7c 51 
  104e3d:	4c 8d 75 c0          	lea    -0x40(%rbp),%r14
  104e41:	48 8b d3             	mov    %rbx,%rdx
  104e44:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104e49:	4d 89 2e             	mov    %r13,(%r14)
  104e4c:	48 8b 5d c0          	mov    -0x40(%rbp),%rbx
  104e50:	48 33 d3             	xor    %rbx,%rdx
  104e53:	49 0f af d7          	imul   %r15,%rdx
  104e57:	48 89 95 68 ff ff ff 	mov    %rdx,-0x98(%rbp)
  104e5e:	49 8b d8             	mov    %r8,%rbx
  104e61:	48 8b 1b             	mov    (%rbx),%rbx
  104e64:	4c 8d 7d b8          	lea    -0x48(%rbp),%r15
  104e68:	4c 8b b5 68 ff ff ff 	mov    -0x98(%rbp),%r14
  104e6f:	48 8b d3             	mov    %rbx,%rdx
  104e72:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104e77:	4d 89 2f             	mov    %r13,(%r15)
  104e7a:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  104e7e:	0f b6 14 13          	movzbl (%rbx,%rdx,1),%edx
  104e82:	48 89 55 c8          	mov    %rdx,-0x38(%rbp)
  104e86:	49 8b da             	mov    %r10,%rbx
  104e89:	48 8b 1b             	mov    (%rbx),%rbx
  104e8c:	4c 8d 7d a8          	lea    -0x58(%rbp),%r15
  104e90:	48 8b d3             	mov    %rbx,%rdx
  104e93:	c4 c2 93 f6 d6       	mulx   %r14,%r13,%rdx
  104e98:	4d 89 2f             	mov    %r13,(%r15)
  104e9b:	48 0f af 57 18       	imul   0x18(%rdi),%rdx
  104ea0:	48 89 55 b0          	mov    %rdx,-0x50(%rbp)
  104ea4:	48 8b 5d c8          	mov    -0x38(%rbp),%rbx
  104ea8:	48 33 5f 48          	xor    0x48(%rdi),%rbx
  104eac:	49 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r15
  104eb3:	c1 7c 51 
  104eb6:	49 0f af df          	imul   %r15,%rbx
  104eba:	4d 8b fb             	mov    %r11,%r15
  104ebd:	49 33 de             	xor    %r14,%rbx
  104ec0:	49 0f af 5f 08       	imul   0x8(%r15),%rbx
  104ec5:	4d 8b 3f             	mov    (%r15),%r15
  104ec8:	4c 8d 75 a0          	lea    -0x60(%rbp),%r14
  104ecc:	48 8b d3             	mov    %rbx,%rdx
  104ecf:	c4 c2 93 f6 d7       	mulx   %r15,%r13,%rdx
  104ed4:	4d 89 2e             	mov    %r13,(%r14)
  104ed7:	48 8b 5d b0          	mov    -0x50(%rbp),%rbx
  104edb:	48 03 d3             	add    %rbx,%rdx
  104ede:	49 3b d1             	cmp    %r9,%rdx
  104ee1:	72 0d                	jb     104ef0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x170>
  104ee3:	41 2b d1             	sub    %r9d,%edx
  104ee6:	48 8b 5f 58          	mov    0x58(%rdi),%rbx
  104eea:	48 63 d2             	movslq %edx,%rdx
  104eed:	8b 14 93             	mov    (%rbx,%rdx,4),%edx
  104ef0:	48 63 d8             	movslq %eax,%rbx
  104ef3:	48 89 14 d9          	mov    %rdx,(%rcx,%rbx,8)
  104ef7:	ff c0                	inc    %eax
  104ef9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  104eff:	3b c2                	cmp    %edx,%eax
  104f01:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104f07:	0f 8c 1b ff ff ff    	jl     104e28 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0xa8>
  104f0d:	e9 eb 00 00 00       	jmp    104ffd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104f12:	33 c0                	xor    %eax,%eax
  104f14:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104f1a:	85 d2                	test   %edx,%edx
  104f1c:	0f 8e db 00 00 00    	jle    104ffd <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x27d>
  104f22:	4c 8d 47 78          	lea    0x78(%rdi),%r8
  104f26:	4c 8d 57 68          	lea    0x68(%rdi),%r10
  104f2a:	4c 8d 9f 80 00 00 00 	lea    0x80(%rdi),%r11
  104f31:	4c 63 c8             	movslq %eax,%r9
  104f34:	4e 8b 0c ce          	mov    (%rsi,%r9,8),%r9
  104f38:	4c 33 4f 48          	xor    0x48(%rdi),%r9
  104f3c:	48 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rbx
  104f43:	c1 7c 51 
  104f46:	4c 8d 7d 90          	lea    -0x70(%rbp),%r15
  104f4a:	49 8b d1             	mov    %r9,%rdx
  104f4d:	c4 e2 8b f6 d3       	mulx   %rbx,%r14,%rdx
  104f52:	4d 89 37             	mov    %r14,(%r15)
  104f55:	4c 8b 4d 90          	mov    -0x70(%rbp),%r9
  104f59:	49 33 d1             	xor    %r9,%rdx
  104f5c:	48 0f af d3          	imul   %rbx,%rdx
  104f60:	48 89 95 60 ff ff ff 	mov    %rdx,-0xa0(%rbp)
  104f67:	4d 8b c8             	mov    %r8,%r9
  104f6a:	4d 8b 09             	mov    (%r9),%r9
  104f6d:	48 8d 5d 88          	lea    -0x78(%rbp),%rbx
  104f71:	4c 8b bd 60 ff ff ff 	mov    -0xa0(%rbp),%r15
  104f78:	49 8b d1             	mov    %r9,%rdx
  104f7b:	c4 c2 8b f6 d7       	mulx   %r15,%r14,%rdx
  104f80:	4c 89 33             	mov    %r14,(%rbx)
  104f83:	4c 8b 4f 08          	mov    0x8(%rdi),%r9
  104f87:	41 0f b6 14 11       	movzbl (%r9,%rdx,1),%edx
  104f8c:	48 89 55 98          	mov    %rdx,-0x68(%rbp)
  104f90:	4d 8b ca             	mov    %r10,%r9
  104f93:	4d 8b 09             	mov    (%r9),%r9
  104f96:	48 8d 5d 80          	lea    -0x80(%rbp),%rbx
  104f9a:	49 8b d1             	mov    %r9,%rdx
  104f9d:	c4 42 8b f6 cf       	mulx   %r15,%r14,%r9
  104fa2:	4c 89 33             	mov    %r14,(%rbx)
  104fa5:	4c 0f af 4f 18       	imul   0x18(%rdi),%r9
  104faa:	48 8b 55 98          	mov    -0x68(%rbp),%rdx
  104fae:	48 33 57 48          	xor    0x48(%rdi),%rdx
  104fb2:	48 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rbx
  104fb9:	c1 7c 51 
  104fbc:	48 0f af d3          	imul   %rbx,%rdx
  104fc0:	49 8b db             	mov    %r11,%rbx
  104fc3:	49 33 d7             	xor    %r15,%rdx
  104fc6:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  104fcb:	48 8b 1b             	mov    (%rbx),%rbx
  104fce:	4c 8d bd 78 ff ff ff 	lea    -0x88(%rbp),%r15
  104fd5:	c4 e2 8b f6 d3       	mulx   %rbx,%r14,%rdx
  104fda:	4d 89 37             	mov    %r14,(%r15)
  104fdd:	49 03 d1             	add    %r9,%rdx
  104fe0:	4c 63 c8             	movslq %eax,%r9
  104fe3:	4a 89 14 c9          	mov    %rdx,(%rcx,%r9,8)
  104fe7:	ff c0                	inc    %eax
  104fe9:	8b 95 74 ff ff ff    	mov    -0x8c(%rbp),%edx
  104fef:	3b c2                	cmp    %edx,%eax
  104ff1:	89 95 74 ff ff ff    	mov    %edx,-0x8c(%rbp)
  104ff7:	0f 8c 34 ff ff ff    	jl     104f31 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndicesStreamMultiPart+0x1b1>
  104ffd:	33 ff                	xor    %edi,%edi
  104fff:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  105003:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
  105007:	48 81 c4 80 00 00 00 	add    $0x80,%rsp
  10500e:	5b                   	pop    %rbx
  10500f:	41 5d                	pop    %r13
  105011:	41 5e                	pop    %r14
  105013:	41 5f                	pop    %r15
  105015:	5d                   	pop    %rbp
  105016:	c3                   	ret
  105017:	48 8d 3d ea 81 15 00 	lea    0x1581ea(%rip),%rdi        # 25d208 <_ZTV36S_P_CoreLib_System_ArgumentException>
  10501e:	e8 81 05 f6 ff       	call   655a4 <RhpNewFast>
  105023:	48 8b d8             	mov    %rax,%rbx
  105026:	48 8b fb             	mov    %rbx,%rdi
  105029:	48 8d 35 30 51 14 00 	lea    0x145130(%rip),%rsi        # 24a160 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  105030:	e8 1b 5f f8 ff       	call   8af50 <S_P_CoreLib_System_ArgumentException___ctor_0>
  105035:	48 8b fb             	mov    %rbx,%rdi
  105038:	e8 d1 07 f6 ff       	call   6580e <RhpThrowEx>
  10503d:	cc                   	int3
  10503e:	90                   	nop
  10503f:	90                   	nop

0000000000098bc0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds>:
   98bc0:	55                   	push   %rbp
   98bc1:	48 8b ec             	mov    %rsp,%rbp
   98bc4:	8b c6                	mov    %esi,%eax
   98bc6:	33 c9                	xor    %ecx,%ecx
   98bc8:	c6 02 00             	movb   $0x0,(%rdx)
   98bcb:	8b 77 08             	mov    0x8(%rdi),%esi
   98bce:	3b f0                	cmp    %eax,%esi
   98bd0:	7e 74                	jle    98c46 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x86>
   98bd2:	3b c6                	cmp    %esi,%eax
   98bd4:	73 77                	jae    98c4d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   98bd6:	44 8b c0             	mov    %eax,%r8d
   98bd9:	46 0f b7 44 47 0c    	movzwl 0xc(%rdi,%r8,2),%r8d
   98bdf:	41 83 f8 48          	cmp    $0x48,%r8d
   98be3:	77 14                	ja     98bf9 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x39>
   98be5:	41 83 f8 20          	cmp    $0x20,%r8d
   98be9:	74 4c                	je     98c37 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x77>
   98beb:	41 83 f8 27          	cmp    $0x27,%r8d
   98bef:	74 2a                	je     98c1b <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x5b>
   98bf1:	41 83 f8 48          	cmp    $0x48,%r8d
   98bf5:	74 45                	je     98c3c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98bf7:	eb 47                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98bf9:	41 83 f8 68          	cmp    $0x68,%r8d
   98bfd:	77 0e                	ja     98c0d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x4d>
   98bff:	41 83 f8 5c          	cmp    $0x5c,%r8d
   98c03:	74 20                	je     98c25 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x65>
   98c05:	41 83 f8 68          	cmp    $0x68,%r8d
   98c09:	74 31                	je     98c3c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98c0b:	eb 33                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c0d:	41 83 f8 6d          	cmp    $0x6d,%r8d
   98c11:	74 29                	je     98c3c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98c13:	41 83 f8 74          	cmp    $0x74,%r8d
   98c17:	74 23                	je     98c3c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   98c19:	eb 25                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c1b:	85 c9                	test   %ecx,%ecx
   98c1d:	0f 94 c1             	sete   %cl
   98c20:	0f b6 c9             	movzbl %cl,%ecx
   98c23:	eb 1b                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c25:	ff c0                	inc    %eax
   98c27:	3b c6                	cmp    %esi,%eax
   98c29:	73 22                	jae    98c4d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   98c2b:	44 8b c0             	mov    %eax,%r8d
   98c2e:	66 42 83 7c 47 0c 20 	cmpw   $0x20,0xc(%rdi,%r8,2)
   98c35:	75 09                	jne    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c37:	c6 02 01             	movb   $0x1,(%rdx)
   98c3a:	eb 04                	jmp    98c40 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98c3c:	85 c9                	test   %ecx,%ecx
   98c3e:	74 0b                	je     98c4b <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8b>
   98c40:	ff c0                	inc    %eax
   98c42:	3b f0                	cmp    %eax,%esi
   98c44:	7f 8c                	jg     98bd2 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x12>
   98c46:	c6 02 00             	movb   $0x0,(%rdx)
   98c49:	5d                   	pop    %rbp
   98c4a:	c3                   	ret
   98c4b:	5d                   	pop    %rbp
   98c4c:	c3                   	ret
   98c4d:	e8 6e 22 03 00       	call   caec0 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   98c52:	cc                   	int3
   98c53:	90                   	nop
   98c54:	90                   	nop
   98c55:	90                   	nop
   98c56:	90                   	nop
   98c57:	90                   	nop
   98c58:	90                   	nop
   98c59:	90                   	nop
   98c5a:	90                   	nop
   98c5b:	90                   	nop
   98c5c:	90                   	nop
   98c5d:	90                   	nop
   98c5e:	90                   	nop
   98c5f:	90                   	nop

0000000000098c60 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek>:
   98c60:	55                   	push   %rbp
   98c61:	53                   	push   %rbx
   98c62:	50                   	push   %rax
   98c63:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   98c68:	48 8b df             	mov    %rdi,%rbx
   98c6b:	83 bb 98 01 00 00 ff 	cmpl   $0xffffffff,0x198(%rbx)
   98c72:	75 2e                	jne    98ca2 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x42>
   98c74:	48 8d 3d bd f9 1b 00 	lea    0x1bf9bd(%rip),%rdi        # 258638 <__NONGCSTATICSS_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   98c7b:	48 83 7f f8 00       	cmpq   $0x0,-0x8(%rdi)
   98c80:	75 2d                	jne    98caf <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x4f>
   98c82:	33 ff                	xor    %edi,%edi
   98c84:	89 7d f0             	mov    %edi,-0x10(%rbp)
   98c87:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   98c8b:	48 8d 55 f0          	lea    -0x10(%rbp),%rdx
   98c8f:	be 0c 10 00 00       	mov    $0x100c,%esi
   98c94:	e8 57 39 03 00       	call   cc5f0 <S_P_CoreLib_Interop_Globalization__GetLocaleInfoInt>
   98c99:	8b 45 f0             	mov    -0x10(%rbp),%eax
   98c9c:	89 83 98 01 00 00    	mov    %eax,0x198(%rbx)
   98ca2:	8b 83 98 01 00 00    	mov    0x198(%rbx),%eax
   98ca8:	48 83 c4 08          	add    $0x8,%rsp
   98cac:	5b                   	pop    %rbx
   98cad:	5d                   	pop    %rbp
   98cae:	c3                   	ret
   98caf:	e8 06 f4 f6 ff       	call   80ba <__GetNonGCStaticBase_S_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   98cb4:	eb cc                	jmp    98c82 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x22>
   98cb6:	90                   	nop
   98cb7:	90                   	nop
   98cb8:	90                   	nop
--
00000000000accc0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>:
   accc0:	55                   	push   %rbp
   accc1:	c5 f8 77             	vzeroupper
   accc4:	48 8b ec             	mov    %rsp,%rbp
   accc7:	48 8b c7             	mov    %rdi,%rax
   accca:	48 81 fe 80 00 00 00 	cmp    $0x80,%rsi
   accd1:	72 5a                	jb     acd2d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x6d>
   accd3:	62 f1 7c 48 10 00    	vmovups (%rax),%zmm0
   accd9:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   accdf:	c4 e1 fb 93 c9       	kmovq  %k1,%rcx
   acce4:	0f 1f 00             	nopl   (%rax)
   acce7:	48 85 c9             	test   %rcx,%rcx
   accea:	0f 85 d7 00 00 00    	jne    acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   accf0:	48 8d 4c 30 c0       	lea    -0x40(%rax,%rsi,1),%rcx
   accf5:	48 8d 78 40          	lea    0x40(%rax),%rdi
   accf9:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   accfd:	62 f1 7d 48 6f 07    	vmovdqa32 (%rdi),%zmm0
   acd03:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   acd09:	c4 e1 fb 93 d1       	kmovq  %k1,%rdx
   acd0e:	0f 1f 00             	nopl   (%rax)
   acd11:	48 85 d2             	test   %rdx,%rdx
   acd14:	75 09                	jne    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd16:	48 83 c7 40          	add    $0x40,%rdi
   acd1a:	48 3b f9             	cmp    %rcx,%rdi
   acd1d:	76 de                	jbe    accfd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x3d>
   acd1f:	48 2b f7             	sub    %rdi,%rsi
   acd22:	48 03 f0             	add    %rax,%rsi
   acd25:	e9 9d 00 00 00       	jmp    acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   acd2a:	0f 1f 00             	nopl   (%rax)
   acd2d:	48 83 fe 40          	cmp    $0x40,%rsi
   acd31:	72 34                	jb     acd67 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xa7>
   acd33:	c5 fc 10 00          	vmovups (%rax),%ymm0
   acd37:	c5 fd d7 c8          	vpmovmskb %ymm0,%ecx
   acd3b:	85 c9                	test   %ecx,%ecx
   acd3d:	0f 85 84 00 00 00    	jne    acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   acd43:	48 8d 4c 30 e0       	lea    -0x20(%rax,%rsi,1),%rcx
   acd48:	48 8d 78 20          	lea    0x20(%rax),%rdi
   acd4c:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   acd50:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
   acd54:	c5 fd d7 d0          	vpmovmskb %ymm0,%edx
   acd58:	85 d2                	test   %edx,%edx
   acd5a:	75 c3                	jne    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd5c:	48 83 c7 20          	add    $0x20,%rdi
   acd60:	48 3b f9             	cmp    %rcx,%rdi
   acd63:	76 eb                	jbe    acd50 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x90>
   acd65:	eb b8                	jmp    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd67:	48 83 fe 20          	cmp    $0x20,%rsi
   acd6b:	72 5a                	jb     acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   acd6d:	c5 f8 10 05 2b dd 0d 	vmovups 0xddd2b(%rip),%xmm0        # 18aaa0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   acd74:	00 
   acd75:	c4 e2 79 17 00       	vptest (%rax),%xmm0
   acd7a:	75 4b                	jne    acdc7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   acd7c:	48 8d 4c 30 f0       	lea    -0x10(%rax,%rsi,1),%rcx
   acd81:	48 8d 78 10          	lea    0x10(%rax),%rdi
   acd85:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   acd89:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   acd8e:	75 8f                	jne    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd90:	48 83 c7 10          	add    $0x10,%rdi
   acd94:	48 3b f9             	cmp    %rcx,%rdi
   acd97:	76 f0                	jbe    acd89 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xc9>
   acd99:	eb 84                	jmp    acd1f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   acd9b:	8b 0f                	mov    (%rdi),%ecx
   acd9d:	8b 57 04             	mov    0x4(%rdi),%edx
   acda0:	44 8b c1             	mov    %ecx,%r8d
   acda3:	44 0b c2             	or     %edx,%r8d
   acda6:	41 f7 c0 80 80 80 80 	test   $0x80808080,%r8d
   acdad:	74 10                	je     acdbf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xff>
   acdaf:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acdb5:	75 5e                	jne    ace15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acdb7:	8b ca                	mov    %edx,%ecx
   acdb9:	48 83 c7 04          	add    $0x4,%rdi
   acdbd:	eb 56                	jmp    ace15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acdbf:	48 83 c7 08          	add    $0x8,%rdi
   acdc3:	48 83 c6 f8          	add    $0xfffffffffffffff8,%rsi
   acdc7:	48 83 fe 08          	cmp    $0x8,%rsi
   acdcb:	73 ce                	jae    acd9b <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xdb>
   acdcd:	40 f6 c6 04          	test   $0x4,%sil
   acdd1:	74 0e                	je     acde1 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x121>
   acdd3:	8b 0f                	mov    (%rdi),%ecx
   acdd5:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acddb:	75 38                	jne    ace15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acddd:	48 83 c7 04          	add    $0x4,%rdi
   acde1:	40 f6 c6 02          	test   $0x2,%sil
   acde5:	74 0f                	je     acdf6 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x136>
   acde7:	0f b7 0f             	movzwl (%rdi),%ecx
   acdea:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   acdf0:	75 23                	jne    ace15 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   acdf2:	48 83 c7 02          	add    $0x2,%rdi
   acdf6:	40 f6 c6 01          	test   $0x1,%sil
   acdfa:	74 0b                	je     ace07 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x147>
   acdfc:	48 8d 4f 01          	lea    0x1(%rdi),%rcx
   ace00:	80 3f 00             	cmpb   $0x0,(%rdi)
   ace03:	48 0f 4d f9          	cmovge %rcx,%rdi
   ace07:	48 8b cf             	mov    %rdi,%rcx
   ace0a:	48 2b c8             	sub    %rax,%rcx
   ace0d:	48 8b c1             	mov    %rcx,%rax
   ace10:	c5 f8 77             	vzeroupper
   ace13:	5d                   	pop    %rbp
   ace14:	c3                   	ret
   ace15:	81 e1 80 80 80 80    	and    $0x80808080,%ecx
   ace1b:	f3 0f bc c9          	tzcnt  %ecx,%ecx
--
00000000000ace40 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>:
   ace40:	55                   	push   %rbp
   ace41:	c5 f8 77             	vzeroupper
   ace44:	48 8b ec             	mov    %rsp,%rbp
   ace47:	48 8b cf             	mov    %rdi,%rcx
   ace4a:	48 83 fe 40          	cmp    $0x40,%rsi
   ace4e:	72 57                	jb     acea7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x67>
   ace50:	62 f1 7c 48 10 05 66 	vmovups 0xddc66(%rip),%zmm0        # 18aac0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   ace57:	dc 0d 00 
   ace5a:	62 f2 fd 48 26 09    	vptestmw (%rcx),%zmm0,%k1
   ace60:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ace65:	0f 1f 00             	nopl   (%rax)
   ace68:	0f 85 d1 00 00 00    	jne    acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   ace6e:	48 8d 44 71 c0       	lea    -0x40(%rcx,%rsi,2),%rax
   ace73:	48 8d 79 40          	lea    0x40(%rcx),%rdi
   ace77:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   ace7b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   ace80:	62 f2 fd 48 26 0f    	vptestmw (%rdi),%zmm0,%k1
   ace86:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ace8b:	75 09                	jne    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   ace8d:	48 83 c7 40          	add    $0x40,%rdi
   ace91:	48 3b f8             	cmp    %rax,%rdi
   ace94:	76 ea                	jbe    ace80 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x40>
   ace96:	48 8b c7             	mov    %rdi,%rax
   ace99:	48 2b c1             	sub    %rcx,%rax
   ace9c:	48 d1 e8             	shr    $1,%rax
   ace9f:	48 2b f0             	sub    %rax,%rsi
   acea2:	e9 98 00 00 00       	jmp    acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acea7:	48 83 fe 20          	cmp    $0x20,%rsi
   aceab:	72 32                	jb     acedf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x9f>
   acead:	c5 fc 10 05 0b dc 0d 	vmovups 0xddc0b(%rip),%ymm0        # 18aac0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   aceb4:	00 
   aceb5:	c4 e2 7d 17 01       	vptest (%rcx),%ymm0
   aceba:	0f 85 7f 00 00 00    	jne    acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acec0:	48 8d 44 71 e0       	lea    -0x20(%rcx,%rsi,2),%rax
   acec5:	48 8d 79 20          	lea    0x20(%rcx),%rdi
   acec9:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   acecd:	c4 e2 7d 17 07       	vptest (%rdi),%ymm0
   aced2:	75 c2                	jne    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   aced4:	48 83 c7 20          	add    $0x20,%rdi
   aced8:	48 3b f8             	cmp    %rax,%rdi
   acedb:	76 f0                	jbe    acecd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x8d>
   acedd:	eb b7                	jmp    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acedf:	48 83 fe 10          	cmp    $0x10,%rsi
   acee3:	72 5a                	jb     acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acee5:	c5 f8 10 05 d3 db 0d 	vmovups 0xddbd3(%rip),%xmm0        # 18aac0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   aceec:	00 
   aceed:	c4 e2 79 17 01       	vptest (%rcx),%xmm0
   acef2:	75 4b                	jne    acf3f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   acef4:	48 8d 44 71 f0       	lea    -0x10(%rcx,%rsi,2),%rax
   acef9:	48 8d 79 10          	lea    0x10(%rcx),%rdi
   acefd:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   acf01:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   acf06:	75 8e                	jne    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acf08:	48 83 c7 10          	add    $0x10,%rdi
   acf0c:	48 3b f8             	cmp    %rax,%rdi
   acf0f:	76 f0                	jbe    acf01 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xc1>
   acf11:	eb 83                	jmp    ace96 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   acf13:	8b 17                	mov    (%rdi),%edx
   acf15:	8b 47 04             	mov    0x4(%rdi),%eax
   acf18:	44 8b c2             	mov    %edx,%r8d
   acf1b:	44 0b c0             	or     %eax,%r8d
   acf1e:	41 f7 c0 80 ff 80 ff 	test   $0xff80ff80,%r8d
   acf25:	74 10                	je     acf37 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xf7>
   acf27:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acf2d:	75 48                	jne    acf77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acf2f:	8b d0                	mov    %eax,%edx
   acf31:	48 83 c7 04          	add    $0x4,%rdi
   acf35:	eb 40                	jmp    acf77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acf37:	48 83 c7 08          	add    $0x8,%rdi
   acf3b:	48 83 c6 fc          	add    $0xfffffffffffffffc,%rsi
   acf3f:	48 83 fe 04          	cmp    $0x4,%rsi
   acf43:	73 ce                	jae    acf13 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xd3>
   acf45:	40 f6 c6 02          	test   $0x2,%sil
   acf49:	74 0e                	je     acf59 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x119>
   acf4b:	8b 17                	mov    (%rdi),%edx
   acf4d:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   acf53:	75 22                	jne    acf77 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   acf55:	48 83 c7 04          	add    $0x4,%rdi
   acf59:	40 f6 c6 01          	test   $0x1,%sil
   acf5d:	74 0a                	je     acf69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acf5f:	66 83 3f 7f          	cmpw   $0x7f,(%rdi)
   acf63:	77 04                	ja     acf69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acf65:	48 83 c7 02          	add    $0x2,%rdi
   acf69:	48 8b c7             	mov    %rdi,%rax
   acf6c:	48 2b c1             	sub    %rcx,%rax
   acf6f:	48 d1 e8             	shr    $1,%rax
   acf72:	c5 f8 77             	vzeroupper
   acf75:	5d                   	pop    %rbp
   acf76:	c3                   	ret
   acf77:	f7 c2 80 ff 00 00    	test   $0xff80,%edx
   acf7d:	74 e6                	je     acf65 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x125>
   acf7f:	eb e8                	jmp    acf69 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   acf81:	90                   	nop
   acf82:	90                   	nop
   acf83:	90                   	nop
   acf84:	90                   	nop
   acf85:	90                   	nop
   acf86:	90                   	nop
   acf87:	90                   	nop
   acf88:	90                   	nop
--
00000000000b2de0 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>:
   b2de0:	55                   	push   %rbp
   b2de1:	41 57                	push   %r15
   b2de3:	53                   	push   %rbx
   b2de4:	c5 f8 77             	vzeroupper
   b2de7:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   b2dec:	48 8b df             	mov    %rdi,%rbx
   b2def:	48 85 f6             	test   %rsi,%rsi
   b2df2:	75 07                	jne    b2dfb <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x1b>
   b2df4:	33 c0                	xor    %eax,%eax
   b2df6:	5b                   	pop    %rbx
   b2df7:	41 5f                	pop    %r15
   b2df9:	5d                   	pop    %rbp
   b2dfa:	c3                   	ret
   b2dfb:	4c 8b fb             	mov    %rbx,%r15
   b2dfe:	48 83 fe 08          	cmp    $0x8,%rsi
   b2e02:	0f 82 0b 01 00 00    	jb     b2f13 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x133>
   b2e08:	c5 f8 10 05 70 7d 0d 	vmovups 0xd7d70(%rip),%xmm0        # 18ab80 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2e0f:	00 
   b2e10:	c4 c1 78 10 0f       	vmovups (%r15),%xmm1
   b2e15:	c5 f1 dd 0d 73 7d 0d 	vpaddusw 0xd7d73(%rip),%xmm1,%xmm1        # 18ab90 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2e1c:	00 
   b2e1d:	c5 f9 d7 f9          	vpmovmskb %xmm1,%edi
   b2e21:	f7 c7 aa aa 00 00    	test   $0xaaaa,%edi
   b2e27:	0f 85 c2 00 00 00    	jne    b2eef <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10f>
   b2e2d:	48 03 f6             	add    %rsi,%rsi
   b2e30:	48 83 fe 20          	cmp    $0x20,%rsi
   b2e34:	72 5c                	jb     b2e92 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb2>
   b2e36:	49 8d 5f 10          	lea    0x10(%r15),%rbx
   b2e3a:	48 83 e3 f0          	and    $0xfffffffffffffff0,%rbx
   b2e3e:	49 03 f7             	add    %r15,%rsi
   b2e41:	48 2b f3             	sub    %rbx,%rsi
   b2e44:	48 83 fe 20          	cmp    $0x20,%rsi
   b2e48:	72 33                	jb     b2e7d <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x9d>
   b2e4a:	48 8d 04 33          	lea    (%rbx,%rsi,1),%rax
   b2e4e:	48 83 e8 20          	sub    $0x20,%rax
   b2e52:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2e59:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b2e60:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2e64:	c5 f9 6f 53 10       	vmovdqa 0x10(%rbx),%xmm2
   b2e69:	c5 f1 eb da          	vpor   %xmm2,%xmm1,%xmm3
   b2e6d:	c4 e2 79 17 d8       	vptest %xmm0,%xmm3
   b2e72:	75 5c                	jne    b2ed0 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xf0>
   b2e74:	48 83 c3 20          	add    $0x20,%rbx
   b2e78:	48 3b d8             	cmp    %rax,%rbx
   b2e7b:	76 e3                	jbe    b2e60 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x80>
   b2e7d:	40 f6 c6 10          	test   $0x10,%sil
   b2e81:	74 13                	je     b2e96 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb6>
   b2e83:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b2e87:	c4 e2 79 17 0d f0 7c 	vptest 0xd7cf0(%rip),%xmm1        # 18ab80 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2e8e:	0d 00 
   b2e90:	75 51                	jne    b2ee3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2e92:	48 83 c3 10          	add    $0x10,%rbx
   b2e96:	40 0f b6 c6          	movzbl %sil,%eax
   b2e9a:	a8 0f                	test   $0xf,%al
   b2e9c:	74 24                	je     b2ec2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2e9e:	48 8b c6             	mov    %rsi,%rax
   b2ea1:	48 83 e0 0f          	and    $0xf,%rax
   b2ea5:	48 03 c3             	add    %rbx,%rax
   b2ea8:	48 8b d8             	mov    %rax,%rbx
   b2eab:	48 83 eb 10          	sub    $0x10,%rbx
   b2eaf:	c5 f8 10 0b          	vmovups (%rbx),%xmm1
   b2eb3:	c4 e2 79 17 0d c4 7c 	vptest 0xd7cc4(%rip),%xmm1        # 18ab80 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2eba:	0d 00 
   b2ebc:	75 25                	jne    b2ee3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2ebe:	48 83 c3 10          	add    $0x10,%rbx
   b2ec2:	48 8b c3             	mov    %rbx,%rax
   b2ec5:	49 2b c7             	sub    %r15,%rax
   b2ec8:	48 d1 e8             	shr    $1,%rax
   b2ecb:	5b                   	pop    %rbx
   b2ecc:	41 5f                	pop    %r15
   b2ece:	5d                   	pop    %rbp
   b2ecf:	c3                   	ret
   b2ed0:	c4 e2 79 17 0d a7 7c 	vptest 0xd7ca7(%rip),%xmm1        # 18ab80 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2ed7:	0d 00 
   b2ed9:	75 08                	jne    b2ee3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b2edb:	48 83 c3 10          	add    $0x10,%rbx
   b2edf:	c5 f8 28 ca          	vmovaps %xmm2,%xmm1
   b2ee3:	c5 f1 dd 05 a5 7c 0d 	vpaddusw 0xd7ca5(%rip),%xmm1,%xmm0        # 18ab90 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b2eea:	00 
   b2eeb:	c5 f9 d7 f8          	vpmovmskb %xmm0,%edi
   b2eef:	81 e7 aa aa 00 00    	and    $0xaaaa,%edi
   b2ef5:	33 f6                	xor    %esi,%esi
   b2ef7:	f3 0f bc f7          	tzcnt  %edi,%esi
   b2efb:	8b fe                	mov    %esi,%edi
   b2efd:	48 8d 5c 3b ff       	lea    -0x1(%rbx,%rdi,1),%rbx
   b2f02:	eb be                	jmp    b2ec2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2f04:	e8 37 03 00 00       	call   b3240 <S_P_CoreLib_System_Text_Latin1Utility__FirstCharInUInt32IsLatin1>
   b2f09:	85 c0                	test   %eax,%eax
   b2f0b:	74 b5                	je     b2ec2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2f0d:	48 83 c3 02          	add    $0x2,%rbx
   b2f11:	eb af                	jmp    b2ec2 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b2f13:	40 f6 c6 04          	test   $0x4,%sil
   b2f17:	74 2a                	je     b2f43 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x163>
   b2f19:	49 8b 3f             	mov    (%r15),%rdi
   b2f1c:	48 b8 00 ff 00 ff 00 	movabs $0xff00ff00ff00ff00,%rax
   b2f23:	ff 00 ff 
   b2f26:	48 23 f8             	and    %rax,%rdi
   b2f29:	74 14                	je     b2f3f <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x15f>
   b2f2b:	33 db                	xor    %ebx,%ebx
   b2f2d:	f3 48 0f bc df       	tzcnt  %rdi,%rbx
--
0000000000103fe0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapMultiPart>:
  103fe0:	55                   	push   %rbp
  103fe1:	41 57                	push   %r15
  103fe3:	41 56                	push   %r14
  103fe5:	41 55                	push   %r13
  103fe7:	53                   	push   %rbx
  103fe8:	48 83 ec 20          	sub    $0x20,%rsp
  103fec:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
  103ff1:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  103ff6:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  103ffb:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  104000:	48 8b df             	mov    %rdi,%rbx
  104003:	48 8b d6             	mov    %rsi,%rdx
  104006:	48 33 53 48          	xor    0x48(%rbx),%rdx
  10400a:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104011:	c1 7c 51 
  104014:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  104018:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10401d:	48 89 06             	mov    %rax,(%rsi)
  104020:	48 8b f7             	mov    %rdi,%rsi
  104023:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  104027:	49 8b ff             	mov    %r15,%rdi
  10402a:	ba 40 00 00 00       	mov    $0x40,%edx
  10402f:	e8 4c 01 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104034:	4c 33 f8             	xor    %rax,%r15
  104037:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10403e:	c1 7c 51 
  104041:	4d 0f af fe          	imul   %r14,%r15
  104045:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  104049:	48 8b 12             	mov    (%rdx),%rdx
  10404c:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  104050:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104055:	48 89 37             	mov    %rsi,(%rdi)
  104058:	48 8b f2             	mov    %rdx,%rsi
  10405b:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10405f:	ba 40 00 00 00       	mov    $0x40,%edx
  104064:	e8 17 01 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104069:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  10406d:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  104072:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  104076:	48 8b 12             	mov    (%rdx),%rdx
  104079:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  10407d:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104082:	48 89 37             	mov    %rsi,(%rdi)
  104085:	48 8b f2             	mov    %rdx,%rsi
  104088:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  10408c:	ba 40 00 00 00       	mov    $0x40,%edx
  104091:	e8 ea 00 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104096:	4c 8b e8             	mov    %rax,%r13
  104099:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  10409e:	4c 33 73 48          	xor    0x48(%rbx),%r14
  1040a2:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  1040a9:	c1 7c 51 
  1040ac:	49 0f af d6          	imul   %r14,%rdx
  1040b0:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  1040b7:	49 33 d7             	xor    %r15,%rdx
  1040ba:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  1040bf:	48 8b 3b             	mov    (%rbx),%rdi
  1040c2:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  1040c6:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1040cb:	48 89 06             	mov    %rax,(%rsi)
  1040ce:	48 8b f7             	mov    %rdi,%rsi
  1040d1:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  1040d5:	ba 40 00 00 00       	mov    $0x40,%edx
  1040da:	e8 a1 00 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1040df:	49 03 c5             	add    %r13,%rax
  1040e2:	48 83 c4 20          	add    $0x20,%rsp
  1040e6:	5b                   	pop    %rbx
  1040e7:	41 5d                	pop    %r13
  1040e9:	41 5e                	pop    %r14
  1040eb:	41 5f                	pop    %r15
  1040ed:	5d                   	pop    %rbp
  1040ee:	c3                   	ret
  1040ef:	90                   	nop

00000000001040f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexSinglePart>:
  1040f0:	55                   	push   %rbp
  1040f1:	41 57                	push   %r15
  1040f3:	41 56                	push   %r14
  1040f5:	53                   	push   %rbx
  1040f6:	48 83 ec 18          	sub    $0x18,%rsp
  1040fa:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  1040ff:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  104104:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  104109:	33 c0                	xor    %eax,%eax
  10410b:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  10410f:	48 8b df             	mov    %rdi,%rbx
  104112:	48 8b d6             	mov    %rsi,%rdx
  104115:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104119:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104120:	c1 7c 51 
  104123:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  104127:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10412c:	48 89 06             	mov    %rax,(%rsi)
  10412f:	48 8b f7             	mov    %rdi,%rsi
  104132:	4c 8b 7d e0          	mov    -0x20(%rbp),%r15
  104136:	49 8b ff             	mov    %r15,%rdi
  104139:	ba 40 00 00 00       	mov    $0x40,%edx
  10413e:	e8 3d 00 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104143:	4c 33 f8             	xor    %rax,%r15
  104146:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10414d:	c1 7c 51 
  104150:	4d 0f af fe          	imul   %r14,%r15
  104154:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  104158:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  10415c:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104161:	48 89 37             	mov    %rsi,(%rdi)
  104164:	48 8b f2             	mov    %rdx,%rsi
  104167:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
  10416b:	ba 40 00 00 00       	mov    $0x40,%edx
  104170:	e8 0b 00 f9 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104175:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104179:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
  10417d:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104181:	49 0f af d6          	imul   %r14,%rdx
  104185:	48 8d bb 80 00 00 00 	lea    0x80(%rbx),%rdi
  10418c:	49 33 d7             	xor    %r15,%rdx
  10418f:	48 0f af 57 08       	imul   0x8(%rdi),%rdx
  104194:	48 8b 3f             	mov    (%rdi),%rdi
  104197:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  10419b:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1041a0:	48 89 06             	mov    %rax,(%rsi)
  1041a3:	48 8b f7             	mov    %rdi,%rsi
  1041a6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1041aa:	ba 40 00 00 00       	mov    $0x40,%edx
  1041af:	e8 cc ff f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1041b4:	48 3b 43 38          	cmp    0x38(%rbx),%rax
  1041b8:	72 17                	jb     1041d1 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexSinglePart+0xe1>
  1041ba:	48 8b 4b 58          	mov    0x58(%rbx),%rcx
  1041be:	2b 43 38             	sub    0x38(%rbx),%eax
  1041c1:	48 98                	cltq
  1041c3:	8b 04 81             	mov    (%rcx,%rax,4),%eax
  1041c6:	48 83 c4 18          	add    $0x18,%rsp
  1041ca:	5b                   	pop    %rbx
  1041cb:	41 5e                	pop    %r14
  1041cd:	41 5f                	pop    %r15
  1041cf:	5d                   	pop    %rbp
  1041d0:	c3                   	ret
  1041d1:	48 83 c4 18          	add    $0x18,%rsp
  1041d5:	5b                   	pop    %rbx
  1041d6:	41 5e                	pop    %r14
  1041d8:	41 5f                	pop    %r15
  1041da:	5d                   	pop    %rbp
  1041db:	c3                   	ret
  1041dc:	90                   	nop
  1041dd:	90                   	nop
  1041de:	90                   	nop
  1041df:	90                   	nop

00000000001041e0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemapSinglePart>:
  1041e0:	55                   	push   %rbp
  1041e1:	41 57                	push   %r15
  1041e3:	41 56                	push   %r14
  1041e5:	53                   	push   %rbx
  1041e6:	48 83 ec 18          	sub    $0x18,%rsp
  1041ea:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
  1041ef:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  1041f4:	c5 79 7f 45 d0       	vmovdqa %xmm8,-0x30(%rbp)
  1041f9:	33 c0                	xor    %eax,%eax
  1041fb:	48 89 45 e0          	mov    %rax,-0x20(%rbp)
  1041ff:	48 8b df             	mov    %rdi,%rbx
  104202:	48 8b d6             	mov    %rsi,%rdx
  104205:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104209:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  104210:	c1 7c 51 
  104213:	48 8d 75 e0          	lea    -0x20(%rbp),%rsi
  104217:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  10421c:	48 89 06             	mov    %rax,(%rsi)
  10421f:	48 8b f7             	mov    %rdi,%rsi
  104222:	4c 8b 7d e0          	mov    -0x20(%rbp),%r15
  104226:	49 8b ff             	mov    %r15,%rdi
  104229:	ba 40 00 00 00       	mov    $0x40,%edx
  10422e:	e8 4d ff f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104233:	4c 33 f8             	xor    %rax,%r15
  104236:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  10423d:	c1 7c 51 
  104240:	4d 0f af fe          	imul   %r14,%r15
  104244:	48 8b 53 70          	mov    0x70(%rbx),%rdx
  104248:	48 8d 7d d8          	lea    -0x28(%rbp),%rdi
  10424c:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104251:	48 89 37             	mov    %rsi,(%rdi)
  104254:	48 8b f2             	mov    %rdx,%rsi
  104257:	48 8b 7d d8          	mov    -0x28(%rbp),%rdi
  10425b:	ba 40 00 00 00       	mov    $0x40,%edx
  104260:	e8 1b ff f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104265:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104269:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx
  10426d:	48 33 53 48          	xor    0x48(%rbx),%rdx
  104271:	49 0f af d6          	imul   %r14,%rdx
  104275:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  10427c:	49 33 d7             	xor    %r15,%rdx
  10427f:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  104284:	48 8b 3b             	mov    (%rbx),%rdi
  104287:	48 8d 75 d0          	lea    -0x30(%rbp),%rsi
  10428b:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  104290:	48 89 06             	mov    %rax,(%rsi)
  104293:	48 8b f7             	mov    %rdi,%rsi
  104296:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10429a:	ba 40 00 00 00       	mov    $0x40,%edx
  10429f:	e8 dc fe f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1042a4:	90                   	nop
  1042a5:	48 83 c4 18          	add    $0x18,%rsp
  1042a9:	5b                   	pop    %rbx
  1042aa:	41 5e                	pop    %r14
  1042ac:	41 5f                	pop    %r15
  1042ae:	5d                   	pop    %rbp
  1042af:	c3                   	ret

00000000001042b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex>:
  1042b0:	55                   	push   %rbp
  1042b1:	41 57                	push   %r15
  1042b3:	41 56                	push   %r14
  1042b5:	41 55                	push   %r13
  1042b7:	53                   	push   %rbx
  1042b8:	48 83 ec 30          	sub    $0x30,%rsp
  1042bc:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  1042c1:	48 8b df             	mov    %rdi,%rbx
  1042c4:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  1042c8:	0f 85 fe 00 00 00    	jne    1043cc <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndex+0x11c>
  1042ce:	48 8b d6             	mov    %rsi,%rdx
  1042d1:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1042d5:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1042dc:	c1 7c 51 
  1042df:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  1042e3:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1042e8:	48 89 06             	mov    %rax,(%rsi)
  1042eb:	48 8b f7             	mov    %rdi,%rsi
  1042ee:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  1042f2:	49 8b ff             	mov    %r15,%rdi
  1042f5:	ba 40 00 00 00       	mov    $0x40,%edx
  1042fa:	e8 81 fe f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1042ff:	4c 33 f8             	xor    %rax,%r15
  104302:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  104309:	c1 7c 51 
  10430c:	4d 0f af fe          	imul   %r14,%r15
  104310:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  104314:	48 8b 12             	mov    (%rdx),%rdx
  104317:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  10431b:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  104320:	48 89 37             	mov    %rsi,(%rdi)
  104323:	48 8b f2             	mov    %rdx,%rsi
  104326:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  10432a:	ba 40 00 00 00       	mov    $0x40,%edx
  10432f:	e8 4c fe f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104334:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104338:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  10433d:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  104341:	48 8b 12             	mov    (%rdx),%rdx
  104344:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  104348:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
--
0000000000104480 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap>:
  104480:	55                   	push   %rbp
  104481:	41 57                	push   %r15
  104483:	41 56                	push   %r14
  104485:	41 55                	push   %r13
  104487:	53                   	push   %rbx
  104488:	48 83 ec 30          	sub    $0x30,%rsp
  10448c:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
  104491:	48 8b df             	mov    %rdi,%rbx
  104494:	80 7b 55 00          	cmpb   $0x0,0x55(%rbx)
  104498:	0f 85 ec 00 00 00    	jne    10458a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__GetIndexNoRemap+0x10a>
  10449e:	48 8b d6             	mov    %rsi,%rdx
  1044a1:	48 33 53 48          	xor    0x48(%rbx),%rdx
  1044a5:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1044ac:	c1 7c 51 
  1044af:	48 8d 75 d8          	lea    -0x28(%rbp),%rsi
  1044b3:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  1044b8:	48 89 06             	mov    %rax,(%rsi)
  1044bb:	48 8b f7             	mov    %rdi,%rsi
  1044be:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
  1044c2:	49 8b ff             	mov    %r15,%rdi
  1044c5:	ba 40 00 00 00       	mov    $0x40,%edx
  1044ca:	e8 b1 fc f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1044cf:	4c 33 f8             	xor    %rax,%r15
  1044d2:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  1044d9:	c1 7c 51 
  1044dc:	4d 0f af fe          	imul   %r14,%r15
  1044e0:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  1044e4:	48 8b 12             	mov    (%rdx),%rdx
  1044e7:	48 8d 7d d0          	lea    -0x30(%rbp),%rdi
  1044eb:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  1044f0:	48 89 37             	mov    %rsi,(%rdi)
  1044f3:	48 8b f2             	mov    %rdx,%rsi
  1044f6:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
  1044fa:	ba 40 00 00 00       	mov    $0x40,%edx
  1044ff:	e8 7c fc f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104504:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  104508:	44 0f b6 34 02       	movzbl (%rdx,%rax,1),%r14d
  10450d:	48 8d 53 68          	lea    0x68(%rbx),%rdx
  104511:	48 8b 12             	mov    (%rdx),%rdx
  104514:	48 8d 7d c8          	lea    -0x38(%rbp),%rdi
  104518:	c4 c2 cb f6 d7       	mulx   %r15,%rsi,%rdx
  10451d:	48 89 37             	mov    %rsi,(%rdi)
  104520:	48 8b f2             	mov    %rdx,%rsi
  104523:	48 8b 7d c8          	mov    -0x38(%rbp),%rdi
  104527:	ba 40 00 00 00       	mov    $0x40,%edx
  10452c:	e8 4f fc f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  104531:	4c 8b e8             	mov    %rax,%r13
  104534:	4c 0f af 6b 18       	imul   0x18(%rbx),%r13
  104539:	4c 33 73 48          	xor    0x48(%rbx),%r14
  10453d:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  104544:	c1 7c 51 
  104547:	49 0f af d6          	imul   %r14,%rdx
  10454b:	48 81 c3 80 00 00 00 	add    $0x80,%rbx
  104552:	49 33 d7             	xor    %r15,%rdx
  104555:	48 0f af 53 08       	imul   0x8(%rbx),%rdx
  10455a:	48 8b 3b             	mov    (%rbx),%rdi
  10455d:	48 8d 75 c0          	lea    -0x40(%rbp),%rsi
  104561:	c4 e2 fb f6 ff       	mulx   %rdi,%rax,%rdi
  104566:	48 89 06             	mov    %rax,(%rsi)
  104569:	48 8b f7             	mov    %rdi,%rsi
  10456c:	48 8b 7d c0          	mov    -0x40(%rbp),%rdi
  104570:	ba 40 00 00 00       	mov    $0x40,%edx
  104575:	e8 06 fc f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  10457a:	49 03 c5             	add    %r13,%rax
  10457d:	48 83 c4 30          	add    $0x30,%rsp
  104581:	5b                   	pop    %rbx
  104582:	41 5d                	pop    %r13
  104584:	41 5e                	pop    %r14
  104586:	41 5f                	pop    %r15
  104588:	5d                   	pop    %rbp
  104589:	c3                   	ret
  10458a:	48 8b fe             	mov    %rsi,%rdi
  10458d:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  104591:	48 8d 55 b8          	lea    -0x48(%rbp),%rdx
  104595:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  10459c:	c1 7c 51 
  10459f:	e8 3c f8 f7 ff       	call   83de0 <S_P_CoreLib_System_Math__BigMul_0>
  1045a4:	48 8b f0             	mov    %rax,%rsi
  1045a7:	4c 8b 7d b8          	mov    -0x48(%rbp),%r15
  1045ab:	49 8b ff             	mov    %r15,%rdi
  1045ae:	ba 40 00 00 00       	mov    $0x40,%edx
  1045b3:	e8 c8 fb f8 ff       	call   94180 <S_P_CoreLib_System_UInt128__op_UnsignedRightShift>
  1045b8:	4c 33 f8             	xor    %rax,%r15
  1045bb:	49 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r14
  1045c2:	c1 7c 51 
  1045c5:	4d 0f af fe          	imul   %r14,%r15
  1045c9:	48 8b fb             	mov    %rbx,%rdi
  1045cc:	49 8b f7             	mov    %r15,%rsi
  1045cf:	e8 8c 00 00 00       	call   104660 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_4<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_StrongerIntHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear__PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_UInt32VectorRemappingStorage>__BucketInPart>
  1045d4:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1045d8:	40 0f b6 3c 07       	rex movzbl (%rdi,%rax,1),%edi
  1045dd:	48 33 7b 48          	xor    0x48(%rbx),%rdi
  1045e1:	49 0f af fe          	imul   %r14,%rdi
  1045e5:	48 8d b3 80 00 00 00 	lea    0x80(%rbx),%rsi
  1045ec:	49 33 ff             	xor    %r15,%rdi
  1045ef:	48 0f af 7e 08       	imul   0x8(%rsi),%rdi
  1045f4:	48 8b 16             	mov    (%rsi),%rdx
  1045f7:	33 f6                	xor    %esi,%esi
  1045f9:	33 c9                	xor    %ecx,%ecx
  1045fb:	e8 30 fb f8 ff       	call   94130 <S_P_CoreLib_System_UInt128__op_Multiply>
