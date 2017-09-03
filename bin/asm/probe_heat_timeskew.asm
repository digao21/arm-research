	.file	"probe_heat_timeskew.c"
	.text
	.p2align 4,,15
.globl StencilProbeTimeskew
	.type	StencilProbeTimeskew, @function
StencilProbeTimeskew:
.LFB0:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	movl	%ecx, %eax
	subl	$1, %r8d
	imull	%edx, %eax
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	cltq
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	subq	$296, %rsp
	.cfi_def_cfa_offset 352
	movq	%rax, 40(%rsp)
	salq	$3, %rax
	movq	%rdi, 256(%rsp)
	movq	%rax, 48(%rsp)
	movslq	%edx, %rax
	movq	%rsi, 288(%rsp)
	movq	%rax, -88(%rsp)
	movsd	(%rdi), %xmm7
	salq	$3, %rax
	movl	%edx, 172(%rsp)
	movl	%ecx, 188(%rsp)
	movl	%r9d, 216(%rsp)
	movl	%r8d, 252(%rsp)
	movl	$1, 176(%rsp)
	movq	%rax, -112(%rsp)
.L2:
	movl	252(%rsp), %ecx
	cmpl	%ecx, 176(%rsp)
	jge	.L45
	xorl	%eax, %eax
	cmpl	$1, 176(%rsp)
	movl	188(%rsp), %edx
	movl	$1, 184(%rsp)
	setne	%al
	movl	%eax, 280(%rsp)
	movl	252(%rsp), %eax
	subl	360(%rsp), %eax
	cmpl	176(%rsp), %eax
	sete	%al
	subl	$1, %edx
	movzbl	%al, %eax
	movl	%edx, 248(%rsp)
	subl	$1, %eax
	movl	%eax, 232(%rsp)
.L5:
	movl	248(%rsp), %eax
	cmpl	%eax, 184(%rsp)
	jge	.L46
	xorl	%eax, %eax
	cmpl	$1, 184(%rsp)
	movl	184(%rsp), %ebx
	movl	172(%rsp), %ecx
	movl	216(%rsp), %r9d
	movsd	.LC0(%rip), %xmm4
	movl	$1, 180(%rsp)
	setne	%al
	movl	%eax, 284(%rsp)
	movl	248(%rsp), %eax
	subl	352(%rsp), %eax
	cmpl	184(%rsp), %eax
	sete	%al
	addl	352(%rsp), %ebx
	subl	$1, %ecx
	movzbl	%al, %eax
	addl	$1, %r9d
	movl	%ecx, 244(%rsp)
	subl	$1, %eax
	movl	%r9d, 224(%rsp)
	movl	%eax, 236(%rsp)
	movl	%ebx, 220(%rsp)
	movl	%ebx, 184(%rsp)
.L8:
	movl	180(%rsp), %r9d
	cmpl	%r9d, 244(%rsp)
	jle	.L5
	xorl	%eax, %eax
	cmpl	$1, 180(%rsp)
	movl	244(%rsp), %edx
	setne	%al
	subl	216(%rsp), %edx
	cmpl	180(%rsp), %edx
	sete	%dl
	movzbl	%dl, %edx
	subl	$1, %edx
	cmpl	$0, 368(%rsp)
	movl	%edx, 240(%rsp)
	jle	.L11
	negl	%eax
	movl	220(%rsp), %edx
	movl	280(%rsp), %ebx
	movl	%eax, 276(%rsp)
	movl	284(%rsp), %eax
	movl	176(%rsp), %r9d
	movl	$0, 228(%rsp)
	movl	%edx, %ecx
	subl	352(%rsp), %ecx
	negl	%ebx
	negl	%eax
	movl	%edx, 204(%rsp)
	movl	%ebx, 268(%rsp)
	movl	%eax, 272(%rsp)
	movl	360(%rsp), %eax
	movl	%r9d, 208(%rsp)
	movl	224(%rsp), %edx
	movl	%ecx, 212(%rsp)
	movq	288(%rsp), %rbx
	addl	%r9d, %eax
	movl	180(%rsp), %ecx
	movq	256(%rsp), %r9
	movapd	.LC1(%rip), %xmm5
	movl	%eax, 200(%rsp)
	movl	%edx, 192(%rsp)
	movl	%ecx, 196(%rsp)
	movq	%rbx, 24(%rsp)
	movq	%r9, -96(%rsp)
