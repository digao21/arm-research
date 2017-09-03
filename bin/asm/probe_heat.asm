	.file	"probe_heat.c"
	.text
	.p2align 4,,15
.globl StencilProbe
	.type	StencilProbe, @function
StencilProbe:
.LFB11:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$208, %rsp
	.cfi_def_cfa_offset 264
	testl	%r9d, %r9d
	movsd	(%rdi), %xmm0
	movq	%rsi, 72(%rsp)
	movl	%edx, 164(%rsp)
	movl	%ecx, 68(%rsp)
	movl	%r9d, 196(%rsp)
	movsd	%xmm0, 48(%rsp)
	jle	.L26
	movl	%ecx, %eax
	movl	%edx, %ebx
	subl	$1, %r8d
	imull	%edx, %eax
	movl	%r8d, 180(%rsp)
	subl	$1, %ebx
	movl	$0, 192(%rsp)
	cltq
	movq	%rax, 152(%rsp)
	salq	$3, %rax
	movq	%rax, 104(%rsp)
	movl	%ecx, %eax
	addl	$2, %eax
	imull	%edx, %eax
	subl	$2, %edx
	movl	%edx, %ebp
	movl	%edx, 60(%rsp)
	shrl	%ebp
	cltq
	leal	(%rbp,%rbp), %edx
	movq	%rax, 184(%rsp)
	leaq	8(,%rax,8), %rax
	movl	%edx, 64(%rsp)
	addl	$1, %edx
	movq	%rax, 200(%rsp)
	movl	%edx, 84(%rsp)
.L3:
	cmpl	$1, 180(%rsp)
	jle	.L22
	movq	152(%rsp), %rax
	movslq	164(%rsp), %r13
	movq	200(%rsp), %rsi
	movsd	.LC0(%rip), %xmm15
	movsd	.LC1(%rip), %xmm14
	movl	$2, 44(%rsp)
	leaq	8(%rdi,%rax,8), %rax
	leaq	8(%rdi,%r13,8), %rcx
	addq	%rdi, %rsi
	leaq	0(,%r13,8), %r11
	movq	%rax, 120(%rsp)
	movl	68(%rsp), %eax
	movq	%rcx, 136(%rsp)
	movl	68(%rsp), %ecx
	movq	%rsi, 112(%rsp)
	addl	$1, %eax
	imull	164(%rsp), %eax
	cltq
	movq	%rax, 168(%rsp)
	salq	$3, %rax
	leaq	(%rdi,%rax), %rdx
	addq	72(%rsp), %rax
	movq	%rdx, 88(%rsp)
	xorl	%edx, %edx
	movq	%rax, 96(%rsp)
	leal	1(%rcx,%rcx), %eax
	imull	164(%rsp), %eax
	cltq
	movq	%rax, 128(%rsp)
	.p2align 4,,10
	.p2align 3
.L25:
	movq	152(%rsp), %rsi
	cmpl	$2, 68(%rsp)
	movl	44(%rsp), %eax
	leaq	(%rdx,%rsi), %rsi
	movq	%rsi, 144(%rsp)
	jle	.L10
	movq	128(%rsp), %rax
	movq	88(%rsp), %rsi
	movq	96(%rsp), %r12
	salq	$3, %rax
	addq	$8, %rsi
	leaq	8(%rdi,%rax), %rcx
	leaq	24(%rdi,%rax), %rax
	movq	%rsi, -48(%rsp)
	movq	112(%rsp), %rsi
	addq	$8, %r12
	movq	%rcx, -80(%rsp)
	movq	%rax, 8(%rsp)
	movq	136(%rsp), %rcx
	movq	96(%rsp), %rax
	addq	$16, %rsi
	movq	%rsi, 24(%rsp)
	leaq	0(%r13,%rdx), %rsi
	addq	$24, %rax
	addq	$16, %rcx
	movq	%rax, (%rsp)
	movq	%rcx, 16(%rsp)
	movq	120(%rsp), %rax
	movq	88(%rsp), %rcx
	movq	%rsi, -8(%rsp)
	movq	128(%rsp), %rsi
	addq	$16, %rax
	addq	$16, %rcx
	movq	%rax, 32(%rsp)
	movq	%rcx, -96(%rsp)
	movq	184(%rsp), %rax
	movq	152(%rsp), %rcx
	movq	%rsi, -40(%rsp)
	movq	112(%rsp), %rsi
	addq	%rdx, %rax
	addq	%rdx, %rcx
	addq	168(%rsp), %rdx
	movq	%rax, -16(%rsp)
	movq	96(%rsp), %rax
	movq	%rcx, -24(%rsp)
	movq	120(%rsp), %rcx
	movq	%rsi, -64(%rsp)
	movq	%rdx, -112(%rsp)
	movq	%rax, -32(%rsp)
	movq	88(%rsp), %rdx
	movq	136(%rsp), %rax
	movq	%rcx, -72(%rsp)
	movq	%rdx, -104(%rsp)
	movq	%rax, -88(%rsp)
	movsd	.LC2(%rip), %xmm13
	movl	$2, -52(%rsp)
	movsd	.LC3(%rip), %xmm12
	movsd	.LC4(%rip), %xmm11
	movsd	.LC5(%rip), %xmm10
	.p2align 4,,10
	.p2align 3
