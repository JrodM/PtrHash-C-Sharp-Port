   987e8:	e8 b3 00 00 00       	call   988a0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds>
   987ed:	80 7d d0 00          	cmpb   $0x0,-0x30(%rbp)
   987f1:	74 09                	je     987fc <S_P_CoreLib_System_Globalization_CultureData__StripSecondsFromPattern+0xfc>
   987f3:	48 8d 3d 0e fe 19 00 	lea    0x19fe0e(%rip),%rdi        # 238608 <__Str___869F1DFB999A452F497A4CF7F44DB2D6EE661F74A9E7E05251BC1420E50672D4>
   987fa:	eb 07                	jmp    98803 <S_P_CoreLib_System_Globalization_CultureData__StripSecondsFromPattern+0x103>
   987fc:	48 8d 3d fd fb 19 00 	lea    0x19fbfd(%rip),%rdi        # 238400 <__Str_>
   98803:	45 3b e5             	cmp    %r13d,%r12d
   98806:	72 6c                	jb     98874 <S_P_CoreLib_System_Globalization_CultureData__StripSecondsFromPattern+0x174>
   98808:	48 8d 73 0c          	lea    0xc(%rbx),%rsi
   9880c:	41 8b d5             	mov    %r13d,%edx
   9880f:	48 85 ff             	test   %rdi,%rdi
   98812:	75 07                	jne    9881b <S_P_CoreLib_System_Globalization_CultureData__StripSecondsFromPattern+0x11b>
   98814:	33 c9                	xor    %ecx,%ecx
   98816:	45 33 c0             	xor    %r8d,%r8d
   98819:	eb 08                	jmp    98823 <S_P_CoreLib_System_Globalization_CultureData__StripSecondsFromPattern+0x123>
   9881b:	48 8d 4f 0c          	lea    0xc(%rdi),%rcx
   9881f:	44 8b 47 08          	mov    0x8(%rdi),%r8d
   98823:	44 3b e0             	cmp    %eax,%r12d
   98826:	72 4c                	jb     98874 <S_P_CoreLib_System_Globalization_CultureData__StripSecondsFromPattern+0x174>
   98828:	8b f8                	mov    %eax,%edi
   9882a:	48 8d 7c 7b 0c       	lea    0xc(%rbx,%rdi,2),%rdi
   9882f:	44 2b e0             	sub    %eax,%r12d
   98832:	45 8b cc             	mov    %r12d,%r9d
   98835:	48 89 7d c8          	mov    %rdi,-0x38(%rbp)
   98839:	48 8b fe             	mov    %rsi,%rdi
   9883c:	8b f2                	mov    %edx,%esi
   9883e:	48 8b d1             	mov    %rcx,%rdx
   98841:	41 8b c8             	mov    %r8d,%ecx
   98844:	4c 8b 45 c8          	mov    -0x38(%rbp),%r8
   98848:	e8 f3 c3 fe ff       	call   84c40 <String__Concat_9>
   9884d:	48 8b d8             	mov    %rax,%rbx
   98850:	eb 03                	jmp    98855 <S_P_CoreLib_System_Globalization_CultureData__StripSecondsFromPattern+0x155>
   98852:	45 8b f5             	mov    %r13d,%r14d
   98855:	41 ff c5             	inc    %r13d
   98858:	44 39 6b 08          	cmp    %r13d,0x8(%rbx)
   9885c:	0f 8f ca fe ff ff    	jg     9872c <S_P_CoreLib_System_Globalization_CultureData__StripSecondsFromPattern+0x2c>
   98862:	48 8b c3             	mov    %rbx,%rax
   98865:	48 83 c4 18          	add    $0x18,%rsp
   98869:	5b                   	pop    %rbx
   9886a:	41 5c                	pop    %r12
   9886c:	41 5d                	pop    %r13
   9886e:	41 5e                	pop    %r14
   98870:	41 5f                	pop    %r15
   98872:	5d                   	pop    %rbp
   98873:	c3                   	ret
   98874:	bf 21 00 00 00       	mov    $0x21,%edi
   98879:	e8 c2 9f ff ff       	call   92840 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_0>
   9887e:	cc                   	int3
   9887f:	e8 fc 2c 03 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   98884:	cc                   	int3
   98885:	90                   	nop
   98886:	90                   	nop
   98887:	90                   	nop
   98888:	90                   	nop
   98889:	90                   	nop
   9888a:	90                   	nop
   9888b:	90                   	nop
   9888c:	90                   	nop
   9888d:	90                   	nop
   9888e:	90                   	nop
   9888f:	90                   	nop
   98890:	90                   	nop
   98891:	90                   	nop
   98892:	90                   	nop
   98893:	90                   	nop
   98894:	90                   	nop
   98895:	90                   	nop
   98896:	90                   	nop
   98897:	90                   	nop
   98898:	90                   	nop
   98899:	90                   	nop
   9889a:	90                   	nop
   9889b:	90                   	nop
   9889c:	90                   	nop
   9889d:	90                   	nop
   9889e:	90                   	nop
   9889f:	90                   	nop

00000000000988a0 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds>:
   988a0:	55                   	push   %rbp
   988a1:	48 8b ec             	mov    %rsp,%rbp
   988a4:	8b c6                	mov    %esi,%eax
   988a6:	33 c9                	xor    %ecx,%ecx
   988a8:	c6 02 00             	movb   $0x0,(%rdx)
   988ab:	8b 77 08             	mov    0x8(%rdi),%esi
   988ae:	3b f0                	cmp    %eax,%esi
   988b0:	7e 74                	jle    98926 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x86>
   988b2:	3b c6                	cmp    %esi,%eax
   988b4:	73 77                	jae    9892d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   988b6:	44 8b c0             	mov    %eax,%r8d
   988b9:	46 0f b7 44 47 0c    	movzwl 0xc(%rdi,%r8,2),%r8d
   988bf:	41 83 f8 48          	cmp    $0x48,%r8d
   988c3:	77 14                	ja     988d9 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x39>
   988c5:	41 83 f8 20          	cmp    $0x20,%r8d
   988c9:	74 4c                	je     98917 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x77>
   988cb:	41 83 f8 27          	cmp    $0x27,%r8d
   988cf:	74 2a                	je     988fb <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x5b>
   988d1:	41 83 f8 48          	cmp    $0x48,%r8d
   988d5:	74 45                	je     9891c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988d7:	eb 47                	jmp    98920 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988d9:	41 83 f8 68          	cmp    $0x68,%r8d
   988dd:	77 0e                	ja     988ed <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x4d>
   988df:	41 83 f8 5c          	cmp    $0x5c,%r8d
   988e3:	74 20                	je     98905 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x65>
   988e5:	41 83 f8 68          	cmp    $0x68,%r8d
   988e9:	74 31                	je     9891c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988eb:	eb 33                	jmp    98920 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988ed:	41 83 f8 6d          	cmp    $0x6d,%r8d
   988f1:	74 29                	je     9891c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988f3:	41 83 f8 74          	cmp    $0x74,%r8d
   988f7:	74 23                	je     9891c <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x7c>
   988f9:	eb 25                	jmp    98920 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   988fb:	85 c9                	test   %ecx,%ecx
   988fd:	0f 94 c1             	sete   %cl
   98900:	0f b6 c9             	movzbl %cl,%ecx
   98903:	eb 1b                	jmp    98920 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98905:	ff c0                	inc    %eax
   98907:	3b c6                	cmp    %esi,%eax
   98909:	73 22                	jae    9892d <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8d>
   9890b:	44 8b c0             	mov    %eax,%r8d
   9890e:	66 42 83 7c 47 0c 20 	cmpw   $0x20,0xc(%rdi,%r8,2)
   98915:	75 09                	jne    98920 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   98917:	c6 02 01             	movb   $0x1,(%rdx)
   9891a:	eb 04                	jmp    98920 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x80>
   9891c:	85 c9                	test   %ecx,%ecx
   9891e:	74 0b                	je     9892b <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x8b>
   98920:	ff c0                	inc    %eax
   98922:	3b f0                	cmp    %eax,%esi
   98924:	7f 8c                	jg     988b2 <S_P_CoreLib_System_Globalization_CultureData__GetIndexOfNextTokenAfterSeconds+0x12>
   98926:	c6 02 00             	movb   $0x0,(%rdx)
   98929:	5d                   	pop    %rbp
   9892a:	c3                   	ret
   9892b:	5d                   	pop    %rbp
   9892c:	c3                   	ret
   9892d:	e8 4e 2c 03 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   98932:	cc                   	int3
   98933:	90                   	nop
   98934:	90                   	nop
   98935:	90                   	nop
   98936:	90                   	nop
   98937:	90                   	nop
   98938:	90                   	nop
   98939:	90                   	nop
   9893a:	90                   	nop
   9893b:	90                   	nop
   9893c:	90                   	nop
   9893d:	90                   	nop
   9893e:	90                   	nop
   9893f:	90                   	nop

0000000000098940 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek>:
   98940:	55                   	push   %rbp
   98941:	41 57                	push   %r15
   98943:	53                   	push   %rbx
   98944:	48 83 ec 10          	sub    $0x10,%rsp
   98948:	48 8d 6c 24 20       	lea    0x20(%rsp),%rbp
   9894d:	48 8b df             	mov    %rdi,%rbx
   98950:	83 bb 98 01 00 00 ff 	cmpl   $0xffffffff,0x198(%rbx)
   98957:	75 34                	jne    9898d <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x4d>
   98959:	4c 8d 3d 98 5f 1b 00 	lea    0x1b5f98(%rip),%r15        # 24e8f8 <__NONGCSTATICSS_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   98960:	49 83 7f f8 00       	cmpq   $0x0,-0x8(%r15)
   98965:	75 35                	jne    9899c <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x5c>
   98967:	41 80 3f 00          	cmpb   $0x0,(%r15)
   9896b:	75 20                	jne    9898d <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x4d>
   9896d:	33 ff                	xor    %edi,%edi
   9896f:	89 7d e8             	mov    %edi,-0x18(%rbp)
   98972:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   98976:	48 8d 55 e8          	lea    -0x18(%rbp),%rdx
   9897a:	be 0c 10 00 00       	mov    $0x100c,%esi
   9897f:	e8 2c 43 03 00       	call   cccb0 <S_P_CoreLib_Interop_Globalization__GetLocaleInfoInt>
   98984:	8b 45 e8             	mov    -0x18(%rbp),%eax
   98987:	89 83 98 01 00 00    	mov    %eax,0x198(%rbx)
   9898d:	8b 83 98 01 00 00    	mov    0x198(%rbx),%eax
   98993:	48 83 c4 10          	add    $0x10,%rsp
   98997:	5b                   	pop    %rbx
   98998:	41 5f                	pop    %r15
   9899a:	5d                   	pop    %rbp
   9899b:	c3                   	ret
   9899c:	e8 19 f7 f6 ff       	call   80ba <__GetNonGCStaticBase_S_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   989a1:	eb c4                	jmp    98967 <S_P_CoreLib_System_Globalization_CultureData__get_FirstDayOfWeek+0x27>
   989a3:	90                   	nop
   989a4:	90                   	nop
   989a5:	90                   	nop
   989a6:	90                   	nop
   989a7:	90                   	nop
   989a8:	90                   	nop
   989a9:	90                   	nop
   989aa:	90                   	nop
   989ab:	90                   	nop
   989ac:	90                   	nop
   989ad:	90                   	nop
   989ae:	90                   	nop
   989af:	90                   	nop
   989b0:	90                   	nop
   989b1:	90                   	nop
   989b2:	90                   	nop
   989b3:	90                   	nop
   989b4:	90                   	nop
   989b5:	90                   	nop
   989b6:	90                   	nop
   989b7:	90                   	nop
   989b8:	90                   	nop
   989b9:	90                   	nop
   989ba:	90                   	nop
   989bb:	90                   	nop
   989bc:	90                   	nop
   989bd:	90                   	nop
   989be:	90                   	nop
   989bf:	90                   	nop

00000000000989c0 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds>:
   989c0:	55                   	push   %rbp
   989c1:	41 57                	push   %r15
   989c3:	41 56                	push   %r14
   989c5:	41 55                	push   %r13
   989c7:	53                   	push   %rbx
   989c8:	48 8d 6c 24 20       	lea    0x20(%rsp),%rbp
   989cd:	48 8b df             	mov    %rdi,%rbx
   989d0:	48 83 bb 60 01 00 00 	cmpq   $0x0,0x160(%rbx)
   989d7:	00 
   989d8:	0f 85 25 01 00 00    	jne    98b03 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x143>
   989de:	4c 8d 3d 13 5f 1b 00 	lea    0x1b5f13(%rip),%r15        # 24e8f8 <__NONGCSTATICSS_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   989e5:	49 83 7f f8 00       	cmpq   $0x0,-0x8(%r15)
   989ea:	0f 85 23 01 00 00    	jne    98b13 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x153>
   989f0:	41 80 3f 00          	cmpb   $0x0,(%r15)
   989f4:	0f 85 09 01 00 00    	jne    98b03 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x143>
   989fa:	48 8d 3d 5f 2d 1f 00 	lea    0x1f2d5f(%rip),%rdi        # 28b760 <_ZTV52__Array<S_P_CoreLib_System_Globalization_CalendarId>>
   98a01:	be 17 00 00 00       	mov    $0x17,%esi
   98a06:	e8 4f cc fc ff       	call   6565a <RhpNewArray>
   98a0b:	4c 8b f8             	mov    %rax,%r15
   98a0e:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   98a12:	49 8b f7             	mov    %r15,%rsi
   98a15:	e8 b6 cb ff ff       	call   955d0 <S_P_CoreLib_System_Globalization_CalendarData__IcuGetCalendars>
   98a1a:	44 8b f0             	mov    %eax,%r14d
   98a1d:	45 85 f6             	test   %r14d,%r14d
   98a20:	75 1e                	jne    98a40 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x80>
   98a22:	e8 99 f2 ff ff       	call   97cc0 <S_P_CoreLib_System_Globalization_CultureData__get_Invariant>
   98a27:	48 8b b0 60 01 00 00 	mov    0x160(%rax),%rsi
   98a2e:	48 8d bb 60 01 00 00 	lea    0x160(%rbx),%rdi
   98a35:	e8 4e db fc ff       	call   66588 <RhpAssignRefESI>
   98a3a:	e9 c4 00 00 00       	jmp    98b03 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x143>
   98a3f:	90                   	nop
   98a40:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   98a44:	48 85 ff             	test   %rdi,%rdi
   98a47:	0f 84 87 00 00 00    	je     98ad4 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x114>
   98a4d:	83 7f 08 05          	cmpl   $0x5,0x8(%rdi)
   98a51:	0f 85 7d 00 00 00    	jne    98ad4 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x114>
   98a57:	48 ba 7a 00 68 00 2d 	movabs $0x54002d0068007a,%rdx
   98a5e:	00 54 00 
   98a61:	48 33 57 0c          	xor    0xc(%rdi),%rdx
   98a65:	8b 7f 12             	mov    0x12(%rdi),%edi
   98a68:	81 f7 54 00 57 00    	xor    $0x570054,%edi
   98a6e:	48 0b fa             	or     %rdx,%rdi
   98a71:	75 61                	jne    98ad4 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x114>
   98a73:	33 ff                	xor    %edi,%edi
   98a75:	45 85 f6             	test   %r14d,%r14d
   98a78:	7e 35                	jle    98aaf <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0xef>
   98a7a:	41 83 fe 17          	cmp    $0x17,%r14d
   98a7e:	7f 14                	jg     98a94 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0xd4>
   98a80:	8b d7                	mov    %edi,%edx
   98a82:	66 41 83 7c 57 10 04 	cmpw   $0x4,0x10(%r15,%rdx,2)
   98a89:	74 49                	je     98ad4 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x114>
   98a8b:	ff c7                	inc    %edi
   98a8d:	41 3b fe             	cmp    %r14d,%edi
   98a90:	7c ee                	jl     98a80 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0xc0>
   98a92:	eb 1b                	jmp    98aaf <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0xef>
   98a94:	83 ff 17             	cmp    $0x17,%edi
   98a97:	0f 83 80 00 00 00    	jae    98b1d <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x15d>
   98a9d:	8b d7                	mov    %edi,%edx
   98a9f:	66 41 83 7c 57 10 04 	cmpw   $0x4,0x10(%r15,%rdx,2)
   98aa6:	74 2c                	je     98ad4 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x114>
   98aa8:	ff c7                	inc    %edi
   98aaa:	41 3b fe             	cmp    %r14d,%edi
   98aad:	7c e5                	jl     98a94 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0xd4>
   98aaf:	41 ff c6             	inc    %r14d
   98ab2:	49 8b ff             	mov    %r15,%rdi
   98ab5:	49 8b d7             	mov    %r15,%rdx
   98ab8:	be 01 00 00 00       	mov    $0x1,%esi
   98abd:	b9 02 00 00 00       	mov    $0x2,%ecx
   98ac2:	41 b8 15 00 00 00    	mov    $0x15,%r8d
   98ac8:	e8 a3 f4 fe ff       	call   87f70 <S_P_CoreLib_System_Array__Copy_2>
   98acd:	66 41 c7 47 12 04 00 	movw   $0x4,0x12(%r15)
   98ad4:	49 63 f6             	movslq %r14d,%rsi
   98ad7:	48 8d 3d 82 2c 1f 00 	lea    0x1f2c82(%rip),%rdi        # 28b760 <_ZTV52__Array<S_P_CoreLib_System_Globalization_CalendarId>>
   98ade:	e8 77 cb fc ff       	call   6565a <RhpNewArray>
   98ae3:	4c 8b e8             	mov    %rax,%r13
   98ae6:	49 8b ff             	mov    %r15,%rdi
   98ae9:	49 8b f5             	mov    %r13,%rsi
   98aec:	41 8b d6             	mov    %r14d,%edx
   98aef:	e8 7c f3 fe ff       	call   87e70 <S_P_CoreLib_System_Array__Copy_1>
   98af4:	48 8d bb 60 01 00 00 	lea    0x160(%rbx),%rdi
   98afb:	49 8b f5             	mov    %r13,%rsi
   98afe:	e8 85 da fc ff       	call   66588 <RhpAssignRefESI>
   98b03:	48 8b 83 60 01 00 00 	mov    0x160(%rbx),%rax
   98b0a:	5b                   	pop    %rbx
   98b0b:	41 5d                	pop    %r13
   98b0d:	41 5e                	pop    %r14
   98b0f:	41 5f                	pop    %r15
   98b11:	5d                   	pop    %rbp
   98b12:	c3                   	ret
   98b13:	e8 a2 f5 f6 ff       	call   80ba <__GetNonGCStaticBase_S_P_CoreLib_System_Globalization_GlobalizationMode_Settings>
   98b18:	e9 d3 fe ff ff       	jmp    989f0 <S_P_CoreLib_System_Globalization_CultureData__get_CalendarIds+0x30>
   98b1d:	e8 5e 2a 03 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   98b22:	cc                   	int3
   98b23:	90                   	nop
   98b24:	90                   	nop
   98b25:	90                   	nop
   98b26:	90                   	nop
   98b27:	90                   	nop
   98b28:	90                   	nop
   98b29:	90                   	nop
   98b2a:	90                   	nop
   98b2b:	90                   	nop
   98b2c:	90                   	nop
   98b2d:	90                   	nop
   98b2e:	90                   	nop
   98b2f:	90                   	nop

0000000000098b30 <S_P_CoreLib_System_Globalization_CultureData__GetCalendar>:
   98b30:	55                   	push   %rbp
   98b31:	41 57                	push   %r15
   98b33:	41 56                	push   %r14
   98b35:	41 55                	push   %r13
   98b37:	41 54                	push   %r12
   98b39:	53                   	push   %rbx
   98b3a:	50                   	push   %rax
   98b3b:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   98b40:	48 8b df             	mov    %rdi,%rbx
   98b43:	44 8b fe             	mov    %esi,%r15d
