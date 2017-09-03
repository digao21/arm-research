	.file	"probe_heat_blocked.c"
	.text
	.p2align 4,,15
.globl StencilProbeBlocked
	.type	StencilProbeBlocked, @function
StencilProbeBlocked:
.LFB0:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %eax
	subl	$1, %r8d
	addl	$1, %eax
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
	subq	$376, %rsp
	.cfi_def_cfa_offset 432
	movl	%edx, 184(%rsp)
	movl	%r9d, 212(%rsp)
	movl	%ecx, %r9d
	imull	184(%rsp), %eax
	movsd	(%rdi), %xmm0
	subl	$1, %edx
	movq	%rdi, -96(%rsp)
	movq	%rsi, 40(%rsp)
	movsd	%xmm0, (%rsp)
	movl	%ecx, 208(%rsp)
	movl	%edx, 268(%rsp)
	movl	%r8d, 180(%rsp)
	movl	$0, 328(%rsp)
	cltq
	movq	%rax, 352(%rsp)
	leal	1(%r9,%r9), %eax
	imull	184(%rsp), %eax
	cltq
	movq	%rax, 360(%rsp)
	movl	%ecx, %eax
	addl	$2, %eax
	imull	184(%rsp), %eax
	cltq
	movq	%rax, 368(%rsp)
	movl	184(%rsp), %eax
	imull	%ecx, %eax
	cltq
	movq	%rax, 64(%rsp)
	salq	$3, %rax
	movq	%rax, 56(%rsp)
.L2:
	movl	448(%rsp), %eax
	cmpl	%eax, 328(%rsp)
	jge	.L31
	movl	432(%rsp), %eax
	movl	208(%rsp), %edx
	imull	184(%rsp), %eax
	movl	432(%rsp), %ebx
	movq	352(%rsp), %r9
	subl	$1, %edx
	movsd	.LC0(%rip), %xmm13
	movl	%edx, 324(%rsp)
	movslq	184(%rsp), %rdx
	addl	$1, %ebx
	movq	%r9, 240(%rsp)
	movq	64(%rsp), %r9
	movl	%ebx, 204(%rsp)
	movq	368(%rsp), %rbx
	cltq
	movsd	.LC1(%rip), %xmm12
	movq	%rax, 192(%rsp)
	movq	360(%rsp), %rax
	movq	%rdx, -88(%rsp)
	movq	%rbx, 256(%rsp)
	movq	%r9, 232(%rsp)
	movq	%rdx, 224(%rsp)
	movq	%rax, 216(%rsp)
	movslq	212(%rsp), %rax
	movq	%rax, 336(%rsp)
	salq	$3, %rax
	movq	%rax, 272(%rsp)
.L30:
	movl	204(%rsp), %eax
	subl	432(%rsp), %eax
	cmpl	%eax, 324(%rsp)
	movl	%eax, 176(%rsp)
	jle	.L27
	cmpl	$1, 268(%rsp)
	jle	.L24
	movl	204(%rsp), %edx
	cmpl	%edx, 324(%rsp)
	cmovle	324(%rsp), %edx
	movl	212(%rsp), %ebx
	movq	-96(%rsp), %r9
	movq	216(%rsp), %rax
	movsd	.LC2(%rip), %xmm15
	movl	$-2, 308(%rsp)
	addl	$1, %ebx
	movsd	.LC3(%rip), %xmm14
	movl	%edx, 32(%rsp)
	movl	%ebx, 188(%rsp)
	addq	$8, %r9
	movq	224(%rsp), %rdx
	movq	256(%rsp), %rbx
	leaq	(%r9,%rax,8), %rax
	movq	%r9, 168(%rsp)
	movl	$1, 36(%rsp)
	movq	%rax, 312(%rsp)
	movq	232(%rsp), %rax
	leaq	(%r9,%rdx,8), %rdx
	leaq	(%r9,%rbx,8), %rbx
	movq	%rdx, 296(%rsp)
	movq	%rbx, 288(%rsp)
	leaq	(%r9,%rax,8), %rax
	movq	240(%rsp), %rdx
	movl	212(%rsp), %ebx
	movq	%rax, 280(%rsp)
	addq	$1, %rdx
	negl	%ebx
	movq	%rdx, 248(%rsp)
	movl	%ebx, 348(%rsp)