.L34:
	cmpl	$0, 196(%rsp)
	movl	196(%rsp), %edx
	movl	$1, %eax
	movl	212(%rsp), %ecx
	movl	192(%rsp), %ebx
	movl	204(%rsp), %r9d
	cmovle	%eax, %edx
	cmpl	$0, 212(%rsp)
	movl	%edx, 20(%rsp)
	cmovle	%eax, %ecx
	cmpl	$0, 208(%rsp)
	movl	%ecx, 164(%rsp)
	movl	208(%rsp), %ecx
	cmovle	%eax, %ecx
	cmpl	$0, 192(%rsp)
	cmovle	%eax, %ebx
	cmpl	$0, 204(%rsp)
	movl	%ebx, -4(%rsp)
	cmovle	%eax, %r9d
	cmpl	$0, 200(%rsp)
	cmovg	200(%rsp), %eax
	movl	%r9d, 16(%rsp)
	cmpl	%eax, %ecx
	movl	%eax, 168(%rsp)
	jge	.L12
	leal	1(%rcx), %eax
	movq	-96(%rsp), %rbx
	movslq	%edx, %rdx
	movl	164(%rsp), %r9d
	movl	%eax, -8(%rsp)
	movl	188(%rsp), %eax
	imull	-8(%rsp), %eax
	addl	164(%rsp), %eax
	imull	172(%rsp), %eax
	cltq
	movq	%rax, 104(%rsp)
	addq	%rdx, %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 144(%rsp)
	leal	-1(%rcx), %eax
	imull	188(%rsp), %eax
	imull	188(%rsp), %ecx
	addl	164(%rsp), %eax
	imull	172(%rsp), %eax
	cltq
	movq	%rax, 96(%rsp)
	leaq	(%rdx,%rax), %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 120(%rsp)
	leal	1(%rcx,%r9), %eax
	imull	172(%rsp), %eax
	cltq
	movq	%rax, 88(%rsp)
	leaq	(%rdx,%rax), %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 128(%rsp)
	leal	-1(%rcx,%r9), %eax
	imull	172(%rsp), %eax
	cltq
	movq	%rax, 80(%rsp)
	leaq	(%rdx,%rax), %rax
	leaq	(%rbx,%rax,8), %rax
	movq	%rax, 112(%rsp)
	movl	%r9d, %eax
	addl	%ecx, %eax
	imull	172(%rsp), %eax
	cltq
	addq	%rax, %rdx
	movq	%rax, 72(%rsp)
	leaq	0(,%rdx,8), %rax
	addq	%rax, %rbx
	addq	24(%rsp), %rax
	movq	%rbx, 56(%rsp)
	movq	%rax, 64(%rsp)
	movl	-4(%rsp), %eax
	subl	$1, %eax
	subl	20(%rsp), %eax
	addq	%rdx, %rax
	movq	%rax, 136(%rsp)
	movl	-4(%rsp), %eax
	subl	20(%rsp), %eax
	movl	%eax, (%rsp)
	shrl	%eax
	movl	%eax, 32(%rsp)
	addl	%eax, %eax
	movl	%eax, 4(%rsp)
	addl	20(%rsp), %eax
	movl	%eax, 36(%rsp)
	.p2align 4,,10
	.p2align 3
.L13:
	movl	16(%rsp), %ebx
	cmpl	%ebx, 164(%rsp)
	movl	-8(%rsp), %eax
	jge	.L20
	movq	136(%rsp), %r9
	movq	64(%rsp), %rax
	movq	72(%rsp), %rdx
	movq	80(%rsp), %rcx
	movq	88(%rsp), %rbx
	movq	56(%rsp), %r10
	leaq	8(,%r9,8), %r9
	addq	$16, %rax
	movq	56(%rsp), %r15
	movq	%rax, -24(%rsp)
	movq	%rdx, -80(%rsp)
	movq	%r9, -16(%rsp)
	movq	96(%rsp), %r9
	addq	$8, %r10
	movq	%rcx, -56(%rsp)
	movq	%rbx, -48(%rsp)
	subq	$8, %r15
	movq	104(%rsp), %rax
	movq	64(%rsp), %rdx
	movq	%r9, -40(%rsp)
	movq	-96(%rsp), %r9
	movq	56(%rsp), %rcx
	movl	164(%rsp), %ebx
	movq	112(%rsp), %r14
	movq	128(%rsp), %r13
	movq	120(%rsp), %r12
	movq	144(%rsp), %r11
	addq	$8, %r9
	movsd	.LC0(%rip), %xmm6
	movq	%rax, -32(%rsp)
	movq	%rdx, -104(%rsp)
	movq	%rcx, -64(%rsp)
	movl	%ebx, -68(%rsp)
	movq	%r9, 152(%rsp)
	.p2align 4,,10
	.p2align 3
