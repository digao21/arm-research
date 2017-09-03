	.file	"probe_heat_oblivious.c"
	.text
	.p2align 4,,15
.globl walk3
	.type	walk3, @function
walk3:
.LFB0:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%edx, %r10d
	movl	%r9d, %r15d
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
	movl	%r8d, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$536, %rsp
	.cfi_def_cfa_offset 592
	movl	648(%rsp), %eax
	movl	680(%rsp), %edx
	movl	672(%rsp), %r11d
	movl	%r10d, 148(%rsp)
	movq	%rdi, 424(%rsp)
	movl	%ecx, 152(%rsp)
	addl	$2, %eax
	addl	$2, %edx
	movl	%r9d, 444(%rsp)
	movl	%r11d, %r12d
	movl	592(%rsp), %r14d
	movl	624(%rsp), %ebx
	movl	656(%rsp), %r13d
	movl	%eax, 160(%rsp)
	movl	%edx, 168(%rsp)
	movl	%esi, 136(%rsp)
	movl	664(%rsp), %r10d
	movl	632(%rsp), %r11d
	jmp	.L2
.L42:
	movl	160(%rsp), %eax
	movl	640(%rsp), %edx
	movl	$4, %ecx
	movl	%ebx, 32(%rsp)
	movl	444(%rsp), %r9d
	movl	%ebp, %r8d
	movl	136(%rsp), %esi
	movq	424(%rsp), %rdi
	addl	%r11d, %eax
	leal	(%rbx,%rdx), %edx
	movl	600(%rsp), %ebx
	imull	%r15d, %eax
	movl	%r10d, 72(%rsp)
	movl	%r11d, 40(%rsp)
	movl	%r10d, 104(%rsp)
	movl	%r12d, 80(%rsp)
	movl	%ebx, 8(%rsp)
	movl	%r13d, 64(%rsp)
	leal	(%rax,%rdx,2), %edx
	movl	$-1, 56(%rsp)
	movl	%r14d, (%rsp)
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	%ecx
	movl	616(%rsp), %edx
	movl	608(%rsp), %ecx
	movl	%edx, 24(%rsp)
	movl	%ecx, 16(%rsp)
	movl	148(%rsp), %edx
	movl	152(%rsp), %ecx
	movl	%eax, %r15d
	movl	680(%rsp), %eax
	movl	%r15d, 48(%rsp)
	movl	%r15d, %ebx
	movl	%eax, 88(%rsp)
	call	walk3
	movl	104(%rsp), %r10d
	movl	%ebp, %eax
	orl	$-1, %r11d
.L30:
	movl	444(%rsp), %r15d
	movl	%eax, %ebp