--
00000000000ad560 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>:
   ad560:	55                   	push   %rbp
   ad561:	c5 f8 77             	vzeroupper
   ad564:	48 8b ec             	mov    %rsp,%rbp
   ad567:	48 8b c7             	mov    %rdi,%rax
   ad56a:	48 81 fe 80 00 00 00 	cmp    $0x80,%rsi
   ad571:	72 5a                	jb     ad5cd <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x6d>
   ad573:	62 f1 7c 48 10 00    	vmovups (%rax),%zmm0
   ad579:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   ad57f:	c4 e1 fb 93 c9       	kmovq  %k1,%rcx
   ad584:	0f 1f 00             	nopl   (%rax)
   ad587:	48 85 c9             	test   %rcx,%rcx
   ad58a:	0f 85 d7 00 00 00    	jne    ad667 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ad590:	48 8d 4c 30 c0       	lea    -0x40(%rax,%rsi,1),%rcx
   ad595:	48 8d 78 40          	lea    0x40(%rax),%rdi
   ad599:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   ad59d:	62 f1 7d 48 6f 07    	vmovdqa32 (%rdi),%zmm0
   ad5a3:	62 f2 7e 48 29 c8    	vpmovb2m %zmm0,%k1
   ad5a9:	c4 e1 fb 93 d1       	kmovq  %k1,%rdx
   ad5ae:	0f 1f 00             	nopl   (%rax)
   ad5b1:	48 85 d2             	test   %rdx,%rdx
   ad5b4:	75 09                	jne    ad5bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ad5b6:	48 83 c7 40          	add    $0x40,%rdi
   ad5ba:	48 3b f9             	cmp    %rcx,%rdi
   ad5bd:	76 de                	jbe    ad59d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x3d>
   ad5bf:	48 2b f7             	sub    %rdi,%rsi
   ad5c2:	48 03 f0             	add    %rax,%rsi
   ad5c5:	e9 9d 00 00 00       	jmp    ad667 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ad5ca:	0f 1f 00             	nopl   (%rax)
   ad5cd:	48 83 fe 40          	cmp    $0x40,%rsi
   ad5d1:	72 34                	jb     ad607 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xa7>
   ad5d3:	c5 fc 10 00          	vmovups (%rax),%ymm0
   ad5d7:	c5 fd d7 c8          	vpmovmskb %ymm0,%ecx
   ad5db:	85 c9                	test   %ecx,%ecx
   ad5dd:	0f 85 84 00 00 00    	jne    ad667 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ad5e3:	48 8d 4c 30 e0       	lea    -0x20(%rax,%rsi,1),%rcx
   ad5e8:	48 8d 78 20          	lea    0x20(%rax),%rdi
   ad5ec:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   ad5f0:	c5 fd 6f 07          	vmovdqa (%rdi),%ymm0
   ad5f4:	c5 fd d7 d0          	vpmovmskb %ymm0,%edx
   ad5f8:	85 d2                	test   %edx,%edx
   ad5fa:	75 c3                	jne    ad5bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ad5fc:	48 83 c7 20          	add    $0x20,%rdi
   ad600:	48 3b f9             	cmp    %rcx,%rdi
   ad603:	76 eb                	jbe    ad5f0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x90>
   ad605:	eb b8                	jmp    ad5bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ad607:	48 83 fe 20          	cmp    $0x20,%rsi
   ad60b:	72 5a                	jb     ad667 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ad60d:	c5 f8 10 05 cb 73 0d 	vmovups 0xd73cb(%rip),%xmm0        # 1849e0 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   ad614:	00 
   ad615:	c4 e2 79 17 00       	vptest (%rax),%xmm0
   ad61a:	75 4b                	jne    ad667 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x107>
   ad61c:	48 8d 4c 30 f0       	lea    -0x10(%rax,%rsi,1),%rcx
   ad621:	48 8d 78 10          	lea    0x10(%rax),%rdi
   ad625:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   ad629:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   ad62e:	75 8f                	jne    ad5bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ad630:	48 83 c7 10          	add    $0x10,%rdi
   ad634:	48 3b f9             	cmp    %rcx,%rdi
   ad637:	76 f0                	jbe    ad629 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xc9>
   ad639:	eb 84                	jmp    ad5bf <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x5f>
   ad63b:	8b 0f                	mov    (%rdi),%ecx
   ad63d:	8b 57 04             	mov    0x4(%rdi),%edx
   ad640:	44 8b c1             	mov    %ecx,%r8d
   ad643:	44 0b c2             	or     %edx,%r8d
   ad646:	41 f7 c0 80 80 80 80 	test   $0x80808080,%r8d
   ad64d:	74 10                	je     ad65f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xff>
   ad64f:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   ad655:	75 5e                	jne    ad6b5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   ad657:	8b ca                	mov    %edx,%ecx
   ad659:	48 83 c7 04          	add    $0x4,%rdi
   ad65d:	eb 56                	jmp    ad6b5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   ad65f:	48 83 c7 08          	add    $0x8,%rdi
   ad663:	48 83 c6 f8          	add    $0xfffffffffffffff8,%rsi
   ad667:	48 83 fe 08          	cmp    $0x8,%rsi
   ad66b:	73 ce                	jae    ad63b <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0xdb>
   ad66d:	40 f6 c6 04          	test   $0x4,%sil
   ad671:	74 0e                	je     ad681 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x121>
   ad673:	8b 0f                	mov    (%rdi),%ecx
   ad675:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   ad67b:	75 38                	jne    ad6b5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   ad67d:	48 83 c7 04          	add    $0x4,%rdi
   ad681:	40 f6 c6 02          	test   $0x2,%sil
   ad685:	74 0f                	je     ad696 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x136>
   ad687:	0f b7 0f             	movzwl (%rdi),%ecx
   ad68a:	f7 c1 80 80 80 80    	test   $0x80808080,%ecx
   ad690:	75 23                	jne    ad6b5 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x155>
   ad692:	48 83 c7 02          	add    $0x2,%rdi
   ad696:	40 f6 c6 01          	test   $0x1,%sil
   ad69a:	74 0b                	je     ad6a7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x147>
   ad69c:	48 8d 4f 01          	lea    0x1(%rdi),%rcx
   ad6a0:	80 3f 00             	cmpb   $0x0,(%rdi)
   ad6a3:	48 0f 4d f9          	cmovge %rcx,%rdi
   ad6a7:	48 8b cf             	mov    %rdi,%rcx
   ad6aa:	48 2b c8             	sub    %rax,%rcx
   ad6ad:	48 8b c1             	mov    %rcx,%rax
   ad6b0:	c5 f8 77             	vzeroupper
   ad6b3:	5d                   	pop    %rbp
   ad6b4:	c3                   	ret
   ad6b5:	81 e1 80 80 80 80    	and    $0x80808080,%ecx
   ad6bb:	f3 0f bc c9          	tzcnt  %ecx,%ecx
   ad6bf:	c1 e9 03             	shr    $0x3,%ecx
   ad6c2:	48 03 f9             	add    %rcx,%rdi
   ad6c5:	eb e0                	jmp    ad6a7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector+0x147>
   ad6c7:	90                   	nop
   ad6c8:	90                   	nop
   ad6c9:	90                   	nop
   ad6ca:	90                   	nop
   ad6cb:	90                   	nop
   ad6cc:	90                   	nop
   ad6cd:	90                   	nop
   ad6ce:	90                   	nop
   ad6cf:	90                   	nop
   ad6d0:	90                   	nop
   ad6d1:	90                   	nop
   ad6d2:	90                   	nop
   ad6d3:	90                   	nop
   ad6d4:	90                   	nop
   ad6d5:	90                   	nop
   ad6d6:	90                   	nop
   ad6d7:	90                   	nop
   ad6d8:	90                   	nop
   ad6d9:	90                   	nop
   ad6da:	90                   	nop
   ad6db:	90                   	nop
   ad6dc:	90                   	nop
   ad6dd:	90                   	nop
   ad6de:	90                   	nop
   ad6df:	90                   	nop

00000000000ad6e0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>:
   ad6e0:	55                   	push   %rbp
   ad6e1:	c5 f8 77             	vzeroupper
   ad6e4:	48 8b ec             	mov    %rsp,%rbp
   ad6e7:	48 8b cf             	mov    %rdi,%rcx
   ad6ea:	48 83 fe 40          	cmp    $0x40,%rsi
   ad6ee:	72 57                	jb     ad747 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x67>
   ad6f0:	62 f1 7c 48 10 05 06 	vmovups 0xd7306(%rip),%zmm0        # 184a00 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   ad6f7:	73 0d 00 
   ad6fa:	62 f2 fd 48 26 09    	vptestmw (%rcx),%zmm0,%k1
   ad700:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ad705:	0f 1f 00             	nopl   (%rax)
   ad708:	0f 85 d1 00 00 00    	jne    ad7df <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   ad70e:	48 8d 44 71 c0       	lea    -0x40(%rcx,%rsi,2),%rax
   ad713:	48 8d 79 40          	lea    0x40(%rcx),%rdi
   ad717:	48 83 e7 c0          	and    $0xffffffffffffffc0,%rdi
   ad71b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   ad720:	62 f2 fd 48 26 0f    	vptestmw (%rdi),%zmm0,%k1
   ad726:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ad72b:	75 09                	jne    ad736 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   ad72d:	48 83 c7 40          	add    $0x40,%rdi
   ad731:	48 3b f8             	cmp    %rax,%rdi
   ad734:	76 ea                	jbe    ad720 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x40>
   ad736:	48 8b c7             	mov    %rdi,%rax
   ad739:	48 2b c1             	sub    %rcx,%rax
   ad73c:	48 d1 e8             	shr    $1,%rax
   ad73f:	48 2b f0             	sub    %rax,%rsi
   ad742:	e9 98 00 00 00       	jmp    ad7df <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   ad747:	48 83 fe 20          	cmp    $0x20,%rsi
   ad74b:	72 32                	jb     ad77f <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x9f>
   ad74d:	c5 fc 10 05 ab 72 0d 	vmovups 0xd72ab(%rip),%ymm0        # 184a00 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   ad754:	00 
   ad755:	c4 e2 7d 17 01       	vptest (%rcx),%ymm0
   ad75a:	0f 85 7f 00 00 00    	jne    ad7df <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   ad760:	48 8d 44 71 e0       	lea    -0x20(%rcx,%rsi,2),%rax
   ad765:	48 8d 79 20          	lea    0x20(%rcx),%rdi
   ad769:	48 83 e7 e0          	and    $0xffffffffffffffe0,%rdi
   ad76d:	c4 e2 7d 17 07       	vptest (%rdi),%ymm0
   ad772:	75 c2                	jne    ad736 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   ad774:	48 83 c7 20          	add    $0x20,%rdi
   ad778:	48 3b f8             	cmp    %rax,%rdi
   ad77b:	76 f0                	jbe    ad76d <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x8d>
   ad77d:	eb b7                	jmp    ad736 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   ad77f:	48 83 fe 10          	cmp    $0x10,%rsi
   ad783:	72 5a                	jb     ad7df <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   ad785:	c5 f8 10 05 73 72 0d 	vmovups 0xd7273(%rip),%xmm0        # 184a00 <__readonlydata_S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   ad78c:	00 
   ad78d:	c4 e2 79 17 01       	vptest (%rcx),%xmm0
   ad792:	75 4b                	jne    ad7df <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xff>
   ad794:	48 8d 44 71 f0       	lea    -0x10(%rcx,%rsi,2),%rax
   ad799:	48 8d 79 10          	lea    0x10(%rcx),%rdi
   ad79d:	48 83 e7 f0          	and    $0xfffffffffffffff0,%rdi
   ad7a1:	c4 e2 79 17 07       	vptest (%rdi),%xmm0
   ad7a6:	75 8e                	jne    ad736 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   ad7a8:	48 83 c7 10          	add    $0x10,%rdi
   ad7ac:	48 3b f8             	cmp    %rax,%rdi
   ad7af:	76 f0                	jbe    ad7a1 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xc1>
   ad7b1:	eb 83                	jmp    ad736 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x56>
   ad7b3:	8b 17                	mov    (%rdi),%edx
   ad7b5:	8b 47 04             	mov    0x4(%rdi),%eax
   ad7b8:	44 8b c2             	mov    %edx,%r8d
   ad7bb:	44 0b c0             	or     %eax,%r8d
   ad7be:	41 f7 c0 80 ff 80 ff 	test   $0xff80ff80,%r8d
   ad7c5:	74 10                	je     ad7d7 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xf7>
   ad7c7:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   ad7cd:	75 48                	jne    ad817 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   ad7cf:	8b d0                	mov    %eax,%edx
   ad7d1:	48 83 c7 04          	add    $0x4,%rdi
   ad7d5:	eb 40                	jmp    ad817 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   ad7d7:	48 83 c7 08          	add    $0x8,%rdi
   ad7db:	48 83 c6 fc          	add    $0xfffffffffffffffc,%rsi
   ad7df:	48 83 fe 04          	cmp    $0x4,%rsi
   ad7e3:	73 ce                	jae    ad7b3 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0xd3>
   ad7e5:	40 f6 c6 02          	test   $0x2,%sil
   ad7e9:	74 0e                	je     ad7f9 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x119>
   ad7eb:	8b 17                	mov    (%rdi),%edx
   ad7ed:	f7 c2 80 ff 80 ff    	test   $0xff80ff80,%edx
   ad7f3:	75 22                	jne    ad817 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x137>
   ad7f5:	48 83 c7 04          	add    $0x4,%rdi
   ad7f9:	40 f6 c6 01          	test   $0x1,%sil
   ad7fd:	74 0a                	je     ad809 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   ad7ff:	66 83 3f 7f          	cmpw   $0x7f,(%rdi)
   ad803:	77 04                	ja     ad809 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   ad805:	48 83 c7 02          	add    $0x2,%rdi
   ad809:	48 8b c7             	mov    %rdi,%rax
   ad80c:	48 2b c1             	sub    %rcx,%rax
   ad80f:	48 d1 e8             	shr    $1,%rax
   ad812:	c5 f8 77             	vzeroupper
   ad815:	5d                   	pop    %rbp
   ad816:	c3                   	ret
   ad817:	f7 c2 80 ff 00 00    	test   $0xff80,%edx
   ad81d:	74 e6                	je     ad805 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x125>
   ad81f:	eb e8                	jmp    ad809 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector+0x129>
   ad821:	90                   	nop
   ad822:	90                   	nop
   ad823:	90                   	nop
   ad824:	90                   	nop
   ad825:	90                   	nop
   ad826:	90                   	nop
   ad827:	90                   	nop
   ad828:	90                   	nop
   ad829:	90                   	nop
   ad82a:	90                   	nop
   ad82b:	90                   	nop
   ad82c:	90                   	nop
   ad82d:	90                   	nop
   ad82e:	90                   	nop
   ad82f:	90                   	nop
   ad830:	90                   	nop
   ad831:	90                   	nop
   ad832:	90                   	nop
   ad833:	90                   	nop
   ad834:	90                   	nop
   ad835:	90                   	nop
   ad836:	90                   	nop
   ad837:	90                   	nop
   ad838:	90                   	nop
   ad839:	90                   	nop
   ad83a:	90                   	nop
   ad83b:	90                   	nop
   ad83c:	90                   	nop
   ad83d:	90                   	nop
   ad83e:	90                   	nop
   ad83f:	90                   	nop