.L24:
	cmpl	$1, %ebx
	movl	44(%rsp), %eax
	jle	.L12
	cmpl	$4, 60(%rsp)
	movsd	48(%rsp), %xmm2
	mulsd	%xmm2, %xmm2
	jbe	.L21
	testb	$15, %r12b
	jne	.L21
	cmpq	8(%rsp), %r12
	jbe	.L34
	cmpq	16(%rsp), %r12
	jbe	.L35
.L16:
	cmpq	24(%rsp), %r12
	jbe	.L36
.L17:
	cmpq	32(%rsp), %r12
	jbe	.L37
.L18:
	movq	-104(%rsp), %rax
	addq	$32, %rax
	cmpq	%rax, %r12
	jbe	.L38
.L19:
	cmpq	-96(%rsp), %r12
	jbe	.L39
.L20:
	movq	-104(%rsp), %rax
	addq	$24, %rax
	cmpq	%rax, %r12
	jbe	.L40
	movl	64(%rsp), %eax
	testl	%eax, %eax
	je	.L41
.L6:
	movapd	%xmm2, %xmm0
	movq	-32(%rsp), %r15
	movq	-48(%rsp), %r10
	movq	-104(%rsp), %r9
	movsd	%xmm2, -120(%rsp)
	unpcklpd	%xmm0, %xmm0
	movq	-96(%rsp), %r8
	movq	-72(%rsp), %rsi
	xorl	%r14d, %r14d
	movq	-64(%rsp), %rcx
	movq	-88(%rsp), %rdx
	movq	-80(%rsp), %rax
	movapd	%xmm0, %xmm9
	movapd	.LC6(%rip), %xmm8
	movapd	.LC7(%rip), %xmm7
	movapd	.LC8(%rip), %xmm6
	movapd	.LC9(%rip), %xmm5
	movapd	.LC10(%rip), %xmm4
	movapd	.LC11(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	(%rax), %xmm1
	addl	$1, %r14d
	movsd	(%rdx), %xmm2
	movhpd	8(%rax), %xmm1
	addq	$16, %rax
	movhpd	8(%rdx), %xmm2
	addq	$16, %rdx
	movapd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%rcx), %xmm2
	mulpd	%xmm8, %xmm0
	movhpd	8(%rcx), %xmm2
	addq	$16, %rcx
	mulpd	%xmm7, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%rsi), %xmm2
	mulpd	%xmm6, %xmm1
	movhpd	8(%rsi), %xmm2
	addq	$16, %rsi
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%r8), %xmm2
	mulpd	%xmm5, %xmm1
	movhpd	8(%r8), %xmm2
	addq	$16, %r8
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%r9), %xmm2
	mulpd	%xmm4, %xmm1
	movhpd	8(%r9), %xmm2
	addq	$16, %r9
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%r10), %xmm2
	mulpd	%xmm3, %xmm1
	movhpd	8(%r10), %xmm2
	addq	$16, %r10
	addpd	%xmm1, %xmm0
	movapd	.LC12(%rip), %xmm1
	mulpd	%xmm2, %xmm1
	divpd	%xmm9, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm0, 8(%r15)
	addq	$16, %r15
	cmpl	%ebp, %r14d
	jb	.L8
	movl	64(%rsp), %edx
	cmpl	%edx, 60(%rsp)
	movsd	-120(%rsp), %xmm2
	movl	84(%rsp), %eax
	je	.L5
