	.file	"probe_heat_circqueue.c"
	.text
	.p2align 4,,15
.globl StencilProbeCircqueue
	.type	StencilProbeCircqueue, @function
StencilProbeCircqueue:
.LFB19:
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
	subq	$416, %rsp
	.cfi_def_cfa_offset 472
	movq	queuePlane1(%rip), %rbx
	movq	queuePlanesIndices(%rip), %rbp
	movl	%edx, 68(%rsp)
	movl	%ecx, %edx
	movq	%rdi, 248(%rsp)
	subl	$2, %edx
	movl	%ecx, 204(%rsp)
	movq	248(%rsp), %r9
	movl	%edx, %eax
	sarl	$31, %edx
	movq	%rsi, 368(%rsp)
	idivl	472(%rsp)
	movsd	(%rdi), %xmm7
	movl	204(%rsp), %edi
	imull	68(%rsp), %edi
	leal	-2(%r8), %edx
	movq	queuePlane0(%rip), %rcx
	movq	queuePlane2(%rip), %rsi
	movl	68(%rsp), %r15d
	movq	%rbx, 264(%rsp)
	movl	%edx, 388(%rsp)
	addl	488(%rsp), %edx
	movq	%rcx, 272(%rsp)
	movq	%rsi, 224(%rsp)
	movq	%rbp, 304(%rsp)
	movl	$0, 360(%rsp)
	subl	$1, %r15d
	movl	%edi, 244(%rsp)
	movslq	%edi, %r11
	movl	%eax, 396(%rsp)
	leal	-1(%r8), %eax
	movl	%edx, 384(%rsp)
	imull	%edi, %eax
	cltq
	leaq	(%r9,%rax,8), %rax
	movq	%rax, 352(%rsp)
	movl	$1, 392(%rsp)
	movl	%edi, %eax
	movl	68(%rsp), %r12d
	addl	%eax, %eax
	movq	%r11, 376(%rsp)
	cltq
	salq	$3, %r11
	addq	%r11, %r9
	salq	$3, %rax
	movq	%r11, 320(%rsp)
	subl	$2, %r12d
	movq	%r9, 400(%rsp)
	movq	%rax, 408(%rsp)
	movl	%r12d, 64(%rsp)
	shrl	%r12d
	movl	%r12d, 196(%rsp)
	addl	%r12d, %r12d
	movl	%r12d, 80(%rsp)
	addl	$1, %r12d
	movl	%r12d, 200(%rsp)
.L2:
	movl	392(%rsp), %eax
	subl	$1, %eax
	cmpl	%eax, 396(%rsp)
	jle	.L57
	cmpl	$1, 384(%rsp)
	jle	.L54
	movl	204(%rsp), %eax
	movq	248(%rsp), %rdi
	movq	376(%rsp), %r11
	movl	204(%rsp), %r12d
	movl	488(%rsp), %ecx
	movl	244(%rsp), %r14d
	negl	%eax
	movq	%rdi, %r9
	addq	408(%rsp), %r9
	movl	%eax, 108(%rsp)
	movq	400(%rsp), %rbp
	subl	$1, %r12d
	imull	68(%rsp), %eax
	addq	$1, %r11
	subl	$1, %ecx
	movq	%rdi, 296(%rsp)
	movq	%rbp, 288(%rsp)
	movq	%r9, 280(%rsp)
	movq	%r11, 328(%rsp)
	movl	%r12d, 348(%rsp)
	movl	%r12d, 240(%rsp)
	movl	%r14d, 344(%rsp)
	movl	%r14d, 340(%rsp)
	movl	$1, 188(%rsp)
	movslq	%eax, %rdx
	movl	$2, 260(%rsp)
	movl	%eax, 212(%rsp)
	movq	%rdx, 216(%rsp)
	movl	%ecx, 236(%rsp)