00000000000ad840 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii>:
   ad840:	55                   	push   %rbp
   ad841:	c5 f8 77             	vzeroupper
   ad844:	48 8b ec             	mov    %rsp,%rbp
   ad847:	33 c0                	xor    %eax,%eax
   ad849:	48 83 fa 20          	cmp    $0x20,%rdx
   ad84d:	0f 82 d6 02 00 00    	jb     adb29 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x2e9>
   ad853:	48 8b 0f             	mov    (%rdi),%rcx
   ad856:	49 b8 80 ff 80 ff 80 	movabs $0xff80ff80ff80ff80,%r8
   ad85d:	ff 80 ff 
   ad860:	49 85 c8             	test   %rcx,%r8
   ad863:	4c 8b c1             	mov    %rcx,%r8
   ad866:	0f 85 30 03 00 00    	jne    adb9c <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x35c>
   ad86c:	48 81 fa 80 00 00 00 	cmp    $0x80,%rdx
   ad873:	0f 82 16 01 00 00    	jb     ad98f <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x14f>
   ad879:	48 8b c7             	mov    %rdi,%rax
   ad87c:	62 f1 7c 48 10 00    	vmovups (%rax),%zmm0
   ad882:	62 f1 7c 48 10 0d b4 	vmovups 0xd71b4(%rip),%zmm1        # 184a40 <__readonlydata_S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii>
   ad889:	71 0d 00 
   ad88c:	62 f2 fd 48 26 c9    	vptestmw %zmm1,%zmm0,%k1
   ad892:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ad897:	0f 1f 00             	nopl   (%rax)
   ad89a:	74 07                	je     ad8a3 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x63>
   ad89c:	33 c0                	xor    %eax,%eax
   ad89e:	e9 e7 00 00 00       	jmp    ad98a <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x14a>
   ad8a3:	48 8b ce             	mov    %rsi,%rcx
   ad8a6:	62 f2 7e 48 30 c2    	vpmovwb %zmm0,%ymm2
   ad8ac:	62 f2 7e 48 30 c0    	vpmovwb %zmm0,%ymm0
   ad8b2:	62 f3 ed 48 3a c0 01 	vinserti64x4 $0x1,%ymm0,%zmm2,%zmm0
   ad8b9:	c5 fc 11 01          	vmovups %ymm0,(%rcx)
   ad8bd:	41 b8 20 00 00 00    	mov    $0x20,%r8d
   ad8c3:	40 f6 c6 20          	test   $0x20,%sil
   ad8c7:	75 2f                	jne    ad8f8 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0xb8>
   ad8c9:	62 f1 7c 48 10 40 01 	vmovups 0x40(%rax),%zmm0
   ad8d0:	62 f2 fd 48 26 c9    	vptestmw %zmm1,%zmm0,%k1
   ad8d6:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ad8db:	0f 1f 00             	nopl   (%rax)
   ad8de:	75 72                	jne    ad952 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x112>
   ad8e0:	62 f2 7e 48 30 c2    	vpmovwb %zmm0,%ymm2
   ad8e6:	62 f2 7e 48 30 c0    	vpmovwb %zmm0,%ymm0
   ad8ec:	62 f3 ed 48 3a c0 01 	vinserti64x4 $0x1,%ymm0,%zmm2,%zmm0
   ad8f3:	c5 fc 11 41 20       	vmovups %ymm0,0x20(%rcx)
   ad8f8:	4c 8b c6             	mov    %rsi,%r8
   ad8fb:	49 83 e0 3f          	and    $0x3f,%r8
   ad8ff:	49 f7 d8             	neg    %r8
   ad902:	49 83 c0 40          	add    $0x40,%r8
   ad906:	4c 8d 4a c0          	lea    -0x40(%rdx),%r9
   ad90a:	62 b1 7c 48 10 04 40 	vmovups (%rax,%r8,2),%zmm0
   ad911:	62 b1 7c 48 10 54 40 	vmovups 0x40(%rax,%r8,2),%zmm2
   ad918:	01 
   ad919:	62 f1 7d 48 eb da    	vpord  %zmm2,%zmm0,%zmm3
   ad91f:	62 f2 e5 48 26 c9    	vptestmw %zmm1,%zmm3,%k1
   ad925:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ad92a:	0f 1f 00             	nopl   (%rax)
   ad92d:	75 2c                	jne    ad95b <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x11b>
   ad92f:	62 f2 7e 48 30 c0    	vpmovwb %zmm0,%ymm0
   ad935:	62 f2 7e 48 30 d2    	vpmovwb %zmm2,%ymm2
   ad93b:	62 f3 fd 48 3a c2 01 	vinserti64x4 $0x1,%ymm2,%zmm0,%zmm0
   ad942:	62 b1 7c 48 11 04 01 	vmovups %zmm0,(%rcx,%r8,1)
   ad949:	49 83 c0 40          	add    $0x40,%r8
   ad94d:	4d 3b c1             	cmp    %r9,%r8
   ad950:	76 b8                	jbe    ad90a <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0xca>
   ad952:	49 8b c0             	mov    %r8,%rax
   ad955:	eb 33                	jmp    ad98a <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x14a>
   ad957:	0f 1f 40 00          	nopl   0x0(%rax)
   ad95b:	62 f2 fd 48 26 c9    	vptestmw %zmm1,%zmm0,%k1
   ad961:	c4 e1 f9 98 c9       	kortestd %k1,%k1
   ad966:	0f 1f 00             	nopl   (%rax)
   ad969:	75 e7                	jne    ad952 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x112>
   ad96b:	62 f2 7e 48 30 c1    	vpmovwb %zmm0,%ymm1
   ad971:	62 f2 7e 48 30 c0    	vpmovwb %zmm0,%ymm0
   ad977:	62 f3 f5 48 3a c0 01 	vinserti64x4 $0x1,%ymm0,%zmm1,%zmm0
   ad97e:	c4 a1 7c 11 04 01    	vmovups %ymm0,(%rcx,%r8,1)
   ad984:	49 83 c0 20          	add    $0x20,%r8
   ad988:	eb c8                	jmp    ad952 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x112>
   ad98a:	e9 9a 01 00 00       	jmp    adb29 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x2e9>
   ad98f:	48 83 fa 40          	cmp    $0x40,%rdx
   ad993:	0f 82 e4 00 00 00    	jb     ada7d <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x23d>
   ad999:	48 8b c7             	mov    %rdi,%rax
   ad99c:	c5 fc 10 00          	vmovups (%rax),%ymm0
   ad9a0:	c5 fc 10 0d 98 70 0d 	vmovups 0xd7098(%rip),%ymm1        # 184a40 <__readonlydata_S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii>
   ad9a7:	00 
   ad9a8:	c4 e2 7d 17 c1       	vptest %ymm1,%ymm0
   ad9ad:	74 07                	je     ad9b6 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x176>
   ad9af:	33 c0                	xor    %eax,%eax
   ad9b1:	e9 c2 00 00 00       	jmp    ada78 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x238>
   ad9b6:	48 8b ce             	mov    %rsi,%rcx
   ad9b9:	62 f2 7e 28 30 c2    	vpmovwb %ymm0,%xmm2
   ad9bf:	62 f2 7e 28 30 c0    	vpmovwb %ymm0,%xmm0
   ad9c5:	c4 e3 6d 38 c0 01    	vinserti128 $0x1,%xmm0,%ymm2,%ymm0
   ad9cb:	c5 f8 11 01          	vmovups %xmm0,(%rcx)
   ad9cf:	41 b8 10 00 00 00    	mov    $0x10,%r8d
   ad9d5:	40 f6 c6 10          	test   $0x10,%sil
   ad9d9:	75 23                	jne    ad9fe <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x1be>
   ad9db:	c5 fc 10 40 20       	vmovups 0x20(%rax),%ymm0
   ad9e0:	c4 e2 7d 17 c1       	vptest %ymm1,%ymm0
   ad9e5:	75 62                	jne    ada49 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x209>
   ad9e7:	62 f2 7e 28 30 c2    	vpmovwb %ymm0,%xmm2
   ad9ed:	62 f2 7e 28 30 c0    	vpmovwb %ymm0,%xmm0
   ad9f3:	c4 e3 6d 38 c0 01    	vinserti128 $0x1,%xmm0,%ymm2,%ymm0
   ad9f9:	c5 f8 11 41 10       	vmovups %xmm0,0x10(%rcx)
   ad9fe:	4c 8b c6             	mov    %rsi,%r8
   ada01:	49 83 e0 1f          	and    $0x1f,%r8
   ada05:	49 f7 d8             	neg    %r8
   ada08:	49 83 c0 20          	add    $0x20,%r8
   ada0c:	4c 8d 4a e0          	lea    -0x20(%rdx),%r9
   ada10:	c4 a1 7c 10 04 40    	vmovups (%rax,%r8,2),%ymm0
   ada16:	c4 a1 7c 10 54 40 20 	vmovups 0x20(%rax,%r8,2),%ymm2
   ada1d:	c5 fd eb da          	vpor   %ymm2,%ymm0,%ymm3
   ada21:	c4 e2 7d 17 d9       	vptest %ymm1,%ymm3
   ada26:	75 2b                	jne    ada53 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x213>
   ada28:	62 f2 7e 28 30 c0    	vpmovwb %ymm0,%xmm0
   ada2e:	62 f2 7e 28 30 d2    	vpmovwb %ymm2,%xmm2
   ada34:	c4 e3 7d 38 c2 01    	vinserti128 $0x1,%xmm2,%ymm0,%ymm0
   ada3a:	c4 a1 7c 11 04 01    	vmovups %ymm0,(%rcx,%r8,1)
   ada40:	49 83 c0 20          	add    $0x20,%r8
   ada44:	4d 3b c1             	cmp    %r9,%r8
   ada47:	76 c7                	jbe    ada10 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x1d0>
   ada49:	49 8b c0             	mov    %r8,%rax
   ada4c:	eb 2a                	jmp    ada78 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x238>
   ada4e:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
   ada53:	c4 e2 7d 17 c1       	vptest %ymm1,%ymm0
   ada58:	75 ef                	jne    ada49 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x209>
   ada5a:	62 f2 7e 28 30 c1    	vpmovwb %ymm0,%xmm1
   ada60:	62 f2 7e 28 30 c0    	vpmovwb %ymm0,%xmm0
   ada66:	c4 e3 75 38 c0 01    	vinserti128 $0x1,%xmm0,%ymm1,%ymm0
   ada6c:	c4 a1 78 11 04 01    	vmovups %xmm0,(%rcx,%r8,1)
   ada72:	49 83 c0 10          	add    $0x10,%r8
   ada76:	eb d1                	jmp    ada49 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x209>
   ada78:	e9 ac 00 00 00       	jmp    adb29 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x2e9>
   ada7d:	48 8b c7             	mov    %rdi,%rax
   ada80:	c5 f8 10 00          	vmovups (%rax),%xmm0
   ada84:	c5 f8 10 0d b4 6f 0d 	vmovups 0xd6fb4(%rip),%xmm1        # 184a40 <__readonlydata_S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii>
   ada8b:	00 
   ada8c:	c4 e2 79 17 c1       	vptest %xmm1,%xmm0
   ada91:	74 07                	je     ada9a <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x25a>
   ada93:	33 c0                	xor    %eax,%eax
   ada95:	e9 8f 00 00 00       	jmp    adb29 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x2e9>
   ada9a:	48 8b ce             	mov    %rsi,%rcx
   ada9d:	c5 f9 67 c0          	vpackuswb %xmm0,%xmm0,%xmm0
   adaa1:	c5 fb 11 01          	vmovsd %xmm0,(%rcx)
   adaa5:	41 b8 08 00 00 00    	mov    $0x8,%r8d
   adaab:	40 f6 c6 08          	test   $0x8,%sil
   adaaf:	75 15                	jne    adac6 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x286>
   adab1:	c5 f8 10 40 10       	vmovups 0x10(%rax),%xmm0
   adab6:	c4 e2 79 17 c1       	vptest %xmm1,%xmm0
   adabb:	75 51                	jne    adb0e <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x2ce>
   adabd:	c5 f9 67 c0          	vpackuswb %xmm0,%xmm0,%xmm0
   adac1:	c5 fb 11 41 08       	vmovsd %xmm0,0x8(%rcx)
   adac6:	4c 8b c6             	mov    %rsi,%r8
   adac9:	49 83 e0 0f          	and    $0xf,%r8
   adacd:	41 b9 10 00 00 00    	mov    $0x10,%r9d
   adad3:	4d 2b c8             	sub    %r8,%r9
   adad6:	4d 8b c1             	mov    %r9,%r8
   adad9:	4c 8b ca             	mov    %rdx,%r9
   adadc:	49 83 e9 10          	sub    $0x10,%r9
   adae0:	c4 a1 78 10 04 40    	vmovups (%rax,%r8,2),%xmm0
   adae6:	4d 8d 50 08          	lea    0x8(%r8),%r10
   adaea:	c4 a1 78 10 14 50    	vmovups (%rax,%r10,2),%xmm2
   adaf0:	c5 f9 eb da          	vpor   %xmm2,%xmm0,%xmm3
   adaf4:	c4 e2 79 17 d9       	vptest %xmm1,%xmm3
   adaf9:	75 18                	jne    adb13 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x2d3>
   adafb:	c5 f9 67 c2          	vpackuswb %xmm2,%xmm0,%xmm0
   adaff:	c4 a1 78 11 04 01    	vmovups %xmm0,(%rcx,%r8,1)
   adb05:	49 83 c0 10          	add    $0x10,%r8
   adb09:	4d 3b c1             	cmp    %r9,%r8
   adb0c:	76 d2                	jbe    adae0 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii+0x2a0>
   adb0e:	49 8b c0             	mov    %r8,%rax
--
   ade67:	e8 74 f8 ff ff       	call   ad6e0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   ade6c:	44 8b e8             	mov    %eax,%r13d
   ade6f:	45 8b e5             	mov    %r13d,%r12d
   ade72:	45 3b ee             	cmp    %r14d,%r13d
   ade75:	74 16                	je     ade8d <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_0+0x8d>
   ade77:	48 8b fb             	mov    %rbx,%rdi
   ade7a:	49 8b f7             	mov    %r15,%rsi
   ade7d:	41 8b d6             	mov    %r14d,%edx
   ade80:	41 8b cc             	mov    %r12d,%ecx
   ade83:	e8 e8 36 00 00       	call   b1570 <S_P_CoreLib_System_Text_Encoding__GetByteCountWithFallback>
   ade88:	44 03 e0             	add    %eax,%r12d
   ade8b:	78 1d                	js     adeaa <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_0+0xaa>
   ade8d:	41 8b c4             	mov    %r12d,%eax
   ade90:	48 83 c4 08          	add    $0x8,%rsp
   ade94:	5b                   	pop    %rbx
   ade95:	41 5c                	pop    %r12
   ade97:	41 5d                	pop    %r13
   ade99:	41 5e                	pop    %r14
   ade9b:	41 5f                	pop    %r15
   ade9d:	5d                   	pop    %rbp
   ade9e:	c3                   	ret
   ade9f:	bf 0e 00 00 00       	mov    $0xe,%edi
   adea4:	e8 07 49 fe ff       	call   927b0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException>
   adea9:	cc                   	int3
   adeaa:	e8 51 34 00 00       	call   b1300 <S_P_CoreLib_System_Text_Encoding__ThrowConversionOverflow>
   adeaf:	cc                   	int3
   adeb0:	e8 cb d6 01 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   adeb5:	cc                   	int3
   adeb6:	90                   	nop
   adeb7:	90                   	nop
   adeb8:	90                   	nop
   adeb9:	90                   	nop
   adeba:	90                   	nop
   adebb:	90                   	nop
   adebc:	90                   	nop
   adebd:	90                   	nop
   adebe:	90                   	nop
   adebf:	90                   	nop

00000000000adec0 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1>:
   adec0:	55                   	push   %rbp
   adec1:	41 57                	push   %r15
   adec3:	41 56                	push   %r14
   adec5:	41 55                	push   %r13
   adec7:	41 54                	push   %r12
   adec9:	53                   	push   %rbx
   adeca:	50                   	push   %rax
   adecb:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   aded0:	4c 8b f7             	mov    %rdi,%r14
   aded3:	4c 8b fe             	mov    %rsi,%r15
   aded6:	8b da                	mov    %edx,%ebx
   aded8:	4d 85 ff             	test   %r15,%r15
   adedb:	74 6f                	je     adf4c <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0x8c>
   adedd:	85 db                	test   %ebx,%ebx
   adedf:	7c 76                	jl     adf57 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0x97>
   adee1:	49 8b 76 10          	mov    0x10(%r14),%rsi
   adee5:	44 8b eb             	mov    %ebx,%r13d
   adee8:	48 85 f6             	test   %rsi,%rsi
   adeeb:	74 23                	je     adf10 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0x50>
   adeed:	48 8d 3d 14 9f 1a 00 	lea    0x1a9f14(%rip),%rdi        # 257e08 <_ZTV50S_P_CoreLib_System_Text_EncoderReplacementFallback>
   adef4:	48 39 3e             	cmp    %rdi,(%rsi)
   adef7:	75 17                	jne    adf10 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0x50>
   adef9:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   adefd:	83 7e 08 01          	cmpl   $0x1,0x8(%rsi)
   adf01:	75 0d                	jne    adf10 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0x50>
   adf03:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   adf07:	76 64                	jbe    adf6d <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0xad>
   adf09:	66 83 7e 0c 7f       	cmpw   $0x7f,0xc(%rsi)
   adf0e:	76 0d                	jbe    adf1d <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0x5d>
   adf10:	8b f3                	mov    %ebx,%esi
   adf12:	49 8b ff             	mov    %r15,%rdi
   adf15:	e8 c6 f7 ff ff       	call   ad6e0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   adf1a:	44 8b e8             	mov    %eax,%r13d
   adf1d:	45 8b e5             	mov    %r13d,%r12d
   adf20:	44 3b eb             	cmp    %ebx,%r13d
   adf23:	74 15                	je     adf3a <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0x7a>
   adf25:	49 8b fe             	mov    %r14,%rdi
   adf28:	49 8b f7             	mov    %r15,%rsi
   adf2b:	8b d3                	mov    %ebx,%edx
   adf2d:	41 8b cc             	mov    %r12d,%ecx
   adf30:	e8 3b 36 00 00       	call   b1570 <S_P_CoreLib_System_Text_Encoding__GetByteCountWithFallback>
   adf35:	44 03 e0             	add    %eax,%r12d
   adf38:	78 2d                	js     adf67 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_1+0xa7>
   adf3a:	41 8b c4             	mov    %r12d,%eax
   adf3d:	48 83 c4 08          	add    $0x8,%rsp
   adf41:	5b                   	pop    %rbx
   adf42:	41 5c                	pop    %r12
   adf44:	41 5d                	pop    %r13
   adf46:	41 5e                	pop    %r14
   adf48:	41 5f                	pop    %r15
   adf4a:	5d                   	pop    %rbp
   adf4b:	c3                   	ret
   adf4c:	bf 0e 00 00 00       	mov    $0xe,%edi
   adf51:	e8 5a 48 fe ff       	call   927b0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException>
   adf56:	cc                   	int3
   adf57:	bf 1b 00 00 00       	mov    $0x1b,%edi
   adf5c:	be 0d 00 00 00       	mov    $0xd,%esi
   adf61:	e8 1a 49 fe ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   adf66:	cc                   	int3
   adf67:	e8 94 33 00 00       	call   b1300 <S_P_CoreLib_System_Text_Encoding__ThrowConversionOverflow>
   adf6c:	cc                   	int3
   adf6d:	e8 0e d6 01 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   adf72:	cc                   	int3
   adf73:	90                   	nop
   adf74:	90                   	nop
   adf75:	90                   	nop
   adf76:	90                   	nop
   adf77:	90                   	nop
   adf78:	90                   	nop
   adf79:	90                   	nop
   adf7a:	90                   	nop
   adf7b:	90                   	nop
   adf7c:	90                   	nop
   adf7d:	90                   	nop
   adf7e:	90                   	nop
   adf7f:	90                   	nop

00000000000adf80 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_2>:
   adf80:	55                   	push   %rbp
   adf81:	41 57                	push   %r15
   adf83:	41 56                	push   %r14
   adf85:	41 55                	push   %r13
   adf87:	41 54                	push   %r12
   adf89:	53                   	push   %rbx
   adf8a:	50                   	push   %rax
   adf8b:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   adf90:	48 8b df             	mov    %rdi,%rbx
   adf93:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   adf97:	4c 8b fe             	mov    %rsi,%r15
   adf9a:	44 8b f2             	mov    %edx,%r14d
   adf9d:	48 8b 73 10          	mov    0x10(%rbx),%rsi
   adfa1:	45 8b ee             	mov    %r14d,%r13d
   adfa4:	48 85 f6             	test   %rsi,%rsi
   adfa7:	74 23                	je     adfcc <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_2+0x4c>
   adfa9:	48 8d 3d 58 9e 1a 00 	lea    0x1a9e58(%rip),%rdi        # 257e08 <_ZTV50S_P_CoreLib_System_Text_EncoderReplacementFallback>
   adfb0:	48 39 3e             	cmp    %rdi,(%rsi)
   adfb3:	75 17                	jne    adfcc <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_2+0x4c>
   adfb5:	48 8b 76 08          	mov    0x8(%rsi),%rsi
   adfb9:	83 7e 08 01          	cmpl   $0x1,0x8(%rsi)
   adfbd:	75 0d                	jne    adfcc <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_2+0x4c>
   adfbf:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   adfc3:	76 4b                	jbe    ae010 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_2+0x90>
   adfc5:	66 83 7e 0c 7f       	cmpw   $0x7f,0xc(%rsi)
   adfca:	76 0e                	jbe    adfda <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_2+0x5a>
   adfcc:	41 8b f6             	mov    %r14d,%esi
   adfcf:	49 8b ff             	mov    %r15,%rdi
   adfd2:	e8 09 f7 ff ff       	call   ad6e0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   adfd7:	44 8b e8             	mov    %eax,%r13d
   adfda:	45 8b e5             	mov    %r13d,%r12d
   adfdd:	45 3b ee             	cmp    %r14d,%r13d
   adfe0:	74 16                	je     adff8 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_2+0x78>
   adfe2:	48 8b fb             	mov    %rbx,%rdi
   adfe5:	49 8b f7             	mov    %r15,%rsi
   adfe8:	41 8b d6             	mov    %r14d,%edx
   adfeb:	41 8b cc             	mov    %r12d,%ecx
   adfee:	e8 7d 35 00 00       	call   b1570 <S_P_CoreLib_System_Text_Encoding__GetByteCountWithFallback>
   adff3:	44 03 e0             	add    %eax,%r12d
   adff6:	78 12                	js     ae00a <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCount_2+0x8a>
   adff8:	41 8b c4             	mov    %r12d,%eax
   adffb:	48 83 c4 08          	add    $0x8,%rsp
   adfff:	5b                   	pop    %rbx
   ae000:	41 5c                	pop    %r12
   ae002:	41 5d                	pop    %r13
   ae004:	41 5e                	pop    %r14
   ae006:	41 5f                	pop    %r15
   ae008:	5d                   	pop    %rbp
   ae009:	c3                   	ret
   ae00a:	e8 f1 32 00 00       	call   b1300 <S_P_CoreLib_System_Text_Encoding__ThrowConversionOverflow>
   ae00f:	cc                   	int3
   ae010:	e8 6b d5 01 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   ae015:	cc                   	int3
   ae016:	90                   	nop
   ae017:	90                   	nop
   ae018:	90                   	nop
   ae019:	90                   	nop
   ae01a:	90                   	nop
   ae01b:	90                   	nop
   ae01c:	90                   	nop
   ae01d:	90                   	nop
   ae01e:	90                   	nop
   ae01f:	90                   	nop

00000000000ae020 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCountFast>:
   ae020:	55                   	push   %rbp
   ae021:	53                   	push   %rbx
   ae022:	50                   	push   %rax
   ae023:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   ae028:	48 8b fe             	mov    %rsi,%rdi
   ae02b:	49 8b d8             	mov    %r8,%rbx
   ae02e:	8b c2                	mov    %edx,%eax
   ae030:	48 85 c9             	test   %rcx,%rcx
   ae033:	74 23                	je     ae058 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCountFast+0x38>
   ae035:	48 8d 35 cc 9d 1a 00 	lea    0x1a9dcc(%rip),%rsi        # 257e08 <_ZTV50S_P_CoreLib_System_Text_EncoderReplacementFallback>
   ae03c:	48 39 31             	cmp    %rsi,(%rcx)
   ae03f:	75 17                	jne    ae058 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCountFast+0x38>
   ae041:	48 8b 71 08          	mov    0x8(%rcx),%rsi
   ae045:	83 7e 08 01          	cmpl   $0x1,0x8(%rsi)
   ae049:	75 0d                	jne    ae058 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCountFast+0x38>
   ae04b:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   ae04f:	76 17                	jbe    ae068 <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCountFast+0x48>
   ae051:	66 83 7e 0c 7f       	cmpw   $0x7f,0xc(%rsi)
   ae056:	76 07                	jbe    ae05f <S_P_CoreLib_System_Text_ASCIIEncoding__GetByteCountFast+0x3f>
   ae058:	8b f2                	mov    %edx,%esi
   ae05a:	e8 81 f6 ff ff       	call   ad6e0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   ae05f:	89 03                	mov    %eax,(%rbx)
   ae061:	48 83 c4 08          	add    $0x8,%rsp
   ae065:	5b                   	pop    %rbx
   ae066:	5d                   	pop    %rbp
   ae067:	c3                   	ret
   ae068:	e8 13 d5 01 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   ae06d:	cc                   	int3
   ae06e:	90                   	nop
   ae06f:	90                   	nop