.L7:
	movq	-40(%rsp), %rcx
	movslq	%eax, %rdx
	movq	-112(%rsp), %rsi
	leaq	(%rdx,%rcx), %rcx
	leaq	(%rdi,%rcx,8), %r15
	movq	-8(%rsp), %rcx
	leaq	(%rdx,%rcx), %rcx
	leaq	(%rdi,%rcx,8), %r14
	movq	-16(%rsp), %rcx
	leaq	(%rdx,%rcx), %rcx
	leaq	(%rdi,%rcx,8), %r10
	movq	-24(%rsp), %rcx
	leaq	(%rdx,%rcx), %rcx
	leaq	(%rdi,%rcx,8), %r9
	leal	1(%rax), %ecx
	movslq	%ecx, %rcx
	addq	-112(%rsp), %rcx
	leaq	(%rdi,%rcx,8), %r8
	leaq	-1(%rsi,%rdx), %rcx
	addq	-112(%rsp), %rdx
	leaq	(%rdi,%rcx,8), %rsi
	salq	$3, %rdx
	leaq	(%rdi,%rdx), %rcx
	addq	72(%rsp), %rdx
	.p2align 4,,10
	.p2align 3
.L9:
	movsd	(%r15), %xmm0
	addl	$1, %eax
	movsd	(%r14), %xmm1
	addq	$8, %r15
	addsd	%xmm0, %xmm0
	addq	$8, %r14
	mulsd	%xmm15, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%r10), %xmm1
	addq	$8, %r10
	mulsd	%xmm14, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%r9), %xmm1
	addq	$8, %r9
	mulsd	%xmm13, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%r8), %xmm1
	addq	$8, %r8
	mulsd	%xmm12, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rsi), %xmm1
	addq	$8, %rsi
	mulsd	%xmm11, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rcx), %xmm1
	addq	$8, %rcx
	mulsd	%xmm10, %xmm1
	divsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rdx
	cmpl	%eax, %ebx
	jg	.L9
.L5:
	movl	44(%rsp), %eax
.L12:
	addl	$1, -52(%rsp)
	addq	%r11, -80(%rsp)
	addq	%r11, %r12
	addq	%r11, -88(%rsp)
	addq	%r11, -64(%rsp)
	addq	%r11, -72(%rsp)
	addq	%r11, -104(%rsp)
	addq	%r11, -48(%rsp)
	addq	%r11, -32(%rsp)
	addq	%r11, 8(%rsp)
	addq	%r11, (%rsp)
	addq	%r11, 16(%rsp)
	addq	%r11, 24(%rsp)
	addq	%r11, 32(%rsp)
	addq	%r11, -96(%rsp)
	addq	%r13, -40(%rsp)
	addq	%r13, -8(%rsp)
	addq	%r13, -16(%rsp)
	addq	%r13, -24(%rsp)
	addq	%r13, -112(%rsp)
	movl	68(%rsp), %edx
	cmpl	%edx, -52(%rsp)
	jne	.L24
.L10:
	movq	104(%rsp), %rdx
	addl	$1, 44(%rsp)
	addq	%rdx, 136(%rsp)
	movq	152(%rsp), %rcx
	addq	%rdx, 112(%rsp)
	addq	%rdx, 120(%rsp)
	addq	%rdx, 88(%rsp)
	addq	%rdx, 96(%rsp)
	movq	144(%rsp), %rdx
	addq	%rcx, 128(%rsp)
	cmpl	%eax, 180(%rsp)
	jg	.L25
.L22:
	addl	$1, 192(%rsp)
	movl	196(%rsp), %edx
	cmpl	%edx, 192(%rsp)
	movq	72(%rsp), %rax
	movq	%rdi, 72(%rsp)
	je	.L26
	movq	%rax, %rdi
	jmp	.L3
	.p2align 4,,10
	.p2align 3
.L39:
	movq	-104(%rsp), %rsi
	cmpq	%rsi, (%rsp)
	jb	.L20
	.p2align 4,,10
	.p2align 3