.L28:
	cmpl	$1, 180(%rsp)
	movl	188(%rsp), %r9d
	movl	%r9d, 332(%rsp)
	jle	.L21
	cmpl	%r9d, 268(%rsp)
	movl	%r9d, %eax
	movq	-96(%rsp), %rdx
	cmovle	268(%rsp), %eax
	movq	248(%rsp), %rbx
	movq	240(%rsp), %r9
	movl	$2, -4(%rsp)
	movl	%eax, 12(%rsp)
	movq	248(%rsp), %rax
	movq	%r9, 128(%rsp)
	movq	216(%rsp), %r9
	salq	$3, %rax
	addq	%rax, %rdx
	addq	40(%rsp), %rax
	movq	%r9, 144(%rsp)
	movq	%rdx, 72(%rsp)
	movq	256(%rsp), %rdx
	movq	312(%rsp), %r9
	movq	%rax, 80(%rsp)
	movl	36(%rsp), %eax
	movq	%rdx, 88(%rsp)
	movq	288(%rsp), %rdx
	movq	%r9, 120(%rsp)
	notl	%eax
	addl	12(%rsp), %eax
	movq	%rdx, 96(%rsp)
	movl	308(%rsp), %edx
	leaq	1(%rbx,%rax), %rax
	movq	224(%rsp), %rbx
	salq	$3, %rax
	movq	%rax, 152(%rsp)
	movq	232(%rsp), %rax
	movq	%rbx, 136(%rsp)
	movq	296(%rsp), %rbx
	movq	%rax, 104(%rsp)
	movq	280(%rsp), %rax
	movq	%rbx, 112(%rsp)
	movq	%rax, 160(%rsp)
	movl	12(%rsp), %eax
	leal	1(%rax,%rdx), %eax
	movl	%eax, 16(%rsp)
	shrl	%eax
	movl	%eax, 48(%rsp)
	addl	%eax, %eax
	movl	%eax, 20(%rsp)
	addl	36(%rsp), %eax
	movl	%eax, 52(%rsp)
	.p2align 4,,10
	.p2align 3
.L26:
	movl	176(%rsp), %ebx
	cmpl	%ebx, 32(%rsp)
	movl	-4(%rsp), %eax
	jle	.L9
	movq	-88(%rsp), %r9
	movq	80(%rsp), %rax
	movq	128(%rsp), %rdx
	movq	104(%rsp), %rbx
	movq	72(%rsp), %r10
	movq	72(%rsp), %r15
	salq	$3, %r9
	addq	$16, %rax
	movq	160(%rsp), %r14
	movq	%r9, -112(%rsp)
	movq	%rax, -24(%rsp)
	movq	88(%rsp), %r9
	movq	136(%rsp), %rax
	addq	$8, %r10
	movq	%rdx, -80(%rsp)
	movq	144(%rsp), %rdx
	subq	$8, %r15
	movq	%rbx, -56(%rsp)
	movq	152(%rsp), %rbx
	movq	%r9, -48(%rsp)
	movq	%rax, -40(%rsp)
	movq	%rdx, -32(%rsp)
	movq	80(%rsp), %r9
	movq	72(%rsp), %rax
	movl	176(%rsp), %edx
	movq	96(%rsp), %r13
	movq	112(%rsp), %r12
	movq	120(%rsp), %r11
	movsd	.LC4(%rip), %xmm11
	movq	%rbx, -16(%rsp)
	movq	%r9, -104(%rsp)
	movq	%rax, -64(%rsp)
	movl	%edx, -68(%rsp)
	.p2align 4,,10
	.p2align 3
