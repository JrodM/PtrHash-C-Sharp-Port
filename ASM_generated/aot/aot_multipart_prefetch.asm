   789e6:	e8 55 ca 08 00       	call   105440 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart>
   789eb:	90                   	nop
   789ec:	48 83 c4 10          	add    $0x10,%rsp
   789f0:	5d                   	pop    %rbp
   789f1:	c3                   	ret
   789f2:	90                   	nop
   789f3:	90                   	nop
   789f4:	90                   	nop
   789f5:	90                   	nop
   789f6:	90                   	nop
   789f7:	90                   	nop
   789f8:	90                   	nop
   789f9:	90                   	nop
   789fa:	90                   	nop
   789fb:	90                   	nop
   789fc:	90                   	nop
   789fd:	90                   	nop
   789fe:	90                   	nop
   789ff:	90                   	nop

0000000000105440 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart>:
  105440:	55                   	push   %rbp
  105441:	41 57                	push   %r15
  105443:	41 56                	push   %r14
  105445:	41 55                	push   %r13
  105447:	41 54                	push   %r12
  105449:	53                   	push   %rbx
  10544a:	48 81 ec 98 00 00 00 	sub    $0x98,%rsp
  105451:	c5 f8 77             	vzeroupper
  105454:	48 8d ac 24 c0 00 00 	lea    0xc0(%rsp),%rbp
  10545b:	00 
  10545c:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  105461:	c5 79 7f 85 60 ff ff 	vmovdqa %xmm8,-0xa0(%rbp)
  105468:	ff 
  105469:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  105470:	ff ff ff 
  105473:	c5 79 7f 44 05 d0    	vmovdqa %xmm8,-0x30(%rbp,%rax,1)
  105479:	c5 79 7f 44 05 e0    	vmovdqa %xmm8,-0x20(%rbp,%rax,1)
  10547f:	c5 79 7f 44 05 f0    	vmovdqa %xmm8,-0x10(%rbp,%rax,1)
  105485:	48 83 c0 30          	add    $0x30,%rax
  105489:	75 e8                	jne    105473 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x33>
  10548b:	48 8b 05 a6 7e 0b 00 	mov    0xb7ea6(%rip),%rax        # 1bd338 <__security_cookie>
  105492:	48 89 85 40 ff ff ff 	mov    %rax,-0xc0(%rbp)
  105499:	48 8b df             	mov    %rdi,%rbx
  10549c:	44 8b fa             	mov    %edx,%r15d
  10549f:	45 3b f8             	cmp    %r8d,%r15d
  1054a2:	0f 85 f4 03 00 00    	jne    10589c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x45c>
  1054a8:	45 84 c9             	test   %r9b,%r9b
  1054ab:	74 12                	je     1054bf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x7f>
  1054ad:	80 7b 5c 00          	cmpb   $0x0,0x5c(%rbx)
  1054b1:	74 0c                	je     1054bf <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x7f>
  1054b3:	33 d2                	xor    %edx,%edx
  1054b5:	48 83 7b 08 00       	cmpq   $0x0,0x8(%rbx)
  1054ba:	0f 95 c2             	setne  %dl
  1054bd:	eb 02                	jmp    1054c1 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x81>
  1054bf:	33 d2                	xor    %edx,%edx
  1054c1:	44 0f b6 f2          	movzbl %dl,%r14d
  1054c5:	4c 8b 6b 40          	mov    0x40(%rbx),%r13
  1054c9:	4c 89 6d d0          	mov    %r13,-0x30(%rbp)
  1054cd:	85 24 24             	test   %esp,(%rsp)
  1054d0:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  1054d7:	48 8d 14 24          	lea    (%rsp),%rdx
  1054db:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  1054df:	62 f1 7e 48 7f 02    	vmovdqu32 %zmm0,(%rdx)
  1054e5:	62 f1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%rdx)
  1054ec:	62 f1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%rdx)
  1054f3:	62 f1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%rdx)
  1054fa:	4c 8b e2             	mov    %rdx,%r12
  1054fd:	85 24 24             	test   %esp,(%rsp)
  105500:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105507:	48 8d 14 24          	lea    (%rsp),%rdx
  10550b:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  10550f:	62 f1 7e 48 7f 02    	vmovdqu32 %zmm0,(%rdx)
  105515:	62 f1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%rdx)
  10551c:	62 f1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%rdx)
  105523:	62 f1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%rdx)
  10552a:	48 8b c2             	mov    %rdx,%rax
  10552d:	85 24 24             	test   %esp,(%rsp)
  105530:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105537:	48 8d 14 24          	lea    (%rsp),%rdx
  10553b:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  10553f:	62 f1 7e 48 7f 02    	vmovdqu32 %zmm0,(%rdx)
  105545:	62 f1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%rdx)
  10554c:	62 f1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%rdx)
  105553:	62 f1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%rdx)
  10555a:	4c 8b c2             	mov    %rdx,%r8
  10555d:	4c 8b ce             	mov    %rsi,%r9
  105560:	4c 89 8d 50 ff ff ff 	mov    %r9,-0xb0(%rbp)
  105567:	48 89 8d 48 ff ff ff 	mov    %rcx,-0xb8(%rbp)
  10556e:	4c 89 65 c8          	mov    %r12,-0x38(%rbp)
  105572:	48 89 45 b8          	mov    %rax,-0x48(%rbp)
  105576:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  10557a:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
  10557e:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
  105582:	41 8b d7             	mov    %r15d,%edx
  105585:	be 20 00 00 00       	mov    $0x20,%esi
  10558a:	83 fa 20             	cmp    $0x20,%edx
  10558d:	41 0f 4c f7          	cmovl  %r15d,%esi
  105591:	89 75 a4             	mov    %esi,-0x5c(%rbp)
  105594:	33 ff                	xor    %edi,%edi
  105596:	85 f6                	test   %esi,%esi
  105598:	0f 8e f6 02 00 00    	jle    105894 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x454>
  10559e:	4c 63 d7             	movslq %edi,%r10
  1055a1:	4b 8b 14 d1          	mov    (%r9,%r10,8),%rdx
  1055a5:	4c 8b 5b 50          	mov    0x50(%rbx),%r11
  1055a9:	49 c1 c3 05          	rol    $0x5,%r11
  1055ad:	49 33 d3             	xor    %r11,%rdx
  1055b0:	49 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r11
  1055b7:	c1 7c 51 
  1055ba:	49 0f af d3          	imul   %r11,%rdx
  1055be:	4b 89 14 d4          	mov    %rdx,(%r12,%r10,8)
  1055c2:	4f 8b 1c d4          	mov    (%r12,%r10,8),%r11
  1055c6:	48 8b 53 60          	mov    0x60(%rbx),%rdx
  1055ca:	48 8d 75 88          	lea    -0x78(%rbp),%rsi
  1055ce:	c4 42 f3 f6 db       	mulx   %r11,%rcx,%r11
  1055d3:	48 89 0e             	mov    %rcx,(%rsi)
  1055d6:	48 8b 75 88          	mov    -0x78(%rbp),%rsi
  1055da:	4f 89 1c d0          	mov    %r11,(%r8,%r10,8)
  1055de:	48 8b 53 68          	mov    0x68(%rbx),%rdx
  1055e2:	48 8d 4d 80          	lea    -0x80(%rbp),%rcx
  1055e6:	c4 e2 93 f6 d6       	mulx   %rsi,%r13,%rdx
  1055eb:	4c 89 29             	mov    %r13,(%rcx)
  1055ee:	4c 0f af 5b 30       	imul   0x30(%rbx),%r11
  1055f3:	49 03 d3             	add    %r11,%rdx
  1055f6:	4a 89 14 d0          	mov    %rdx,(%rax,%r10,8)
  1055fa:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  1055fe:	4a 03 14 d0          	add    (%rax,%r10,8),%rdx
  105602:	0f 18 0a             	prefetcht0 (%rdx)
  105605:	ff c7                	inc    %edi
  105607:	8b 75 a4             	mov    -0x5c(%rbp),%esi
  10560a:	3b fe                	cmp    %esi,%edi
  10560c:	0f 8c 7d 02 00 00    	jl     10588f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x44f>
  105612:	83 fe 20             	cmp    $0x20,%esi
  105615:	7d 21                	jge    105638 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x1f8>
  105617:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  10561e:	00 00 
  105620:	48 63 d6             	movslq %esi,%rdx
  105623:	33 ff                	xor    %edi,%edi
  105625:	49 89 3c d4          	mov    %rdi,(%r12,%rdx,8)
  105629:	48 89 3c d0          	mov    %rdi,(%rax,%rdx,8)
  10562d:	49 89 3c d0          	mov    %rdi,(%r8,%rdx,8)
  105631:	ff c6                	inc    %esi
  105633:	83 fe 20             	cmp    $0x20,%esi
  105636:	7c e8                	jl     105620 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x1e0>
  105638:	45 33 ed             	xor    %r13d,%r13d
  10563b:	41 8d 57 e0          	lea    -0x20(%r15),%edx
  10563f:	33 c9                	xor    %ecx,%ecx
  105641:	85 d2                	test   %edx,%edx
  105643:	0f 4f ca             	cmovg  %edx,%ecx
  105646:	89 4d a0             	mov    %ecx,-0x60(%rbp)
  105649:	85 c9                	test   %ecx,%ecx
  10564b:	0f 8e 39 02 00 00    	jle    10588a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x44a>
  105651:	41 8b d5             	mov    %r13d,%edx
  105654:	c1 fa 1f             	sar    $0x1f,%edx
  105657:	83 e2 1f             	and    $0x1f,%edx
  10565a:	41 03 d5             	add    %r13d,%edx
  10565d:	83 e2 e0             	and    $0xffffffe0,%edx
  105660:	41 8b f5             	mov    %r13d,%esi
  105663:	2b f2                	sub    %edx,%esi
  105665:	48 63 f6             	movslq %esi,%rsi
  105668:	49 8b 14 f4          	mov    (%r12,%rsi,8),%rdx
  10566c:	48 89 95 58 ff ff ff 	mov    %rdx,-0xa8(%rbp)
  105673:	48 8b 3c f0          	mov    (%rax,%rsi,8),%rdi
  105677:	48 89 7d 98          	mov    %rdi,-0x68(%rbp)
  10567b:	4d 8b 1c f0          	mov    (%r8,%rsi,8),%r11
  10567f:	4c 89 5d 90          	mov    %r11,-0x70(%rbp)
  105683:	45 8d 55 20          	lea    0x20(%r13),%r10d
  105687:	4d 63 d2             	movslq %r10d,%r10
  10568a:	4f 8b 14 d1          	mov    (%r9,%r10,8),%r10
  10568e:	48 8b 4b 50          	mov    0x50(%rbx),%rcx
  105692:	48 c1 c1 05          	rol    $0x5,%rcx
  105696:	4c 33 d1             	xor    %rcx,%r10
  105699:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
  1056a0:	c1 7c 51 
  1056a3:	4c 0f af d1          	imul   %rcx,%r10
  1056a7:	4d 89 14 f4          	mov    %r10,(%r12,%rsi,8)
  1056ab:	4d 8b 14 f4          	mov    (%r12,%rsi,8),%r10
  1056af:	48 8b 4b 60          	mov    0x60(%rbx),%rcx
  1056b3:	4c 8d 9d 78 ff ff ff 	lea    -0x88(%rbp),%r11
  1056ba:	48 8b d1             	mov    %rcx,%rdx
  1056bd:	c4 42 c3 f6 d2       	mulx   %r10,%rdi,%r10
  1056c2:	49 89 3b             	mov    %rdi,(%r11)
  1056c5:	48 8b bd 78 ff ff ff 	mov    -0x88(%rbp),%rdi
  1056cc:	4d 89 14 f0          	mov    %r10,(%r8,%rsi,8)
  1056d0:	48 8b 53 68          	mov    0x68(%rbx),%rdx
  1056d4:	48 8d 8d 70 ff ff ff 	lea    -0x90(%rbp),%rcx
  1056db:	c4 e2 a3 f6 d7       	mulx   %rdi,%r11,%rdx
  1056e0:	4c 89 19             	mov    %r11,(%rcx)
  1056e3:	4c 0f af 53 30       	imul   0x30(%rbx),%r10
  1056e8:	49 03 d2             	add    %r10,%rdx
  1056eb:	48 89 14 f0          	mov    %rdx,(%rax,%rsi,8)
  1056ef:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  1056f3:	48 8b fa             	mov    %rdx,%rdi
  1056f6:	48 03 3c f0          	add    (%rax,%rsi,8),%rdi
  1056fa:	0f 18 0f             	prefetcht0 (%rdi)
  1056fd:	48 8b 7d 98          	mov    -0x68(%rbp),%rdi
  105701:	0f b6 14 3a          	movzbl (%rdx,%rdi,1),%edx
  105705:	48 33 53 50          	xor    0x50(%rbx),%rdx
  105709:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  105710:	c1 7c 51 
  105713:	48 0f af d6          	imul   %rsi,%rdx
  105717:	48 8d 73 78          	lea    0x78(%rbx),%rsi
  10571b:	48 8b bd 58 ff ff ff 	mov    -0xa8(%rbp),%rdi
  105722:	48 33 d7             	xor    %rdi,%rdx
  105725:	48 0f af 56 08       	imul   0x8(%rsi),%rdx
  10572a:	48 8b 36             	mov    (%rsi),%rsi
  10572d:	48 8d bd 68 ff ff ff 	lea    -0x98(%rbp),%rdi
  105734:	c4 e2 ab f6 f6       	mulx   %rsi,%r10,%rsi
  105739:	4c 89 17             	mov    %r10,(%rdi)
  10573c:	4c 8b 5d 90          	mov    -0x70(%rbp),%r11
  105740:	4c 0f af 5b 20       	imul   0x20(%rbx),%r11
  105745:	49 03 f3             	add    %r11,%rsi
  105748:	45 85 f6             	test   %r14d,%r14d
  10574b:	74 20                	je     10576d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x32d>
  10574d:	48 8b 4d d0          	mov    -0x30(%rbp),%rcx
  105751:	48 3b f1             	cmp    %rcx,%rsi
  105754:	0f 82 2b 01 00 00    	jb     105885 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x445>
  10575a:	2b f1                	sub    %ecx,%esi
  10575c:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  105760:	4c 8d 15 59 ae 14 00 	lea    0x14ae59(%rip),%r10        # 2505c0 <__InterfaceDispatchCell_PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_IRemappingStorage__Index_PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart>
  105767:	41 ff 12             	call   *(%r10)
  10576a:	48 8b f0             	mov    %rax,%rsi
  10576d:	49 63 d5             	movslq %r13d,%rdx
  105770:	48 8b 8d 48 ff ff ff 	mov    -0xb8(%rbp),%rcx
  105777:	48 89 34 d1          	mov    %rsi,(%rcx,%rdx,8)
  10577b:	41 ff c5             	inc    %r13d
  10577e:	8b 55 a0             	mov    -0x60(%rbp),%edx
  105781:	44 3b ea             	cmp    %edx,%r13d
  105784:	4c 8b 8d 50 ff ff ff 	mov    -0xb0(%rbp),%r9
  10578b:	0f 8c e7 00 00 00    	jl     105878 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x438>
  105791:	45 3b ef             	cmp    %r15d,%r13d
  105794:	0f 8d a6 00 00 00    	jge    105840 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x400>
  10579a:	41 8b d5             	mov    %r13d,%edx
  10579d:	c1 fa 1f             	sar    $0x1f,%edx
  1057a0:	83 e2 1f             	and    $0x1f,%edx
  1057a3:	41 03 d5             	add    %r13d,%edx
  1057a6:	83 e2 e0             	and    $0xffffffe0,%edx
  1057a9:	41 8b f5             	mov    %r13d,%esi
  1057ac:	2b f2                	sub    %edx,%esi
  1057ae:	48 63 d6             	movslq %esi,%rdx
  1057b1:	49 8b 34 d4          	mov    (%r12,%rdx,8),%rsi
  1057b5:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  1057b9:	48 8b 3c d0          	mov    (%rax,%rdx,8),%rdi
  1057bd:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
  1057c1:	4d 8b 0c d0          	mov    (%r8,%rdx,8),%r9
  1057c5:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  1057c9:	0f b6 14 3a          	movzbl (%rdx,%rdi,1),%edx
  1057cd:	48 33 53 50          	xor    0x50(%rbx),%rdx
  1057d1:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  1057d8:	c1 7c 51 
  1057db:	48 0f af d7          	imul   %rdi,%rdx
  1057df:	48 8d 7b 78          	lea    0x78(%rbx),%rdi
  1057e3:	48 33 d6             	xor    %rsi,%rdx
  1057e6:	48 0f af 57 08       	imul   0x8(%rdi),%rdx
  1057eb:	48 8b 37             	mov    (%rdi),%rsi
  1057ee:	48 8d bd 60 ff ff ff 	lea    -0xa0(%rbp),%rdi
  1057f5:	c4 e2 ab f6 f6       	mulx   %rsi,%r10,%rsi
  1057fa:	4c 89 17             	mov    %r10,(%rdi)
  1057fd:	4c 0f af 4b 20       	imul   0x20(%rbx),%r9
  105802:	49 03 f1             	add    %r9,%rsi
  105805:	45 85 f6             	test   %r14d,%r14d
  105808:	74 1c                	je     105826 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x3e6>
  10580a:	48 8b 55 d0          	mov    -0x30(%rbp),%rdx
  10580e:	48 3b f2             	cmp    %rdx,%rsi
  105811:	72 63                	jb     105876 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x436>
  105813:	2b f2                	sub    %edx,%esi
  105815:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  105819:	4c 8d 15 a0 ad 14 00 	lea    0x14ada0(%rip),%r10        # 2505c0 <__InterfaceDispatchCell_PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_IRemappingStorage__Index_PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart>
  105820:	41 ff 12             	call   *(%r10)
  105823:	48 8b f0             	mov    %rax,%rsi
  105826:	49 63 fd             	movslq %r13d,%rdi
  105829:	48 8b 8d 48 ff ff ff 	mov    -0xb8(%rbp),%rcx
  105830:	48 89 34 f9          	mov    %rsi,(%rcx,%rdi,8)
  105834:	41 ff c5             	inc    %r13d
  105837:	45 3b ef             	cmp    %r15d,%r13d
  10583a:	0f 8c 5a ff ff ff    	jl     10579a <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x35a>
  105840:	33 ff                	xor    %edi,%edi
  105842:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  105846:	48 89 7d b8          	mov    %rdi,-0x48(%rbp)
  10584a:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
  10584e:	48 8d 3d e3 7a 0b 00 	lea    0xb7ae3(%rip),%rdi        # 1bd338 <__security_cookie>
  105855:	48 8b 3f             	mov    (%rdi),%rdi
  105858:	48 39 bd 40 ff ff ff 	cmp    %rdi,-0xc0(%rbp)
  10585f:	74 05                	je     105866 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x426>
  105861:	e8 ca 46 f0 ff       	call   9f30 <RhpFallbackFailFast>
  105866:	90                   	nop
  105867:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  10586b:	5b                   	pop    %rbx
  10586c:	41 5c                	pop    %r12
  10586e:	41 5d                	pop    %r13
  105870:	41 5e                	pop    %r14
  105872:	41 5f                	pop    %r15
  105874:	5d                   	pop    %rbp
  105875:	c3                   	ret
  105876:	eb ae                	jmp    105826 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x3e6>
  105878:	48 8b 45 c0          	mov    -0x40(%rbp),%rax
  10587c:	4c 8b 45 b0          	mov    -0x50(%rbp),%r8
  105880:	e9 cc fd ff ff       	jmp    105651 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x211>
  105885:	e9 e3 fe ff ff       	jmp    10576d <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x32d>
  10588a:	e9 02 ff ff ff       	jmp    105791 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x351>
  10588f:	e9 0a fd ff ff       	jmp    10559e <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x15e>
  105894:	8b 75 a4             	mov    -0x5c(%rbp),%esi
  105897:	e9 76 fd ff ff       	jmp    105612 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x1d2>
  10589c:	48 8d 3d 45 d8 14 00 	lea    0x14d845(%rip),%rdi        # 2530e8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  1058a3:	e8 9c fc f5 ff       	call   65544 <RhpNewFast>
  1058a8:	48 8b d8             	mov    %rax,%rbx
  1058ab:	48 8b fb             	mov    %rbx,%rdi
  1058ae:	48 8d 35 83 a9 13 00 	lea    0x13a983(%rip),%rsi        # 240238 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  1058b5:	e8 36 50 f8 ff       	call   8a8f0 <S_P_CoreLib_System_ArgumentException___ctor_0>
  1058ba:	48 8b fb             	mov    %rbx,%rdi
  1058bd:	e8 ec fe f5 ff       	call   657ae <RhpThrowEx>
  1058c2:	cc                   	int3
  1058c3:	90                   	nop
  1058c4:	90                   	nop
  1058c5:	90                   	nop
  1058c6:	90                   	nop
  1058c7:	90                   	nop
  1058c8:	90                   	nop
  1058c9:	90                   	nop
  1058ca:	90                   	nop
  1058cb:	90                   	nop
  1058cc:	90                   	nop
  1058cd:	90                   	nop
  1058ce:	90                   	nop
  1058cf:	90                   	nop
  1058d0:	90                   	nop
  1058d1:	90                   	nop
  1058d2:	90                   	nop
  1058d3:	90                   	nop
  1058d4:	90                   	nop
  1058d5:	90                   	nop
  1058d6:	90                   	nop
  1058d7:	90                   	nop
  1058d8:	90                   	nop
  1058d9:	90                   	nop
  1058da:	90                   	nop
  1058db:	90                   	nop
  1058dc:	90                   	nop
  1058dd:	90                   	nop
  1058de:	90                   	nop
  1058df:	90                   	nop