00000000000ae070 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes>:
   ae070:	55                   	push   %rbp
   ae071:	41 57                	push   %r15
   ae073:	41 56                	push   %r14
   ae075:	41 55                	push   %r13
   ae077:	41 54                	push   %r12
   ae079:	53                   	push   %rbx
   ae07a:	48 83 ec 28          	sub    $0x28,%rsp
   ae07e:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
   ae083:	33 c0                	xor    %eax,%eax
   ae085:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   ae089:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
   ae08d:	4c 8b ff             	mov    %rdi,%r15
   ae090:	8b d9                	mov    %ecx,%ebx
   ae092:	48 85 f6             	test   %rsi,%rsi
   ae095:	0f 84 cc 00 00 00    	je     ae167 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0xf7>
   ae09b:	4d 85 c0             	test   %r8,%r8
   ae09e:	0f 84 bc 00 00 00    	je     ae160 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0xf0>
   ae0a4:	8b fa                	mov    %edx,%edi
   ae0a6:	0b fb                	or     %ebx,%edi
   ae0a8:	0f 8c c9 00 00 00    	jl     ae177 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0x107>
   ae0ae:	8b 7e 08             	mov    0x8(%rsi),%edi
   ae0b1:	2b fa                	sub    %edx,%edi
   ae0b3:	3b fb                	cmp    %ebx,%edi
   ae0b5:	0f 8c d6 00 00 00    	jl     ae191 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0x121>
   ae0bb:	45 8b 70 08          	mov    0x8(%r8),%r14d
   ae0bf:	45 3b f1             	cmp    %r9d,%r14d
   ae0c2:	0f 82 d9 00 00 00    	jb     ae1a1 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0x131>
   ae0c8:	48 83 c6 0c          	add    $0xc,%rsi
   ae0cc:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   ae0d0:	48 8b 7d d0          	mov    -0x30(%rbp),%rdi
   ae0d4:	4c 89 45 c8          	mov    %r8,-0x38(%rbp)
   ae0d8:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
   ae0dc:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   ae0e0:	75 05                	jne    ae0e7 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0x77>
   ae0e2:	45 33 ed             	xor    %r13d,%r13d
   ae0e5:	eb 16                	jmp    ae0fd <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0x8d>
   ae0e7:	48 8b 75 c8          	mov    -0x38(%rbp),%rsi
   ae0eb:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   ae0ef:	0f 86 b9 00 00 00    	jbe    ae1ae <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0x13e>
   ae0f5:	4c 8b 6d c8          	mov    -0x38(%rbp),%r13
   ae0f9:	49 83 c5 10          	add    $0x10,%r13
   ae0fd:	48 63 d2             	movslq %edx,%rdx
   ae100:	4c 8d 24 57          	lea    (%rdi,%rdx,2),%r12
   ae104:	49 63 c1             	movslq %r9d,%rax
   ae107:	4c 03 e8             	add    %rax,%r13
   ae10a:	45 2b f1             	sub    %r9d,%r14d
   ae10d:	45 38 3f             	cmp    %r15b,(%r15)
   ae110:	41 3b de             	cmp    %r14d,%ebx
   ae113:	41 8b d6             	mov    %r14d,%edx
   ae116:	0f 4e d3             	cmovle %ebx,%edx
   ae119:	49 8b fc             	mov    %r12,%rdi
   ae11c:	49 8b f5             	mov    %r13,%rsi
   ae11f:	e8 1c f7 ff ff       	call   ad840 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii>
   ae124:	44 8b c8             	mov    %eax,%r9d
   ae127:	41 8b c1             	mov    %r9d,%eax
   ae12a:	44 3b cb             	cmp    %ebx,%r9d
   ae12d:	75 02                	jne    ae131 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0xc1>
   ae12f:	eb 1f                	jmp    ae150 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0xe0>
   ae131:	44 89 0c 24          	mov    %r9d,(%rsp)
   ae135:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
   ae13c:	00 
   ae13d:	49 8b ff             	mov    %r15,%rdi
   ae140:	49 8b f4             	mov    %r12,%rsi
   ae143:	8b d3                	mov    %ebx,%edx
   ae145:	49 8b cd             	mov    %r13,%rcx
   ae148:	45 8b c6             	mov    %r14d,%r8d
   ae14b:	e8 30 37 00 00       	call   b1880 <S_P_CoreLib_System_Text_Encoding__GetBytesWithFallback>
   ae150:	90                   	nop
   ae151:	48 83 c4 28          	add    $0x28,%rsp
   ae155:	5b                   	pop    %rbx
   ae156:	41 5c                	pop    %r12
   ae158:	41 5d                	pop    %r13
   ae15a:	41 5e                	pop    %r14
   ae15c:	41 5f                	pop    %r15
   ae15e:	5d                   	pop    %rbp
   ae15f:	c3                   	ret
   ae160:	bf 0a 00 00 00       	mov    $0xa,%edi
   ae165:	eb 05                	jmp    ae16c <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes+0xfc>
   ae167:	bf 0e 00 00 00       	mov    $0xe,%edi
   ae16c:	be 31 00 00 00       	mov    $0x31,%esi
   ae171:	e8 7a 46 fe ff       	call   927f0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException_1>
   ae176:	cc                   	int3
   ae177:	bf 0f 00 00 00       	mov    $0xf,%edi
   ae17c:	be 10 00 00 00       	mov    $0x10,%esi
   ae181:	85 d2                	test   %edx,%edx
   ae183:	0f 4d fe             	cmovge %esi,%edi
   ae186:	be 0d 00 00 00       	mov    $0xd,%esi
   ae18b:	e8 f0 46 fe ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   ae190:	cc                   	int3
   ae191:	bf 0e 00 00 00       	mov    $0xe,%edi
   ae196:	be 02 00 00 00       	mov    $0x2,%esi
   ae19b:	e8 e0 46 fe ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   ae1a0:	cc                   	int3
   ae1a1:	bf 0b 00 00 00       	mov    $0xb,%edi
   ae1a6:	33 f6                	xor    %esi,%esi
   ae1a8:	e8 d3 46 fe ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   ae1ad:	cc                   	int3
   ae1ae:	e8 cd d3 01 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   ae1b3:	cc                   	int3
   ae1b4:	90                   	nop
   ae1b5:	90                   	nop
   ae1b6:	90                   	nop
   ae1b7:	90                   	nop
   ae1b8:	90                   	nop
   ae1b9:	90                   	nop
   ae1ba:	90                   	nop
   ae1bb:	90                   	nop
   ae1bc:	90                   	nop
   ae1bd:	90                   	nop
   ae1be:	90                   	nop
   ae1bf:	90                   	nop

00000000000ae1c0 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes_1>:
   ae1c0:	55                   	push   %rbp
   ae1c1:	41 57                	push   %r15
   ae1c3:	41 56                	push   %r14
   ae1c5:	41 55                	push   %r13
   ae1c7:	41 54                	push   %r12
   ae1c9:	53                   	push   %rbx
   ae1ca:	48 83 ec 18          	sub    $0x18,%rsp
   ae1ce:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   ae1d3:	4c 8b e7             	mov    %rdi,%r12
   ae1d6:	4c 8b f6             	mov    %rsi,%r14
   ae1d9:	8b da                	mov    %edx,%ebx
   ae1db:	4c 8b e9             	mov    %rcx,%r13
   ae1de:	45 8b f8             	mov    %r8d,%r15d
   ae1e1:	4d 85 f6             	test   %r14,%r14
   ae1e4:	74 67                	je     ae24d <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes_1+0x8d>
   ae1e6:	4d 85 ed             	test   %r13,%r13
   ae1e9:	74 5b                	je     ae246 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes_1+0x86>
   ae1eb:	8b d3                	mov    %ebx,%edx
   ae1ed:	41 0b d7             	or     %r15d,%edx
   ae1f0:	7c 6b                	jl     ae25d <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes_1+0x9d>
   ae1f2:	45 38 24 24          	cmp    %r12b,(%r12)
   ae1f6:	41 3b df             	cmp    %r15d,%ebx
   ae1f9:	41 8b d7             	mov    %r15d,%edx
   ae1fc:	0f 4e d3             	cmovle %ebx,%edx
   ae1ff:	49 8b fe             	mov    %r14,%rdi
   ae202:	49 8b f5             	mov    %r13,%rsi
   ae205:	e8 36 f6 ff ff       	call   ad840 <S_P_CoreLib_System_Text_Ascii__NarrowUtf16ToAscii>
   ae20a:	44 8b c8             	mov    %eax,%r9d
   ae20d:	41 8b c1             	mov    %r9d,%eax
   ae210:	44 3b cb             	cmp    %ebx,%r9d
   ae213:	75 02                	jne    ae217 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes_1+0x57>
   ae215:	eb 1f                	jmp    ae236 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes_1+0x76>
   ae217:	44 89 0c 24          	mov    %r9d,(%rsp)
   ae21b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
   ae222:	00 
   ae223:	49 8b fc             	mov    %r12,%rdi
   ae226:	49 8b f6             	mov    %r14,%rsi
   ae229:	8b d3                	mov    %ebx,%edx
   ae22b:	49 8b cd             	mov    %r13,%rcx
   ae22e:	45 8b c7             	mov    %r15d,%r8d
   ae231:	e8 4a 36 00 00       	call   b1880 <S_P_CoreLib_System_Text_Encoding__GetBytesWithFallback>
   ae236:	90                   	nop
   ae237:	48 83 c4 18          	add    $0x18,%rsp
   ae23b:	5b                   	pop    %rbx
   ae23c:	41 5c                	pop    %r12
   ae23e:	41 5d                	pop    %r13
   ae240:	41 5e                	pop    %r14
   ae242:	41 5f                	pop    %r15
   ae244:	5d                   	pop    %rbp
   ae245:	c3                   	ret
   ae246:	bf 0a 00 00 00       	mov    $0xa,%edi
   ae24b:	eb 05                	jmp    ae252 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes_1+0x92>
   ae24d:	bf 0e 00 00 00       	mov    $0xe,%edi
   ae252:	be 31 00 00 00       	mov    $0x31,%esi
   ae257:	e8 94 45 fe ff       	call   927f0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException_1>
   ae25c:	cc                   	int3
   ae25d:	bf 10 00 00 00       	mov    $0x10,%edi
   ae262:	be 0c 00 00 00       	mov    $0xc,%esi
   ae267:	85 db                	test   %ebx,%ebx
   ae269:	0f 4d fe             	cmovge %esi,%edi
   ae26c:	be 0d 00 00 00       	mov    $0xd,%esi
   ae271:	e8 0a 46 fe ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   ae276:	cc                   	int3
   ae277:	90                   	nop
   ae278:	90                   	nop
   ae279:	90                   	nop
   ae27a:	90                   	nop
   ae27b:	90                   	nop
   ae27c:	90                   	nop
   ae27d:	90                   	nop
   ae27e:	90                   	nop
   ae27f:	90                   	nop

00000000000ae280 <S_P_CoreLib_System_Text_ASCIIEncoding__GetBytes_2>:
   ae280:	55                   	push   %rbp
   ae281:	41 57                	push   %r15
--
   ae538:	e8 23 f0 ff ff       	call   ad560 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   ae53d:	44 8b e8             	mov    %eax,%r13d
   ae540:	45 8b e5             	mov    %r13d,%r12d
   ae543:	44 3b eb             	cmp    %ebx,%r13d
   ae546:	74 15                	je     ae55d <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharCount_0+0x6d>
   ae548:	49 8b fe             	mov    %r14,%rdi
   ae54b:	49 8b f7             	mov    %r15,%rsi
   ae54e:	8b d3                	mov    %ebx,%edx
   ae550:	41 8b cc             	mov    %r12d,%ecx
   ae553:	e8 48 38 00 00       	call   b1da0 <S_P_CoreLib_System_Text_Encoding__GetCharCountWithFallback>
   ae558:	44 03 e0             	add    %eax,%r12d
   ae55b:	78 32                	js     ae58f <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharCount_0+0x9f>
   ae55d:	41 8b c4             	mov    %r12d,%eax
   ae560:	48 83 c4 08          	add    $0x8,%rsp
   ae564:	5b                   	pop    %rbx
   ae565:	41 5c                	pop    %r12
   ae567:	41 5d                	pop    %r13
   ae569:	41 5e                	pop    %r14
   ae56b:	41 5f                	pop    %r15
   ae56d:	5d                   	pop    %rbp
   ae56e:	c3                   	ret
   ae56f:	bf 0a 00 00 00       	mov    $0xa,%edi
   ae574:	be 31 00 00 00       	mov    $0x31,%esi
   ae579:	e8 72 42 fe ff       	call   927f0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException_1>
   ae57e:	cc                   	int3
   ae57f:	bf 1b 00 00 00       	mov    $0x1b,%edi
   ae584:	be 0d 00 00 00       	mov    $0xd,%esi
   ae589:	e8 f2 42 fe ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   ae58e:	cc                   	int3
   ae58f:	e8 6c 2d 00 00       	call   b1300 <S_P_CoreLib_System_Text_Encoding__ThrowConversionOverflow>
   ae594:	cc                   	int3
   ae595:	90                   	nop
   ae596:	90                   	nop
   ae597:	90                   	nop
   ae598:	90                   	nop
   ae599:	90                   	nop
   ae59a:	90                   	nop
   ae59b:	90                   	nop
   ae59c:	90                   	nop
   ae59d:	90                   	nop
   ae59e:	90                   	nop
   ae59f:	90                   	nop

00000000000ae5a0 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharCountFast>:
   ae5a0:	55                   	push   %rbp
   ae5a1:	53                   	push   %rbx
   ae5a2:	50                   	push   %rax
   ae5a3:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   ae5a8:	48 8b fe             	mov    %rsi,%rdi
   ae5ab:	49 8b d8             	mov    %r8,%rbx
   ae5ae:	8b c2                	mov    %edx,%eax
   ae5b0:	48 85 c9             	test   %rcx,%rcx
   ae5b3:	74 16                	je     ae5cb <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharCountFast+0x2b>
   ae5b5:	48 8d 35 a4 93 1a 00 	lea    0x1a93a4(%rip),%rsi        # 257960 <_ZTV50S_P_CoreLib_System_Text_DecoderReplacementFallback>
   ae5bc:	48 39 31             	cmp    %rsi,(%rcx)
   ae5bf:	75 0a                	jne    ae5cb <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharCountFast+0x2b>
   ae5c1:	48 8b 71 08          	mov    0x8(%rcx),%rsi
   ae5c5:	83 7e 08 01          	cmpl   $0x1,0x8(%rsi)
   ae5c9:	74 07                	je     ae5d2 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharCountFast+0x32>
   ae5cb:	8b f2                	mov    %edx,%esi
   ae5cd:	e8 8e ef ff ff       	call   ad560 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   ae5d2:	89 03                	mov    %eax,(%rbx)
   ae5d4:	48 83 c4 08          	add    $0x8,%rsp
   ae5d8:	5b                   	pop    %rbx
   ae5d9:	5d                   	pop    %rbp
   ae5da:	c3                   	ret
   ae5db:	90                   	nop
   ae5dc:	90                   	nop
   ae5dd:	90                   	nop
   ae5de:	90                   	nop
   ae5df:	90                   	nop

00000000000ae5e0 <S_P_CoreLib_System_Text_ASCIIEncoding__GetChars_0>:
   ae5e0:	55                   	push   %rbp
   ae5e1:	41 57                	push   %r15
   ae5e3:	41 56                	push   %r14
   ae5e5:	41 55                	push   %r13
   ae5e7:	41 54                	push   %r12
   ae5e9:	53                   	push   %rbx
   ae5ea:	48 83 ec 18          	sub    $0x18,%rsp
   ae5ee:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   ae5f3:	4c 8b e7             	mov    %rdi,%r12
   ae5f6:	4c 8b f6             	mov    %rsi,%r14
   ae5f9:	8b da                	mov    %edx,%ebx
   ae5fb:	4c 8b e9             	mov    %rcx,%r13
   ae5fe:	45 8b f8             	mov    %r8d,%r15d
   ae601:	4d 85 f6             	test   %r14,%r14
   ae604:	74 66                	je     ae66c <S_P_CoreLib_System_Text_ASCIIEncoding__GetChars_0+0x8c>
   ae606:	4d 85 ed             	test   %r13,%r13
   ae609:	74 5a                	je     ae665 <S_P_CoreLib_System_Text_ASCIIEncoding__GetChars_0+0x85>
   ae60b:	8b d3                	mov    %ebx,%edx
   ae60d:	41 0b d7             	or     %r15d,%edx
   ae610:	7c 6a                	jl     ae67c <S_P_CoreLib_System_Text_ASCIIEncoding__GetChars_0+0x9c>
   ae612:	45 38 24 24          	cmp    %r12b,(%r12)
   ae616:	44 3b fb             	cmp    %ebx,%r15d
   ae619:	8b d3                	mov    %ebx,%edx
   ae61b:	41 0f 4e d7          	cmovle %r15d,%edx
   ae61f:	49 8b fe             	mov    %r14,%rdi
   ae622:	49 8b f5             	mov    %r13,%rsi
   ae625:	e8 b6 f5 ff ff       	call   adbe0 <S_P_CoreLib_System_Text_Ascii__WidenAsciiToUtf16>
   ae62a:	44 8b c8             	mov    %eax,%r9d
   ae62d:	41 8b c1             	mov    %r9d,%eax
   ae630:	3b c3                	cmp    %ebx,%eax
   ae632:	75 02                	jne    ae636 <S_P_CoreLib_System_Text_ASCIIEncoding__GetChars_0+0x56>
   ae634:	eb 1f                	jmp    ae655 <S_P_CoreLib_System_Text_ASCIIEncoding__GetChars_0+0x75>
   ae636:	44 89 0c 24          	mov    %r9d,(%rsp)
   ae63a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
   ae641:	00 
   ae642:	49 8b fc             	mov    %r12,%rdi
   ae645:	49 8b f6             	mov    %r14,%rsi
   ae648:	8b d3                	mov    %ebx,%edx
   ae64a:	49 8b cd             	mov    %r13,%rcx
   ae64d:	45 8b c7             	mov    %r15d,%r8d
   ae650:	e8 db 3a 00 00       	call   b2130 <S_P_CoreLib_System_Text_Encoding__GetCharsWithFallback>
   ae655:	90                   	nop
   ae656:	48 83 c4 18          	add    $0x18,%rsp
   ae65a:	5b                   	pop    %rbx
   ae65b:	41 5c                	pop    %r12
   ae65d:	41 5d                	pop    %r13
   ae65f:	41 5e                	pop    %r14
   ae661:	41 5f                	pop    %r15
   ae663:	5d                   	pop    %rbp
   ae664:	c3                   	ret
   ae665:	bf 0e 00 00 00       	mov    $0xe,%edi
   ae66a:	eb 05                	jmp    ae671 <S_P_CoreLib_System_Text_ASCIIEncoding__GetChars_0+0x91>
   ae66c:	bf 0a 00 00 00       	mov    $0xa,%edi
   ae671:	be 31 00 00 00       	mov    $0x31,%esi
   ae676:	e8 75 41 fe ff       	call   927f0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException_1>
   ae67b:	cc                   	int3
   ae67c:	bf 0c 00 00 00       	mov    $0xc,%edi
   ae681:	be 10 00 00 00       	mov    $0x10,%esi
   ae686:	85 db                	test   %ebx,%ebx
   ae688:	0f 4d fe             	cmovge %esi,%edi
   ae68b:	be 0d 00 00 00       	mov    $0xd,%esi
   ae690:	e8 eb 41 fe ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   ae695:	cc                   	int3
   ae696:	90                   	nop
   ae697:	90                   	nop
   ae698:	90                   	nop
   ae699:	90                   	nop
   ae69a:	90                   	nop
   ae69b:	90                   	nop
   ae69c:	90                   	nop
   ae69d:	90                   	nop
   ae69e:	90                   	nop
   ae69f:	90                   	nop

