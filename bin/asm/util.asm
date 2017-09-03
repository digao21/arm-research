	.file	"util.c"
	.text
	.p2align 4,,15
.globl StencilInit
	.type	StencilInit, @function
StencilInit:
.LFB22:
	.cfi_startproc
	imull	%edi, %esi
	imull	%edx, %esi
	movslq	%esi, %rsi
	testq	%rsi, %rsi
	jle	.L8
	movq	%rcx, %rdx
	andl	$15, %edx
	shrq	$3, %rdx
	cmpq	%rsi, %rdx
	cmova	%rsi, %rdx
	testq	%rdx, %rdx
	je	.L15
	xorl	%eax, %eax
	.p2align 4,,10
	.p2align 3
.L5:
	movabsq	$4607182418800017408, %rdi
	movq	%rdi, (%rcx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rdx
	ja	.L5
	cmpq	%rdx, %rsi
	je	.L8
.L4:
	movq	%rsi, %r11
	subq	%rdx, %r11
	movq	%r11, %r8
	shrq	%r8
	movq	%r8, %r10
	addq	%r10, %r10
	je	.L10
	movapd	.LC1(%rip), %xmm0
	leaq	(%rcx,%rdx,8), %r9
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L7:
	movq	%rdx, %rdi
	addq	$1, %rdx
	salq	$4, %rdi
	cmpq	%rdx, %r8
	movapd	%xmm0, (%r9,%rdi)
	ja	.L7
	addq	%r10, %rax
	cmpq	%r10, %r11
	je	.L8
	.p2align 4,,10
	.p2align 3
.L10:
	movabsq	$4607182418800017408, %rdx
	movq	%rdx, (%rcx,%rax,8)
	addq	$1, %rax
	cmpq	%rax, %rsi
	jg	.L10
.L8:
	rep
	ret
.L15:
	xorl	%eax, %eax
	jmp	.L4
	.cfi_endproc
.LFE22:
	.size	StencilInit, .-StencilInit
	.p2align 4,,15
.globl clear_cache
	.type	clear_cache, @function
clear_cache:
.LFB24:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	movl	$268435456, %edi
	call	malloc
	movq	%rax, %r8
	andl	$15, %r8d
	shrq	$2, %r8
	negl	%r8d
	andl	$3, %r8d
	je	.L28
	movq	%rax, %rsi
	movl	$67108864, %edx
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L19:
	addl	$1, %ecx
	movl	$0x3f800000, (%rsi)
	subl	$1, %edx
	addq	$4, %rsi
	cmpl	%ecx, %r8d
	ja	.L19
.L18:
	movl	$67108864, %r10d
	subl	%r8d, %r10d
	movl	%r10d, %r9d
	shrl	$2, %r9d
	leal	0(,%r9,4), %edi
	testl	%edi, %edi
	je	.L20
	mov	%r8d, %r8d
	movaps	.LC3(%rip), %xmm0
	leaq	(%rax,%r8,4), %r8
	xorl	%esi, %esi
	.p2align 4,,10
	.p2align 3
.L21:
	addl	$1, %esi
	movaps	%xmm0, (%r8)
	addq	$16, %r8
	cmpl	%r9d, %esi
	jb	.L21
	addl	%edi, %ecx
	subl	%edi, %edx
	cmpl	%edi, %r10d
	je	.L22
.L20:
	movslq	%ecx, %rcx
	leaq	(%rax,%rcx,4), %rcx
	.p2align 4,,10
	.p2align 3
.L23:
	movl	$0x3f800000, (%rcx)
	addq	$4, %rcx
	subl	$1, %edx
	jne	.L23
.L22:
	movq	%rax, %rdi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	free
.L28:
	.cfi_restore_state
	movl	$67108864, %edx
	xorl	%ecx, %ecx
	jmp	.L18
	.cfi_endproc
.LFE24:
	.size	clear_cache, .-clear_cache
	.p2align 4,,15
.globl seconds_per_tick
	.type	seconds_per_tick, @function
seconds_per_tick:
.LFB23:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	pushq	%rbx
	.cfi_def_cfa_offset 24
	.cfi_offset 3, -24
	movl	$3, %ebx
	subq	$8, %rsp
	.cfi_def_cfa_offset 32
	.p2align 4,,10
	.p2align 3
.L32:
	call	PAPI_get_real_cyc
	movl	%ebx, %edi
	movq	%rax, %rbp
	xorl	%eax, %eax
	call	sleep
	call	PAPI_get_real_cyc
	mov	%ebx, %edx
	subq	%rbp, %rax
	addl	$1, %ebx
	cvtsi2sdq	%rax, %xmm1
	cvtsi2sdq	%rdx, %xmm0
	divsd	%xmm1, %xmm0
	xorpd	%xmm1, %xmm1
	ucomisd	%xmm0, %xmm1
	jae	.L32
	addq	$8, %rsp
	.cfi_def_cfa_offset 24
	popq	%rbx
	.cfi_def_cfa_offset 16
	popq	%rbp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE23:
	.size	seconds_per_tick, .-seconds_per_tick
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	1072693248
	.long	0
	.long	1072693248
	.align 16
.LC3:
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.long	1065353216
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