.L2:
	subl	%ebp, %r15d
	cmpl	$1, %r15d
	je	.L3
	movl	640(%rsp), %edx
	movl	%r12d, %ecx
	movl	608(%rsp), %esi
	subl	%r13d, %ecx
	movl	%ecx, %eax
	subl	%ebx, %edx
	subl	%r14d, %esi
	imull	%edx, %eax
	imull	%esi, %eax
	cmpl	$4095, %eax
	jle	.L3
	cmpl	$1, %r15d
	jle	.L32
	movl	680(%rsp), %eax
	leal	0(,%r15,4), %esi
	subl	%r10d, %eax
	imull	%r15d, %eax
	leal	(%rax,%rcx,2), %eax
	cmpl	%esi, %eax
	jge	.L41
	movl	648(%rsp), %eax
	subl	%r11d, %eax
	imull	%r15d, %eax
	leal	(%rax,%rdx,2), %eax
	cmpl	%eax, %esi
	jle	.L42
	movl	680(%rsp), %edx
	movl	648(%rsp), %ecx
	sarl	%r15d
	leal	(%r15,%rbp), %eax
	movl	136(%rsp), %esi
	movq	424(%rsp), %rdi
	movl	%ebp, %r8d
	movl	%r12d, 80(%rsp)
	movl	%r10d, 72(%rsp)
	movl	%edx, 88(%rsp)
	movl	%ecx, 56(%rsp)
	movl	%eax, %r9d
	movl	640(%rsp), %edx
	movl	616(%rsp), %ecx
	movl	%r13d, 64(%rsp)
	movl	%r11d, 40(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%r14d, (%rsp)
	movl	%edx, 48(%rsp)
	movl	%ecx, 24(%rsp)
	movl	608(%rsp), %edx
	movl	600(%rsp), %ecx
	movl	%eax, 120(%rsp)
	movl	%r10d, 104(%rsp)
	movl	%r11d, 112(%rsp)
	movl	%edx, 16(%rsp)
	movl	%ecx, 8(%rsp)
	movl	148(%rsp), %edx
	movl	152(%rsp), %ecx
	call	walk3
	movl	680(%rsp), %edx
	movl	104(%rsp), %r10d
	movl	112(%rsp), %r11d
	movl	120(%rsp), %eax
	imull	%r15d, %edx
	addl	%edx, %r12d
	movl	%r15d, %edx
	imull	%r10d, %edx
	addl	%edx, %r13d
	movl	648(%rsp), %edx
	imull	%r15d, %edx
	addl	%edx, 640(%rsp)
	movl	%r15d, %edx
	imull	%r11d, %edx
	addl	%edx, %ebx
	movl	616(%rsp), %edx
	imull	%r15d, %edx
	addl	%edx, 608(%rsp)
	imull	600(%rsp), %r15d
	addl	%r15d, %r14d
	jmp	.L30
.L41:
	movl	168(%rsp), %eax
	leal	0(%r13,%r12), %edx
	movl	$4, %ecx
	movl	444(%rsp), %r9d
	movl	136(%rsp), %esi
	movl	%ebp, %r8d
	movq	424(%rsp), %rdi
	movl	%r10d, 72(%rsp)
	addl	%r10d, %eax
	movl	%r13d, 64(%rsp)
	movl	%r11d, 40(%rsp)
	imull	%r15d, %eax
	movl	%r11d, 112(%rsp)
	movl	$-1, 88(%rsp)
	movl	%ebx, 32(%rsp)
	movl	%r14d, (%rsp)
	leal	(%rax,%rdx,2), %edx
	movl	%edx, %eax
	sarl	$31, %edx
	idivl	%ecx
	movl	640(%rsp), %edx
	movl	616(%rsp), %ecx
	movl	%edx, 48(%rsp)
	movl	600(%rsp), %edx
	movl	%ecx, 24(%rsp)
	movl	152(%rsp), %ecx
	movl	%eax, %r15d
	movl	%eax, 80(%rsp)
	movl	648(%rsp), %eax
	movl	%edx, 8(%rsp)
	movl	148(%rsp), %edx
	movl	%r15d, %r13d
	movl	%eax, 56(%rsp)
	movl	608(%rsp), %eax
	movl	%eax, 16(%rsp)
	call	walk3
	movl	%ebp, %eax
	orl	$-1, %r10d
	movl	112(%rsp), %r11d
	jmp	.L30
.L3:
	movq	424(%rsp), %rcx
	cmpl	444(%rsp), %ebp
	movl	%r11d, 632(%rsp)
	movl	%r10d, 664(%rsp)
	movl	%r12d, %r11d
	movl	148(%rsp), %r10d
	movl	136(%rsp), %r12d
	movq	(%rcx), %rax
	movsd	(%rax), %xmm7
	jge	.L32
	movl	664(%rsp), %eax
	movl	%r13d, %edx
	movl	616(%rsp), %ecx
	imull	%r10d, %edx
	subl	600(%rsp), %ecx
	movl	%ebx, 400(%rsp)
	movsd	.LC1(%rip), %xmm6
	addl	$1, %ebp
	movl	%r13d, 420(%rsp)
	movl	%r11d, 404(%rsp)
	imull	%r10d, %eax
	addl	632(%rsp), %eax
	movl	%ebp, 416(%rsp)
	movl	%ecx, 516(%rsp)
	movl	608(%rsp), %ecx
	movl	%r14d, 268(%rsp)
	movapd	%xmm6, %xmm5
	imull	%r12d, %eax
	cltq
	movq	%rax, 432(%rsp)
	leal	(%rbx,%rdx), %eax
	imull	%r12d, %eax
	cltq
	movq	%rax, 464(%rsp)
	leal	1(%rdx,%rbx), %eax
	imull	%r12d, %eax
	cltq
	movq	%rax, 472(%rsp)
	leal	-1(%rdx,%rbx), %eax
	movslq	%r14d, %rdx
	movq	%rdx, 408(%rsp)
	imull	%r12d, %eax
	cltq
	movq	%rax, 488(%rsp)
	movl	%r13d, %eax
	addl	$1, %eax
	imull	%r10d, %eax
	leal	(%rbx,%rax), %eax
	imull	%r12d, %eax
	cltq
	movq	%rax, 456(%rsp)
	movl	%r13d, %eax
	subl	$1, %eax
	imull	%r10d, %eax
	imull	%r12d, %r10d
	leal	(%rbx,%rax), %eax
	movl	640(%rsp), %ebx
	movslq	%r10d, %r10
	imull	%r12d, %eax
	movslq	%r12d, %r12
	movq	%r10, 296(%rsp)
	movl	%ebx, 264(%rsp)
	movq	%r10, %rbx
	movq	%r12, %rsi
	salq	$3, %rbx
	movq	%r12, 504(%rsp)
	salq	$3, %rsi
	cltq
	movq	%rbx, 312(%rsp)
	movq	%rax, 448(%rsp)
	movslq	600(%rsp), %rax
	movq	%rax, 520(%rsp)
	movl	%ecx, %eax
	subl	%r14d, %eax
	subl	$1, %eax
	movl	%eax, 484(%rsp)
.L28:
	movl	416(%rsp), %edi
	movl	404(%rsp), %edx
	movl	416(%rsp), %eax
	subl	$1, %edi
	cmpl	%edx, 420(%rsp)
	movl	%eax, 500(%rsp)
	jge	.L7
	movl	%eax, %edx
	movl	$2, %ebx
	sarl	$31, %edx
	idivl	%ebx
	movq	424(%rsp), %rax
	movslq	%edx, %rdx
	leaq	(%rax,%rdx,8), %rdx
	movl	%edi, %eax
	movq	%rdx, 280(%rsp)
	movl	%edi, %edx
	sarl	$31, %edx
	idivl	%ebx
	movl	420(%rsp), %eax
	movq	424(%rsp), %rbx
	addl	$1, %eax
	movl	%eax, 252(%rsp)
	movq	464(%rsp), %rax
	addq	408(%rsp), %rax
	movslq	%edx, %rdx
	leaq	(%rbx,%rdx,8), %rdx
	movq	448(%rsp), %rbx
	movq	%rdx, 272(%rsp)
	leaq	-8(,%rax,8), %rdx
	movq	%rbx, 320(%rsp)
	movq	472(%rsp), %rbx
	movq	%rdx, 304(%rsp)
	movq	472(%rsp), %rdx
	addq	408(%rsp), %rdx
	movq	%rbx, 344(%rsp)
	salq	$3, %rdx
	movq	%rdx, 392(%rsp)
	movq	488(%rsp), %rdx
	addq	408(%rsp), %rdx
	salq	$3, %rdx
	movq	%rdx, 384(%rsp)
	movq	456(%rsp), %rdx
	addq	408(%rsp), %rdx
	salq	$3, %rdx
	movq	%rdx, 376(%rsp)
	movq	448(%rsp), %rdx
	addq	408(%rsp), %rdx
	salq	$3, %rdx
	movq	%rdx, 368(%rsp)
	mov	484(%rsp), %edx
	leaq	(%rax,%rdx), %rdx
	movq	456(%rsp), %rax
	movq	%rdx, 360(%rsp)
	movq	488(%rsp), %rdx
	movq	%rax, 328(%rsp)
	movq	464(%rsp), %rax
	movq	%rdx, 336(%rsp)
	movl	484(%rsp), %edx
	movq	%rax, 352(%rsp)
	addl	$1, %edx
	movl	%edx, %r14d
	movl	%edx, 256(%rsp)
	movq	504(%rsp), %r15
	shrl	%r14d
	leal	(%r14,%r14), %ebx
	movl	%ebx, 260(%rsp)
	addl	268(%rsp), %ebx
	movl	%ebx, 292(%rsp)
	.p2align 4,,10
	.p2align 3
.L27:
	movl	264(%rsp), %edx
	cmpl	%edx, 400(%rsp)
	movl	252(%rsp), %eax
	jge	.L9
	movq	304(%rsp), %rbx
	movq	304(%rsp), %rax
	movq	360(%rsp), %rdx
	movapd	.LC0(%rip), %xmm4
	addq	$16, %rbx
	addq	$8, %rax
	movq	%rbx, 192(%rsp)
	movq	%rax, 136(%rsp)
	leaq	8(,%rdx,8), %rdx
	movq	320(%rsp), %rbx
	movq	328(%rsp), %rax
	movq	%rdx, 240(%rsp)
	movq	336(%rsp), %rdx
	movq	%rbx, 216(%rsp)
	movq	%rax, 224(%rsp)
	movq	344(%rsp), %rbx
	movq	352(%rsp), %rax
	movq	%rdx, 200(%rsp)
	movq	368(%rsp), %rdx
	movq	%rbx, 208(%rsp)
	movq	%rax, 128(%rsp)
	movq	376(%rsp), %rbx
	movq	384(%rsp), %rax
	movq	%rdx, 152(%rsp)
	movq	392(%rsp), %rdx
	movq	%rbx, 160(%rsp)
	movq	%rax, 168(%rsp)
	movq	304(%rsp), %rbx
	movl	400(%rsp), %eax
	movq	%rdx, 176(%rsp)
	movq	%rbx, 184(%rsp)
	movl	%eax, 148(%rsp)
	.p2align 4,,10
	.p2align 3
.L26:
	cmpl	%ecx, 268(%rsp)
	movl	252(%rsp), %eax
	jge	.L11
	movq	280(%rsp), %rdx
	movq	272(%rsp), %rbx
	movq	184(%rsp), %rdi
	movq	176(%rsp), %rbp
	movq	168(%rsp), %r8
	movq	160(%rsp), %r9
	movq	(%rdx), %rdx
	movq	(%rbx), %r13
	movq	152(%rsp), %r10
	movq	192(%rsp), %rbx
	movq	136(%rsp), %r11
	movapd	%xmm7, %xmm2
	movq	%rdx, %r12
	addq	136(%rsp), %r12
	cmpl	$5, 256(%rsp)
	movq	%rdx, 232(%rsp)
	mulsd	%xmm7, %xmm2
	leaq	0(%r13,%rbx), %rbx
	leaq	0(%r13,%rdi), %rdi
	leaq	0(%r13,%rbp), %rbp
	leaq	0(%r13,%r8), %r8
	leaq	0(%r13,%r9), %r9
	leaq	0(%r13,%r10), %r10
	leaq	0(%r13,%r11), %r11
	leaq	16(%r12), %rax
	jbe	.L12
	testb	$15, %r12b
	jne	.L12
	leaq	16(%rbx), %rdx
	cmpq	%rdx, %r12
	jbe	.L43
.L13:
	leaq	16(%rdi), %rdx
	cmpq	%rdx, %r12
	jbe	.L44
	leaq	16(%rbp), %rdx
	cmpq	%rdx, %r12
	jbe	.L45
.L15:
	leaq	16(%r8), %rdx
	cmpq	%rdx, %r12
	jbe	.L46
.L16:
	leaq	16(%r9), %rdx
	cmpq	%rdx, %r12
	jbe	.L47
.L17:
	leaq	16(%r10), %rdx
	cmpq	%rdx, %r12
	jbe	.L48
.L18:
	leaq	16(%r11), %rdx
	cmpq	%rdx, %r12
	jbe	.L49
.L33:
	movl	260(%rsp), %eax
	testl	%eax, %eax
	je	.L50
.L20:
	movapd	%xmm2, %xmm0
	xorl	%eax, %eax
	xorl	%edx, %edx
	unpcklpd	%xmm0, %xmm0
	movapd	%xmm0, %xmm3
	.p2align 4,,10
	.p2align 3
.L22:
	movsd	(%rbx,%rax), %xmm1
	addl	$1, %edx
	movsd	(%rdi,%rax), %xmm8
	movhpd	8(%rbx,%rax), %xmm1
	movhpd	8(%rdi,%rax), %xmm8
	movapd	%xmm1, %xmm0
	addpd	%xmm8, %xmm0
	movsd	0(%rbp,%rax), %xmm8
	movhpd	8(%rbp,%rax), %xmm8
	addpd	%xmm8, %xmm0
	movsd	(%r8,%rax), %xmm8
	movhpd	8(%r8,%rax), %xmm8
	addpd	%xmm8, %xmm0
	movsd	(%r9,%rax), %xmm8
	movhpd	8(%r9,%rax), %xmm8
	addpd	%xmm8, %xmm0
	movsd	(%r10,%rax), %xmm8
	movhpd	8(%r10,%rax), %xmm8
	addpd	%xmm8, %xmm0
	movsd	(%r11,%rax), %xmm8
	movhpd	8(%r11,%rax), %xmm8
	movapd	%xmm8, %xmm1
	mulpd	%xmm4, %xmm1
	addpd	%xmm1, %xmm0
	divpd	%xmm3, %xmm0
	movapd	%xmm0, (%r12,%rax)
	addq	$16, %rax
	cmpl	%r14d, %edx
	jb	.L22
	movl	256(%rsp), %edx
	cmpl	%edx, 260(%rsp)
	movl	292(%rsp), %eax
	je	.L23
.L21:
	leal	1(%rax), %edx
	movq	128(%rsp), %rbx
	movslq	%eax, %r10
	movslq	%edx, %rdx
	addq	128(%rsp), %rdx
	leaq	0(%r13,%rdx,8), %r9
	leaq	-1(%rbx,%r10), %rdx
	leaq	0(%r13,%rdx,8), %r8
	movq	208(%rsp), %rdx
	leaq	(%r10,%rdx), %rdx
	leaq	0(%r13,%rdx,8), %rbp
	movq	200(%rsp), %rdx
	leaq	(%r10,%rdx), %rdx
	leaq	0(%r13,%rdx,8), %rdi
	movq	224(%rsp), %rdx
	leaq	(%r10,%rdx), %rdx
	leaq	0(%r13,%rdx,8), %rbx
	movq	216(%rsp), %rdx
	leaq	(%r10,%rdx), %rdx
	addq	128(%rsp), %r10
	leaq	0(%r13,%rdx,8), %rdx
	salq	$3, %r10
	addq	%r10, %r13
	addq	232(%rsp), %r10
	.p2align 4,,10
	.p2align 3
.L24:
	movsd	(%r9), %xmm0
	addl	$1, %eax
	movsd	0(%r13), %xmm1
	addq	$8, %r9
	addsd	(%r8), %xmm0
	addq	$8, %r13
	addq	$8, %r8
	mulsd	%xmm5, %xmm1
	addsd	0(%rbp), %xmm0
	addq	$8, %rbp
	addsd	(%rdi), %xmm0
	addq	$8, %rdi
	addsd	(%rbx), %xmm0
	addq	$8, %rbx
	addsd	(%rdx), %xmm0
	addq	$8, %rdx
	addsd	%xmm1, %xmm0
	divsd	%xmm2, %xmm0
	movsd	%xmm0, (%r10)
	addq	$8, %r10
	cmpl	%ecx, %eax
	jl	.L24
.L23:
	movl	252(%rsp), %eax
.L11:
	addl	$1, 148(%rsp)
	addq	%rsi, 192(%rsp)
	addq	%rsi, 136(%rsp)
	addq	%rsi, 184(%rsp)
	addq	%rsi, 176(%rsp)
	addq	%rsi, 168(%rsp)
	addq	%rsi, 160(%rsp)
	addq	%rsi, 152(%rsp)
	addq	%rsi, 240(%rsp)
	addq	%r15, 128(%rsp)
	addq	%r15, 208(%rsp)
	addq	%r15, 200(%rsp)
	addq	%r15, 224(%rsp)
	addq	%r15, 216(%rsp)
	movl	264(%rsp), %ebx
	cmpl	%ebx, 148(%rsp)
	jl	.L26
.L9:
	movq	296(%rsp), %rbx
	movq	312(%rsp), %rdx
	addl	$1, 252(%rsp)
	addq	%rdx, 304(%rsp)
	addq	%rdx, 392(%rsp)
	addq	%rdx, 384(%rsp)
	addq	%rdx, 376(%rsp)
	addq	%rdx, 368(%rsp)
	addq	%rbx, 352(%rsp)
	addq	%rbx, 344(%rsp)
	addq	%rbx, 336(%rsp)
	addq	%rbx, 328(%rsp)
	addq	%rbx, 320(%rsp)
	addq	%rbx, 360(%rsp)
	cmpl	404(%rsp), %eax
	jl	.L27
.L7:
	movq	432(%rsp), %rbx
	movl	664(%rsp), %eax
	movl	680(%rsp), %edx
	addl	%eax, 420(%rsp)
	addl	%edx, 404(%rsp)
	movl	632(%rsp), %eax
	addq	%rbx, 464(%rsp)
	movl	648(%rsp), %edx
	addq	%rbx, 472(%rsp)
	addq	%rbx, 488(%rsp)
	addq	%rbx, 456(%rsp)
	addl	616(%rsp), %ecx
	addq	%rbx, 448(%rsp)
	movq	520(%rsp), %rbx
	addl	%eax, 400(%rsp)
	addl	%edx, 264(%rsp)
	addq	%rbx, 408(%rsp)
	movl	516(%rsp), %eax
	addl	$1, 416(%rsp)
	movl	600(%rsp), %edx
	addl	%eax, 484(%rsp)
	addl	%edx, 268(%rsp)
	movl	500(%rsp), %ebx
	cmpl	%ebx, 444(%rsp)
	jg	.L28
.L32:
	addq	$536, %rsp
	.cfi_remember_state
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
	.p2align 4,,10
	.p2align 3
.L43:
	.cfi_restore_state
	cmpq	%rbx, %rax
	jb	.L13
	.p2align 4,,10
	.p2align 3
.L12:
	movq	240(%rsp), %rdx
	leaq	8(%r13,%rdx), %rax
	.p2align 4,,10
	.p2align 3
.L25:
	movsd	(%rbx), %xmm0
	addq	$8, %rbx
	movsd	(%r11), %xmm1
	addq	$8, %r11
	addsd	(%rdi), %xmm0
	addq	$8, %rdi
	mulsd	%xmm6, %xmm1
	addsd	0(%rbp), %xmm0
	addq	$8, %rbp
	addsd	(%r8), %xmm0
	addq	$8, %r8
	addsd	(%r9), %xmm0
	addq	$8, %r9
	addsd	(%r10), %xmm0
	addq	$8, %r10
	addsd	%xmm1, %xmm0
	divsd	%xmm2, %xmm0
	movsd	%xmm0, (%r12)
	addq	$8, %r12
	cmpq	%rax, %rbx
	jne	.L25
	jmp	.L23
	.p2align 4,,10
	.p2align 3
.L44:
	cmpq	%rax, %rdi
	jbe	.L12
	leaq	16(%rbp), %rdx
	cmpq	%rdx, %r12
	ja	.L15
	.p2align 4,,10
	.p2align 3
.L45:
	cmpq	%rax, %rbp
	jbe	.L12
	leaq	16(%r8), %rdx
	cmpq	%rdx, %r12
	ja	.L16
	.p2align 4,,10
	.p2align 3
.L46:
	cmpq	%rax, %r8
	jbe	.L12
	leaq	16(%r9), %rdx
	cmpq	%rdx, %r12
	ja	.L17
	.p2align 4,,10
	.p2align 3
.L47:
	cmpq	%rax, %r9
	jbe	.L12
	leaq	16(%r10), %rdx
	cmpq	%rdx, %r12
	ja	.L18
	.p2align 4,,10
	.p2align 3
.L48:
	cmpq	%rax, %r10
	jbe	.L12
	leaq	16(%r11), %rdx
	cmpq	%rdx, %r12
	ja	.L33
	.p2align 4,,10
	.p2align 3
.L49:
	cmpq	%rax, %r11
	jbe	.L12
	movl	260(%rsp), %eax
	testl	%eax, %eax
	jne	.L20
.L50:
	movl	268(%rsp), %eax
	jmp	.L21
	.cfi_endproc
.LFE0:
	.size	walk3, .-walk3
	.p2align 4,,15
.globl StencilProbeOblivious
	.type	StencilProbeOblivious, @function
StencilProbeOblivious:
.LFB1:
	.cfi_startproc
	subq	$120, %rsp
	.cfi_def_cfa_offset 128
	movq	%rsi, %rax
	movl	%edx, %esi
	movl	%ecx, %edx
	movl	%r8d, %ecx
	movq	%rax, 104(%rsp)
	leal	-1(%rcx), %eax
	movl	144(%rsp), %r9d
	movq	%rdi, 96(%rsp)
	leaq	96(%rsp), %rdi
	xorl	%r8d, %r8d
	movl	$0, 88(%rsp)
	movl	%eax, 80(%rsp)
	leal	-1(%rdx), %eax
	movl	$0, 72(%rsp)
	movl	$1, 64(%rsp)
	movl	$0, 56(%rsp)
	movl	%eax, 48(%rsp)
	leal	-1(%rsi), %eax
	movl	$0, 40(%rsp)
	movl	$1, 32(%rsp)
	movl	$0, 24(%rsp)
	movl	%eax, 16(%rsp)
	movl	$0, 8(%rsp)
	movl	$1, (%rsp)
	call	walk3
	addq	$120, %rsp
	.cfi_def_cfa_offset 8
	ret
	.cfi_endproc
.LFE1:
	.size	StencilProbeOblivious, .-StencilProbeOblivious
	.section	.rodata.cst16,"aM",@progbits,16
	.align 16
.LC0:
	.long	0
	.long	-1072168960
	.long	0
	.long	-1072168960
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	0
	.long	-1072168960
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