.L33:
	movl	-4(%rsp), %r9d
	cmpl	%r9d, 20(%rsp)
	movl	-8(%rsp), %eax
	jge	.L22
	cmpl	$5, (%rsp)
	movapd	%xmm7, %xmm2
	mulsd	%xmm7, %xmm2
	jbe	.L31
	testb	$15, -104(%rsp)
	jne	.L31
	leaq	16(%r11), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L47
	leaq	16(%r12), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L48
.L26:
	leaq	16(%r13), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L49
.L27:
	leaq	16(%r14), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L50
.L28:
	leaq	16(%r10), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L51
.L29:
	cmpq	%r10, -104(%rsp)
	jbe	.L52
.L30:
	leaq	8(%r10), %rax
	cmpq	%rax, -104(%rsp)
	jbe	.L53
	movl	4(%rsp), %eax
	testl	%eax, %eax
	je	.L54
.L16:
	movapd	%xmm2, %xmm0
	movq	-104(%rsp), %rbx
	movq	-64(%rsp), %rcx
	movl	32(%rsp), %esi
	xorl	%eax, %eax
	unpcklpd	%xmm0, %xmm0
	xorl	%edx, %edx
	movapd	%xmm0, %xmm3
	.p2align 4,,10
	.p2align 3
.L18:
	movsd	(%rax,%r11), %xmm1
	addl	$1, %edx
	movsd	(%r12,%rax), %xmm8
	movhpd	8(%r11,%rax), %xmm1
	movhpd	8(%rax,%r12), %xmm8
	movapd	%xmm1, %xmm0
	addpd	%xmm8, %xmm0
	movsd	(%rax,%r13), %xmm8
	movhpd	8(%r13,%rax), %xmm8
	addpd	%xmm8, %xmm0
	movsd	(%rax,%r14), %xmm8
	movhpd	8(%r14,%rax), %xmm8
	addpd	%xmm8, %xmm0
	movsd	(%rax,%r10), %xmm8
	movhpd	8(%rax,%r10), %xmm8
	addpd	%xmm8, %xmm0
	movsd	(%rax,%r15), %xmm8
	movhpd	8(%r15,%rax), %xmm8
	addpd	%xmm8, %xmm0
	movsd	(%rax,%rcx), %xmm8
	movhpd	8(%rcx,%rax), %xmm8
	movapd	%xmm8, %xmm1
	mulpd	%xmm5, %xmm1
	divpd	%xmm3, %xmm1
	addpd	%xmm1, %xmm0
	movapd	%xmm0, (%rbx,%rax)
	addq	$16, %rax
	cmpl	%esi, %edx
	jb	.L18
	movl	4(%rsp), %edx
	cmpl	%edx, (%rsp)
	movl	36(%rsp), %eax
	je	.L15
.L17:
	movq	-32(%rsp), %rdx
	movslq	%eax, %rcx
	movq	-96(%rsp), %rbx
	movq	-80(%rsp), %r9
	movq	%r15, 8(%rsp)
	movl	-4(%rsp), %r15d
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
	addq	24(%rsp), %rdx
	.p2align 4,,10
	.p2align 3
.L19:
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
	jg	.L19
	movq	8(%rsp), %r15
.L15:
	movl	-8(%rsp), %eax
.L22:
	movq	-112(%rsp), %rdx
	addl	$1, -68(%rsp)
	movq	-88(%rsp), %rcx
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
	addq	%rcx, -32(%rsp)
	addq	%rcx, -40(%rsp)
	addq	%rcx, -48(%rsp)
	addq	%rcx, -56(%rsp)
	addq	%rcx, -80(%rsp)
	movl	-68(%rsp), %ebx
	cmpl	%ebx, 16(%rsp)
	jg	.L33
