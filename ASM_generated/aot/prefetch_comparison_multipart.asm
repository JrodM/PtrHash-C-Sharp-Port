0000000000105d40 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart>:
  105d40:	55                   	push   %rbp
  105d41:	41 57                	push   %r15
  105d43:	41 56                	push   %r14
  105d45:	41 55                	push   %r13
  105d47:	41 54                	push   %r12
  105d49:	53                   	push   %rbx
  105d4a:	48 81 ec e8 00 00 00 	sub    $0xe8,%rsp
  105d51:	48 8d ac 24 10 01 00 	lea    0x110(%rsp),%rbp
  105d58:	00 
  105d59:	33 c0                	xor    %eax,%eax
  105d5b:	48 89 85 38 ff ff ff 	mov    %rax,-0xc8(%rbp)
  105d62:	45 0f 57 c0          	xorps  %xmm8,%xmm8
  105d66:	44 0f 29 85 40 ff ff 	movaps %xmm8,-0xc0(%rbp)
  105d6d:	ff 
  105d6e:	44 0f 29 85 50 ff ff 	movaps %xmm8,-0xb0(%rbp)
  105d75:	ff 
  105d76:	48 b8 a0 ff ff ff ff 	movabs $0xffffffffffffffa0,%rax
  105d7d:	ff ff ff 
  105d80:	44 0f 29 44 05 c0    	movaps %xmm8,-0x40(%rbp,%rax,1)
  105d86:	44 0f 29 44 05 d0    	movaps %xmm8,-0x30(%rbp,%rax,1)
  105d8c:	44 0f 29 44 05 e0    	movaps %xmm8,-0x20(%rbp,%rax,1)
  105d92:	48 83 c0 30          	add    $0x30,%rax
  105d96:	75 e8                	jne    105d80 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x40>
  105d98:	48 89 45 c0          	mov    %rax,-0x40(%rbp)
  105d9c:	48 8b 05 45 69 0b 00 	mov    0xb6945(%rip),%rax        # 1bc6e8 <__security_cookie>
  105da3:	48 89 85 f0 fe ff ff 	mov    %rax,-0x110(%rbp)
  105daa:	48 8b df             	mov    %rdi,%rbx
  105dad:	4c 8b f6             	mov    %rsi,%r14
  105db0:	44 8b fa             	mov    %edx,%r15d
  105db3:	4c 8b e9             	mov    %rcx,%r13
  105db6:	45 3b f8             	cmp    %r8d,%r15d
  105db9:	0f 85 89 04 00 00    	jne    106248 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x508>
  105dbf:	45 84 c9             	test   %r9b,%r9b
  105dc2:	74 12                	je     105dd6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x96>
  105dc4:	80 7b 5c 00          	cmpb   $0x0,0x5c(%rbx)
  105dc8:	74 0c                	je     105dd6 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x96>
  105dca:	33 d2                	xor    %edx,%edx
  105dcc:	48 83 7b 08 00       	cmpq   $0x0,0x8(%rbx)
  105dd1:	0f 95 c2             	setne  %dl
  105dd4:	eb 02                	jmp    105dd8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x98>
  105dd6:	33 d2                	xor    %edx,%edx
  105dd8:	44 0f b6 e2          	movzbl %dl,%r12d
  105ddc:	48 8b 43 40          	mov    0x40(%rbx),%rax
  105de0:	48 89 45 d0          	mov    %rax,-0x30(%rbp)
  105de4:	85 24 24             	test   %esp,(%rsp)
  105de7:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105dee:	48 8d 3c 24          	lea    (%rsp),%rdi
  105df2:	48 89 bd 18 ff ff ff 	mov    %rdi,-0xe8(%rbp)
  105df9:	33 f6                	xor    %esi,%esi
  105dfb:	ba 00 01 00 00       	mov    $0x100,%edx
  105e00:	e8 1b 14 f0 ff       	call   7220 <memset@plt>
  105e05:	48 8b bd 18 ff ff ff 	mov    -0xe8(%rbp),%rdi
  105e0c:	48 8b c7             	mov    %rdi,%rax
  105e0f:	48 89 85 00 ff ff ff 	mov    %rax,-0x100(%rbp)
  105e16:	85 24 24             	test   %esp,(%rsp)
  105e19:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105e20:	48 8d 3c 24          	lea    (%rsp),%rdi
  105e24:	48 89 bd 10 ff ff ff 	mov    %rdi,-0xf0(%rbp)
  105e2b:	33 f6                	xor    %esi,%esi
  105e2d:	ba 00 01 00 00       	mov    $0x100,%edx
  105e32:	e8 e9 13 f0 ff       	call   7220 <memset@plt>
  105e37:	48 8b bd 10 ff ff ff 	mov    -0xf0(%rbp),%rdi
  105e3e:	48 8b c7             	mov    %rdi,%rax
  105e41:	48 89 85 f8 fe ff ff 	mov    %rax,-0x108(%rbp)
  105e48:	85 24 24             	test   %esp,(%rsp)
  105e4b:	48 81 ec 00 01 00 00 	sub    $0x100,%rsp
  105e52:	48 8d 3c 24          	lea    (%rsp),%rdi
  105e56:	48 89 bd 08 ff ff ff 	mov    %rdi,-0xf8(%rbp)
  105e5d:	33 f6                	xor    %esi,%esi
  105e5f:	ba 00 01 00 00       	mov    $0x100,%edx
  105e64:	e8 b7 13 f0 ff       	call   7220 <memset@plt>
  105e69:	48 8b bd 08 ff ff ff 	mov    -0xf8(%rbp),%rdi
  105e70:	48 8b c7             	mov    %rdi,%rax
  105e73:	48 8b 8d 00 ff ff ff 	mov    -0x100(%rbp),%rcx
  105e7a:	48 89 4d c0          	mov    %rcx,-0x40(%rbp)
  105e7e:	48 89 4d c8          	mov    %rcx,-0x38(%rbp)
  105e82:	4c 8b 85 f8 fe ff ff 	mov    -0x108(%rbp),%r8
  105e89:	4c 89 45 b0          	mov    %r8,-0x50(%rbp)
  105e8d:	4c 89 45 b8          	mov    %r8,-0x48(%rbp)
  105e91:	48 89 45 a0          	mov    %rax,-0x60(%rbp)
  105e95:	48 89 45 a8          	mov    %rax,-0x58(%rbp)
  105e99:	41 8b d7             	mov    %r15d,%edx
  105e9c:	41 b9 20 00 00 00    	mov    $0x20,%r9d
  105ea2:	83 fa 20             	cmp    $0x20,%edx
  105ea5:	45 0f 4c cf          	cmovl  %r15d,%r9d
  105ea9:	44 89 4d 9c          	mov    %r9d,-0x64(%rbp)
  105ead:	45 33 d2             	xor    %r10d,%r10d
  105eb0:	45 85 c9             	test   %r9d,%r9d
  105eb3:	0f 8e 83 03 00 00    	jle    10623c <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4fc>
  105eb9:	44 89 55 90          	mov    %r10d,-0x70(%rbp)
  105ebd:	4d 63 da             	movslq %r10d,%r11
  105ec0:	4c 89 9d 20 ff ff ff 	mov    %r11,-0xe0(%rbp)
  105ec7:	4b 8b 14 de          	mov    (%r14,%r11,8),%rdx
  105ecb:	48 8b 7b 50          	mov    0x50(%rbx),%rdi
  105ecf:	48 c1 c7 05          	rol    $0x5,%rdi
  105ed3:	48 33 d7             	xor    %rdi,%rdx
  105ed6:	48 bf 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdi
  105edd:	c1 7c 51 
  105ee0:	48 0f af d7          	imul   %rdi,%rdx
  105ee4:	4a 89 14 d9          	mov    %rdx,(%rcx,%r11,8)
  105ee8:	4a 8b 34 d9          	mov    (%rcx,%r11,8),%rsi
  105eec:	48 8b 7b 60          	mov    0x60(%rbx),%rdi
  105ef0:	48 8d 95 60 ff ff ff 	lea    -0xa0(%rbp),%rdx
  105ef7:	e8 f4 e2 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  105efc:	48 8b b5 60 ff ff ff 	mov    -0xa0(%rbp),%rsi
  105f03:	48 89 45 88          	mov    %rax,-0x78(%rbp)
  105f07:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
  105f0b:	4c 8b 85 20 ff ff ff 	mov    -0xe0(%rbp),%r8
  105f12:	4a 89 04 c1          	mov    %rax,(%rcx,%r8,8)
  105f16:	48 8b 7b 68          	mov    0x68(%rbx),%rdi
  105f1a:	48 8d 95 58 ff ff ff 	lea    -0xa8(%rbp),%rdx
  105f21:	e8 ca e2 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  105f26:	48 8b 55 88          	mov    -0x78(%rbp),%rdx
  105f2a:	48 0f af 53 30       	imul   0x30(%rbx),%rdx
  105f2f:	48 03 d0             	add    %rax,%rdx
  105f32:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  105f36:	48 8b bd 20 ff ff ff 	mov    -0xe0(%rbp),%rdi
  105f3d:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
  105f41:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  105f45:	48 03 14 f8          	add    (%rax,%rdi,8),%rdx
  105f49:	0f 18 0a             	prefetcht0 (%rdx)
  105f4c:	44 8b 55 90          	mov    -0x70(%rbp),%r10d
  105f50:	41 ff c2             	inc    %r10d
  105f53:	8b 55 9c             	mov    -0x64(%rbp),%edx
  105f56:	44 3b d2             	cmp    %edx,%r10d
  105f59:	0f 8c d4 02 00 00    	jl     106233 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4f3>
  105f5f:	83 fa 20             	cmp    $0x20,%edx
  105f62:	0f 8d be 02 00 00    	jge    106226 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4e6>
  105f68:	48 63 fa             	movslq %edx,%rdi
  105f6b:	33 f6                	xor    %esi,%esi
  105f6d:	48 8b 4d c8          	mov    -0x38(%rbp),%rcx
  105f71:	48 89 34 f9          	mov    %rsi,(%rcx,%rdi,8)
  105f75:	48 89 34 f8          	mov    %rsi,(%rax,%rdi,8)
  105f79:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
  105f7d:	49 89 34 f8          	mov    %rsi,(%r8,%rdi,8)
  105f81:	ff c2                	inc    %edx
  105f83:	83 fa 20             	cmp    $0x20,%edx
  105f86:	0f 8c 95 02 00 00    	jl     106221 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4e1>
  105f8c:	45 33 c9             	xor    %r9d,%r9d
  105f8f:	41 8d 57 e0          	lea    -0x20(%r15),%edx
  105f93:	45 33 d2             	xor    %r10d,%r10d
  105f96:	85 d2                	test   %edx,%edx
  105f98:	44 0f 4f d2          	cmovg  %edx,%r10d
  105f9c:	44 89 55 94          	mov    %r10d,-0x6c(%rbp)
  105fa0:	45 85 d2             	test   %r10d,%r10d
  105fa3:	0f 8e 70 02 00 00    	jle    106219 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4d9>
  105fa9:	41 8b d1             	mov    %r9d,%edx
  105fac:	c1 fa 1f             	sar    $0x1f,%edx
  105faf:	83 e2 1f             	and    $0x1f,%edx
  105fb2:	41 03 d1             	add    %r9d,%edx
  105fb5:	83 e2 e0             	and    $0xffffffe0,%edx
  105fb8:	41 8b f9             	mov    %r9d,%edi
  105fbb:	2b fa                	sub    %edx,%edi
  105fbd:	4c 63 df             	movslq %edi,%r11
  105fc0:	4c 89 9d 28 ff ff ff 	mov    %r11,-0xd8(%rbp)
  105fc7:	4a 8b 34 d9          	mov    (%rcx,%r11,8),%rsi
  105fcb:	48 89 b5 30 ff ff ff 	mov    %rsi,-0xd0(%rbp)
  105fd2:	4a 8b 34 d8          	mov    (%rax,%r11,8),%rsi
  105fd6:	48 89 75 80          	mov    %rsi,-0x80(%rbp)
  105fda:	4b 8b 14 d8          	mov    (%r8,%r11,8),%rdx
  105fde:	48 89 95 78 ff ff ff 	mov    %rdx,-0x88(%rbp)
  105fe5:	44 89 4d 98          	mov    %r9d,-0x68(%rbp)
  105fe9:	45 8d 51 20          	lea    0x20(%r9),%r10d
  105fed:	4d 63 d2             	movslq %r10d,%r10
  105ff0:	4f 8b 14 d6          	mov    (%r14,%r10,8),%r10
  105ff4:	48 8b 73 50          	mov    0x50(%rbx),%rsi
  105ff8:	48 c1 c6 05          	rol    $0x5,%rsi
  105ffc:	49 33 f2             	xor    %r10,%rsi
  105fff:	49 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%r10
  106006:	c1 7c 51 
  106009:	49 0f af f2          	imul   %r10,%rsi
  10600d:	4a 89 34 d9          	mov    %rsi,(%rcx,%r11,8)
  106011:	4a 8b 34 d9          	mov    (%rcx,%r11,8),%rsi
  106015:	4c 8b 53 60          	mov    0x60(%rbx),%r10
  106019:	48 8d 95 50 ff ff ff 	lea    -0xb0(%rbp),%rdx
  106020:	49 8b fa             	mov    %r10,%rdi
  106023:	e8 c8 e1 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  106028:	48 8b b5 50 ff ff ff 	mov    -0xb0(%rbp),%rsi
  10602f:	48 89 85 70 ff ff ff 	mov    %rax,-0x90(%rbp)
  106036:	48 8b 4d a8          	mov    -0x58(%rbp),%rcx
  10603a:	4c 8b 85 28 ff ff ff 	mov    -0xd8(%rbp),%r8
  106041:	4a 89 04 c1          	mov    %rax,(%rcx,%r8,8)
  106045:	48 8b 7b 68          	mov    0x68(%rbx),%rdi
  106049:	48 8d 95 48 ff ff ff 	lea    -0xb8(%rbp),%rdx
  106050:	e8 9b e1 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  106055:	48 8b 95 70 ff ff ff 	mov    -0x90(%rbp),%rdx
  10605c:	48 0f af 53 30       	imul   0x30(%rbx),%rdx
  106061:	48 03 d0             	add    %rax,%rdx
  106064:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  106068:	48 8b bd 28 ff ff ff 	mov    -0xd8(%rbp),%rdi
  10606f:	48 89 14 f8          	mov    %rdx,(%rax,%rdi,8)
  106073:	48 8b 53 10          	mov    0x10(%rbx),%rdx
  106077:	48 8b f2             	mov    %rdx,%rsi
  10607a:	48 03 34 f8          	add    (%rax,%rdi,8),%rsi
  10607e:	0f 18 0e             	prefetcht0 (%rsi)
  106081:	48 8b 7d 80          	mov    -0x80(%rbp),%rdi
  106085:	0f b6 14 3a          	movzbl (%rdx,%rdi,1),%edx
  106089:	8b fa                	mov    %edx,%edi
  10608b:	48 33 7b 50          	xor    0x50(%rbx),%rdi
  10608f:	48 ba 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rdx
  106096:	c1 7c 51 
  106099:	48 0f af fa          	imul   %rdx,%rdi
  10609d:	48 8d 53 78          	lea    0x78(%rbx),%rdx
  1060a1:	48 8b b5 30 ff ff ff 	mov    -0xd0(%rbp),%rsi
  1060a8:	48 33 fe             	xor    %rsi,%rdi
  1060ab:	48 0f af 7a 08       	imul   0x8(%rdx),%rdi
  1060b0:	48 8b 32             	mov    (%rdx),%rsi
  1060b3:	48 8d 95 40 ff ff ff 	lea    -0xc0(%rbp),%rdx
  1060ba:	e8 31 e1 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  1060bf:	48 8b b5 78 ff ff ff 	mov    -0x88(%rbp),%rsi
  1060c6:	48 0f af 73 20       	imul   0x20(%rbx),%rsi
  1060cb:	48 03 f0             	add    %rax,%rsi
  1060ce:	45 85 e4             	test   %r12d,%r12d
  1060d1:	74 20                	je     1060f3 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x3b3>
  1060d3:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  1060d7:	48 3b f0             	cmp    %rax,%rsi
  1060da:	0f 82 34 01 00 00    	jb     106214 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4d4>
  1060e0:	2b f0                	sub    %eax,%esi
  1060e2:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1060e6:	4c 8d 15 43 9e 14 00 	lea    0x149e43(%rip),%r10        # 24ff30 <__InterfaceDispatchCell_PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_IRemappingStorage__Index_PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart>
  1060ed:	41 ff 12             	call   *(%r10)
  1060f0:	48 8b f0             	mov    %rax,%rsi
  1060f3:	8b 55 98             	mov    -0x68(%rbp),%edx
  1060f6:	48 63 fa             	movslq %edx,%rdi
  1060f9:	49 89 74 fd 00       	mov    %rsi,0x0(%r13,%rdi,8)
  1060fe:	ff c2                	inc    %edx
  106100:	8b 7d 94             	mov    -0x6c(%rbp),%edi
  106103:	3b d7                	cmp    %edi,%edx
  106105:	0f 8c f5 00 00 00    	jl     106200 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4c0>
  10610b:	41 3b d7             	cmp    %r15d,%edx
  10610e:	0f 8d b4 00 00 00    	jge    1061c8 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x488>
  106114:	8b fa                	mov    %edx,%edi
  106116:	c1 ff 1f             	sar    $0x1f,%edi
  106119:	83 e7 1f             	and    $0x1f,%edi
  10611c:	03 fa                	add    %edx,%edi
  10611e:	83 e7 e0             	and    $0xffffffe0,%edi
  106121:	89 55 98             	mov    %edx,-0x68(%rbp)
  106124:	8b f2                	mov    %edx,%esi
  106126:	2b f7                	sub    %edi,%esi
  106128:	48 63 fe             	movslq %esi,%rdi
  10612b:	4c 8b 75 c8          	mov    -0x38(%rbp),%r14
  10612f:	49 8b 34 fe          	mov    (%r14,%rdi,8),%rsi
  106133:	48 8b 45 b8          	mov    -0x48(%rbp),%rax
  106137:	48 8b 0c f8          	mov    (%rax,%rdi,8),%rcx
  10613b:	4c 8b 45 a8          	mov    -0x58(%rbp),%r8
  10613f:	4d 8b 0c f8          	mov    (%r8,%rdi,8),%r9
  106143:	4c 89 8d 68 ff ff ff 	mov    %r9,-0x98(%rbp)
  10614a:	48 8b 7b 10          	mov    0x10(%rbx),%rdi
  10614e:	40 0f b6 3c 0f       	rex movzbl (%rdi,%rcx,1),%edi
  106153:	48 33 7b 50          	xor    0x50(%rbx),%rdi
  106157:	48 b9 95 0a 22 27 b7 	movabs $0x517cc1b727220a95,%rcx
  10615e:	c1 7c 51 
  106161:	48 0f af f9          	imul   %rcx,%rdi
  106165:	48 8d 4b 78          	lea    0x78(%rbx),%rcx
  106169:	48 33 fe             	xor    %rsi,%rdi
  10616c:	48 0f af 79 08       	imul   0x8(%rcx),%rdi
  106171:	48 8b 31             	mov    (%rcx),%rsi
  106174:	48 8d 95 38 ff ff ff 	lea    -0xc8(%rbp),%rdx
  10617b:	e8 70 e0 f7 ff       	call   841f0 <S_P_CoreLib_System_Math___BigMul_g__SoftwareFallback_48_0>
  106180:	48 8b b5 68 ff ff ff 	mov    -0x98(%rbp),%rsi
  106187:	48 0f af 73 20       	imul   0x20(%rbx),%rsi
  10618c:	48 03 f0             	add    %rax,%rsi
  10618f:	45 85 e4             	test   %r12d,%r12d
  106192:	74 1c                	je     1061b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x470>
  106194:	48 8b 45 d0          	mov    -0x30(%rbp),%rax
  106198:	48 3b f0             	cmp    %rax,%rsi
  10619b:	72 61                	jb     1061fe <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4be>
  10619d:	2b f0                	sub    %eax,%esi
  10619f:	48 8b 7b 08          	mov    0x8(%rbx),%rdi
  1061a3:	4c 8d 15 86 9d 14 00 	lea    0x149d86(%rip),%r10        # 24ff30 <__InterfaceDispatchCell_PtrHash_CSharp_Port_PtrHash_CSharp_Port_Storage_IRemappingStorage__Index_PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart>
  1061aa:	41 ff 12             	call   *(%r10)
  1061ad:	48 8b f0             	mov    %rax,%rsi
  1061b0:	8b 7d 98             	mov    -0x68(%rbp),%edi
  1061b3:	48 63 c7             	movslq %edi,%rax
  1061b6:	49 89 74 c5 00       	mov    %rsi,0x0(%r13,%rax,8)
  1061bb:	ff c7                	inc    %edi
  1061bd:	41 3b ff             	cmp    %r15d,%edi
  1061c0:	8b d7                	mov    %edi,%edx
  1061c2:	0f 8c 4c ff ff ff    	jl     106114 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x3d4>
  1061c8:	33 ff                	xor    %edi,%edi
  1061ca:	48 89 7d a0          	mov    %rdi,-0x60(%rbp)
  1061ce:	48 89 7d b0          	mov    %rdi,-0x50(%rbp)
  1061d2:	48 89 7d c0          	mov    %rdi,-0x40(%rbp)
  1061d6:	48 8d 3d 0b 65 0b 00 	lea    0xb650b(%rip),%rdi        # 1bc6e8 <__security_cookie>
  1061dd:	48 8b 3f             	mov    (%rdi),%rdi
  1061e0:	48 39 bd f0 fe ff ff 	cmp    %rdi,-0x110(%rbp)
  1061e7:	74 05                	je     1061ee <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x4ae>
  1061e9:	e8 62 3d f0 ff       	call   9f50 <RhpFallbackFailFast>
  1061ee:	90                   	nop
  1061ef:	48 8d 65 d8          	lea    -0x28(%rbp),%rsp
  1061f3:	5b                   	pop    %rbx
  1061f4:	41 5c                	pop    %r12
  1061f6:	41 5d                	pop    %r13
  1061f8:	41 5e                	pop    %r14
  1061fa:	41 5f                	pop    %r15
  1061fc:	5d                   	pop    %rbp
  1061fd:	c3                   	ret
  1061fe:	eb b0                	jmp    1061b0 <PtrHash_CSharp_Port_PtrHash_CSharp_Port_Core_PtrHash_3<UInt64__PtrHash_CSharp_Port_PtrHash_CSharp_Port_KeyHashers_FxHasher__PtrHash_CSharp_Port_PtrHash_CSharp_Port_BucketFunctions_Linear>__GetIndicesStreamPrefetchMultiPart+0x470>
  106200:	44 8b ca             	mov    %edx,%r9d