.L23:
	movl	36(%rsp), %edx
	cmpl	%edx, 12(%rsp)
	movl	-4(%rsp), %eax
	jle	.L11
	cmpl	$4, 16(%rsp)
	movsd	(%rsp), %xmm2
	mulsd	%xmm2, %xmm2
	jbe	.L20
	testb	$15, -104(%rsp)
	jne	.L20
	leaq	16(%r11), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L38
	leaq	16(%r12), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L39
.L15:
	leaq	16(%r13), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L40
.L16:
	leaq	16(%r14), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L41
.L17:
	leaq	16(%r10), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L42
.L18:
	cmpq	%r10, -104(%rsp)
	jbe	.L43
.L19:
	leaq	8(%r10), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L44
	movl	20(%rsp), %eax
	testl	%eax, %eax
	je	.L45
.L5:
	movapd	%xmm2, %xmm0
	movq	-104(%rsp), %rbx
	movq	-64(%rsp), %rcx
	movl	48(%rsp), %esi
	movsd	%xmm2, 24(%rsp)
	unpcklpd	%xmm0, %xmm0
	xorl	%eax, %eax
	xorl	%edx, %edx
	movapd	.LC6(%rip), %xmm9
	movapd	%xmm0, %xmm10
	movapd	.LC7(%rip), %xmm8
	movapd	.LC8(%rip), %xmm7
	movapd	.LC9(%rip), %xmm6
	movapd	.LC10(%rip), %xmm5
	movapd	.LC11(%rip), %xmm4
	movapd	.LC12(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L7:
	movsd	(%rax,%r11), %xmm1
	addl	$1, %edx
	movsd	(%r12,%rax), %xmm2
	movhpd	8(%r11,%rax), %xmm1
	movhpd	8(%rax,%r12), %xmm2
	movapd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%rax,%r13), %xmm2
	mulpd	%xmm9, %xmm0
	movhpd	8(%r13,%rax), %xmm2
	mulpd	%xmm8, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%rax,%r14), %xmm2
	mulpd	%xmm7, %xmm1
	movhpd	8(%r14,%rax), %xmm2
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%rax,%r10), %xmm2
	mulpd	%xmm6, %xmm1
	movhpd	8(%rax,%r10), %xmm2
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%rax,%r15), %xmm2
	mulpd	%xmm5, %xmm1
	movhpd	8(%rax,%r15), %xmm2
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	movsd	(%rax,%rcx), %xmm2
	mulpd	%xmm4, %xmm1
	movhpd	8(%rcx,%rax), %xmm2
	addpd	%xmm1, %xmm0
	movapd	%xmm2, %xmm1
	mulpd	%xmm3, %xmm1
	divpd	%xmm10, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm0, (%rbx,%rax)
	addq	$16, %rax
	cmpl	%esi, %edx
	jb	.L7
	movl	20(%rsp), %r9d
	cmpl	%r9d, 16(%rsp)
	movsd	24(%rsp), %xmm2
	movl	52(%rsp), %eax
	je	.L4
.L6:
	movq	-32(%rsp), %rdx
	movslq	%eax, %rcx
	movq	-96(%rsp), %rbx
	movq	-80(%rsp), %r9
	movq	%r14, 24(%rsp)
	movl	12(%rsp), %r14d
	movsd	.LC5(%rip), %xmm3
	leaq	(%rcx,%rdx), %rdx
	leaq	(%rbx,%rdx,8), %rdx
	movq	%rdx, -120(%rsp)
	movq	-40(%rsp), %rdx
	leaq	(%rcx,%rdx), %rdx
	leaq	(%rbx,%rdx,8), %r8
	movq	-48(%rsp), %rdx
	leaq	(%rcx,%rdx), %rdx
	leaq	(%rbx,%rdx,8), %rbp
	movq	-56(%rsp), %rdx
	leaq	(%rcx,%rdx), %rdx
	leaq	(%rbx,%rdx,8), %rdi
	leal	1(%rax), %edx
	movslq	%edx, %rdx
	addq	-80(%rsp), %rdx
	leaq	(%rbx,%rdx,8), %rsi
	leaq	-1(%r9,%rcx), %rdx
	leaq	(%rbx,%rdx,8), %rbx
	leaq	(%rcx,%r9), %rdx
	movq	-96(%rsp), %rcx
	movq	-120(%rsp), %r9
	salq	$3, %rdx
	addq	%rdx, %rcx
	addq	40(%rsp), %rdx
	.p2align 4,,10
	.p2align 3