.L20:
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rcx
	addl	$1, -8(%rsp)
	addq	%rdx, 144(%rsp)
	addq	%rdx, 120(%rsp)
	addq	%rdx, 128(%rsp)
	addq	%rdx, 112(%rsp)
	addq	%rdx, 56(%rsp)
	addq	%rdx, 64(%rsp)
	addq	%rcx, 104(%rsp)
	addq	%rcx, 96(%rsp)
	addq	%rcx, 88(%rsp)
	addq	%rcx, 80(%rsp)
	addq	%rcx, 72(%rsp)
	addq	%rcx, 136(%rsp)
	cmpl	%eax, 168(%rsp)
	jg	.L13
.L12:
	addl	$1, 228(%rsp)
	movl	276(%rsp), %eax
	movl	272(%rsp), %edx
	addl	%eax, 196(%rsp)
	addl	%edx, 212(%rsp)
	movl	268(%rsp), %ecx
	movl	232(%rsp), %eax
	addl	%ecx, 208(%rsp)
	addl	%eax, 200(%rsp)
	movl	240(%rsp), %ebx
	movl	236(%rsp), %r9d
	addl	%ebx, 192(%rsp)
	addl	%r9d, 204(%rsp)
	movl	368(%rsp), %ecx
	cmpl	%ecx, 228(%rsp)
	movq	-96(%rsp), %rdx
	movq	24(%rsp), %rax
	movq	%rdx, 24(%rsp)
	je	.L11
	movq	%rax, -96(%rsp)
	jmp	.L34
	.p2align 4,,10
	.p2align 3
.L52:
	cmpq	%r15, -24(%rsp)
	jb	.L30
	.p2align 4,,10
	.p2align 3
.L31:
	movq	152(%rsp), %r9
	addq	-16(%rsp), %r9
	movq	%r15, %rsi
	movq	-104(%rsp), %rbp
	movq	-64(%rsp), %rdi
	movq	%r10, %rax
	movq	%r14, %rbx
	movq	%r13, %rcx
	movq	%r12, %rdx
	movq	%r11, %r8
	.p2align 4,,10
	.p2align 3
.L14:
	movsd	(%r8), %xmm0
	addq	$8, %r8
	movsd	(%rdi), %xmm1
	addq	$8, %rdi
	addsd	(%rdx), %xmm0
	addq	$8, %rdx
	mulsd	%xmm6, %xmm1
	divsd	%xmm2, %xmm1
	addsd	(%rcx), %xmm0
	addq	$8, %rcx
	addsd	(%rbx), %xmm0
	addq	$8, %rbx
	addsd	(%rax), %xmm0
	addq	$8, %rax
	addsd	(%rsi), %xmm0
	addq	$8, %rsi
	addsd	%xmm1, %xmm0
	movsd	%xmm0, 0(%rbp)
	addq	$8, %rbp
	cmpq	%r9, %rax
	jne	.L14
	jmp	.L15
	.p2align 4,,10
	.p2align 3
.L47:
	cmpq	%r11, -24(%rsp)
	jae	.L31
	leaq	16(%r12), %rax
	cmpq	%rax, -104(%rsp)
	ja	.L26
	.p2align 4,,10
	.p2align 3
.L48:
	cmpq	%r12, -24(%rsp)
	jae	.L31
	leaq	16(%r13), %rax
	cmpq	%rax, -104(%rsp)
	ja	.L27
	.p2align 4,,10
	.p2align 3
.L49:
	cmpq	%r13, -24(%rsp)
	jae	.L31
	leaq	16(%r14), %rax
	cmpq	%rax, -104(%rsp)
	ja	.L28
	.p2align 4,,10
	.p2align 3
.L50:
	cmpq	%r14, -24(%rsp)
	jae	.L31
	leaq	16(%r10), %rax
	cmpq	%rax, -104(%rsp)
	ja	.L29
	.p2align 4,,10
	.p2align 3
.L51:
	cmpq	%r10, -24(%rsp)
	jb	.L29
	jmp	.L31
	.p2align 4,,10
	.p2align 3
.L53:
	movq	-64(%rsp), %rax
	cmpq	%rax, -24(%rsp)
	jae	.L31
	movl	4(%rsp), %eax
	testl	%eax, %eax
	jne	.L16
.L54:
	movl	20(%rsp), %eax
	jmp	.L17
.L11:
	movl	216(%rsp), %ebx
	addl	%ebx, 180(%rsp)
	addl	%ebx, 224(%rsp)
	jmp	.L8
.L46:
	movl	360(%rsp), %edx
	addl	%edx, 176(%rsp)
	jmp	.L2
.L45:
	addq	$296, %rsp
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
	.size	StencilProbeTimeskew, .-StencilProbeTimeskew
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