00000000000ae6a0 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsFast>:
   ae6a0:	55                   	push   %rbp
   ae6a1:	53                   	push   %rbx
   ae6a2:	50                   	push   %rax
   ae6a3:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   ae6a8:	49 8b d9             	mov    %r9,%rbx
   ae6ab:	44 3b c2             	cmp    %edx,%r8d
   ae6ae:	44 0f 4f c2          	cmovg  %edx,%r8d
   ae6b2:	41 8b d0             	mov    %r8d,%edx
   ae6b5:	48 8b fe             	mov    %rsi,%rdi
   ae6b8:	48 8b f1             	mov    %rcx,%rsi
   ae6bb:	e8 20 f5 ff ff       	call   adbe0 <S_P_CoreLib_System_Text_Ascii__WidenAsciiToUtf16>
   ae6c0:	89 03                	mov    %eax,(%rbx)
   ae6c2:	8b 03                	mov    (%rbx),%eax
   ae6c4:	48 83 c4 08          	add    $0x8,%rsp
   ae6c8:	5b                   	pop    %rbx
   ae6c9:	5d                   	pop    %rbp
   ae6ca:	c3                   	ret
   ae6cb:	90                   	nop
   ae6cc:	90                   	nop
   ae6cd:	90                   	nop
   ae6ce:	90                   	nop
   ae6cf:	90                   	nop
   ae6d0:	90                   	nop
   ae6d1:	90                   	nop
   ae6d2:	90                   	nop
   ae6d3:	90                   	nop
   ae6d4:	90                   	nop
   ae6d5:	90                   	nop
   ae6d6:	90                   	nop
   ae6d7:	90                   	nop
   ae6d8:	90                   	nop
   ae6d9:	90                   	nop
   ae6da:	90                   	nop
   ae6db:	90                   	nop
   ae6dc:	90                   	nop
   ae6dd:	90                   	nop
   ae6de:	90                   	nop
   ae6df:	90                   	nop

00000000000ae6e0 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback>:
   ae6e0:	55                   	push   %rbp
   ae6e1:	41 57                	push   %r15
   ae6e3:	41 56                	push   %r14
   ae6e5:	41 55                	push   %r13
   ae6e7:	41 54                	push   %r12
   ae6e9:	53                   	push   %rbx
   ae6ea:	48 83 ec 38          	sub    $0x38,%rsp
   ae6ee:	48 8d 6c 24 60       	lea    0x60(%rsp),%rbp
   ae6f3:	89 4d d4             	mov    %ecx,-0x2c(%rbp)
   ae6f6:	4c 8b e7             	mov    %rdi,%r12
   ae6f9:	4c 8b ee             	mov    %rsi,%r13
   ae6fc:	44 8b fa             	mov    %edx,%r15d
   ae6ff:	4d 8b f0             	mov    %r8,%r14
   ae702:	41 8b d9             	mov    %r9d,%ebx
   ae705:	48 8b 4d 18          	mov    0x18(%rbp),%rcx
   ae709:	48 85 c9             	test   %rcx,%rcx
   ae70c:	74 0e                	je     ae71c <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x3c>
   ae70e:	48 89 4d 18          	mov    %rcx,0x18(%rbp)
   ae712:	48 8b f9             	mov    %rcx,%rdi
   ae715:	e8 e2 ac f5 ff       	call   93fc <S_P_CoreLib_System_Text_Decoder__get_Fallback>
   ae71a:	eb 0c                	jmp    ae728 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x48>
   ae71c:	49 8b 7c 24 18       	mov    0x18(%r12),%rdi
   ae721:	48 89 4d 18          	mov    %rcx,0x18(%rbp)
   ae725:	48 8b c7             	mov    %rdi,%rax
   ae728:	48 85 c0             	test   %rax,%rax
   ae72b:	0f 84 d2 00 00 00    	je     ae803 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x123>
   ae731:	48 8d 3d 28 92 1a 00 	lea    0x1a9228(%rip),%rdi        # 257960 <_ZTV50S_P_CoreLib_System_Text_DecoderReplacementFallback>
   ae738:	48 39 38             	cmp    %rdi,(%rax)
   ae73b:	0f 85 c2 00 00 00    	jne    ae803 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x123>
   ae741:	48 8b 78 08          	mov    0x8(%rax),%rdi
   ae745:	83 7f 08 01          	cmpl   $0x1,0x8(%rdi)
   ae749:	0f 85 b4 00 00 00    	jne    ae803 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x123>
   ae74f:	83 7f 08 00          	cmpl   $0x0,0x8(%rdi)
   ae753:	0f 86 0f 01 00 00    	jbe    ae868 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x188>
   ae759:	0f b7 47 0c          	movzwl 0xc(%rdi),%eax
   ae75d:	89 45 d0             	mov    %eax,-0x30(%rbp)
   ae760:	41 8b ff             	mov    %r15d,%edi
   ae763:	8b f3                	mov    %ebx,%esi
   ae765:	3b fe                	cmp    %esi,%edi
   ae767:	44 8b cb             	mov    %ebx,%r9d
   ae76a:	45 0f 4e cf          	cmovle %r15d,%r9d
   ae76e:	44 89 4d cc          	mov    %r9d,-0x34(%rbp)
   ae772:	33 ff                	xor    %edi,%edi
   ae774:	45 85 c9             	test   %r9d,%r9d
   ae777:	7e 6d                	jle    ae7e6 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x106>
   ae779:	8d 77 01             	lea    0x1(%rdi),%esi
   ae77c:	44 8b d6             	mov    %esi,%r10d
   ae77f:	3b fb                	cmp    %ebx,%edi
   ae781:	0f 83 e1 00 00 00    	jae    ae868 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x188>
   ae787:	8b ff                	mov    %edi,%edi
   ae789:	66 41 89 04 7e       	mov    %ax,(%r14,%rdi,2)
   ae78e:	45 3b d1             	cmp    %r9d,%r10d
   ae791:	7d 44                	jge    ae7d7 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0xf7>
   ae793:	45 3b d7             	cmp    %r15d,%r10d
   ae796:	0f 87 c6 00 00 00    	ja     ae862 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x182>
   ae79c:	41 8b fa             	mov    %r10d,%edi
   ae79f:	49 03 fd             	add    %r13,%rdi
   ae7a2:	41 8b f7             	mov    %r15d,%esi
   ae7a5:	41 2b f2             	sub    %r10d,%esi
   ae7a8:	44 3b d3             	cmp    %ebx,%r10d
   ae7ab:	0f 87 b1 00 00 00    	ja     ae862 <S_P_CoreLib_System_Text_ASCIIEncoding__GetCharsWithFallback+0x182>
   ae7b1:	41 8b d2             	mov    %r10d,%edx
   ae7b4:	49 8d 14 56          	lea    (%r14,%rdx,2),%rdx
   ae7b8:	44 89 55 c8          	mov    %r10d,-0x38(%rbp)
   ae7bc:	44 8b c3             	mov    %ebx,%r8d
   ae7bf:	45 2b c2             	sub    %r10d,%r8d
   ae7c2:	41 8b c8             	mov    %r8d,%ecx
   ae7c5:	4c 8d 45 c0          	lea    -0x40(%rbp),%r8
   ae7c9:	e8 c2 ec ff ff       	call   ad490 <S_P_CoreLib_System_Text_Ascii__ToUtf16>
   ae7ce:	8b 45 c8             	mov    -0x38(%rbp),%eax
   ae7d1:	03 45 c0             	add    -0x40(%rbp),%eax
   ae7d4:	44 8b d0             	mov    %eax,%r10d
   ae7d7:	44 8b 4d cc          	mov    -0x34(%rbp),%r9d
--
   b2e46:	e8 35 08 00 00       	call   b3680 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2e4b:	44 8b e8             	mov    %eax,%r13d
   b2e4e:	3b c3                	cmp    %ebx,%eax
   b2e50:	74 15                	je     b2e67 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount+0x47>
   b2e52:	49 8b fe             	mov    %r14,%rdi
   b2e55:	49 8b f7             	mov    %r15,%rsi
   b2e58:	8b d3                	mov    %ebx,%edx
   b2e5a:	41 8b cd             	mov    %r13d,%ecx
   b2e5d:	e8 0e e7 ff ff       	call   b1570 <S_P_CoreLib_System_Text_Encoding__GetByteCountWithFallback>
   b2e62:	44 03 e8             	add    %eax,%r13d
   b2e65:	78 27                	js     b2e8e <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount+0x6e>
   b2e67:	41 8b c5             	mov    %r13d,%eax
   b2e6a:	5b                   	pop    %rbx
   b2e6b:	41 5d                	pop    %r13
   b2e6d:	41 5e                	pop    %r14
   b2e6f:	41 5f                	pop    %r15
   b2e71:	5d                   	pop    %rbp
   b2e72:	c3                   	ret
   b2e73:	bf 0e 00 00 00       	mov    $0xe,%edi
   b2e78:	e8 33 f9 fd ff       	call   927b0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException>
   b2e7d:	cc                   	int3
   b2e7e:	bf 1b 00 00 00       	mov    $0x1b,%edi
   b2e83:	be 0d 00 00 00       	mov    $0xd,%esi
   b2e88:	e8 f3 f9 fd ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   b2e8d:	cc                   	int3
   b2e8e:	e8 6d e4 ff ff       	call   b1300 <S_P_CoreLib_System_Text_Encoding__ThrowConversionOverflow>
   b2e93:	cc                   	int3
   b2e94:	90                   	nop
   b2e95:	90                   	nop
   b2e96:	90                   	nop
   b2e97:	90                   	nop
   b2e98:	90                   	nop
   b2e99:	90                   	nop
   b2e9a:	90                   	nop
   b2e9b:	90                   	nop
   b2e9c:	90                   	nop
   b2e9d:	90                   	nop
   b2e9e:	90                   	nop
   b2e9f:	90                   	nop

00000000000b2ea0 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount_1>:
   b2ea0:	55                   	push   %rbp
   b2ea1:	41 57                	push   %r15
   b2ea3:	41 56                	push   %r14
   b2ea5:	41 55                	push   %r13
   b2ea7:	53                   	push   %rbx
   b2ea8:	48 83 ec 10          	sub    $0x10,%rsp
   b2eac:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   b2eb1:	48 8b df             	mov    %rdi,%rbx
   b2eb4:	48 89 75 d8          	mov    %rsi,-0x28(%rbp)
   b2eb8:	4c 8b fe             	mov    %rsi,%r15
   b2ebb:	44 8b f2             	mov    %edx,%r14d
   b2ebe:	38 1b                	cmp    %bl,(%rbx)
   b2ec0:	41 8b f6             	mov    %r14d,%esi
   b2ec3:	49 8b ff             	mov    %r15,%rdi
   b2ec6:	e8 b5 07 00 00       	call   b3680 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2ecb:	44 8b e8             	mov    %eax,%r13d
   b2ece:	41 3b c6             	cmp    %r14d,%eax
   b2ed1:	74 16                	je     b2ee9 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount_1+0x49>
   b2ed3:	48 8b fb             	mov    %rbx,%rdi
   b2ed6:	49 8b f7             	mov    %r15,%rsi
   b2ed9:	41 8b d6             	mov    %r14d,%edx
   b2edc:	41 8b cd             	mov    %r13d,%ecx
   b2edf:	e8 8c e6 ff ff       	call   b1570 <S_P_CoreLib_System_Text_Encoding__GetByteCountWithFallback>
   b2ee4:	44 03 e8             	add    %eax,%r13d
   b2ee7:	78 10                	js     b2ef9 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount_1+0x59>
   b2ee9:	41 8b c5             	mov    %r13d,%eax
   b2eec:	48 83 c4 10          	add    $0x10,%rsp
   b2ef0:	5b                   	pop    %rbx
   b2ef1:	41 5d                	pop    %r13
   b2ef3:	41 5e                	pop    %r14
   b2ef5:	41 5f                	pop    %r15
   b2ef7:	5d                   	pop    %rbp
   b2ef8:	c3                   	ret
   b2ef9:	e8 02 e4 ff ff       	call   b1300 <S_P_CoreLib_System_Text_Encoding__ThrowConversionOverflow>
   b2efe:	cc                   	int3
   b2eff:	90                   	nop

00000000000b2f00 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount_2>:
   b2f00:	55                   	push   %rbp
   b2f01:	41 57                	push   %r15
   b2f03:	41 56                	push   %r14
   b2f05:	41 55                	push   %r13
   b2f07:	53                   	push   %rbx
   b2f08:	48 83 ec 10          	sub    $0x10,%rsp
   b2f0c:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   b2f11:	33 c0                	xor    %eax,%eax
   b2f13:	48 89 45 d8          	mov    %rax,-0x28(%rbp)
   b2f17:	48 8b df             	mov    %rdi,%rbx
   b2f1a:	48 85 f6             	test   %rsi,%rsi
   b2f1d:	74 4b                	je     b2f6a <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount_2+0x6a>
   b2f1f:	48 8d 7e 0c          	lea    0xc(%rsi),%rdi
   b2f23:	48 89 7d d8          	mov    %rdi,-0x28(%rbp)
   b2f27:	4c 8b 7d d8          	mov    -0x28(%rbp),%r15
   b2f2b:	44 8b 76 08          	mov    0x8(%rsi),%r14d
   b2f2f:	38 1b                	cmp    %bl,(%rbx)
   b2f31:	41 8b f6             	mov    %r14d,%esi
   b2f34:	49 8b ff             	mov    %r15,%rdi
   b2f37:	e8 44 07 00 00       	call   b3680 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2f3c:	44 8b e8             	mov    %eax,%r13d
   b2f3f:	41 3b c6             	cmp    %r14d,%eax
   b2f42:	74 16                	je     b2f5a <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount_2+0x5a>
   b2f44:	48 8b fb             	mov    %rbx,%rdi
   b2f47:	49 8b f7             	mov    %r15,%rsi
   b2f4a:	41 8b d6             	mov    %r14d,%edx
   b2f4d:	41 8b cd             	mov    %r13d,%ecx
   b2f50:	e8 1b e6 ff ff       	call   b1570 <S_P_CoreLib_System_Text_Encoding__GetByteCountWithFallback>
   b2f55:	44 03 e8             	add    %eax,%r13d
   b2f58:	78 1b                	js     b2f75 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCount_2+0x75>
   b2f5a:	41 8b c5             	mov    %r13d,%eax
   b2f5d:	48 83 c4 10          	add    $0x10,%rsp
   b2f61:	5b                   	pop    %rbx
   b2f62:	41 5d                	pop    %r13
   b2f64:	41 5e                	pop    %r14
   b2f66:	41 5f                	pop    %r15
   b2f68:	5d                   	pop    %rbp
   b2f69:	c3                   	ret
   b2f6a:	bf 11 00 00 00       	mov    $0x11,%edi
   b2f6f:	e8 3c f8 fd ff       	call   927b0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException>
   b2f74:	cc                   	int3
   b2f75:	e8 86 e3 ff ff       	call   b1300 <S_P_CoreLib_System_Text_Encoding__ThrowConversionOverflow>
   b2f7a:	cc                   	int3
   b2f7b:	90                   	nop
   b2f7c:	90                   	nop
   b2f7d:	90                   	nop
   b2f7e:	90                   	nop
   b2f7f:	90                   	nop

00000000000b2f80 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCountFast>:
   b2f80:	55                   	push   %rbp
   b2f81:	53                   	push   %rbx
   b2f82:	50                   	push   %rax
   b2f83:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   b2f88:	48 8b fe             	mov    %rsi,%rdi
   b2f8b:	49 8b d8             	mov    %r8,%rbx
   b2f8e:	8b c2                	mov    %edx,%eax
   b2f90:	48 85 c9             	test   %rcx,%rcx
   b2f93:	74 33                	je     b2fc8 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCountFast+0x48>
   b2f95:	48 8b f1             	mov    %rcx,%rsi
   b2f98:	4c 8d 05 19 4d 1a 00 	lea    0x1a4d19(%rip),%r8        # 257cb8 <_ZTV52S_P_CoreLib_System_Text_EncoderLatin1BestFitFallback>
   b2f9f:	4c 39 06             	cmp    %r8,(%rsi)
   b2fa2:	74 2b                	je     b2fcf <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCountFast+0x4f>
   b2fa4:	48 8d 35 5d 4e 1a 00 	lea    0x1a4e5d(%rip),%rsi        # 257e08 <_ZTV50S_P_CoreLib_System_Text_EncoderReplacementFallback>
   b2fab:	48 39 31             	cmp    %rsi,(%rcx)
   b2fae:	75 18                	jne    b2fc8 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCountFast+0x48>
   b2fb0:	48 8b 71 08          	mov    0x8(%rcx),%rsi
   b2fb4:	83 7e 08 01          	cmpl   $0x1,0x8(%rsi)
   b2fb8:	75 0e                	jne    b2fc8 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCountFast+0x48>
   b2fba:	83 7e 08 00          	cmpl   $0x0,0x8(%rsi)
   b2fbe:	76 18                	jbe    b2fd8 <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCountFast+0x58>
   b2fc0:	66 81 7e 0c ff 00    	cmpw   $0xff,0xc(%rsi)
   b2fc6:	76 07                	jbe    b2fcf <S_P_CoreLib_System_Text_Latin1Encoding__GetByteCountFast+0x4f>
   b2fc8:	8b f2                	mov    %edx,%esi
   b2fca:	e8 b1 06 00 00       	call   b3680 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b2fcf:	89 03                	mov    %eax,(%rbx)
   b2fd1:	48 83 c4 08          	add    $0x8,%rsp
   b2fd5:	5b                   	pop    %rbx
   b2fd6:	5d                   	pop    %rbp
   b2fd7:	c3                   	ret
   b2fd8:	e8 a3 85 01 00       	call   cb580 <S_P_CoreLib_Internal_Runtime_CompilerHelpers_ThrowHelpers__ThrowIndexOutOfRangeException>
   b2fdd:	cc                   	int3
   b2fde:	90                   	nop
   b2fdf:	90                   	nop

00000000000b2fe0 <S_P_CoreLib_System_Text_Latin1Encoding__GetMaxByteCount>:
   b2fe0:	55                   	push   %rbp
   b2fe1:	41 57                	push   %r15
   b2fe3:	53                   	push   %rbx
   b2fe4:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   b2fe9:	48 8b df             	mov    %rdi,%rbx
   b2fec:	85 f6                	test   %esi,%esi
   b2fee:	7c 36                	jl     b3026 <S_P_CoreLib_System_Text_Latin1Encoding__GetMaxByteCount+0x46>
   b2ff0:	4c 63 fe             	movslq %esi,%r15
   b2ff3:	49 ff c7             	inc    %r15
   b2ff6:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   b2ffa:	48 8b 07             	mov    (%rdi),%rax
   b2ffd:	ff 50 38             	call   *0x38(%rax)
   b3000:	83 f8 01             	cmp    $0x1,%eax
   b3003:	7e 10                	jle    b3015 <S_P_CoreLib_System_Text_Latin1Encoding__GetMaxByteCount+0x35>
   b3005:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
   b3009:	48 8b 07             	mov    (%rdi),%rax
   b300c:	ff 50 38             	call   *0x38(%rax)
   b300f:	48 98                	cltq
   b3011:	4c 0f af f8          	imul   %rax,%r15
   b3015:	49 81 ff ff ff ff 7f 	cmp    $0x7fffffff,%r15
   b301c:	7f 17                	jg     b3035 <S_P_CoreLib_System_Text_Latin1Encoding__GetMaxByteCount+0x55>
   b301e:	41 8b c7             	mov    %r15d,%eax
   b3021:	5b                   	pop    %rbx
   b3022:	41 5f                	pop    %r15
   b3024:	5d                   	pop    %rbp
   b3025:	c3                   	ret
   b3026:	8b fe                	mov    %esi,%edi
   b3028:	48 8d 35 11 66 19 00 	lea    0x196611(%rip),%rsi        # 249640 <__Str_charCount>
   b302f:	e8 ac cc 07 00       	call   12fce0 <S_P_CoreLib_System_ArgumentOutOfRangeException__ThrowNegative<Int32>>
   b3034:	cc                   	int3
   b3035:	48 8d 3d 9c 01 1a 00 	lea    0x1a019c(%rip),%rdi        # 2531d8 <_ZTV46S_P_CoreLib_System_ArgumentOutOfRangeException>
   b303c:	e8 03 25 fb ff       	call   65544 <RhpNewFast>
   b3041:	48 8b d8             	mov    %rax,%rbx
   b3044:	48 8b fb             	mov    %rbx,%rdi
   b3047:	48 8d 35 f2 65 19 00 	lea    0x1965f2(%rip),%rsi        # 249640 <__Str_charCount>
   b304e:	48 8d 15 cb 41 19 00 	lea    0x1941cb(%rip),%rdx        # 247220 <__Str_Too_many_characters__The_resul_FBD9BA174244900AA27930524B9E5293C86D7A20508E1EEA1565BDE0EC10AC61>
   b3055:	e8 56 7b fd ff       	call   8abb0 <S_P_CoreLib_System_ArgumentOutOfRangeException___ctor_1>
   b305a:	48 8b fb             	mov    %rbx,%rdi
   b305d:	e8 4c 27 fb ff       	call   657ae <RhpThrowEx>
   b3062:	cc                   	int3
   b3063:	90                   	nop
   b3064:	90                   	nop
   b3065:	90                   	nop
   b3066:	90                   	nop
   b3067:	90                   	nop
   b3068:	90                   	nop
   b3069:	90                   	nop
   b306a:	90                   	nop
   b306b:	90                   	nop
   b306c:	90                   	nop
   b306d:	90                   	nop
   b306e:	90                   	nop
   b306f:	90                   	nop

