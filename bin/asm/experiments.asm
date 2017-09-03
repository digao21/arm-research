	.file	"experiments.c"
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"[execStencil.func] - Undefined optimization"
	.text
	.p2align 4,,15
.globl solveStencil
	.type	solveStencil, @function
solveStencil:
.LFB24:
	.cfi_startproc
	cmpl	$4, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movq	%rsi, %rax
	movl	%ecx, %r10d
	movq	%rdx, %rsi
	movl	%r9d, %ecx
	movl	%r8d, %edx
	movl	24(%rsp), %r9d
	movl	16(%rsp), %r8d
	movl	32(%rsp), %r11d
	movl	40(%rsp), %ebx
	jbe	.L11
	movl	$.LC0, %edi
	call	puts
	movl	$1, %edi
	call	exit
	.p2align 4,,10
	.p2align 3
.L11:
	mov	%edi, %edi
	jmp	*.L8(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L8:
	.quad	.L3
	.quad	.L4
	.quad	.L5
	.quad	.L6
	.quad	.L7
	.text
	.p2align 4,,10
	.p2align 3
.L6:
	movl	%r10d, 32(%rsp)
	movl	%ebx, 24(%rsp)
	movq	%rax, %rdi
	movl	%r11d, 16(%rsp)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	StencilProbeOblivious
	.p2align 4,,10
	.p2align 3
.L7:
	.cfi_restore_state
	movl	%r10d, 32(%rsp)
	movl	%ebx, 24(%rsp)
	movq	%rax, %rdi
	movl	%r11d, 16(%rsp)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	StencilProbeTimeskew
	.p2align 4,,10
	.p2align 3
.L3:
	.cfi_restore_state
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	movl	%r10d, %r9d
	movq	%rax, %rdi
	jmp	StencilProbe
	.p2align 4,,10
	.p2align 3
.L4:
	.cfi_restore_state
	movl	%r10d, 32(%rsp)
	movl	%ebx, 24(%rsp)
	movq	%rax, %rdi
	movl	%r11d, 16(%rsp)
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	StencilProbeBlocked
	.p2align 4,,10
	.p2align 3
.L5:
	.cfi_restore_state
	movl	%r10d, 32(%rsp)
	movl	%ebx, 24(%rsp)
	movq	%rax, %rdi
	movl	%r11d, 16(%rsp)
	popq	%rbx
	.cfi_def_cfa_offset 8
	jmp	StencilProbeCircqueue
	.cfi_endproc
.LFE24:
	.size	solveStencil, .-solveStencil
	.p2align 4,,15
.globl constTimestepExp
	.type	constTimestepExp, @function
constTimestepExp:
.LFB27:
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
	movl	%esi, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%r9d, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%ecx, %rbx
	salq	$3, %rbx
	subq	$88, %rsp
	.cfi_def_cfa_offset 144
	movl	152(%rsp), %eax
	movl	144(%rsp), %ebp
	movl	%edi, 68(%rsp)
	movl	%edx, 32(%rsp)
	movl	%ecx, 64(%rsp)
	movl	%r8d, 72(%rsp)
	movl	%eax, 76(%rsp)
	movl	160(%rsp), %eax
	movl	168(%rsp), %r15d
	movl	176(%rsp), %r14d
	movl	%eax, 60(%rsp)
	movslq	%r9d, %rax
	imulq	%rax, %rbx
	movslq	%ebp, %rax
	imulq	%rax, %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, 40(%rsp)
	call	malloc
	movl	%r13d, %edi
	movq	%rax, 48(%rsp)
	call	initAnalise
	movl	32(%rsp), %edx
	cmpl	%edx, 64(%rsp)
	movq	%rax, %r13
	jl	.L13
	movl	%edx, %ebx
	.p2align 4,,10
	.p2align 3
.L14:
	movq	40(%rsp), %rcx
	movl	%ebx, %edi
	movl	%ebp, %edx
	movl	%r12d, %esi
	call	StencilInit
	movq	48(%rsp), %rcx
	movl	%ebp, %edx
	movl	%r12d, %esi
	movl	%ebx, %edi
	call	StencilInit
	xorl	%eax, %eax
	call	clear_cache
	movq	%r13, %rdi
	call	startAnalise
	movl	60(%rsp), %eax
	movl	76(%rsp), %ecx
	movl	%ebx, %r8d
	movq	48(%rsp), %rdx
	movq	40(%rsp), %rsi
	movl	%r12d, %r9d
	movl	68(%rsp), %edi
	movl	%r14d, 24(%rsp)
	movl	%eax, 8(%rsp)
	movl	%r15d, 16(%rsp)
	movl	%ebp, (%rsp)
	call	solveStencil
	movq	%r13, %rdi
	call	finishAnalise
	movl	60(%rsp), %r8d
	movl	%ebx, %esi
	movl	%r15d, %r9d
	movl	%ebp, %ecx
	movl	%r12d, %edx
	movq	%r13, %rdi
	movl	%r14d, (%rsp)
	call	printResult
	addl	72(%rsp), %ebx
	cmpl	%ebx, 64(%rsp)
	jge	.L14
.L13:
	movq	40(%rsp), %rdi
	call	free
	movq	48(%rsp), %rdi
	call	free
	addq	$88, %rsp
	.cfi_def_cfa_offset 56
	movq	%r13, %rdi
	xorl	%eax, %eax
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
	jmp	releaseAnaliseData
	.cfi_endproc
.LFE27:
	.size	constTimestepExp, .-constTimestepExp
	.p2align 4,,15
.globl dinamTimestepExp
	.type	dinamTimestepExp, @function
dinamTimestepExp:
.LFB26:
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
	movl	%edx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%esi, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movslq	%ecx, %rbx
	salq	$3, %rbx
	subq	$104, %rsp
	.cfi_def_cfa_offset 160
	movl	176(%rsp), %eax
	movl	160(%rsp), %r14d
	movl	168(%rsp), %edx
	movl	%edi, 84(%rsp)
	movl	%ecx, 88(%rsp)
	movl	%r8d, 92(%rsp)
	movl	%eax, 76(%rsp)
	movl	184(%rsp), %eax
	movl	%edx, 32(%rsp)
	movl	%r9d, 52(%rsp)
	movl	192(%rsp), %r15d
	movl	%eax, 80(%rsp)
	movslq	%r9d, %rax
	imulq	%rax, %rbx
	movslq	%r14d, %rax
	imulq	%rax, %rbx
	movq	%rbx, %rdi
	call	malloc
	movq	%rbx, %rdi
	movq	%rax, 56(%rsp)
	call	malloc
	movl	%ebp, %edi
	movq	%rax, 64(%rsp)
	call	initAnalise
	cmpl	%r13d, 88(%rsp)
	movq	%rax, %rbp
	movl	32(%rsp), %edx
	jl	.L18
	cvtsi2sd	%edx, %xmm0
	movl	$5, %ebx
	xorl	%r12d, %r12d
	movsd	%xmm0, 40(%rsp)
	.p2align 4,,10
	.p2align 3
.L22:
	movq	56(%rsp), %rcx
	movl	52(%rsp), %esi
	movl	%r14d, %edx
	movl	%r13d, %edi
	call	StencilInit
	movq	64(%rsp), %rcx
	movl	52(%rsp), %esi
	movl	%r14d, %edx
	movl	%r13d, %edi
	call	StencilInit
	xorl	%eax, %eax
	call	clear_cache
	.p2align 4,,10
	.p2align 3
.L19:
	movq	%rbp, %rdi
	addl	$1, %r12d
	call	startAnalise
	movl	80(%rsp), %eax
	movl	52(%rsp), %r9d
	movl	%ebx, %ecx
	movq	64(%rsp), %rdx
	movq	56(%rsp), %rsi
	movl	%r13d, %r8d
	movl	84(%rsp), %edi
	movl	%r15d, 24(%rsp)
	movl	%eax, 16(%rsp)
	movl	76(%rsp), %eax
	movl	%r14d, (%rsp)
	movl	%eax, 8(%rsp)
	call	solveStencil
	movq	%rbp, %rdi
	call	finishAnalise
	movq	%rbp, %rdi
	call	getTime
	cvtsi2sd	%ebx, %xmm2
	movsd	.LC1(%rip), %xmm1
	mulsd	40(%rsp), %xmm1
	divsd	%xmm0, %xmm2
	mulsd	%xmm2, %xmm1
	cvttsd2si	%xmm1, %ebx
	movsd	40(%rsp), %xmm1
	ucomisd	%xmm0, %xmm1
	seta	%al
	cmpl	$29, %r12d
	jg	.L24
	testb	%al, %al
	jne	.L19
.L21:
	movl	80(%rsp), %r9d
	movl	76(%rsp), %r8d
	movl	%r13d, %esi
	movl	52(%rsp), %edx
	movl	%r14d, %ecx
	movq	%rbp, %rdi
	movl	%r15d, (%rsp)
	call	printResult
	addl	92(%rsp), %r13d
	cmpl	88(%rsp), %r13d
	jle	.L22
.L18:
	movq	56(%rsp), %rdi
	call	free
	movq	64(%rsp), %rdi
	call	free
	addq	$104, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
	xorl	%eax, %eax
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
	jmp	releaseAnaliseData
	.p2align 4,,10
	.p2align 3
.L24:
	.cfi_restore_state
	testb	%al, %al
	je	.L21
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE26:
	.size	dinamTimestepExp, .-dinamTimestepExp
	.p2align 4,,15
	.type	solveStencil.clone.1, @function
solveStencil.clone.1:
.LFB29:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	cmpl	$4, %edi
	movq	%rsi, %rax
	movl	%ecx, %r10d
	movq	%rdx, %rsi
	movl	%r9d, %ecx
	movl	%r8d, %edx
	movl	24(%rsp), %r9d
	movl	16(%rsp), %r8d
	movl	32(%rsp), %r11d
	jbe	.L36
	movl	$.LC0, %edi
	call	puts
	movl	$1, %edi
	call	exit
.L36:
	mov	%edi, %edi
	jmp	*.L34(,%rdi,8)
	.section	.rodata
	.align 8
	.align 4
.L34:
	.quad	.L29
	.quad	.L30
	.quad	.L31
	.quad	.L32
	.quad	.L33
	.text
	.p2align 4,,10
	.p2align 3
.L32:
	movl	%r10d, 32(%rsp)
	movl	$0, 24(%rsp)
	movq	%rax, %rdi
	movl	%r11d, 16(%rsp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	StencilProbeOblivious
	.p2align 4,,10
	.p2align 3
.L33:
	.cfi_restore_state
	movl	%r10d, 32(%rsp)
	movl	$0, 24(%rsp)
	movq	%rax, %rdi
	movl	%r11d, 16(%rsp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	StencilProbeTimeskew
	.p2align 4,,10
	.p2align 3
.L29:
	.cfi_restore_state
	movl	%r10d, %r9d
	movq	%rax, %rdi
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	StencilProbe
	.p2align 4,,10
	.p2align 3
.L30:
	.cfi_restore_state
	movl	%r10d, 32(%rsp)
	movl	$0, 24(%rsp)
	movq	%rax, %rdi
	movl	%r11d, 16(%rsp)
	addq	$8, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	jmp	StencilProbeBlocked
	.p2align 4,,10
	.p2align 3
.L31:
	.cfi_restore_state
	movl	%r10d, 32(%rsp)
	movl	$0, 24(%rsp)
	movq	%rax, %rdi
	movl	%r11d, 16(%rsp)
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	StencilProbeCircqueue
	.cfi_endproc
.LFE29:
	.size	solveStencil.clone.1, .-solveStencil.clone.1
	.p2align 4,,15
	.type	constTimestepExp.clone.0, @function
constTimestepExp.clone.0:
.LFB28:
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
	movl	%ecx, %r13d
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	movl	%edx, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	movl	%edi, %ebp
	movl	$1073741824, %edi
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	movl	%esi, %ebx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	call	malloc
	movl	$1073741824, %edi
	movq	%rax, %r14
	call	malloc
	movl	%ebp, %edi
	movq	%rax, %r15
	call	initAnalise
	cmpl	$2048, %ebx
	movq	%rax, %rbp
	jg	.L38
	.p2align 4,,10
	.p2align 3
.L41:
	movl	%ebx, %edi
	movq	%r14, %rcx
	movl	$256, %edx
	movl	$256, %esi
	call	StencilInit
	movq	%r15, %rcx
	movl	$256, %edx
	movl	$256, %esi
	movl	%ebx, %edi
	call	StencilInit
	xorl	%eax, %eax
	call	clear_cache
	movq	%rbp, %rdi
	call	startAnalise
	movl	%ebx, %r8d
	movl	$256, %r9d
	movl	$5, %ecx
	movq	%r15, %rdx
	movq	%r14, %rsi
	movl	$1, %edi
	movl	%r13d, 16(%rsp)
	movl	%r12d, 8(%rsp)
	movl	$256, (%rsp)
	call	solveStencil.clone.1
	movq	%rbp, %rdi
	call	finishAnalise
	movl	%ebx, %esi
	movl	%r13d, %r9d
	movl	%r12d, %r8d
	movl	$256, %ecx
	movl	$256, %edx
	movq	%rbp, %rdi
	addl	$32, %ebx
	movl	$0, (%rsp)
	call	printResult
	cmpl	$2048, %ebx
	jle	.L41
.L38:
	movq	%r14, %rdi
	call	free
	movq	%r15, %rdi
	call	free
	addq	$40, %rsp
	.cfi_def_cfa_offset 56
	movq	%rbp, %rdi
	xorl	%eax, %eax
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
	jmp	releaseAnaliseData
	.cfi_endproc
.LFE28:
	.size	constTimestepExp.clone.0, .-constTimestepExp.clone.0
	.p2align 4,,15
	.type	dinamTimestepExp.clone.2, @function
dinamTimestepExp.clone.2:
.LFB30:
	.cfi_startproc
	pushq	%r14
	.cfi_def_cfa_offset 16
	.cfi_offset 14, -16
	movl	$32768, %edi
	pushq	%r13
	.cfi_def_cfa_offset 24
	.cfi_offset 13, -24
	pushq	%r12
	.cfi_def_cfa_offset 32
	.cfi_offset 12, -32
	movl	$5, %r12d
	pushq	%rbp
	.cfi_def_cfa_offset 40
	.cfi_offset 6, -40
	xorl	%ebp, %ebp
	pushq	%rbx
	.cfi_def_cfa_offset 48
	.cfi_offset 3, -48
	subq	$32, %rsp
	.cfi_def_cfa_offset 80
	call	malloc
	movl	$32768, %edi
	movq	%rax, %r13
	call	malloc
	movl	$2, %edi
	movq	%rax, %r14
	call	initAnalise
	movq	%r13, %rcx
	movl	$16, %edx
	movl	$16, %esi
	movl	$16, %edi
	movq	%rax, %rbx
	call	StencilInit
	movq	%r14, %rcx
	movl	$16, %edx
	movl	$16, %esi
	movl	$16, %edi
	call	StencilInit
	xorl	%eax, %eax
	call	clear_cache
.L44:
	movq	%rbx, %rdi
	addl	$1, %ebp
	call	startAnalise
	movl	%r12d, %ecx
	movl	$16, %r9d
	movl	$16, %r8d
	movq	%r14, %rdx
	movq	%r13, %rsi
	xorl	%edi, %edi
	movl	$0, 16(%rsp)
	movl	$0, 8(%rsp)
	movl	$16, (%rsp)
	call	solveStencil.clone.1
	movq	%rbx, %rdi
	call	finishAnalise
	movq	%rbx, %rdi
	call	getTime
	cvtsi2sd	%r12d, %xmm1
	divsd	%xmm0, %xmm1
	mulsd	.LC2(%rip), %xmm1
	cvttsd2si	%xmm1, %r12d
	movsd	.LC3(%rip), %xmm1
	ucomisd	%xmm0, %xmm1
	seta	%al
	cmpl	$29, %ebp
	jle	.L50
	testb	%al, %al
	jne	.L51
.L46:
	xorl	%r9d, %r9d
	xorl	%r8d, %r8d
	movl	$16, %ecx
	movl	$16, %edx
	movl	$16, %esi
	movq	%rbx, %rdi
	movl	$0, (%rsp)
	call	printResult
	movq	%r13, %rdi
	call	free
	movq	%r14, %rdi
	call	free
	addq	$32, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 48
	movq	%rbx, %rdi
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 40
	popq	%rbp
	.cfi_def_cfa_offset 32
	popq	%r12
	.cfi_def_cfa_offset 24
	popq	%r13
	.cfi_def_cfa_offset 16
	popq	%r14
	.cfi_def_cfa_offset 8
	jmp	releaseAnaliseData
.L50:
	.cfi_restore_state
	testb	%al, %al
	jne	.L44
	jmp	.L46
	.p2align 4,,10
	.p2align 3
.L51:
	movl	$1, %edi
	call	exit
	.cfi_endproc
.LFE30:
	.size	dinamTimestepExp.clone.2, .-dinamTimestepExp.clone.2
	.p2align 4,,15
.globl warmUp
	.type	warmUp, @function
warmUp:
.LFB25:
	.cfi_startproc
	jmp	dinamTimestepExp.clone.2
	.cfi_endproc
.LFE25:
	.size	warmUp, .-warmUp
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC4:
	.string	"dx = %d; dy = %d\n"
	.text
	.p2align 4,,15
.globl blockAnalise
	.type	blockAnalise, @function
blockAnalise:
.LFB23:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	dinamTimestepExp.clone.2
	movl	$2, %edx
	movl	$2, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$2, %ecx
	xorl	%edi, %edi
	movl	$2, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$4, %edx
	movl	$4, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$4, %ecx
	xorl	%edi, %edi
	movl	$4, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$8, %edx
	movl	$8, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$8, %ecx
	xorl	%edi, %edi
	movl	$8, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$16, %edx
	movl	$16, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$16, %ecx
	xorl	%edi, %edi
	movl	$16, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$32, %edx
	movl	$32, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$32, %ecx
	xorl	%edi, %edi
	movl	$32, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$64, %edx
	movl	$64, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$64, %ecx
	xorl	%edi, %edi
	movl	$64, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$128, %edx
	movl	$128, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$128, %ecx
	xorl	%edi, %edi
	movl	$128, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$256, %edx
	movl	$256, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$256, %ecx
	movl	$256, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	call	constTimestepExp.clone.0
	movl	$2, %edx
	movl	$4, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$2, %ecx
	xorl	%edi, %edi
	movl	$4, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$4, %edx
	movl	$8, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$4, %ecx
	xorl	%edi, %edi
	movl	$8, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$8, %edx
	movl	$16, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$8, %ecx
	xorl	%edi, %edi
	movl	$16, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$16, %edx
	movl	$32, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$16, %ecx
	xorl	%edi, %edi
	movl	$32, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$32, %edx
	movl	$64, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$32, %ecx
	xorl	%edi, %edi
	movl	$64, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$64, %edx
	movl	$128, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$64, %ecx
	xorl	%edi, %edi
	movl	$128, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$128, %edx
	movl	$256, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$128, %ecx
	xorl	%edi, %edi
	movl	$256, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$256, %edx
	movl	$512, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$256, %ecx
	xorl	%edi, %edi
	movl	$512, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	xorl	%eax, %eax
	movl	$2, %edx
	movl	$8, %esi
	movl	$.LC4, %edi
	call	printf
	movl	$2, %ecx
	xorl	%edi, %edi
	movl	$8, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$4, %edx
	movl	$16, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$4, %ecx
	xorl	%edi, %edi
	movl	$16, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$8, %edx
	movl	$32, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$8, %ecx
	xorl	%edi, %edi
	movl	$32, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$16, %edx
	movl	$64, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$16, %ecx
	xorl	%edi, %edi
	movl	$64, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$32, %edx
	movl	$128, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$32, %ecx
	xorl	%edi, %edi
	movl	$128, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$64, %edx
	movl	$256, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$64, %ecx
	xorl	%edi, %edi
	movl	$256, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$128, %edx
	movl	$512, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$128, %ecx
	xorl	%edi, %edi
	movl	$512, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$256, %edx
	movl	$1024, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$256, %ecx
	xorl	%edi, %edi
	movl	$1024, %edx
	movl	$2048, %esi
	call	constTimestepExp.clone.0
	movl	$2, %edx
	movl	$16, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$2, %ecx
	movl	$16, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	call	constTimestepExp.clone.0
	movl	$4, %edx
	movl	$32, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$4, %ecx
	movl	$32, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	call	constTimestepExp.clone.0
	movl	$8, %edx
	movl	$64, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$8, %ecx
	movl	$64, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	call	constTimestepExp.clone.0
	movl	$16, %edx
	movl	$128, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$16, %ecx
	movl	$128, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	call	constTimestepExp.clone.0
	movl	$32, %edx
	movl	$256, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$32, %ecx
	movl	$256, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	call	constTimestepExp.clone.0
	movl	$64, %edx
	movl	$512, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$64, %ecx
	movl	$512, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	call	constTimestepExp.clone.0
	movl	$128, %edx
	movl	$1024, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$128, %ecx
	movl	$1024, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	call	constTimestepExp.clone.0
	movl	$256, %edx
	movl	$2048, %esi
	movl	$.LC4, %edi
	xorl	%eax, %eax
	call	printf
	movl	$256, %ecx
	movl	$2048, %edx
	movl	$2048, %esi
	xorl	%edi, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	constTimestepExp.clone.0
	.cfi_endproc
.LFE23:
	.size	blockAnalise, .-blockAnalise
	.p2align 4,,15
.globl performanceExperiment
	.type	performanceExperiment, @function
performanceExperiment:
.LFB22:
	.cfi_startproc
	subq	$8, %rsp
	.cfi_def_cfa_offset 16
	call	dinamTimestepExp.clone.2
	movl	$256, %ecx
	movl	$512, %edx
	movl	$32, %esi
	movl	$1, %edi
	addq	$8, %rsp
	.cfi_def_cfa_offset 8
	jmp	constTimestepExp.clone.0
	.cfi_endproc
.LFE22:
	.size	performanceExperiment, .-performanceExperiment
	.section	.rodata.cst8,"aM",@progbits,8
	.align 8
.LC1:
	.long	858993459
	.long	1072902963
	.align 8
.LC2:
	.long	0
	.long	1076363264
	.align 8
.LC3:
	.long	0
	.long	1076101120
	.ident	"GCC: (GNU) 4.4.7 20120313 (Red Hat 4.4.7-11)"
	.section	.note.GNU-stack,"",@progbits
