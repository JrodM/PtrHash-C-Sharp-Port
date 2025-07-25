   789d0:	e8 ab c6 08 00       	call   105080 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart>
   789d5:	eb 14                	jmp    789eb <DisasmTest_Program__RunTest+0x6b>
   789d7:	49 8b c8             	mov    %r8,%rcx
   789da:	45 8b c1             	mov    %r9d,%r8d
   789dd:	8b 55 fc             	mov    -0x4(%rbp),%edx
   789e0:	41 b9 01 00 00 00    	mov    $0x1,%r9d
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

0000000000105080 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart>:
  105080:	55                   	push   %rbp
  105081:	41 57                	push   %r15
  105083:	41 56                	push   %r14
  105085:	41 55                	push   %r13
  105087:	41 54                	push   %r12
  105089:	53                   	push   %rbx
  10508a:	48 83 ec 78          	sub    $0x78,%rsp
  10508e:	c5 f8 77             	vzeroupper
  105091:	48 8d ac 24 a0 00 00 	lea    0xa0(%rsp),%rbp
  105098:	00 
  105099:	33 c0                	xor    %eax,%eax
  10509b:	48 89 45 88          	mov    %rax,-0x78(%rbp)
  10509f:	c4 41 38 57 c0       	vxorps %xmm8,%xmm8,%xmm8
  1050a4:	c5 79 7f 45 90       	vmovdqa %xmm8,-0x70(%rbp)
  1050a9:	c5 79 7f 45 a0       	vmovdqa %xmm8,-0x60(%rbp)
  1050ae:	c5 79 7f 45 b0       	vmovdqa %xmm8,-0x50(%rbp)
  1050b3:	c5 79 7f 45 c0       	vmovdqa %xmm8,-0x40(%rbp)
  1050b8:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  1050bc:	48 8b 05 75 82 0b 00 	mov    0xb8275(%rip),%rax        # 1bd338 <__security_cookie>
  1050c3:	48 89 85 68 ff ff ff 	mov    %rax,-0x98(%rbp)
  1050ca:	48 8b df             	mov    %rdi,%rbx
  1050cd:	44 8b fa             	mov    %edx,%r15d
  1050d0:	45 3b f8             	cmp    %r8d,%r15d
  1050d3:	0f 85 38 03 00 00    	jne    105411 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x391>
  1050d9:	45 84 c9             	test   %r9b,%r9b
  1050dc:	74 12                	je     1050f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x70>
  1050de:	80 7b 5c 00          	cmpb   $0x0,0x5c(%rbx)
  1050e2:	74 0c                	je     1050f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x70>
  1050e4:	33 d2                	xor    %edx,%edx
  1050e6:	48 83 7b 08 00       	cmpq   $0x0,0x8(%rbx)
  1050eb:	0f 95 c2             	setne  %dl
  1050ee:	eb 02                	jmp    1050f2 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x72>
  1050f0:	33 d2                	xor    %edx,%edx
  1050f2:	44 0f b6 f2          	movzbl %dl,%r14d
  1050f6:	4c 8b 6b 40          	mov    0x40(%rbx),%r13
  1050fa:	85 24 24             	test   %esp,(%rsp)
  1050fd:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105104:	48 8d 14 24          	lea    (%rsp),%rdx
  105108:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  10510c:	62 f1 7e 48 7f 02    	vmovdqu32 %zmm0,(%rdx)
  105112:	62 f1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%rdx)
  105119:	62 f1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%rdx)
  105120:	62 f1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%rdx)
  105127:	4c 8b e2             	mov    %rdx,%r12
  10512a:	85 24 24             	test   %esp,(%rsp)
  10512d:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105134:	48 8d 14 24          	lea    (%rsp),%rdx
  105138:	c5 fc 57 c0          	vxorps %ymm0,%ymm0,%ymm0
  10513c:	62 f1 7e 48 7f 02    	vmovdqu32 %zmm0,(%rdx)
  105142:	62 f1 7e 48 7f 42 01 	vmovdqu32 %zmm0,0x40(%rdx)
  105149:	62 f1 7e 48 7f 42 02 	vmovdqu32 %zmm0,0x80(%rdx)
  105150:	62 f1 7e 48 7f 42 03 	vmovdqu32 %zmm0,0xc0(%rdx)
  105157:	48 8b c2             	mov    %rdx,%rax
  10515a:	4c 8b c6             	mov    %rsi,%r8
  10515d:	4c 89 85 78 ff ff ff 	mov    %r8,-0x88(%rbp)
  105164:	48 89 8d 70 ff ff ff 	mov    %rcx,-0x90(%rbp)
  10516b:	4c 89 65 d0          	mov    %r12,-0x30(%rbp)
  10516f:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  105173:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
  105177:	41 8b d7             	mov    %r15d,%edx
  10517a:	be 20 00 00 00       	mov    $0x20,%esi
  10517f:	83 fa 20             	cmp    $0x20,%edx
  105182:	41 0f 4c f7          	cmovl  %r15d,%esi
  105186:	89 75 bc             	mov    %esi,-0x44(%rbp)
  105189:	33 ff                	xor    %edi,%edi
  10518b:	85 f6                	test   %esi,%esi
  10518d:	0f 8e 76 02 00 00    	jle    105409 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x389>
  105193:	4c 63 d7             	movslq %edi,%r10
  105196:	4b 8b 14 d0          	mov    (%r8,%r10,8),%rdx
  10519a:	4c 8b 4b 50          	mov    0x50(%rbx),%r9
  10519e:	49 c1 c1 05          	rol    $0x5,%r9
  1051a2:	49 33 d1             	xor    %r9,%rdx
  1051a5:	49 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r9
  1051ac:	c1 7c 51 
  1051af:	49 0f af d1          	imul   %r9,%rdx
  1051b3:	4b 89 14 d4          	mov    %rdx,(%r12,%r10,8)
  1051b7:	4f 8b 0c d4          	mov    (%r12,%r10,8),%r9
  1051bb:	48 8b 53 68          	mov    0x68(%rbx),%rdx
  1051bf:	4c 8d 5d a0          	lea    -0x60(%rbp),%r11
  1051c3:	c4 c2 cb f6 d1       	mulx   %r9,%rsi,%rdx
  1051c8:	49 89 33             	mov    %rsi,(%r11)
  1051cb:	4a 89 14 d0          	mov    %rdx,(%rax,%r10,8)
  1051cf:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  1051d3:	4a 03 14 d0          	add    (%rax,%r10,8),%rdx
  1051d7:	0f 18 0a             	prefetcht0 (%rdx)
  1051da:	ff c7                	inc    %edi
  1051dc:	8b 75 bc             	mov    -0x44(%rbp),%esi
  1051df:	3b fe                	cmp    %esi,%edi
  1051e1:	0f 8c 1d 02 00 00    	jl     105404 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x384>
  1051e7:	83 fe 20             	cmp    $0x20,%esi
  1051ea:	7d 1b                	jge    105207 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x187>
  1051ec:	0f 1f 40 00          	nopl   0x0(%rax)
  1051f0:	48 63 d6             	movslq %esi,%rdx
  1051f3:	33 ff                	xor    %edi,%edi
  1051f5:	49 89 3c d4          	mov    %rdi,(%r12,%rdx,8)
  1051f9:	48 63 d6             	movslq %esi,%rdx
  1051fc:	48 89 3c d0          	mov    %rdi,(%rax,%rdx,8)
  105200:	ff c6                	inc    %esi
  105202:	83 fe 20             	cmp    $0x20,%esi
  105205:	7c e9                	jl     1051f0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x170>
  105207:	45 33 c9             	xor    %r9d,%r9d
  10520a:	41 8d 57 e0          	lea    -0x20(%r15),%edx
  10520e:	45 33 db             	xor    %r11d,%r11d
  105211:	85 d2                	test   %edx,%edx
  105213:	44 0f 4f da          	cmovg  %edx,%r11d
  105217:	44 89 5d b4          	mov    %r11d,-0x4c(%rbp)
  10521b:	45 85 db             	test   %r11d,%r11d
  10521e:	0f 8e db 01 00 00    	jle    1053ff <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x37f>
  105224:	41 8b d1             	mov    %r9d,%edx
  105227:	c1 fa 1f             	sar    $0x1f,%edx
  10522a:	83 e2 1f             	and    $0x1f,%edx
  10522d:	41 03 d1             	add    %r9d,%edx
  105230:	83 e2 e0             	and    $0xffffffe0,%edx
  105233:	41 8b f1             	mov    %r9d,%esi
  105236:	2b f2                	sub    %edx,%esi
  105238:	48 63 f6             	movslq %esi,%rsi
  10523b:	49 8b 14 f4          	mov    (%r12,%rsi,8),%rdx
  10523f:	48 89 55 80          	mov    %rdx,-0x80(%rbp)
  105243:	48 8b 3c f0          	mov    (%rax,%rsi,8),%rdi
  105247:	48 89 7d a8          	mov    %rdi,-0x58(%rbp)
  10524b:	44 89 4d b8          	mov    %r9d,-0x48(%rbp)
  10524f:	45 8d 51 20          	lea    0x20(%r9),%r10d
  105253:	4d 63 d2             	movslq %r10d,%r10
  105256:	4f 8b 14 d0          	mov    (%r8,%r10,8),%r10
  10525a:	4c 8b 5b 50          	mov    0x50(%rbx),%r11
  10525e:	49 c1 c3 05          	rol    $0x5,%r11
  105262:	4d 33 d3             	xor    %r11,%r10
  105265:	49 bb 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r11
  10526c:	c1 7c 51 
  10526f:	4d 0f af d3          	imul   %r11,%r10
  105273:	4d 89 14 f4          	mov    %r10,(%r12,%rsi,8)
  105277:	4d 8b 14 f4          	mov    (%r12,%rsi,8),%r10
  10527b:	4c 8b 5b 68          	mov    0x68(%rbx),%r11
  10527f:	48 8d 7d 98          	lea    -0x68(%rbp),%rdi
  105283:	49 8b d3             	mov    %r11,%rdx
  105286:	c4 c2 f3 f6 d2       	mulx   %r10,%rcx,%rdx
  10528b:	48 89 0f             	mov    %rcx,(%rdi)
  10528e:	48 89 14 f0          	mov    %rdx,(%rax,%rsi,8)
  105292:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  105296:	48 8b fa             	mov    %rdx,%rdi
  105299:	48 03 3c f0          	add    (%rax,%rsi,8),%rdi
  10529d:	0f 18 0f             	prefetcht0 (%rdi)
  1052a0:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
  1052a4:	0f b6 14 3a          	movzbl (%rdx,%rdi,1),%edx
  1052a8:	48 33 53 50          	xor    0x50(%rbx),%rdx
  1052ac:	48 be 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rsi
  1052b3:	c1 7c 51 
  1052b6:	48 0f af d6          	imul   %rsi,%rdx
  1052ba:	48 8d 73 78          	lea    0x78(%rbx),%rsi
  1052be:	48 8b 7d 80          	mov    -0x80(%rbp),%rdi
  1052c2:	48 33 d7             	xor    %rdi,%rdx
  1052c5:	48 0f af 56 08       	imul   0x8(%rsi),%rdx
  1052ca:	48 8b 36             	mov    (%rsi),%rsi
  1052cd:	48 8d 7d 90          	lea    -0x70(%rbp),%rdi
  1052d1:	c4 e2 ab f6 f6       	mulx   %rsi,%r10,%rsi
  1052d6:	4c 89 17             	mov    %r10,(%rdi)
  1052d9:	45 85 f6             	test   %r14d,%r14d
  1052dc:	74 19                	je     1052f7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x277>
  1052de:	49 3b f5             	cmp    %r13,%rsi
  1052e1:	72 14                	jb     1052f7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x277>
  1052e3:	41 2b f5             	sub    %r13d,%esi
  1052e6:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1052ea:	4c 8d 15 bf b2 14 00 	lea    0x14b2bf(%rip),%r10        # 2505b0 <__InterfaceDispatchCellSection_Start>
  1052f1:	41 ff 12             	call   *(%r10)
  1052f4:	48 8b f0             	mov    %rax,%rsi
  1052f7:	44 8b 4d b8          	mov    -0x48(%rbp),%r9d
  1052fb:	49 63 d1             	movslq %r9d,%rdx
  1052fe:	48 8b 8d 70 ff ff ff 	mov    -0x90(%rbp),%rcx
  105305:	48 89 34 d1          	mov    %rsi,(%rcx,%rdx,8)
  105309:	41 ff c1             	inc    %r9d
  10530c:	8b 55 b4             	mov    -0x4c(%rbp),%edx
  10530f:	44 3b ca             	cmp    %edx,%r9d
  105312:	4c 8b 85 78 ff ff ff 	mov    -0x88(%rbp),%r8
  105319:	0f 8c d7 00 00 00    	jl     1053f6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x376>
  10531f:	45 3b cf             	cmp    %r15d,%r9d
  105322:	0f 8d 9c 00 00 00    	jge    1053c4 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x344>
  105328:	41 8b d1             	mov    %r9d,%edx
  10532b:	c1 fa 1f             	sar    $0x1f,%edx
  10532e:	83 e2 1f             	and    $0x1f,%edx
  105331:	41 03 d1             	add    %r9d,%edx
  105334:	83 e2 e0             	and    $0xffffffe0,%edx
  105337:	44 89 4d b8          	mov    %r9d,-0x48(%rbp)
  10533b:	41 8b f1             	mov    %r9d,%esi
  10533e:	2b f2                	sub    %edx,%esi
  105340:	48 63 d6             	movslq %esi,%rdx
  105343:	49 8b 14 d4          	mov    (%r12,%rdx,8),%rdx
  105347:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  10534b:	48 63 f6             	movslq %esi,%rsi
  10534e:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  105352:	48 8b 34 f0          	mov    (%rax,%rsi,8),%rsi
  105356:	40 0f b6 34 37       	rex movzbl (%rdi,%rsi,1),%esi
  10535b:	48 33 73 50          	xor    0x50(%rbx),%rsi
  10535f:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  105366:	c1 7c 51 
  105369:	48 0f af f7          	imul   %rdi,%rsi
  10536d:	48 8d 7b 78          	lea    0x78(%rbx),%rdi
  105371:	48 33 d6             	xor    %rsi,%rdx
  105374:	48 0f af 57 08       	imul   0x8(%rdi),%rdx
  105379:	48 8b 37             	mov    (%rdi),%rsi
  10537c:	48 8d 7d 88          	lea    -0x78(%rbp),%rdi
  105380:	c4 e2 ab f6 f6       	mulx   %rsi,%r10,%rsi
  105385:	4c 89 17             	mov    %r10,(%rdi)
  105388:	45 85 f6             	test   %r14d,%r14d
  10538b:	74 19                	je     1053a6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x326>
  10538d:	49 3b f5             	cmp    %r13,%rsi
  105390:	72 14                	jb     1053a6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x326>
  105392:	41 2b f5             	sub    %r13d,%esi
  105395:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  105399:	4c 8d 15 10 b2 14 00 	lea    0x14b210(%rip),%r10        # 2505b0 <__InterfaceDispatchCellSection_Start>
  1053a0:	41 ff 12             	call   *(%r10)
  1053a3:	48 8b f0             	mov    %rax,%rsi
  1053a6:	44 8b 4d b8          	mov    -0x48(%rbp),%r9d
  1053aa:	49 63 f9             	movslq %r9d,%rdi
  1053ad:	48 8b 8d 70 ff ff ff 	mov    -0x90(%rbp),%rcx
  1053b4:	48 89 34 f9          	mov    %rsi,(%rcx,%rdi,8)
  1053b8:	41 ff c1             	inc    %r9d
  1053bb:	45 3b cf             	cmp    %r15d,%r9d
  1053be:	0f 8c 64 ff ff ff    	jl     105328 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x2a8>
  1053c4:	33 ff                	xor    %edi,%edi
  1053c6:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  1053ca:	48 89 7d d0          	mov    %rdi,-0x30(%rbp)
  1053ce:	48 8d 3d 63 7f 0b 00 	lea    0xb7f63(%rip),%rdi        # 1bd338 <__security_cookie>
  1053d5:	48 8b 3f             	mov    (%rdi),%rdi
  1053d8:	48 39 bd 68 ff ff ff 	cmp    %rdi,-0x98(%rbp)
  1053df:	74 05                	je     1053e6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x366>
  1053e1:	e8 4a 4b f0 ff       	call   9f30 <RhpFallbackFailFast>
  1053e6:	90                   	nop
  1053e7:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  1053eb:	5b                   	pop    %rbx
  1053ec:	41 5c                	pop    %r12
  1053ee:	41 5d                	pop    %r13
  1053f0:	41 5e                	pop    %r14
  1053f2:	41 5f                	pop    %r15
  1053f4:	5d                   	pop    %rbp
  1053f5:	c3                   	ret
  1053f6:	48 8b 45 c8          	mov    -0x38(%rbp),%rax
  1053fa:	e9 25 fe ff ff       	jmp    105224 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x1a4>
  1053ff:	e9 1b ff ff ff       	jmp    10531f <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x29f>
  105404:	e9 8a fd ff ff       	jmp    105193 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x113>
  105409:	8b 75 bc             	mov    -0x44(%rbp),%esi
  10540c:	e9 d6 fd ff ff       	jmp    1051e7 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchSinglePart+0x167>
  105411:	48 8d 3d d0 dc 14 00 	lea    0x14dcd0(%rip),%rdi        # 2530e8 <_ZTV36S_P_CoreLib_System_ArgumentException>
  105418:	e8 27 01 f6 ff       	call   65544 <RhpNewFast>
  10541d:	48 8b d8             	mov    %rax,%rbx
  105420:	48 8b fb             	mov    %rbx,%rdi
  105423:	48 8d 35 0e ae 13 00 	lea    0x13ae0e(%rip),%rsi        # 240238 <__Str_Keys_and_results_spans_must_ha_43F6D6A820163A8026071BC2C47B83B192082E1BDB91BCE90ED312AAEBF76ECC>
  10542a:	e8 c1 54 f8 ff       	call   8a8f0 <S_P_CoreLib_System_ArgumentException___ctor_0>
  10542f:	48 8b fb             	mov    %rbx,%rdi
  105432:	e8 77 03 f6 ff       	call   657ae <RhpThrowEx>
  105437:	cc                   	int3
  105438:	90                   	nop
  105439:	90                   	nop
  10543a:	90                   	nop
  10543b:	90                   	nop
  10543c:	90                   	nop
  10543d:	90                   	nop
  10543e:	90                   	nop
  10543f:	90                   	nop