00000000000b3070 <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes>:
   b3070:	55                   	push   %rbp
   b3071:	41 57                	push   %r15
   b3073:	41 56                	push   %r14
   b3075:	41 55                	push   %r13
   b3077:	41 54                	push   %r12
   b3079:	53                   	push   %rbx
   b307a:	48 83 ec 18          	sub    $0x18,%rsp
   b307e:	48 8d 6c 24 40       	lea    0x40(%rsp),%rbp
   b3083:	4c 8b e7             	mov    %rdi,%r12
   b3086:	4c 8b f6             	mov    %rsi,%r14
   b3089:	8b da                	mov    %edx,%ebx
   b308b:	4c 8b e9             	mov    %rcx,%r13
   b308e:	45 8b f8             	mov    %r8d,%r15d
   b3091:	4d 85 f6             	test   %r14,%r14
   b3094:	74 67                	je     b30fd <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes+0x8d>
   b3096:	4d 85 ed             	test   %r13,%r13
   b3099:	74 5b                	je     b30f6 <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes+0x86>
   b309b:	8b d3                	mov    %ebx,%edx
   b309d:	41 0b d7             	or     %r15d,%edx
   b30a0:	7c 6b                	jl     b310d <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes+0x9d>
   b30a2:	45 38 24 24          	cmp    %r12b,(%r12)
   b30a6:	41 3b df             	cmp    %r15d,%ebx
   b30a9:	41 8b d7             	mov    %r15d,%edx
   b30ac:	0f 4e d3             	cmovle %ebx,%edx
   b30af:	49 8b fe             	mov    %r14,%rdi
   b30b2:	49 8b f5             	mov    %r13,%rsi
   b30b5:	e8 66 07 00 00       	call   b3820 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1>
   b30ba:	44 8b c8             	mov    %eax,%r9d
   b30bd:	41 8b c1             	mov    %r9d,%eax
   b30c0:	44 3b cb             	cmp    %ebx,%r9d
   b30c3:	75 02                	jne    b30c7 <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes+0x57>
   b30c5:	eb 1f                	jmp    b30e6 <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes+0x76>
   b30c7:	44 89 0c 24          	mov    %r9d,(%rsp)
   b30cb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
   b30d2:	00 
   b30d3:	49 8b fc             	mov    %r12,%rdi
   b30d6:	49 8b f6             	mov    %r14,%rsi
   b30d9:	8b d3                	mov    %ebx,%edx
   b30db:	49 8b cd             	mov    %r13,%rcx
   b30de:	45 8b c7             	mov    %r15d,%r8d
   b30e1:	e8 9a e7 ff ff       	call   b1880 <S_P_CoreLib_System_Text_Encoding__GetBytesWithFallback>
   b30e6:	90                   	nop
   b30e7:	48 83 c4 18          	add    $0x18,%rsp
   b30eb:	5b                   	pop    %rbx
   b30ec:	41 5c                	pop    %r12
   b30ee:	41 5d                	pop    %r13
   b30f0:	41 5e                	pop    %r14
   b30f2:	41 5f                	pop    %r15
   b30f4:	5d                   	pop    %rbp
   b30f5:	c3                   	ret
   b30f6:	bf 0a 00 00 00       	mov    $0xa,%edi
   b30fb:	eb 05                	jmp    b3102 <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes+0x92>
   b30fd:	bf 0e 00 00 00       	mov    $0xe,%edi
   b3102:	be 31 00 00 00       	mov    $0x31,%esi
   b3107:	e8 e4 f6 fd ff       	call   927f0 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentNullException_1>
   b310c:	cc                   	int3
   b310d:	bf 10 00 00 00       	mov    $0x10,%edi
   b3112:	be 0c 00 00 00       	mov    $0xc,%esi
   b3117:	85 db                	test   %ebx,%ebx
   b3119:	0f 4d fe             	cmovge %esi,%edi
   b311c:	be 0d 00 00 00       	mov    $0xd,%esi
   b3121:	e8 5a f7 fd ff       	call   92880 <S_P_CoreLib_System_ThrowHelper__ThrowArgumentOutOfRangeException_1>
   b3126:	cc                   	int3
   b3127:	90                   	nop
   b3128:	90                   	nop
   b3129:	90                   	nop
   b312a:	90                   	nop
   b312b:	90                   	nop
   b312c:	90                   	nop
   b312d:	90                   	nop
   b312e:	90                   	nop
   b312f:	90                   	nop

00000000000b3130 <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes_1>:
   b3130:	55                   	push   %rbp
   b3131:	41 57                	push   %r15
   b3133:	41 56                	push   %r14
   b3135:	41 55                	push   %r13
   b3137:	41 54                	push   %r12
   b3139:	53                   	push   %rbx
   b313a:	48 83 ec 28          	sub    $0x28,%rsp
   b313e:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
   b3143:	48 8b df             	mov    %rdi,%rbx
   b3146:	48 89 75 d0          	mov    %rsi,-0x30(%rbp)
   b314a:	4c 8b fe             	mov    %rsi,%r15
   b314d:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
   b3151:	4c 8b f1             	mov    %rcx,%r14
   b3154:	44 8b ea             	mov    %edx,%r13d
   b3157:	45 8b e0             	mov    %r8d,%r12d
   b315a:	38 1b                	cmp    %bl,(%rbx)
   b315c:	45 3b ec             	cmp    %r12d,%r13d
   b315f:	41 8b d4             	mov    %r12d,%edx
   b3162:	41 0f 4e d5          	cmovle %r13d,%edx
   b3166:	49 8b ff             	mov    %r15,%rdi
   b3169:	49 8b f6             	mov    %r14,%rsi
   b316c:	e8 af 06 00 00       	call   b3820 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1>
   b3171:	44 8b c8             	mov    %eax,%r9d
   b3174:	41 8b c1             	mov    %r9d,%eax
   b3177:	45 3b cd             	cmp    %r13d,%r9d
   b317a:	75 02                	jne    b317e <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes_1+0x4e>
   b317c:	eb 20                	jmp    b319e <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes_1+0x6e>
   b317e:	44 89 0c 24          	mov    %r9d,(%rsp)
   b3182:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%rsp)
   b3189:	00 
   b318a:	48 8b fb             	mov    %rbx,%rdi
   b318d:	49 8b f7             	mov    %r15,%rsi
   b3190:	41 8b d5             	mov    %r13d,%edx
   b3193:	49 8b ce             	mov    %r14,%rcx
   b3196:	45 8b c4             	mov    %r12d,%r8d
   b3199:	e8 e2 e6 ff ff       	call   b1880 <S_P_CoreLib_System_Text_Encoding__GetBytesWithFallback>
   b319e:	90                   	nop
   b319f:	48 83 c4 28          	add    $0x28,%rsp
   b31a3:	5b                   	pop    %rbx
   b31a4:	41 5c                	pop    %r12
   b31a6:	41 5d                	pop    %r13
   b31a8:	41 5e                	pop    %r14
   b31aa:	41 5f                	pop    %r15
   b31ac:	5d                   	pop    %rbp
   b31ad:	c3                   	ret
   b31ae:	90                   	nop
   b31af:	90                   	nop

00000000000b31b0 <S_P_CoreLib_System_Text_Latin1Encoding__GetBytes_2>:
   b31b0:	55                   	push   %rbp
   b31b1:	41 57                	push   %r15
   b31b3:	41 56                	push   %r14
   b31b5:	41 55                	push   %r13
   b31b7:	41 54                	push   %r12
   b31b9:	53                   	push   %rbx
   b31ba:	48 83 ec 28          	sub    $0x28,%rsp
   b31be:	48 8d 6c 24 50       	lea    0x50(%rsp),%rbp
   b31c3:	33 c0                	xor    %eax,%eax
   b31c5:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
   b31c9:	48 89 45 c8          	mov    %rax,-0x38(%rbp)
--
00000000000b3680 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>:
   b3680:	55                   	push   %rbp
   b3681:	41 57                	push   %r15
   b3683:	53                   	push   %rbx
   b3684:	c5 f8 77             	vzeroupper
   b3687:	48 8d 6c 24 10       	lea    0x10(%rsp),%rbp
   b368c:	48 8b df             	mov    %rdi,%rbx
   b368f:	48 85 f6             	test   %rsi,%rsi
   b3692:	75 07                	jne    b369b <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x1b>
   b3694:	33 c0                	xor    %eax,%eax
   b3696:	5b                   	pop    %rbx
   b3697:	41 5f                	pop    %r15
   b3699:	5d                   	pop    %rbp
   b369a:	c3                   	ret
   b369b:	4c 8b fb             	mov    %rbx,%r15
   b369e:	48 83 fe 08          	cmp    $0x8,%rsi
   b36a2:	0f 82 0b 01 00 00    	jb     b37b3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x133>
   b36a8:	c5 f8 10 05 10 14 0d 	vmovups 0xd1410(%rip),%xmm0        # 184ac0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b36af:	00 
   b36b0:	c4 c1 78 10 0f       	vmovups (%r15),%xmm1
   b36b5:	c5 f1 dd 0d 13 14 0d 	vpaddusw 0xd1413(%rip),%xmm1,%xmm1        # 184ad0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b36bc:	00 
   b36bd:	c5 f9 d7 f9          	vpmovmskb %xmm1,%edi
   b36c1:	f7 c7 aa aa 00 00    	test   $0xaaaa,%edi
   b36c7:	0f 85 c2 00 00 00    	jne    b378f <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10f>
   b36cd:	48 03 f6             	add    %rsi,%rsi
   b36d0:	48 83 fe 20          	cmp    $0x20,%rsi
   b36d4:	72 5c                	jb     b3732 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb2>
   b36d6:	49 8d 5f 10          	lea    0x10(%r15),%rbx
   b36da:	48 83 e3 f0          	and    $0xfffffffffffffff0,%rbx
   b36de:	49 03 f7             	add    %r15,%rsi
   b36e1:	48 2b f3             	sub    %rbx,%rsi
   b36e4:	48 83 fe 20          	cmp    $0x20,%rsi
   b36e8:	72 33                	jb     b371d <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x9d>
   b36ea:	48 8d 04 33          	lea    (%rbx,%rsi,1),%rax
   b36ee:	48 83 e8 20          	sub    $0x20,%rax
   b36f2:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b36f9:	0f 1f 80 00 00 00 00 	nopl   0x0(%rax)
   b3700:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b3704:	c5 f9 6f 53 10       	vmovdqa 0x10(%rbx),%xmm2
   b3709:	c5 f1 eb da          	vpor   %xmm2,%xmm1,%xmm3
   b370d:	c4 e2 79 17 d8       	vptest %xmm0,%xmm3
   b3712:	75 5c                	jne    b3770 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xf0>
   b3714:	48 83 c3 20          	add    $0x20,%rbx
   b3718:	48 3b d8             	cmp    %rax,%rbx
   b371b:	76 e3                	jbe    b3700 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x80>
   b371d:	40 f6 c6 10          	test   $0x10,%sil
   b3721:	74 13                	je     b3736 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xb6>
   b3723:	c5 f9 6f 0b          	vmovdqa (%rbx),%xmm1
   b3727:	c4 e2 79 17 0d 90 13 	vptest 0xd1390(%rip),%xmm1        # 184ac0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b372e:	0d 00 
   b3730:	75 51                	jne    b3783 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b3732:	48 83 c3 10          	add    $0x10,%rbx
   b3736:	40 0f b6 c6          	movzbl %sil,%eax
   b373a:	a8 0f                	test   $0xf,%al
   b373c:	74 24                	je     b3762 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b373e:	48 8b c6             	mov    %rsi,%rax
   b3741:	48 83 e0 0f          	and    $0xf,%rax
   b3745:	48 03 c3             	add    %rbx,%rax
   b3748:	48 8b d8             	mov    %rax,%rbx
   b374b:	48 83 eb 10          	sub    $0x10,%rbx
   b374f:	c5 f8 10 0b          	vmovups (%rbx),%xmm1
   b3753:	c4 e2 79 17 0d 64 13 	vptest 0xd1364(%rip),%xmm1        # 184ac0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b375a:	0d 00 
   b375c:	75 25                	jne    b3783 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b375e:	48 83 c3 10          	add    $0x10,%rbx
   b3762:	48 8b c3             	mov    %rbx,%rax
   b3765:	49 2b c7             	sub    %r15,%rax
   b3768:	48 d1 e8             	shr    $1,%rax
   b376b:	5b                   	pop    %rbx
   b376c:	41 5f                	pop    %r15
   b376e:	5d                   	pop    %rbp
   b376f:	c3                   	ret
   b3770:	c4 e2 79 17 0d 47 13 	vptest 0xd1347(%rip),%xmm1        # 184ac0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2>
   b3777:	0d 00 
   b3779:	75 08                	jne    b3783 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x103>
   b377b:	48 83 c3 10          	add    $0x10,%rbx
   b377f:	c5 f8 28 ca          	vmovaps %xmm2,%xmm1
   b3783:	c5 f1 dd 05 45 13 0d 	vpaddusw 0xd1345(%rip),%xmm1,%xmm0        # 184ad0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x10>
   b378a:	00 
   b378b:	c5 f9 d7 f8          	vpmovmskb %xmm0,%edi
   b378f:	81 e7 aa aa 00 00    	and    $0xaaaa,%edi
   b3795:	33 f6                	xor    %esi,%esi
   b3797:	f3 0f bc f7          	tzcnt  %edi,%esi
   b379b:	8b fe                	mov    %esi,%edi
   b379d:	48 8d 5c 3b ff       	lea    -0x1(%rbx,%rdi,1),%rbx
   b37a2:	eb be                	jmp    b3762 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b37a4:	e8 37 03 00 00       	call   b3ae0 <S_P_CoreLib_System_Text_Latin1Utility__FirstCharInUInt32IsLatin1>
   b37a9:	85 c0                	test   %eax,%eax
   b37ab:	74 b5                	je     b3762 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b37ad:	48 83 c3 02          	add    $0x2,%rbx
   b37b1:	eb af                	jmp    b3762 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b37b3:	40 f6 c6 04          	test   $0x4,%sil
   b37b7:	74 2a                	je     b37e3 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x163>
   b37b9:	49 8b 3f             	mov    (%r15),%rdi
   b37bc:	48 b8 00 ff 00 ff 00 	movabs $0xff00ff00ff00ff00,%rax
   b37c3:	ff 00 ff 
   b37c6:	48 23 f8             	and    %rax,%rdi
   b37c9:	74 14                	je     b37df <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x15f>
   b37cb:	33 db                	xor    %ebx,%ebx
   b37cd:	f3 48 0f bc df       	tzcnt  %rdi,%rbx
   b37d2:	48 c1 eb 03          	shr    $0x3,%rbx
   b37d6:	48 83 e3 fe          	and    $0xfffffffffffffffe,%rbx
   b37da:	49 03 df             	add    %r15,%rbx
   b37dd:	eb 83                	jmp    b3762 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b37df:	49 8d 5f 08          	lea    0x8(%r15),%rbx
   b37e3:	40 f6 c6 02          	test   $0x2,%sil
   b37e7:	74 0e                	je     b37f7 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x177>
   b37e9:	8b 3b                	mov    (%rbx),%edi
   b37eb:	f7 c7 00 ff 00 ff    	test   $0xff00ff00,%edi
   b37f1:	75 b1                	jne    b37a4 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x124>
   b37f3:	48 83 c3 04          	add    $0x4,%rbx
   b37f7:	40 f6 c6 01          	test   $0x1,%sil
   b37fb:	0f 84 61 ff ff ff    	je     b3762 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b3801:	66 81 3b ff 00       	cmpw   $0xff,(%rbx)
   b3806:	0f 87 56 ff ff ff    	ja     b3762 <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0xe2>
   b380c:	eb 9f                	jmp    b37ad <S_P_CoreLib_System_Text_Latin1Utility__GetIndexOfFirstNonLatin1Char_Sse2+0x12d>
   b380e:	90                   	nop
   b380f:	90                   	nop
   b3810:	90                   	nop
   b3811:	90                   	nop
   b3812:	90                   	nop
   b3813:	90                   	nop
   b3814:	90                   	nop
   b3815:	90                   	nop
   b3816:	90                   	nop
   b3817:	90                   	nop
   b3818:	90                   	nop
   b3819:	90                   	nop
   b381a:	90                   	nop
   b381b:	90                   	nop
   b381c:	90                   	nop
   b381d:	90                   	nop
   b381e:	90                   	nop
   b381f:	90                   	nop