.L58:
	movl	488(%rsp), %eax
	movl	260(%rsp), %ebx
	testl	%eax, %eax
	movl	%ebx, 364(%rsp)
	jle	.L56
	movl	488(%rsp), %eax
	addl	472(%rsp), %eax
	addl	360(%rsp), %eax
	movslq	68(%rsp), %rcx
	movl	240(%rsp), %edi
	movl	244(%rsp), %r9d
	movl	240(%rsp), %r11d
	movl	68(%rsp), %ebx
	movl	388(%rsp), %ebp
	movl	240(%rsp), %r12d
	movl	%eax, 92(%rsp)
	movl	360(%rsp), %eax
	addl	$1, %edi
	subl	488(%rsp), %eax
	movl	344(%rsp), %r14d
	negl	%r9d
	movq	328(%rsp), %rdx
	addl	$2, %r11d
	movq	%rcx, %r13
	subl	$3, %ebx
	movl	%edi, 140(%rsp)
	movl	%ebp, 132(%rsp)
	movl	%r9d, 208(%rsp)
	movl	%r11d, 168(%rsp)
	salq	$3, %r13
	addl	$2, %eax
	movl	%r12d, 156(%rsp)
	movl	%r14d, 172(%rsp)
	movl	%eax, 88(%rsp)
	movl	340(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movq	$0, 160(%rsp)
	movl	$1, 72(%rsp)
	movl	$0, 76(%rsp)
	movl	%eax, 192(%rsp)
	movq	%rcx, -104(%rsp)
	movq	%rbx, 312(%rsp)
	.p2align 4,,10
	.p2align 3
.L53:
	movl	76(%rsp), %eax
	cmpl	%eax, 188(%rsp)
	movl	72(%rsp), %r14d
	movl	%r14d, 136(%rsp)
	jle	.L5
	movl	132(%rsp), %eax
	addl	$1, %eax
	cmpl	188(%rsp), %eax
	jle	.L5
	movl	76(%rsp), %r14d
	testl	%r14d, %r14d
	jne	.L6
	movq	280(%rsp), %rdx
	movq	288(%rsp), %rcx
	movq	296(%rsp), %rbx
	movq	%rdx, 112(%rsp)
	movq	%rcx, -112(%rsp)
	movq	%rbx, 120(%rsp)
.L7:
	movl	88(%rsp), %r12d
	movl	92(%rsp), %ebp
	movl	$1, %r8d
	movl	$0, %eax
	movl	348(%rsp), %r11d
	movl	76(%rsp), %r14d
	testl	%r12d, %r12d
	cmovg	88(%rsp), %r8d
	cmovg	88(%rsp), %eax
	setle	%r10b
	cmpl	%ebp, 204(%rsp)
	movq	368(%rsp), %r12
	movq	%r12, 96(%rsp)
	cmovg	%ebp, %r11d
	cmovle	204(%rsp), %ebp
	xorl	%r9d, %r9d
	cmpl	%r14d, 236(%rsp)
	movl	%r11d, 84(%rsp)
	je	.L13
	movq	304(%rsp), %rbx
	movq	160(%rsp), %rcx
	movl	140(%rsp), %r9d
	movq	224(%rsp), %rsi
	movslq	(%rbx,%rcx), %rdx
	leal	(%rax,%r9), %r9d
	imull	68(%rsp), %r9d
	leaq	(%rsi,%rdx,8), %rdx
	movq	%rdx, 96(%rsp)
.L13:
	testb	%r10b, %r10b
	jne	.L60
	movl	76(%rsp), %r11d
	testl	%r11d, %r11d
	jne	.L14
.L60:
	movl	172(%rsp), %r14d
.L16:
	movl	72(%rsp), %edi
	cmpl	%edi, 188(%rsp)
	movq	248(%rsp), %r11
	movl	132(%rsp), %r12d
	cmovne	120(%rsp), %r11
	cmpl	%r12d, 188(%rsp)
	movq	352(%rsp), %rdx
	movl	76(%rsp), %ecx
	cmovne	112(%rsp), %rdx
	cmpl	%ecx, 236(%rsp)
	movl	%edi, 136(%rsp)
	movq	%r11, 120(%rsp)
	movq	%rdx, 112(%rsp)
	jle	.L19
	leal	1(%rax), %edx
	leal	-1(%rbp), %ecx
	cmpl	%ecx, %edx
	jge	.L20
	movl	140(%rsp), %ebx
	movq	-112(%rsp), %r11
	movslq	%r14d, %rdi
	leal	2(%rax), %esi
	movslq	%r9d, %r12
	leal	1(%rbx,%rax), %edx
	imull	68(%rsp), %edx
	movslq	%edx, %rcx
	leal	(%r15,%rdx), %edx
	movq	%rcx, %rax
	subq	%rdi, %rax
	leaq	(%r11,%rax,8), %rbx
	movq	96(%rsp), %r11
	movq	%rcx, %rax
	subq	%r12, %rax
	leaq	(%r11,%rax,8), %rcx
	movslq	%edx, %r11
	movq	%r11, %rax
	subq	%rdi, %rax
	movq	-112(%rsp), %rdi
	leaq	(%rdi,%rax,8), %rdx
	movq	%r11, %rax
	movq	96(%rsp), %r11
	subq	%r12, %rax
	leaq	(%r11,%rax,8), %rax
	.p2align 4,,10
	.p2align 3
.L21:
	movq	(%rbx), %rdi
	addl	$1, %esi
	addq	%r13, %rbx
	movq	%rdi, (%rcx)
	movq	(%rdx), %rdi
	addq	%r13, %rcx
	addq	%r13, %rdx
	movq	%rdi, (%rax)
	addq	%r13, %rax
	cmpl	%ebp, %esi
	jne	.L21
.L20:
	testb	%r10b, %r10b
	je	.L22
	cmpl	$1, %r15d
	jle	.L22
	movq	176(%rsp), %rax
	movq	96(%rsp), %r12
	movslq	%r9d, %rdi
	movslq	%r14d, %rsi
	movq	-112(%rsp), %rdx
	subq	%rdi, %rax
	leaq	(%r12,%rax,8), %rbx
	movq	176(%rsp), %rax
	subq	%rsi, %rax
	cmpl	$21, 64(%rsp)
	leaq	(%rdx,%rax,8), %rcx
	jbe	.L23
	testb	$15, %bl
	jne	.L23
	leaq	16(%rcx), %rax
	cmpq	%rax, %rbx
	jbe	.L78
.L61:
	movl	80(%rsp), %r10d
	testl	%r10d, %r10d
	je	.L79
	movl	196(%rsp), %r10d
	xorl	%eax, %eax
	xorl	%edx, %edx
	.p2align 4,,10
	.p2align 3
.L27:
	movsd	(%rcx,%rax), %xmm1
	addl	$1, %edx
	movhpd	8(%rcx,%rax), %xmm1
	movapd	%xmm1, (%rbx,%rax)
	addq	$16, %rax
	cmpl	%r10d, %edx
	jb	.L27
	movl	80(%rsp), %r11d
	cmpl	%r11d, 64(%rsp)
	movl	200(%rsp), %eax
	je	.L22
.L26:
	movl	192(%rsp), %ebx
	movq	-112(%rsp), %r12
	addl	%eax, %ebx
	movslq	%ebx, %rbx
	movq	%rbx, %rdx
	subq	%rsi, %rdx
	leaq	(%r12,%rdx,8), %rcx
	movq	%rbx, %rdx
	movq	96(%rsp), %rbx
	subq	%rdi, %rdx
	leaq	(%rbx,%rdx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L28:
	movq	(%rcx), %rbx
	addl	$1, %eax
	addq	$8, %rcx
	movq	%rbx, (%rdx)
	addq	$8, %rdx
	cmpl	%eax, %r15d
	jg	.L28
.L22:
	cmpl	204(%rsp), %ebp
	je	.L80
.L19:
	cmpl	84(%rsp), %r8d
	jge	.L5
	movl	140(%rsp), %ecx
	movl	156(%rsp), %eax
	movslq	%r14d, %rbp
	movq	-112(%rsp), %rdi
	notl	%r14d
	movq	%rbp, 56(%rsp)
	movq	120(%rsp), %r11
	movq	112(%rsp), %r10
	movslq	%r9d, %r9
	addl	%r8d, %ecx
	addl	%r8d, %eax
	movq	%r9, 144(%rsp)
	imull	68(%rsp), %ecx
	imull	68(%rsp), %eax
	movslq	%ecx, %rdx
	movslq	%eax, %rbx
	leaq	1(%rdx), %rsi
	movq	%rbx, %rax
	subq	%rbp, %rax
	movq	%rsi, %r12
	leaq	8(%rdi,%rax,8), %rax
	subq	%rbp, %r12
	movslq	%r14d, %rdi
	movq	-112(%rsp), %rbp
	movq	%rdx, %r14
	subq	56(%rsp), %r14
	movq	%rax, -88(%rsp)
	leaq	(%rsi,%rdi), %rax
	salq	$3, %r12
	addq	%r12, %r11
	addq	%r12, %r10
	leaq	0(%rbp,%rax,8), %rax
	movq	%r14, -48(%rsp)
	movq	%rax, -96(%rsp)
	movq	%rdx, %rax
	subq	56(%rsp), %rax
	leaq	16(%rbp,%rax,8), %rax
	movq	%rax, -64(%rsp)
	leaq	0(%rbp,%r14,8), %rax
	movq	-112(%rsp), %r14
	movq	%rax, -56(%rsp)
	movl	168(%rsp), %eax
	addq	%r14, %r12
	movq	%r12, 48(%rsp)
	movq	120(%rsp), %r12
	addl	%r8d, %eax
	imull	68(%rsp), %eax
	movslq	%eax, %rbp
	movq	%rbp, %rax
	subq	56(%rsp), %rax
	leaq	8(%r14,%rax,8), %rax
	movq	%rax, -72(%rsp)
	movq	%rsi, %rax
	movq	96(%rsp), %rsi
	subq	%r9, %rax
	movq	-112(%rsp), %r9
	leaq	(%rsi,%rax,8), %r14
	movq	312(%rsp), %rax
	leaq	3(%rdx), %rsi
	addq	%rdi, %rdx
	leaq	(%rbx,%rax), %rax
	subq	56(%rsp), %rax
	leaq	(%r9,%rax,8), %rax
	movq	%rsi, %r9
	subq	56(%rsp), %r9
	movq	%rax, 40(%rsp)
	movq	%rsi, %rax
	subq	144(%rsp), %rax
	salq	$3, %r9
	addq	%r9, %r12
	movq	%r12, (%rsp)
	movq	96(%rsp), %r12
	leaq	(%r12,%rax,8), %rax
	movq	%rax, -8(%rsp)
	addq	112(%rsp), %r9
	movq	%rbx, %rax
	subq	56(%rsp), %rax
	subq	56(%rsp), %rbx
	movsd	.LC0(%rip), %xmm4
	movq	48(%rsp), %r12
	movapd	.LC1(%rip), %xmm5
	movq	%r9, 8(%rsp)
	movq	-112(%rsp), %r9
	movapd	%xmm4, %xmm6
	movl	%ecx, -12(%rsp)
	movq	%rbx, -24(%rsp)
	movq	%rdx, -32(%rsp)
	movl	%r8d, -76(%rsp)
	leaq	24(%r9,%rax,8), %rax
	movq	%rax, 16(%rsp)
	leaq	(%rdi,%rsi), %rax
	leaq	(%r9,%rax,8), %rax
	movq	%rax, 24(%rsp)
	movq	%rbp, %rax
	subq	56(%rsp), %rax
	subq	56(%rsp), %rbp
	leaq	24(%r9,%rax,8), %rax
	movq	%rbp, -40(%rsp)
	movq	%rax, 32(%rsp)
	.p2align 4,,10
	.p2align 3
.L37:
	cmpl	$1, %r15d
	jle	.L39
	cmpl	$5, 64(%rsp)
	movapd	%xmm7, %xmm2
	mulsd	%xmm7, %xmm2
	jbe	.L52
	testb	$15, %r14b
	jne	.L52
	cmpq	(%rsp), %r14
	jbe	.L81
	cmpq	8(%rsp), %r14
	jbe	.L82
.L47:
	cmpq	16(%rsp), %r14
	jbe	.L83
.L48:
	cmpq	24(%rsp), %r14
	jbe	.L84
.L49:
	movq	-56(%rsp), %rax
	addq	$32, %rax
	cmpq	%rax, %r14
	jbe	.L85
.L50:
	cmpq	32(%rsp), %r14
	jbe	.L86
.L51:
	movq	-56(%rsp), %rax
	addq	$24, %rax
	cmpq	%rax, %r14
	jbe	.L87
	movl	80(%rsp), %edx
	testl	%edx, %edx
	je	.L88
.L40:
	movapd	%xmm2, %xmm8
	movq	-72(%rsp), %rsi
	movq	-64(%rsp), %rbx
	movq	-96(%rsp), %rcx
	xorl	%eax, %eax
	unpcklpd	%xmm8, %xmm8
	movq	-88(%rsp), %rdx
	movl	196(%rsp), %ebp
	xorl	%edi, %edi
	movapd	%xmm8, %xmm3
	.p2align 4,,10
	.p2align 3
.L42:
	movsd	(%rax,%r11), %xmm1
	addl	$1, %edi
	movsd	(%rax,%r10), %xmm8
	movhpd	8(%r11,%rax), %xmm1
	movhpd	8(%r10,%rax), %xmm8
	movapd	%xmm1, %xmm0
	addpd	%xmm8, %xmm0
	movsd	(%rdx), %xmm8
	movhpd	8(%rdx), %xmm8
	addq	$16, %rdx
	addpd	%xmm8, %xmm0
	movsd	(%rcx), %xmm8
	movhpd	8(%rcx), %xmm8
	addq	$16, %rcx
	addpd	%xmm8, %xmm0
	movsd	(%rbx), %xmm8
	movhpd	8(%rbx), %xmm8
	addq	$16, %rbx
	addpd	%xmm8, %xmm0
	movsd	(%rsi), %xmm8
	movhpd	8(%rsi), %xmm8
	addq	$16, %rsi
	addpd	%xmm8, %xmm0
	movsd	(%rax,%r12), %xmm8
	movhpd	8(%r12,%rax), %xmm8
	movapd	%xmm8, %xmm1
	mulpd	%xmm5, %xmm1
	divpd	%xmm3, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm0, (%r14,%rax)
	addq	$16, %rax
	cmpl	%ebp, %edi
	jb	.L42
	movl	80(%rsp), %edx
	cmpl	%edx, 64(%rsp)
	movl	200(%rsp), %eax
	je	.L39
.L41:
	movl	-12(%rsp), %edx
	movq	-24(%rsp), %rbx
	movq	-112(%rsp), %rsi
	movq	120(%rsp), %r9
	movq	112(%rsp), %r8
	leal	(%rax,%rdx), %edx
	movslq	%edx, %rdx
	movq	%rdx, 48(%rsp)
	movq	%rdx, %rcx
	movslq	%eax, %rdx
	leaq	(%rdx,%rbx), %rbx
	subq	56(%rsp), %rcx
	leaq	(%rsi,%rbx,8), %rbp
	movq	-32(%rsp), %rbx
	salq	$3, %rcx
	leaq	(%rdx,%rbx), %rbx
	addq	%rcx, %r9
	addq	%rcx, %r8
	leaq	(%rsi,%rbx,8), %rdi
	leal	1(%rax), %ebx
	movq	-48(%rsp), %rsi
	movslq	%ebx, %rbx
	leaq	(%rbx,%rsi), %rsi
	movq	-112(%rsp), %rbx
	leaq	(%rbx,%rsi,8), %rsi
	movq	-40(%rsp), %rbx
	leaq	(%rdx,%rbx), %rbx
	movq	-112(%rsp), %rdx
	addq	%rdx, %rcx
	leaq	(%rdx,%rbx,8), %rbx
	movq	48(%rsp), %rdx
	subq	144(%rsp), %rdx
	movq	%rcx, -120(%rsp)
	movq	96(%rsp), %rcx
	leaq	(%rcx,%rdx,8), %rdx
	movq	-120(%rsp), %rcx
	.p2align 4,,10
	.p2align 3
.L43:
	movsd	(%r9), %xmm0
	addl	$1, %eax
	movsd	(%rcx), %xmm1
	addq	$8, %r9
	addsd	(%r8), %xmm0
	addq	$8, %rcx
	addq	$8, %r8
	mulsd	%xmm4, %xmm1
	divsd	%xmm2, %xmm1
	addsd	0(%rbp), %xmm0
	addq	$8, %rbp
	addsd	(%rdi), %xmm0
	addq	$8, %rdi
	addsd	(%rsi), %xmm0
	addq	$8, %rsi
	addsd	(%rbx), %xmm0
	addq	$8, %rbx
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%rdx)
	addq	$8, %rdx
	cmpl	%eax, %r15d
	jg	.L43
.L39:
	movq	-104(%rsp), %rsi
	addl	$1, -76(%rsp)
	addq	%r13, %r11
	addq	%r13, -88(%rsp)
	movl	68(%rsp), %ebx
	addq	%r13, %r10
	addq	%r13, -96(%rsp)
	addq	%r13, %r12
	addq	%r13, %r14
	addq	%r13, -64(%rsp)
	addq	%r13, -56(%rsp)
	addq	%r13, -72(%rsp)
	addq	%r13, 40(%rsp)
	addq	%r13, (%rsp)
	addq	%r13, -8(%rsp)
	addq	%r13, 8(%rsp)
	addq	%r13, 16(%rsp)
	addq	%r13, 24(%rsp)
	addq	%r13, 32(%rsp)
	addl	%ebx, -12(%rsp)
	addq	%rsi, -24(%rsp)
	addq	%rsi, -32(%rsp)
	addq	%rsi, -48(%rsp)
	addq	%rsi, -40(%rsp)
	movl	-76(%rsp), %edi
	cmpl	%edi, 84(%rsp)
	jg	.L37
.L5:
	movl	108(%rsp), %esi
	addl	$1, 76(%rsp)
	addl	$1, 72(%rsp)
	movq	216(%rsp), %rcx
	movl	212(%rsp), %ebx
	addq	%rcx, 176(%rsp)
	addl	%ebx, 192(%rsp)
	addl	%esi, 140(%rsp)
	addl	$1, 132(%rsp)
	movl	208(%rsp), %edi
	addl	%esi, 156(%rsp)
	movl	136(%rsp), %ebp
	addl	%edi, 172(%rsp)
	addq	$4, 160(%rsp)
	subl	$1, 92(%rsp)
	addl	$1, 88(%rsp)
	addl	%esi, 168(%rsp)
	cmpl	%ebp, 488(%rsp)
	jg	.L53
	movq	272(%rsp), %rax
	movq	264(%rsp), %r9
	movq	224(%rsp), %r11
	movq	%r9, 272(%rsp)
	movq	%rax, 224(%rsp)
	movq	%r11, 264(%rsp)
.L56:
	movq	320(%rsp), %r12
	movl	244(%rsp), %eax
	addl	$1, 260(%rsp)
	addl	$1, 188(%rsp)
	addq	%r12, 296(%rsp)
	addq	%r12, 288(%rsp)
	addq	%r12, 280(%rsp)
	movq	376(%rsp), %r14
	addl	%eax, 340(%rsp)
	movl	204(%rsp), %edx
	addq	%r14, 328(%rsp)
	movl	364(%rsp), %ecx
	addl	%eax, 344(%rsp)
	addl	%edx, 240(%rsp)
	cmpl	%ecx, 384(%rsp)
	jg	.L58
.L54:
	movl	472(%rsp), %esi
	addl	$1, 392(%rsp)
	addl	%esi, 360(%rsp)
	jmp	.L2
	.p2align 4,,10
	.p2align 3
.L86:
	movq	-72(%rsp), %rdx
	cmpq	%rdx, -8(%rsp)
	jb	.L51
	.p2align 4,,10
	.p2align 3
.L52:
	movq	40(%rsp), %r9
	movq	-72(%rsp), %rdi
	movq	%r14, %r8
	movq	-64(%rsp), %rsi
	movq	-96(%rsp), %rbx
	movq	%r12, %rbp
	movq	-88(%rsp), %rax
	movq	%r10, %rcx
	movq	%r11, %rdx
	addq	$16, %r9
	.p2align 4,,10
	.p2align 3
.L38:
	movsd	(%rdx), %xmm0
	addq	$8, %rdx
	movsd	0(%rbp), %xmm1
	addq	$8, %rbp
	addsd	(%rcx), %xmm0
	addq	$8, %rcx
	mulsd	%xmm6, %xmm1
	divsd	%xmm2, %xmm1
	addsd	(%rax), %xmm0
	addq	$8, %rax
	addsd	(%rbx), %xmm0
	addq	$8, %rbx
	addsd	(%rsi), %xmm0
	addq	$8, %rsi
	addsd	(%rdi), %xmm0
	addq	$8, %rdi
	addsd	%xmm1, %xmm0
	movsd	%xmm0, (%r8)
	addq	$8, %r8
	cmpq	%r9, %rax
	jne	.L38
	jmp	.L39
	.p2align 4,,10
	.p2align 3
.L81:
	cmpq	%r11, -8(%rsp)
	jae	.L52
	cmpq	8(%rsp), %r14
	ja	.L47
	.p2align 4,,10
	.p2align 3
.L82:
	cmpq	%r10, -8(%rsp)
	jae	.L52
	cmpq	16(%rsp), %r14
	ja	.L48
	.p2align 4,,10
	.p2align 3
.L83:
	movq	-88(%rsp), %rbp
	cmpq	%rbp, -8(%rsp)
	jae	.L52
	cmpq	24(%rsp), %r14
	ja	.L49
	.p2align 4,,10
	.p2align 3
.L84:
	movq	-96(%rsp), %r9
	cmpq	%r9, -8(%rsp)
	jae	.L52
	movq	-56(%rsp), %rax
	addq	$32, %rax
	cmpq	%rax, %r14
	ja	.L50
	.p2align 4,,10
	.p2align 3
.L85:
	movq	-64(%rsp), %rax
	cmpq	%rax, -8(%rsp)
	jb	.L50
	jmp	.L52
	.p2align 4,,10
	.p2align 3
.L87:
	cmpq	%r12, -8(%rsp)
	jae	.L52
	movl	80(%rsp), %edx
	testl	%edx, %edx
	jne	.L40
.L88:
	movl	$1, %eax
	jmp	.L41
	.p2align 4,,10
	.p2align 3
.L6:
	movq	304(%rsp), %rdi
	movq	160(%rsp), %rsi
	movq	272(%rsp), %rbp
	movq	264(%rsp), %r9
	movslq	-4(%rdi,%rsi), %rax
	salq	$3, %rax
	addq	%rax, %rbp
	addq	%rax, %r9
	addq	224(%rsp), %rax
	movq	%rbp, 120(%rsp)
	movq	%r9, -112(%rsp)
	movq	%rax, 112(%rsp)
	jmp	.L7
.L14:
	movl	156(%rsp), %r14d
	leal	(%rax,%r14), %r14d
	imull	68(%rsp), %r14d
	jmp	.L16
.L80:
	cmpl	$1, %r15d
	jle	.L19
	movl	84(%rsp), %esi
	addl	140(%rsp), %esi
	movslq	%r9d, %rbp
	imull	68(%rsp), %esi
	movq	96(%rsp), %rdi
	movq	-112(%rsp), %r11
	leal	1(%rsi), %edx
	movslq	%edx, %rdx
	movq	%rdx, %rax
	subq	%rbp, %rax
	leaq	(%rdi,%rax,8), %rbx
	movq	%rdx, %rax
	movslq	%r14d, %rdi
	subq	%rdi, %rax
	cmpl	$21, 64(%rsp)
	leaq	(%r11,%rax,8), %rdx
	jbe	.L30
	testb	$15, %bl
	jne	.L30
	leaq	16(%rdx), %rax
	cmpq	%rax, %rbx
	jbe	.L89
.L62:
	cmpl	$0, 80(%rsp)
	movl	$1, %eax
	je	.L33
	movl	196(%rsp), %r10d
	xorl	%eax, %eax
	xorl	%ecx, %ecx
	.p2align 4,,10
	.p2align 3
.L34:
	movsd	(%rdx,%rax), %xmm8
	addl	$1, %ecx
	movhpd	8(%rdx,%rax), %xmm8
	movapd	%xmm8, (%rbx,%rax)
	addq	$16, %rax
	cmpl	%r10d, %ecx
	jb	.L34
	movl	80(%rsp), %edx
	cmpl	%edx, 64(%rsp)
	movl	200(%rsp), %eax
	je	.L19
.L33:
	leal	(%rax,%rsi), %ebx
	movq	-112(%rsp), %rsi
	movslq	%ebx, %rbx
	movq	%rbx, %rdx
	subq	%rdi, %rdx
	movq	96(%rsp), %rdi
	leaq	(%rsi,%rdx,8), %rcx
	movq	%rbx, %rdx
	subq	%rbp, %rdx
	leaq	(%rdi,%rdx,8), %rdx
	.p2align 4,,10
	.p2align 3
.L35:
	movq	(%rcx), %rbx
	addl	$1, %eax
	addq	$8, %rcx
	movq	%rbx, (%rdx)
	addq	$8, %rdx
	cmpl	%eax, %r15d
	jg	.L35
	jmp	.L19
.L78:
	leaq	16(%rbx), %rax
	cmpq	%rax, %rcx
	ja	.L61
.L23:
	movl	68(%rsp), %esi
	movl	$2, %eax
.L29:
	movq	(%rcx), %rdx
	addl	$1, %eax
	addq	$8, %rcx
	movq	%rdx, (%rbx)
	addq	$8, %rbx
	cmpl	%eax, %esi
	jne	.L29
	jmp	.L22
.L89:
	leaq	16(%rbx), %rax
	cmpq	%rax, %rdx
	ja	.L62
.L30:
	movl	$2, %eax
.L36:
	movq	(%rdx), %rcx
	addl	$1, %eax
	addq	$8, %rdx
	movq	%rcx, (%rbx)
	addq	$8, %rbx
	cmpl	%eax, 68(%rsp)
	jne	.L36
	jmp	.L19
.L79:
	movl	$1, %eax
	jmp	.L26
.L57:
	movq	272(%rsp), %rbx
	movq	264(%rsp), %rsi
	movq	224(%rsp), %rdi
	movq	%rbx, queuePlane0(%rip)
	movq	%rsi, queuePlane1(%rip)
	movq	%rdi, queuePlane2(%rip)
	addq	$416, %rsp
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
.LFE19:
	.size	StencilProbeCircqueue, .-StencilProbeCircqueue
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC2:
	.string	"Error on array queuePlanesIndices malloc."
	.align 8
.LC3:
	.string	"Error on array queuePlanes malloc."
	.text
	.p2align 4,,15
.globl CircularQueueInit
	.type	CircularQueueInit, @function
CircularQueueInit:
.LFB18:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	movl	%edx, %r13d
	leal	-1(%r13), %r14d
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	movl	%edi, %ebx
	movslq	%r14d, %rdi
	salq	$2, %rdi
	call	malloc
	testq	%rax, %rax
	movq	%rax, queuePlanesIndices(%rip)
	je	.L91
	xorl	%edi, %edi
	xorl	%r12d, %r12d
	cmpl	$1, %r13d
	jle	.L93
	leal	0(%rbp,%r14,2), %ebp
	leal	(%rbx,%rbx), %edx
	subl	$2, %r13d
	leaq	4(%rax,%r13,4), %rcx
	xorl	%r12d, %r12d
	imull	%ebx, %ebp
	negl	%edx
	.p2align 4,,10
	.p2align 3
.L94:
	movl	%r12d, (%rax)
	addq	$4, %rax
	addl	%ebp, %r12d
	addl	%edx, %ebp
	cmpq	%rcx, %rax
	jne	.L94
	leal	(%r12,%r12,2), %edi
	movslq	%edi, %rdi
	salq	$3, %rdi
.L93:
	call	malloc
	testq	%rax, %rax
	movq	%rax, queuePlanes(%rip)
	je	.L98
	movslq	%r12d, %rdx
	addl	%r12d, %r12d
	movq	%rax, queuePlane0(%rip)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 40
	movslq	%r12d, %r12
	leaq	(%rax,%rdx,8), %rdx
	popq	%rbp
	.cfi_def_cfa_offset 32
	leaq	(%rax,%r12,8), %rax
	movq	%rdx, queuePlane1(%rip)
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	movq	%rax, queuePlane2(%rip)
	popq	%r14
	.cfi_def_cfa_offset 8
	ret
.L91:
	.cfi_restore_state
	movl	$.LC2, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L98:
	movl	$.LC3, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE18:
	.size	CircularQueueInit, .-CircularQueueInit
	.comm	queuePlanes,8,8
	.comm	queuePlane0,8,8
	.comm	queuePlane1,8,8
	.comm	queuePlane2,8,8
	.comm	queuePlanesIndices,8,8
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC0:
	.long	0
	.long	-1072168960
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC1:
	.long	0
	.long	-1072168960
	.long	0
	.long	-1072168960
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