.L8:
	movsd	(%r9), %xmm0
	addl	$1, %eax
	movsd	(%r8), %xmm1
	addq	$8, %r9
	addsd	%xmm0, %xmm0
	addq	$8, %r8
	mulsd	%xmm13, %xmm1
	addsd	%xmm1, %xmm0
	movsd	0(%rbp), %xmm1
	addq	$8, %rbp
	mulsd	%xmm12, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rdi), %xmm1
	addq	$8, %rdi
	mulsd	%xmm15, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rsi), %xmm1
	addq	$8, %rsi
	mulsd	%xmm14, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rbx), %xmm1
	addq	$8, %rbx
	mulsd	%xmm11, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rcx), %xmm1
	addq	$8, %rcx
	mulsd	%xmm3, %xmm1
	divsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rdx
	cmpl	%eax, %r14d
	jg	.L8
	movq	24(%rsp), %r14
.L4:
	movl	-4(%rsp), %eax
.L11:
	movq	-112(%rsp), %rdx
	addl	$1, -68(%rsp)
	movq	-88(%rsp), %rbx
	addq	-112(%rsp), %r11
	addq	-112(%rsp), %r12
	addq	-112(%rsp), %r13
	addq	-112(%rsp), %r14
	addq	%rdx, %r15
	addq	-112(%rsp), %r10
	addq	%rdx, -64(%rsp)
	addq	%rdx, -104(%rsp)
	addq	%rdx, -16(%rsp)
	addq	%rdx, -24(%rsp)
	addq	%rbx, -32(%rsp)
	addq	%rbx, -40(%rsp)
	addq	%rbx, -48(%rsp)
	addq	%rbx, -56(%rsp)
	addq	%rbx, -80(%rsp)
	movl	32(%rsp), %r9d
	cmpl	%r9d, -68(%rsp)
	jl	.L23
.L9:
	movq	56(%rsp), %r9
	movq	64(%rsp), %rdx
	addl	$1, -4(%rsp)
	addq	%r9, 120(%rsp)
	addq	%r9, 112(%rsp)
	addq	%r9, 96(%rsp)
	addq	%r9, 160(%rsp)
	addq	%r9, 72(%rsp)
	addq	%r9, 80(%rsp)
	addq	%r9, 152(%rsp)
	addq	%rdx, 144(%rsp)
	addq	%rdx, 136(%rsp)
	addq	%rdx, 88(%rsp)
	addq	%rdx, 104(%rsp)
	addq	%rdx, 128(%rsp)
	cmpl	%eax, 180(%rsp)
	jg	.L26
.L21:
	movq	272(%rsp), %r9
	movl	212(%rsp), %ebx
	addq	%r9, 312(%rsp)
	addl	%ebx, 188(%rsp)
	addl	%ebx, 36(%rsp)
	addq	%r9, 296(%rsp)
	addq	%r9, 288(%rsp)
	addq	%r9, 280(%rsp)
	movq	336(%rsp), %rax
	movl	348(%rsp), %edx
	addq	%rax, 248(%rsp)
	addl	%edx, 308(%rsp)
	movl	332(%rsp), %ebx
	cmpl	%ebx, 268(%rsp)
	jg	.L28