00000000000b3820 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1>:
   b3820:	55                   	push   %rbp
   b3821:	41 57                	push   %r15
   b3823:	41 56                	push   %r14
   b3825:	41 55                	push   %r13
   b3827:	41 54                	push   %r12
   b3829:	53                   	push   %rbx
   b382a:	50                   	push   %rax
   b382b:	c5 f8 77             	vzeroupper
   b382e:	48 8d 6c 24 30       	lea    0x30(%rsp),%rbp
   b3833:	48 8b df             	mov    %rdi,%rbx
   b3836:	4c 8b fe             	mov    %rsi,%r15
   b3839:	4c 8b f2             	mov    %rdx,%r14
   b383c:	45 33 ed             	xor    %r13d,%r13d
   b383f:	49 83 fe 20          	cmp    $0x20,%r14
   b3843:	72 27                	jb     b386c <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0x4c>
   b3845:	4c 8b 23             	mov    (%rbx),%r12
   b3848:	48 bf 00 ff 00 ff 00 	movabs $0xff00ff00ff00ff00,%rdi
   b384f:	ff 00 ff 
   b3852:	4c 85 e7             	test   %r12,%rdi
   b3855:	0f 85 a3 00 00 00    	jne    b38fe <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0xde>
   b385b:	48 8b fb             	mov    %rbx,%rdi
   b385e:	49 8b f7             	mov    %r15,%rsi
   b3861:	49 8b d6             	mov    %r14,%rdx
   b3864:	e8 d7 00 00 00       	call   b3940 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2>
   b3869:	4c 8b e8             	mov    %rax,%r13
   b386c:	4d 2b f5             	sub    %r13,%r14
   b386f:	49 83 fe 04          	cmp    $0x4,%r14
   b3873:	72 36                	jb     b38ab <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0x8b>
   b3875:	4b 8d 44 35 fc       	lea    -0x4(%r13,%r14,1),%rax
   b387a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   b3880:	4e 8b 24 6b          	mov    (%rbx,%r13,2),%r12
   b3884:	48 bf 00 ff 00 ff 00 	movabs $0xff00ff00ff00ff00,%rdi
   b388b:	ff 00 ff 
   b388e:	4c 85 e7             	test   %r12,%rdi
   b3891:	75 6b                	jne    b38fe <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0xde>
   b3893:	c4 c1 f9 6e c4       	vmovq  %r12,%xmm0
   b3898:	c5 f9 67 c0          	vpackuswb %xmm0,%xmm0,%xmm0
   b389c:	c4 81 79 7e 04 2f    	vmovd  %xmm0,(%r15,%r13,1)
   b38a2:	49 83 c5 04          	add    $0x4,%r13
   b38a6:	4c 3b e8             	cmp    %rax,%r13
   b38a9:	76 d5                	jbe    b3880 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0x60>
   b38ab:	41 f6 c6 02          	test   $0x2,%r14b
   b38af:	74 20                	je     b38d1 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0xb1>
   b38b1:	46 8b 24 6b          	mov    (%rbx,%r13,2),%r12d
   b38b5:	41 f7 c4 00 ff 00 ff 	test   $0xff00ff00,%r12d
   b38bc:	75 67                	jne    b3925 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0x105>
   b38be:	4b 8d 04 2f          	lea    (%r15,%r13,1),%rax
   b38c2:	44 88 20             	mov    %r12b,(%rax)
   b38c5:	41 c1 ec 10          	shr    $0x10,%r12d
   b38c9:	44 88 60 01          	mov    %r12b,0x1(%rax)
   b38cd:	49 83 c5 02          	add    $0x2,%r13
   b38d1:	41 f6 c6 01          	test   $0x1,%r14b
   b38d5:	74 15                	je     b38ec <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0xcc>
   b38d7:	46 0f b7 24 6b       	movzwl (%rbx,%r13,2),%r12d
   b38dc:	41 81 fc ff 00 00 00 	cmp    $0xff,%r12d
   b38e3:	77 07                	ja     b38ec <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0xcc>
   b38e5:	47 88 24 2f          	mov    %r12b,(%r15,%r13,1)
   b38e9:	49 ff c5             	inc    %r13
   b38ec:	49 8b c5             	mov    %r13,%rax
   b38ef:	48 83 c4 08          	add    $0x8,%rsp
   b38f3:	5b                   	pop    %rbx
   b38f4:	41 5c                	pop    %r12
   b38f6:	41 5d                	pop    %r13
   b38f8:	41 5e                	pop    %r14
   b38fa:	41 5f                	pop    %r15
   b38fc:	5d                   	pop    %rbp
   b38fd:	c3                   	ret
   b38fe:	41 8b dc             	mov    %r12d,%ebx
   b3901:	f7 c3 00 ff 00 ff    	test   $0xff00ff00,%ebx
   b3907:	75 2a                	jne    b3933 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0x113>
   b3909:	4b 8d 3c 2f          	lea    (%r15,%r13,1),%rdi
   b390d:	88 1f                	mov    %bl,(%rdi)
   b390f:	8b c3                	mov    %ebx,%eax
   b3911:	c1 e8 10             	shr    $0x10,%eax
   b3914:	88 47 01             	mov    %al,0x1(%rdi)
   b3917:	49 c1 ec 20          	shr    $0x20,%r12
   b391b:	41 8b dc             	mov    %r12d,%ebx
   b391e:	49 83 c5 02          	add    $0x2,%r13
   b3922:	44 8b e3             	mov    %ebx,%r12d
   b3925:	41 8b fc             	mov    %r12d,%edi
   b3928:	e8 b3 01 00 00       	call   b3ae0 <S_P_CoreLib_System_Text_Latin1Utility__FirstCharInUInt32IsLatin1>
   b392d:	85 c0                	test   %eax,%eax
   b392f:	74 bb                	je     b38ec <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0xcc>
   b3931:	eb b2                	jmp    b38e5 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0xc5>
   b3933:	44 8b e3             	mov    %ebx,%r12d
   b3936:	eb ed                	jmp    b3925 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1+0x105>
   b3938:	90                   	nop
   b3939:	90                   	nop
   b393a:	90                   	nop
   b393b:	90                   	nop
   b393c:	90                   	nop
   b393d:	90                   	nop
   b393e:	90                   	nop
   b393f:	90                   	nop

00000000000b3940 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2>:
   b3940:	55                   	push   %rbp
   b3941:	c5 f8 77             	vzeroupper
   b3944:	48 8b ec             	mov    %rsp,%rbp
   b3947:	c5 f8 10 07          	vmovups (%rdi),%xmm0
   b394b:	c4 e2 79 17 05 8c 11 	vptest 0xd118c(%rip),%xmm0        # 184ae0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2>
   b3952:	0d 00 
   b3954:	74 04                	je     b395a <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2+0x1a>
   b3956:	33 c0                	xor    %eax,%eax
   b3958:	5d                   	pop    %rbp
   b3959:	c3                   	ret
   b395a:	c5 f9 67 c0          	vpackuswb %xmm0,%xmm0,%xmm0
   b395e:	c5 f9 d6 06          	vmovq  %xmm0,(%rsi)
   b3962:	b8 08 00 00 00       	mov    $0x8,%eax
   b3967:	40 f6 c6 08          	test   $0x8,%sil
   b396b:	75 19                	jne    b3986 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2+0x46>
   b396d:	c5 f8 10 47 10       	vmovups 0x10(%rdi),%xmm0
   b3972:	c4 e2 79 17 05 65 11 	vptest 0xd1165(%rip),%xmm0        # 184ae0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2>
   b3979:	0d 00 
   b397b:	75 4f                	jne    b39cc <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2+0x8c>
   b397d:	c5 f9 67 c0          	vpackuswb %xmm0,%xmm0,%xmm0
   b3981:	c5 f9 d6 46 08       	vmovq  %xmm0,0x8(%rsi)
   b3986:	48 8b c6             	mov    %rsi,%rax
   b3989:	48 83 e0 0f          	and    $0xf,%rax
   b398d:	b9 10 00 00 00       	mov    $0x10,%ecx
   b3992:	48 2b c8             	sub    %rax,%rcx
   b3995:	48 8b c1             	mov    %rcx,%rax
   b3998:	48 83 ea 10          	sub    $0x10,%rdx
   b399c:	0f 1f 40 00          	nopl   0x0(%rax)
   b39a0:	c5 f8 10 04 47       	vmovups (%rdi,%rax,2),%xmm0
   b39a5:	c5 f8 10 4c 47 10    	vmovups 0x10(%rdi,%rax,2),%xmm1
   b39ab:	c5 f9 eb d1          	vpor   %xmm1,%xmm0,%xmm2
   b39af:	c4 e2 79 17 15 28 11 	vptest 0xd1128(%rip),%xmm2        # 184ae0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2>
   b39b6:	0d 00 
   b39b8:	75 14                	jne    b39ce <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2+0x8e>
   b39ba:	c5 f9 67 c1          	vpackuswb %xmm1,%xmm0,%xmm0
   b39be:	c5 f9 7f 04 06       	vmovdqa %xmm0,(%rsi,%rax,1)
   b39c3:	48 83 c0 10          	add    $0x10,%rax
   b39c7:	48 3b c2             	cmp    %rdx,%rax
   b39ca:	76 d4                	jbe    b39a0 <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2+0x60>
   b39cc:	5d                   	pop    %rbp
   b39cd:	c3                   	ret
   b39ce:	c4 e2 79 17 05 09 11 	vptest 0xd1109(%rip),%xmm0        # 184ae0 <__readonlydata_S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2>
   b39d5:	0d 00 
   b39d7:	75 f3                	jne    b39cc <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2+0x8c>
   b39d9:	c5 f9 67 c0          	vpackuswb %xmm0,%xmm0,%xmm0
   b39dd:	c5 f9 d6 04 06       	vmovq  %xmm0,(%rsi,%rax,1)
   b39e2:	48 83 c0 08          	add    $0x8,%rax
   b39e6:	eb e4                	jmp    b39cc <S_P_CoreLib_System_Text_Latin1Utility__NarrowUtf16ToLatin1_Sse2+0x8c>
   b39e8:	90                   	nop
   b39e9:	90                   	nop
   b39ea:	90                   	nop
   b39eb:	90                   	nop
   b39ec:	90                   	nop
   b39ed:	90                   	nop
   b39ee:	90                   	nop
   b39ef:	90                   	nop

00000000000b39f0 <S_P_CoreLib_System_Text_Latin1Utility__WidenLatin1ToUtf16>:
   b39f0:	e9 0b 00 00 00       	jmp    b3a00 <S_P_CoreLib_System_Text_Latin1Utility__WidenLatin1ToUtf16_Sse2>
   b39f5:	90                   	nop
   b39f6:	90                   	nop
   b39f7:	90                   	nop
   b39f8:	90                   	nop
   b39f9:	90                   	nop
   b39fa:	90                   	nop
   b39fb:	90                   	nop
   b39fc:	90                   	nop
   b39fd:	90                   	nop
   b39fe:	90                   	nop
   b39ff:	90                   	nop

00000000000b3a00 <S_P_CoreLib_System_Text_Latin1Utility__WidenLatin1ToUtf16_Sse2>:
   b3a00:	55                   	push   %rbp
   b3a01:	c5 f8 77             	vzeroupper
   b3a04:	48 8b ec             	mov    %rsp,%rbp
   b3a07:	33 c0                	xor    %eax,%eax
   b3a09:	48 83 fa 10          	cmp    $0x10,%rdx
   b3a0d:	72 60                	jb     b3a6f <S_P_CoreLib_System_Text_Latin1Utility__WidenLatin1ToUtf16_Sse2+0x6f>
   b3a0f:	c5 fa 7e 07          	vmovq  (%rdi),%xmm0
   b3a13:	c5 f0 57 c9          	vxorps %xmm1,%xmm1,%xmm1
   b3a17:	c5 f9 60 c1          	vpunpcklbw %xmm1,%xmm0,%xmm0
   b3a1b:	c5 f8 11 06          	vmovups %xmm0,(%rsi)
   b3a1f:	48 8b c6             	mov    %rsi,%rax
   b3a22:	48 d1 e8             	shr    $1,%rax
--
   b8ae2:	e8 f9 4b ff ff       	call   ad6e0 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiChar_Vector>
   b8ae7:	8b c8                	mov    %eax,%ecx
   b8ae9:	48 8d 1c 4b          	lea    (%rbx,%rcx,2),%rbx
   b8aed:	44 2b f8             	sub    %eax,%r15d
   b8af0:	75 15                	jne    b8b07 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x47>
   b8af2:	33 c0                	xor    %eax,%eax
   b8af4:	49 89 06             	mov    %rax,(%r14)
   b8af7:	41 89 45 00          	mov    %eax,0x0(%r13)
   b8afb:	48 8b c3             	mov    %rbx,%rax
   b8afe:	5b                   	pop    %rbx
   b8aff:	41 5d                	pop    %r13
   b8b01:	41 5e                	pop    %r14
   b8b03:	41 5f                	pop    %r15
   b8b05:	5d                   	pop    %rbp
   b8b06:	c3                   	ret
   b8b07:	33 c0                	xor    %eax,%eax
   b8b09:	33 c9                	xor    %ecx,%ecx
   b8b0b:	41 8b d7             	mov    %r15d,%edx
   b8b0e:	48 8d 14 53          	lea    (%rbx,%rdx,2),%rdx
   b8b12:	41 83 ff 08          	cmp    $0x8,%r15d
   b8b16:	0f 8c aa 00 00 00    	jl     b8bc6 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x106>
   b8b1c:	c5 f8 10 05 cc bf 0c 	vmovups 0xcbfcc(%rip),%xmm0        # 184af0 <__readonlydata_S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar>
   b8b23:	00 
   b8b24:	c5 f8 10 0d d4 bf 0c 	vmovups 0xcbfd4(%rip),%xmm1        # 184b00 <__readonlydata_S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x10>
   b8b2b:	00 
   b8b2c:	c5 f8 10 15 dc bf 0c 	vmovups 0xcbfdc(%rip),%xmm2        # 184b10 <__readonlydata_S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x20>
   b8b33:	00 
   b8b34:	48 8d 7a f0          	lea    -0x10(%rdx),%rdi
   b8b38:	c5 f8 10 1b          	vmovups (%rbx),%xmm3
   b8b3c:	48 83 c3 10          	add    $0x10,%rbx
   b8b40:	c4 e2 61 3a e0       	vpminuw %xmm0,%xmm3,%xmm4
   b8b45:	c5 e1 dd e9          	vpaddusw %xmm1,%xmm3,%xmm5
   b8b49:	c5 d9 eb e5          	vpor   %xmm5,%xmm4,%xmm4
   b8b4d:	c5 f9 d7 f4          	vpmovmskb %xmm4,%esi
   b8b51:	f3 0f b8 f6          	popcnt %esi,%esi
   b8b55:	c5 e1 fd e2          	vpaddw %xmm2,%xmm3,%xmm4
   b8b59:	c5 f1 65 e4          	vpcmpgtw %xmm4,%xmm1,%xmm4
   b8b5d:	c5 79 d7 c4          	vpmovmskb %xmm4,%r8d
   b8b61:	41 81 f8 ff ff 00 00 	cmp    $0xffff,%r8d
   b8b68:	75 0a                	jne    b8b74 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0xb4>
   b8b6a:	48 03 c6             	add    %rsi,%rax
   b8b6d:	48 3b df             	cmp    %rdi,%rbx
   b8b70:	76 c6                	jbe    b8b38 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x78>
   b8b72:	eb 52                	jmp    b8bc6 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x106>
   b8b74:	41 f7 d0             	not    %r8d
   b8b77:	c5 e1 71 d3 03       	vpsrlw $0x3,%xmm3,%xmm3
   b8b7c:	c5 79 d7 cb          	vpmovmskb %xmm3,%r9d
   b8b80:	45 8b d1             	mov    %r9d,%r10d
   b8b83:	45 23 d0             	and    %r8d,%r10d
   b8b86:	41 81 f1 55 55 00 00 	xor    $0x5555,%r9d
   b8b8d:	45 23 c1             	and    %r9d,%r8d
   b8b90:	41 c1 e0 02          	shl    $0x2,%r8d
   b8b94:	45 0f b7 c8          	movzwl %r8w,%r9d
   b8b98:	45 3b ca             	cmp    %r10d,%r9d
   b8b9b:	75 25                	jne    b8bc2 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x102>
   b8b9d:	41 81 f8 ff ff 00 00 	cmp    $0xffff,%r8d
   b8ba4:	76 0c                	jbe    b8bb2 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0xf2>
   b8ba6:	45 0f b7 c0          	movzwl %r8w,%r8d
   b8baa:	48 83 c6 fe          	add    $0xfffffffffffffffe,%rsi
   b8bae:	48 83 c3 fe          	add    $0xfffffffffffffffe,%rbx
   b8bb2:	f3 45 0f b8 c0       	popcnt %r8d,%r8d
   b8bb7:	41 2b c8             	sub    %r8d,%ecx
   b8bba:	49 2b c0             	sub    %r8,%rax
   b8bbd:	49 2b c0             	sub    %r8,%rax
   b8bc0:	eb a8                	jmp    b8b6a <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0xaa>
   b8bc2:	48 83 c3 f0          	add    $0xfffffffffffffff0,%rbx
   b8bc6:	48 3b da             	cmp    %rdx,%rbx
   b8bc9:	73 55                	jae    b8c20 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x160>
   b8bcb:	0f b7 3b             	movzwl (%rbx),%edi
   b8bce:	83 ff 7f             	cmp    $0x7f,%edi
   b8bd1:	76 44                	jbe    b8c17 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x157>
   b8bd3:	8d b7 00 f8 01 00    	lea    0x1f800(%rdi),%esi
   b8bd9:	c1 ee 10             	shr    $0x10,%esi
   b8bdc:	48 03 c6             	add    %rsi,%rax
   b8bdf:	81 c7 00 28 ff ff    	add    $0xffff2800,%edi
   b8be5:	81 ff ff 07 00 00    	cmp    $0x7ff,%edi
   b8beb:	77 2a                	ja     b8c17 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x157>
   b8bed:	48 83 c0 fe          	add    $0xfffffffffffffffe,%rax
   b8bf1:	48 8b fa             	mov    %rdx,%rdi
   b8bf4:	48 2b fb             	sub    %rbx,%rdi
   b8bf7:	48 83 ff 04          	cmp    $0x4,%rdi
   b8bfb:	72 23                	jb     b8c20 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x160>
   b8bfd:	8b 3b                	mov    (%rbx),%edi
   b8bff:	81 c7 00 28 ff 23    	add    $0x23ff2800,%edi
   b8c05:	f7 c7 00 fc 00 fc    	test   $0xfc00fc00,%edi
   b8c0b:	75 13                	jne    b8c20 <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x160>
   b8c0d:	ff c9                	dec    %ecx
   b8c0f:	48 83 c0 02          	add    $0x2,%rax
   b8c13:	48 83 c3 02          	add    $0x2,%rbx
   b8c17:	48 83 c3 02          	add    $0x2,%rbx
   b8c1b:	48 3b da             	cmp    %rdx,%rbx
   b8c1e:	72 ab                	jb     b8bcb <S_P_CoreLib_System_Text_Unicode_Utf16Utility__GetPointerToFirstInvalidChar+0x10b>
   b8c20:	49 89 06             	mov    %rax,(%r14)
   b8c23:	41 89 4d 00          	mov    %ecx,0x0(%r13)
   b8c27:	48 8b c3             	mov    %rbx,%rax
   b8c2a:	5b                   	pop    %rbx
   b8c2b:	41 5d                	pop    %r13
   b8c2d:	41 5e                	pop    %r14
   b8c2f:	41 5f                	pop    %r15
   b8c31:	5d                   	pop    %rbp
   b8c32:	c3                   	ret
   b8c33:	90                   	nop
   b8c34:	90                   	nop
   b8c35:	90                   	nop
   b8c36:	90                   	nop
   b8c37:	90                   	nop
   b8c38:	90                   	nop
   b8c39:	90                   	nop
   b8c3a:	90                   	nop
   b8c3b:	90                   	nop
   b8c3c:	90                   	nop
   b8c3d:	90                   	nop
   b8c3e:	90                   	nop
   b8c3f:	90                   	nop