.L21:
	movq	-48(%rsp), %rax
	movq	-104(%rsp), %r10
	movq	%r12, %r14
	movq	-72(%rsp), %r9
	movq	-64(%rsp), %r8
	movl	$2, %edx
	movq	-88(%rsp), %rsi
	movq	-80(%rsp), %rcx
	movl	164(%rsp), %r15d
	movsd	.LC0(%rip), %xmm8
	movsd	.LC1(%rip), %xmm7
	movsd	.LC2(%rip), %xmm6
	movsd	.LC3(%rip), %xmm5
	movsd	.LC4(%rip), %xmm4
	movsd	.LC5(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L4:
	movsd	(%rcx), %xmm0
	addl	$1, %edx
	movsd	(%rsi), %xmm1
	addq	$8, %rcx
	addsd	%xmm0, %xmm0
	addq	$8, %rsi
	mulsd	%xmm8, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%r8), %xmm1
	addq	$8, %r8
	mulsd	%xmm7, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%r9), %xmm1
	addq	$8, %r9
	mulsd	%xmm6, %xmm1
	addsd	%xmm1, %xmm0
	movsd	8(%rax), %xmm1
	mulsd	%xmm5, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%r10), %xmm1
	addq	$8, %r10
	mulsd	%xmm4, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rax), %xmm1
	addq	$8, %rax
	mulsd	%xmm3, %xmm1
	divsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%r14)
	addq	$8, %r14
	cmpl	%edx, %r15d
	jne	.L4
	jmp	.L5
	.p2align 4,,10
	.p2align 3
.L34:
	movq	-80(%rsp), %rcx
	cmpq	%rcx, (%rsp)
	jae	.L21
	cmpq	16(%rsp), %r12
	ja	.L16
	.p2align 4,,10
	.p2align 3
.L35:
	movq	-88(%rsp), %rsi
	cmpq	%rsi, (%rsp)
	jae	.L21
	cmpq	24(%rsp), %r12
	ja	.L17
	.p2align 4,,10
	.p2align 3
.L36:
	movq	-64(%rsp), %rax
	cmpq	%rax, (%rsp)
	jae	.L21
	cmpq	32(%rsp), %r12
	ja	.L18
	.p2align 4,,10
	.p2align 3
.L37:
	movq	-72(%rsp), %rdx
	cmpq	%rdx, (%rsp)
	jae	.L21
	movq	-104(%rsp), %rax
	addq	$32, %rax
	cmpq	%rax, %r12
	ja	.L19
	.p2align 4,,10
	.p2align 3
.L38:
	movq	-96(%rsp), %rcx
	cmpq	%rcx, (%rsp)
	jb	.L19
	jmp	.L21
	.p2align 4,,10
	.p2align 3
.L40:
	movq	-48(%rsp), %rax
	cmpq	%rax, (%rsp)
	jae	.L21
	movl	64(%rsp), %eax
	testl	%eax, %eax
	jne	.L6
.L41:
	movl	$1, %eax
	jmp	.L7
.L26:
	addq	$208, %rsp
	.cfi_def_cfa_offset 56
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE11:
	.size	StencilProbe, .-StencilProbe
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	1074266112
	.align 8
.LC1:
	.long	0
	.long	1074790400
	.align 8
.LC2:
	.long	0
	.long	1075052544
	.align 8
.LC3:
	.long	0
	.long	1075314688
	.align 8
.LC4:
	.long	0
	.long	1075576832
	.align 8
.LC5:
	.long	0
	.long	-1069940736
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC6:
	.long	0
	.long	1073741824
	.long	0
	.long	1073741824
	.align 16
.LC7:
	.long	0
	.long	1074266112
	.long	0
	.long	1074266112
	.align 16
.LC8:
	.long	0
	.long	1074790400
	.long	0
	.long	1074790400
	.align 16
.LC9:
	.long	0
	.long	1075052544
	.long	0
	.long	1075052544
	.align 16
.LC10:
	.long	0
	.long	1075314688
	.long	0
	.long	1075314688
	.align 16
.LC11:
	.long	0
	.long	1075576832
	.long	0
	.long	1075576832
	.align 16
.LC12:
	.long	0
	.long	-1069940736
	.long	0
	.long	-1069940736
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