.L24:
	movq	192(%rsp), %r9
	movl	432(%rsp), %ebx
	addq	%r9, 240(%rsp)
	addl	%ebx, 204(%rsp)
	addq	%r9, 216(%rsp)
	addq	%r9, 224(%rsp)
	addq	%r9, 256(%rsp)
	addq	%r9, 232(%rsp)
	jmp	.L30
	.p2align 4,,10
	.p2align 3
.L43:
	cmpq	%r15, -24(%rsp)
	jb	.L19
	.p2align 4,,10
	.p2align 3
.L20:
	movq	168(%rsp), %r9
	addq	-16(%rsp), %r9
	movq	%r15, %rsi
	movq	-104(%rsp), %rbp
	movq	-64(%rsp), %rdi
	movq	%r10, %rax
	movsd	.LC0(%rip), %xmm8
	movq	%r14, %rbx
	movsd	.LC1(%rip), %xmm7
	movq	%r13, %rcx
	movsd	.LC2(%rip), %xmm6
	movq	%r12, %rdx
	movsd	.LC3(%rip), %xmm5
	movq	%r11, %r8
	movsd	.LC4(%rip), %xmm4
	movsd	.LC5(%rip), %xmm3
	.p2align 4,,10
	.p2align 3
.L3:
	movsd	(%r8), %xmm0
	addq	$8, %r8
	movsd	(%rdx), %xmm1
	addq	$8, %rdx
	addsd	%xmm0, %xmm0
	mulsd	%xmm8, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rcx), %xmm1
	addq	$8, %rcx
	mulsd	%xmm7, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rbx), %xmm1
	addq	$8, %rbx
	mulsd	%xmm6, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rax), %xmm1
	addq	$8, %rax
	mulsd	%xmm5, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rsi), %xmm1
	addq	$8, %rsi
	mulsd	%xmm4, %xmm1
	addsd	%xmm1, %xmm0
	movsd	(%rdi), %xmm1
	addq	$8, %rdi
	mulsd	%xmm3, %xmm1
	divsd	%xmm2, %xmm1
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 0(%rbp)
	addq	$8, %rbp
	cmpq	%r9, %rax
	jne	.L3
	jmp	.L4
	.p2align 4,,10
	.p2align 3
.L38:
	cmpq	%r11, -24(%rsp)
	jae	.L20
	leaq	16(%r12), %rax
	cmpq	%rax, -104(%rsp)
	ja	.L15
	.p2align 4,,10
	.p2align 3
.L39:
	cmpq	%r12, -24(%rsp)
	jae	.L20
	leaq	16(%r13), %rax
	cmpq	%rax, -104(%rsp)
	ja	.L16
	.p2align 4,,10
	.p2align 3
.L40:
	cmpq	%r13, -24(%rsp)
	jae	.L20
	leaq	16(%r14), %rax
	cmpq	%rax, -104(%rsp)
	ja	.L17
	.p2align 4,,10
	.p2align 3
.L41:
	cmpq	%r14, -24(%rsp)
	jae	.L20
	leaq	16(%r10), %rax
	cmpq	%rax, -104(%rsp)
	ja	.L18
	.p2align 4,,10
	.p2align 3
.L42:
	cmpq	%r10, -24(%rsp)
	jb	.L18
	jmp	.L20
	.p2align 4,,10
	.p2align 3
.L44:
	movq	-64(%rsp), %rbx
	cmpq	%rbx, -24(%rsp)
	jae	.L20
	movl	20(%rsp), %eax
	testl	%eax, %eax
	jne	.L5
.L45:
	movl	36(%rsp), %eax
	jmp	.L6
.L27:
	movq	40(%rsp), %rax
	movq	-96(%rsp), %r9
	addl	$1, 328(%rsp)
	movq	%r9, 40(%rsp)
	movq	%rax, -96(%rsp)
	jmp	.L2
.L31:
	addq	$376, %rsp
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
.LFE0:
	.size	StencilProbeBlocked, .-StencilProbeBlocked
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