00000000000b8c40 <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16>:
   b8c40:	55                   	push   %rbp
   b8c41:	41 57                	push   %r15
   b8c43:	41 56                	push   %r14
   b8c45:	41 55                	push   %r13
   b8c47:	41 54                	push   %r12
   b8c49:	53                   	push   %rbx
   b8c4a:	48 83 ec 48          	sub    $0x48,%rsp
   b8c4e:	48 8d 6c 24 70       	lea    0x70(%rsp),%rbp
   b8c53:	4c 89 4d 90          	mov    %r9,-0x70(%rbp)
   b8c57:	48 8b df             	mov    %rdi,%rbx
   b8c5a:	44 8b f6             	mov    %esi,%r14d
   b8c5d:	4c 8b fa             	mov    %rdx,%r15
   b8c60:	44 8b e9             	mov    %ecx,%r13d
   b8c63:	4d 8b e0             	mov    %r8,%r12
   b8c66:	48 89 5d c8          	mov    %rbx,-0x38(%rbp)
   b8c6a:	48 8b cb             	mov    %rbx,%rcx
   b8c6d:	48 89 4d d0          	mov    %rcx,-0x30(%rbp)
   b8c71:	4c 89 7d b8          	mov    %r15,-0x48(%rbp)
   b8c75:	4d 8b c7             	mov    %r15,%r8
   b8c78:	4c 89 45 c0          	mov    %r8,-0x40(%rbp)
   b8c7c:	45 33 c9             	xor    %r9d,%r9d
   b8c7f:	48 89 4d b0          	mov    %rcx,-0x50(%rbp)
   b8c83:	4c 89 45 a8          	mov    %r8,-0x58(%rbp)
   b8c87:	45 85 f6             	test   %r14d,%r14d
   b8c8a:	0f 84 f2 00 00 00    	je     b8d82 <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x142>
   b8c90:	48 8b fb             	mov    %rbx,%rdi
   b8c93:	41 8b f6             	mov    %r14d,%esi
   b8c96:	49 8b d7             	mov    %r15,%rdx
   b8c99:	4c 8d 4d a8          	lea    -0x58(%rbp),%r9
   b8c9d:	4c 8d 45 b0          	lea    -0x50(%rbp),%r8
   b8ca1:	41 8b cd             	mov    %r13d,%ecx
   b8ca4:	e8 37 01 00 00       	call   b8de0 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__TranscodeToUtf16>
   b8ca9:	44 8b c8             	mov    %eax,%r9d
   b8cac:	41 83 f9 01          	cmp    $0x1,%r9d
   b8cb0:	0f 8e cc 00 00 00    	jle    b8d82 <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x142>
   b8cb6:	41 83 f9 02          	cmp    $0x2,%r9d
   b8cba:	75 0a                	jne    b8cc6 <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x86>
   b8cbc:	80 7d 18 00          	cmpb   $0x0,0x18(%rbp)
   b8cc0:	0f 84 bc 00 00 00    	je     b8d82 <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x142>
   b8cc6:	80 7d 10 00          	cmpb   $0x0,0x10(%rbp)
   b8cca:	0f 84 a4 00 00 00    	je     b8d74 <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x134>
   b8cd0:	48 8b 7d a8          	mov    -0x58(%rbp),%rdi
   b8cd4:	49 8b f7             	mov    %r15,%rsi
   b8cd7:	48 2b fe             	sub    %rsi,%rdi
   b8cda:	48 8b f7             	mov    %rdi,%rsi
   b8cdd:	48 c1 ee 3f          	shr    $0x3f,%rsi
   b8ce1:	48 03 fe             	add    %rsi,%rdi
   b8ce4:	48 d1 ff             	sar    $1,%rdi
   b8ce7:	41 3b fd             	cmp    %r13d,%edi
   b8cea:	0f 87 cb 00 00 00    	ja     b8dbb <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x17b>
   b8cf0:	8b f7                	mov    %edi,%esi
   b8cf2:	4d 8d 3c 77          	lea    (%r15,%rsi,2),%r15
   b8cf6:	44 2b ef             	sub    %edi,%r13d
   b8cf9:	0f 84 7d 00 00 00    	je     b8d7c <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x13c>
   b8cff:	66 41 c7 07 fd ff    	movw   $0xfffd,(%r15)
   b8d05:	41 83 fd 01          	cmp    $0x1,%r13d
   b8d09:	0f 82 ac 00 00 00    	jb     b8dbb <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x17b>
   b8d0f:	49 83 c7 02          	add    $0x2,%r15
   b8d13:	41 ff cd             	dec    %r13d
   b8d16:	48 8b 7d b0          	mov    -0x50(%rbp),%rdi
   b8d1a:	48 8b f3             	mov    %rbx,%rsi
   b8d1d:	2b fe                	sub    %esi,%edi
   b8d1f:	41 3b fe             	cmp    %r14d,%edi
   b8d22:	0f 87 93 00 00 00    	ja     b8dbb <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x17b>
   b8d28:	8b f7                	mov    %edi,%esi
   b8d2a:	48 03 de             	add    %rsi,%rbx
   b8d2d:	41 8b f6             	mov    %r14d,%esi
   b8d30:	2b f7                	sub    %edi,%esi
   b8d32:	44 8b f6             	mov    %esi,%r14d
   b8d35:	48 8b fb             	mov    %rbx,%rdi
   b8d38:	48 8d 55 98          	lea    -0x68(%rbp),%rdx
   b8d3c:	48 8d 4d a0          	lea    -0x60(%rbp),%rcx
   b8d40:	e8 4b ae ff ff       	call   b3b90 <S_P_CoreLib_System_Text_Rune__DecodeFromUtf8>
   b8d45:	8b 45 a0             	mov    -0x60(%rbp),%eax
   b8d48:	41 3b c6             	cmp    %r14d,%eax
   b8d4b:	77 6e                	ja     b8dbb <S_P_CoreLib_System_Text_Unicode_Utf8__ToUtf16+0x17b>
   b8d4d:	8b c8                	mov    %eax,%ecx
   b8d4f:	48 03 cb             	add    %rbx,%rcx
   b8d52:	48 8b d9             	mov    %rcx,%rbx
   b8d55:	44 2b f0             	sub    %eax,%r14d
   b8d58:	45 33 c9             	xor    %r9d,%r9d
   b8d5b:	48 8b c3             	mov    %rbx,%rax
   b8d5e:	48 89 45 b0          	mov    %rax,-0x50(%rbp)
   b8d62:	49 8b c7             	mov    %r15,%rax
   b8d65:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
--
   b9a42:	e8 19 3b ff ff       	call   ad560 <S_P_CoreLib_System_Text_Ascii__GetIndexOfFirstNonAsciiByte_Vector>
   b9a47:	48 03 d8             	add    %rax,%rbx
   b9a4a:	44 2b f8             	sub    %eax,%r15d
   b9a4d:	75 15                	jne    b9a64 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x44>
   b9a4f:	33 c0                	xor    %eax,%eax
   b9a51:	41 89 06             	mov    %eax,(%r14)
   b9a54:	41 89 45 00          	mov    %eax,0x0(%r13)
   b9a58:	48 8b c3             	mov    %rbx,%rax
   b9a5b:	5b                   	pop    %rbx
   b9a5c:	41 5d                	pop    %r13
   b9a5e:	41 5e                	pop    %r14
   b9a60:	41 5f                	pop    %r15
   b9a62:	5d                   	pop    %rbp
   b9a63:	c3                   	ret
   b9a64:	33 c0                	xor    %eax,%eax
   b9a66:	33 c9                	xor    %ecx,%ecx
   b9a68:	41 83 ff 04          	cmp    $0x4,%r15d
   b9a6c:	0f 8c 1f 03 00 00    	jl     b9d91 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x371>
   b9a72:	41 8b d7             	mov    %r15d,%edx
   b9a75:	48 8d 54 13 fc       	lea    -0x4(%rbx,%rdx,1),%rdx
   b9a7a:	48 3b da             	cmp    %rdx,%rbx
   b9a7d:	0f 87 13 03 00 00    	ja     b9d96 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x376>
   b9a83:	48 8d 7a f4          	lea    -0xc(%rdx),%rdi
   b9a87:	8b 33                	mov    (%rbx),%esi
   b9a89:	f7 c6 80 80 80 80    	test   $0x80808080,%esi
   b9a8f:	75 5f                	jne    b9af0 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0xd0>
   b9a91:	48 83 c3 04          	add    $0x4,%rbx
   b9a95:	48 8b f2             	mov    %rdx,%rsi
   b9a98:	48 2b f3             	sub    %rbx,%rsi
   b9a9b:	48 83 fe 10          	cmp    $0x10,%rsi
   b9a9f:	0f 8c e1 02 00 00    	jl     b9d86 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x366>
   b9aa5:	8b 33                	mov    (%rbx),%esi
   b9aa7:	f7 c6 80 80 80 80    	test   $0x80808080,%esi
   b9aad:	75 41                	jne    b9af0 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0xd0>
   b9aaf:	48 83 c3 04          	add    $0x4,%rbx
   b9ab3:	48 83 e3 fc          	and    $0xfffffffffffffffc,%rbx
   b9ab7:	48 8b f7             	mov    %rdi,%rsi
   b9aba:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
   b9ac0:	c5 f8 10 03          	vmovups (%rbx),%xmm0
   b9ac4:	c5 79 d7 c0          	vpmovmskb %xmm0,%r8d
   b9ac8:	45 85 c0             	test   %r8d,%r8d
   b9acb:	75 0e                	jne    b9adb <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0xbb>
   b9acd:	48 83 c3 10          	add    $0x10,%rbx
   b9ad1:	48 3b de             	cmp    %rsi,%rbx
   b9ad4:	76 ea                	jbe    b9ac0 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0xa0>
   b9ad6:	e9 ab 02 00 00       	jmp    b9d86 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x366>
   b9adb:	33 f6                	xor    %esi,%esi
   b9add:	f3 41 0f bc f0       	tzcnt  %r8d,%esi
   b9ae2:	48 03 de             	add    %rsi,%rbx
   b9ae5:	48 3b da             	cmp    %rdx,%rbx
   b9ae8:	0f 87 a8 02 00 00    	ja     b9d96 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x376>
   b9aee:	eb 19                	jmp    b9b09 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0xe9>
   b9af0:	81 e6 80 80 80 80    	and    $0x80808080,%esi
   b9af6:	f3 0f bc f6          	tzcnt  %esi,%esi
   b9afa:	c1 ee 03             	shr    $0x3,%esi
   b9afd:	48 03 de             	add    %rsi,%rbx
   b9b00:	48 3b d3             	cmp    %rbx,%rdx
   b9b03:	0f 82 8d 02 00 00    	jb     b9d96 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x376>
   b9b09:	8b 33                	mov    (%rbx),%esi
   b9b0b:	81 c6 40 7f ff ff    	add    $0xffff7f40,%esi
   b9b11:	f7 c6 e0 c0 00 00    	test   $0xc0e0,%esi
   b9b17:	0f 85 84 00 00 00    	jne    b9ba1 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x181>
   b9b1d:	40 80 fe 02          	cmp    $0x2,%sil
   b9b21:	0f 82 29 03 00 00    	jb     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9b27:	44 8b c6             	mov    %esi,%r8d
   b9b2a:	41 81 e0 00 00 ff c0 	and    $0xc0ff0000,%r8d
   b9b31:	41 81 c0 00 00 3e 7f 	add    $0x7f3e0000,%r8d
   b9b38:	41 81 f8 00 00 1d 00 	cmp    $0x1d0000,%r8d
   b9b3f:	77 2e                	ja     b9b6f <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x14f>
   b9b41:	48 83 c3 04          	add    $0x4,%rbx
   b9b45:	83 c0 fe             	add    $0xfffffffe,%eax
   b9b48:	48 3b da             	cmp    %rdx,%rbx
   b9b4b:	0f 87 45 02 00 00    	ja     b9d96 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x376>
   b9b51:	8b 33                	mov    (%rbx),%esi
   b9b53:	44 8b c6             	mov    %esi,%r8d
   b9b56:	41 81 e0 ff c0 00 00 	and    $0xc0ff,%r8d
   b9b5d:	41 81 c0 3e 7f ff ff 	add    $0xffff7f3e,%r8d
   b9b64:	41 83 f8 1d          	cmp    $0x1d,%r8d
   b9b68:	76 bd                	jbe    b9b27 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x107>
   b9b6a:	e9 1a ff ff ff       	jmp    b9a89 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x69>
   b9b6f:	ff c8                	dec    %eax
   b9b71:	f7 c6 00 00 80 00    	test   $0x800000,%esi
   b9b77:	75 1f                	jne    b9b98 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x178>
   b9b79:	85 f6                	test   %esi,%esi
   b9b7b:	7c 09                	jl     b9b86 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x166>
   b9b7d:	48 83 c3 04          	add    $0x4,%rbx
   b9b81:	e9 00 02 00 00       	jmp    b9d86 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x366>
   b9b86:	48 83 c3 03          	add    $0x3,%rbx
   b9b8a:	48 3b da             	cmp    %rdx,%rbx
   b9b8d:	0f 87 f3 01 00 00    	ja     b9d86 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x366>
   b9b93:	e9 71 ff ff ff       	jmp    b9b09 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0xe9>
   b9b98:	48 83 c3 02          	add    $0x2,%rbx
   b9b9c:	e9 e5 01 00 00       	jmp    b9d86 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x366>
   b9ba1:	81 c6 e0 ff 7f ff    	add    $0xff7fffe0,%esi
   b9ba7:	f7 c6 f0 c0 c0 00    	test   $0xc0c0f0,%esi
   b9bad:	0f 85 a3 01 00 00    	jne    b9d56 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x336>
   b9bb3:	f7 c6 0f 20 00 00    	test   $0x200f,%esi
   b9bb9:	0f 84 91 02 00 00    	je     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9bbf:	44 8d 86 f3 df ff ff 	lea    -0x200d(%rsi),%r8d
   b9bc6:	41 f7 c0 0f 20 00 00 	test   $0x200f,%r8d
   b9bcd:	0f 84 7d 02 00 00    	je     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9bd3:	c1 fe 1f             	sar    $0x1f,%esi
   b9bd6:	48 63 f6             	movslq %esi,%rsi
   b9bd9:	48 8d 5c 33 04       	lea    0x4(%rbx,%rsi,1),%rbx
   b9bde:	83 c0 fe             	add    $0xfffffffe,%eax
   b9be1:	48 8b f2             	mov    %rdx,%rsi
   b9be4:	48 2b f3             	sub    %rbx,%rsi
   b9be7:	48 83 fe 05          	cmp    $0x5,%rsi
   b9beb:	0f 8c 3c 01 00 00    	jl     b9d2d <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x30d>
   b9bf1:	48 8b 33             	mov    (%rbx),%rsi
   b9bf4:	44 8b c6             	mov    %esi,%r8d
   b9bf7:	49 b9 f0 c0 c0 f0 c0 	movabs $0xc0f0c0c0f0c0c0f0,%r9
   b9bfe:	c0 f0 c0 
   b9c01:	4c 23 ce             	and    %rsi,%r9
   b9c04:	49 ba e0 80 80 e0 80 	movabs $0x80e08080e08080e0,%r10
   b9c0b:	80 e0 80 
   b9c0e:	4d 3b ca             	cmp    %r10,%r9
   b9c11:	0f 85 8c 00 00 00    	jne    b9ca3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x283>
   b9c17:	80 7b 08 c0          	cmpb   $0xc0,0x8(%rbx)
   b9c1b:	0f 8d 82 00 00 00    	jge    b9ca3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x283>
   b9c21:	f7 c6 0f 20 00 00    	test   $0x200f,%esi
   b9c27:	0f 84 23 02 00 00    	je     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9c2d:	44 8d 8e f3 df ff ff 	lea    -0x200d(%rsi),%r9d
   b9c34:	41 f7 c1 0f 20 00 00 	test   $0x200f,%r9d
   b9c3b:	0f 84 0f 02 00 00    	je     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9c41:	48 c1 ee 18          	shr    $0x18,%rsi
   b9c45:	f7 c6 0f 20 00 00    	test   $0x200f,%esi
   b9c4b:	74 4e                	je     b9c9b <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x27b>
   b9c4d:	4c 8b ce             	mov    %rsi,%r9
   b9c50:	41 8b f0             	mov    %r8d,%esi
   b9c53:	4d 8b c1             	mov    %r9,%r8
   b9c56:	45 8d 88 f3 df ff ff 	lea    -0x200d(%r8),%r9d
   b9c5d:	41 f7 c1 0f 20 00 00 	test   $0x200f,%r9d
   b9c64:	0f 84 69 ff ff ff    	je     b9bd3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x1b3>
   b9c6a:	49 c1 e8 18          	shr    $0x18,%r8
   b9c6e:	41 f7 c0 0f 20 00 00 	test   $0x200f,%r8d
   b9c75:	0f 84 58 ff ff ff    	je     b9bd3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x1b3>
   b9c7b:	41 81 c0 f3 df ff ff 	add    $0xffffdff3,%r8d
   b9c82:	41 f7 c0 0f 20 00 00 	test   $0x200f,%r8d
   b9c89:	0f 84 44 ff ff ff    	je     b9bd3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x1b3>
   b9c8f:	48 83 c3 09          	add    $0x9,%rbx
   b9c93:	83 c0 fa             	add    $0xfffffffa,%eax
   b9c96:	e9 46 ff ff ff       	jmp    b9be1 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x1c1>
   b9c9b:	41 8b f0             	mov    %r8d,%esi
   b9c9e:	e9 30 ff ff ff       	jmp    b9bd3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x1b3>
   b9ca3:	49 b9 f0 c0 c0 f0 c0 	movabs $0xc0c0f0c0c0f0,%r9
   b9caa:	c0 00 00 
   b9cad:	4c 23 ce             	and    %rsi,%r9
   b9cb0:	49 ba e0 80 80 e0 80 	movabs $0x8080e08080e0,%r10
   b9cb7:	80 00 00 
   b9cba:	4d 3b ca             	cmp    %r10,%r9
   b9cbd:	75 53                	jne    b9d12 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x2f2>
   b9cbf:	f7 c6 0f 20 00 00    	test   $0x200f,%esi
   b9cc5:	0f 84 85 01 00 00    	je     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9ccb:	44 8d 8e f3 df ff ff 	lea    -0x200d(%rsi),%r9d
   b9cd2:	41 f7 c1 0f 20 00 00 	test   $0x200f,%r9d
   b9cd9:	0f 84 71 01 00 00    	je     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9cdf:	48 c1 ee 18          	shr    $0x18,%rsi
   b9ce3:	f7 c6 0f 20 00 00    	test   $0x200f,%esi
   b9ce9:	74 1f                	je     b9d0a <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x2ea>
   b9ceb:	4c 8b ce             	mov    %rsi,%r9
   b9cee:	41 8b f0             	mov    %r8d,%esi
   b9cf1:	4d 8b c1             	mov    %r9,%r8
   b9cf4:	41 81 c0 f3 df ff ff 	add    $0xffffdff3,%r8d
   b9cfb:	41 f7 c0 0f 20 00 00 	test   $0x200f,%r8d
   b9d02:	0f 84 cb fe ff ff    	je     b9bd3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x1b3>
   b9d08:	eb 43                	jmp    b9d4d <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x32d>
   b9d0a:	41 8b f0             	mov    %r8d,%esi
   b9d0d:	e9 c1 fe ff ff       	jmp    b9bd3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x1b3>
   b9d12:	41 8d b0 20 7f 7f ff 	lea    -0x8080e0(%r8),%esi
   b9d19:	f7 c6 f0 c0 c0 00    	test   $0xc0c0f0,%esi
   b9d1f:	41 8b f0             	mov    %r8d,%esi
   b9d22:	0f 84 8b fe ff ff    	je     b9bb3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x193>
   b9d28:	e9 5c fd ff ff       	jmp    b9a89 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x69>
   b9d2d:	48 3b da             	cmp    %rdx,%rbx
   b9d30:	77 64                	ja     b9d96 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x376>
   b9d32:	8b 33                	mov    (%rbx),%esi
   b9d34:	44 8d 86 20 7f 7f ff 	lea    -0x8080e0(%rsi),%r8d
   b9d3b:	41 f7 c0 f0 c0 c0 00 	test   $0xc0c0f0,%r8d
   b9d42:	0f 84 6b fe ff ff    	je     b9bb3 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x193>
   b9d48:	e9 3c fd ff ff       	jmp    b9a89 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x69>
   b9d4d:	48 83 c3 06          	add    $0x6,%rbx
   b9d51:	83 c0 fc             	add    $0xfffffffc,%eax
   b9d54:	eb 30                	jmp    b9d86 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x366>
   b9d56:	81 e6 ff ff c0 c0    	and    $0xc0c0ffff,%esi
   b9d5c:	81 fe ff 3f 00 80    	cmp    $0x80003fff,%esi
   b9d62:	0f 8f e8 00 00 00    	jg     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9d68:	c1 ce 08             	ror    $0x8,%esi
   b9d6b:	81 c6 f0 ff 7f ef    	add    $0xef7ffff0,%esi
   b9d71:	81 fe ff ff ff 03    	cmp    $0x3ffffff,%esi
   b9d77:	0f 87 d3 00 00 00    	ja     b9e50 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x430>
   b9d7d:	48 83 c3 04          	add    $0x4,%rbx
   b9d81:	83 c0 fe             	add    $0xfffffffe,%eax
   b9d84:	ff c9                	dec    %ecx
   b9d86:	48 3b da             	cmp    %rdx,%rbx
   b9d89:	0f 86 f8 fc ff ff    	jbe    b9a87 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x67>
   b9d8f:	eb 05                	jmp    b9d96 <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x376>
   b9d91:	41 8b ff             	mov    %r15d,%edi
   b9d94:	eb 07                	jmp    b9d9d <S_P_CoreLib_System_Text_Unicode_Utf8Utility__GetPointerToFirstInvalidByte+0x37d>
   b9d96:	48 2b d3             	sub    %rbx,%rdx
   b9d99:	48 8d 7a 04          	lea    0x4(%rdx),%rdi
