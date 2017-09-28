	.arch armv8-a+fp+simd
	.file	"experiments.c"
	.text
	.align	2
	.global	solveStencil
	.type	solveStencil, %function
solveStencil:
	stp	x29, x30, [sp, -16]!
	cmp	w0, 4
	add	x29, sp, 0
	mov	w8, w3
	ldr	w10, [x29,16]
	mov	w3, w5
	ldr	w9, [x29,24]
	bls	.L10
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
	mov	w0, 1
	bl	exit
.L10:
	adrp	x5, .L4
	add	x5, x5, :lo12:.L4
	ldrb	w11, [x5,w0,uxtw]
	adr	x12, .Lrtx4
	add	x11, x12, w11, sxtb #2
	br	x11
.Lrtx4:
	.section	.rodata
	.align	0
	.align	2
.L4:
	.byte	(.L3 - .Lrtx4) / 4
	.byte	(.L5 - .Lrtx4) / 4
	.byte	(.L6 - .Lrtx4) / 4
	.byte	(.L7 - .Lrtx4) / 4
	.byte	(.L8 - .Lrtx4) / 4
	.text
.L7:
	str	w8, [x29,16]
	ldp	x29, x30, [sp], 16
	mov	x0, x1
	mov	w5, w7
	mov	x1, x2
	mov	w7, w9
	mov	w2, w4
	mov	w4, w6
	mov	w6, w10
	b	StencilProbeOblivious
.L8:
	str	w8, [x29,16]
	ldp	x29, x30, [sp], 16
	mov	x0, x1
	mov	w5, w7
	mov	x1, x2
	mov	w7, w9
	mov	w2, w4
	mov	w4, w6
	mov	w6, w10
	b	StencilProbeTimeskew
.L3:
	ldp	x29, x30, [sp], 16
	mov	x0, x1
	mov	w5, w8
	mov	x1, x2
	mov	w2, w4
	mov	w4, w6
	b	StencilProbe
.L5:
	str	w8, [x29,16]
	ldp	x29, x30, [sp], 16
	mov	x0, x1
	mov	w5, w7
	mov	x1, x2
	mov	w7, w9
	mov	w2, w4
	mov	w4, w6
	mov	w6, w10
	b	StencilProbeBlocked
.L6:
	str	w8, [x29,16]
	ldp	x29, x30, [sp], 16
	mov	x0, x1
	mov	w5, w7
	mov	x1, x2
	mov	w7, w9
	mov	w2, w4
	mov	w4, w6
	mov	w6, w10
	b	StencilProbeCircqueue
	.size	solveStencil, .-solveStencil
	.align	2
	.global	warmUp
	.type	warmUp, %function
warmUp:
	stp	x29, x30, [sp, -80]!
	mov	x0, 32768
	add	x29, sp, 0
	stp	d8, d9, [sp,56]
	stp	x19, x20, [sp,16]
	stp	x21, x22, [sp,32]
	str	x23, [sp,48]
	bl	malloc
	mov	x23, x0
	mov	x0, 32768
	mov	w21, 30
	bl	malloc
	fmov	d9, 1.2e+1
	mov	x22, x0
	mov	w0, 2
	mov	w20, 5
	bl	initAnalise
	mov	x19, x0
	mov	w0, 16
	mov	w1, w0
	mov	w2, w0
	mov	x3, x23
	fmov	d8, 1.0e+1
	bl	StencilInit
	mov	w0, 16
	mov	w1, w0
	mov	w2, w0
	mov	x3, x22
	bl	StencilInit
	bl	clear_cache
	b	.L15
.L21:
	subs	w21, w21, #1
	beq	.L14
.L15:
	mov	x0, x19
	bl	startAnalise
	mov	w2, 16
	mov	w5, w20
	mov	x1, x22
	mov	w3, w2
	mov	w4, w2
	mov	x0, x23
	bl	StencilProbe
	mov	x0, x19
	bl	finishAnalise
	mov	x0, x19
	bl	getTime
	scvtf	d1, w20
	fcmpe	d0, d8
	fdiv	d1, d1, d0
	fmul	d1, d1, d9
	fcvtzs	w20, d1
	bmi	.L21
	fmov	d1, 1.0e+1
	fcmpe	d0, d1
	bmi	.L14
	mov	w1, 16
	mov	w4, 0
	mov	w2, w1
	mov	w3, w1
	mov	w5, w4
	mov	w6, w4
	mov	x0, x19
	bl	printResult
	mov	x0, x23
	bl	free
	mov	x0, x22
	bl	free
	mov	x0, x19
	ldp	x21, x22, [sp,32]
	ldp	x19, x20, [sp,16]
	ldr	x23, [sp,48]
	ldp	d8, d9, [sp,56]
	ldp	x29, x30, [sp], 80
	b	releaseAnaliseData
.L14:
	mov	w0, 1
	bl	exit
	.size	warmUp, .-warmUp
	.align	2
	.global	performanceExperiment
	.type	performanceExperiment, %function
performanceExperiment:
	stp	x29, x30, [sp, -48]!
	add	x29, sp, 0
	stp	x19, x20, [sp,16]
	stp	x21, x22, [sp,32]
	bl	warmUp
	mov	x0, 1073741824
	mov	w19, 32
	bl	malloc
	mov	x22, x0
	mov	x0, 1073741824
	bl	malloc
	mov	x21, x0
	mov	w0, 1
	bl	initAnalise
	mov	x20, x0
.L24:
	mov	w1, 256
	mov	w2, w1
	mov	w0, w19
	mov	x3, x22
	bl	StencilInit
	mov	w1, 256
	mov	w2, w1
	mov	w0, w19
	mov	x3, x21
	bl	StencilInit
	bl	clear_cache
	mov	x0, x20
	bl	startAnalise
	mov	w3, 256
	mov	w2, w19
	mov	w4, w3
	mov	x1, x21
	mov	w5, 5
	mov	x0, x22
	bl	StencilProbe
	mov	x0, x20
	bl	finishAnalise
	mov	w2, 256
	mov	w1, w19
	mov	x0, x20
	mov	w3, w2
	mov	w4, 512
	mov	w5, w2
	mov	w6, 0
	add	w19, w19, 32
	bl	printResult
	cmp	w19, 2080
	bne	.L24
	mov	x0, x22
	bl	free
	mov	x0, x21
	bl	free
	mov	x0, x20
	ldp	x21, x22, [sp,32]
	ldp	x19, x20, [sp,16]
	ldp	x29, x30, [sp], 48
	b	releaseAnaliseData
	.size	performanceExperiment, .-performanceExperiment
	.align	2
	.global	blockAnalise
	.type	blockAnalise, %function
blockAnalise:
	sub	sp, sp, #112
	stp	x29, x30, [sp,16]
	add	x29, sp, 16
	stp	x27, x28, [sp,96]
	adrp	x27, .LC1
	stp	x25, x26, [sp,80]
	mov	w28, 4
	mov	w25, 1
	add	x27, x27, :lo12:.LC1
	stp	x19, x20, [sp,32]
	stp	x21, x22, [sp,48]
	stp	x23, x24, [sp,64]
	bl	warmUp
.L26:
	mov	w24, 8
	mov	w19, 2
	mov	w26, 5
.L29:
	mul	w23, w25, w19
	mov	w3, w19
	mov	x1, x27
	mov	w2, w23
	mov	w0, 1
	bl	__printf_chk
	mov	x0, 1073741824
	bl	malloc
	mov	x22, x0
	mov	x0, 1073741824
	bl	malloc
	mov	x21, x0
	mov	w0, 0
	bl	initAnalise
	mov	w1, 256
	mov	x20, x0
	mov	w2, w1
	mov	w0, 2048
	mov	x3, x22
	bl	StencilInit
	mov	w1, 256
	mov	w2, w1
	mov	x3, x21
	mov	w0, 2048
	bl	StencilInit
	bl	clear_cache
	mov	x0, x20
	bl	startAnalise
	mov	w3, 256
	mov	w7, 0
	mov	w4, w3
	mov	w6, w19
	mov	x1, x21
	mov	w2, 2048
	mov	w5, w23
	mov	x0, x22
	str	w26, [sp]
	bl	StencilProbeBlocked
	mov	x0, x20
	bl	finishAnalise
	mov	w2, 256
	mov	w5, w19
	mov	w1, 2048
	mov	w3, w2
	mov	w4, w23
	mov	w6, 0
	mov	x0, x20
	lsl	w19, w19, 1
	bl	printResult
	mov	x0, x22
	bl	free
	mov	x0, x21
	bl	free
	mov	x0, x20
	bl	releaseAnaliseData
	subs	w24, w24, #1
	bne	.L29
	subs	w28, w28, #1
	lsl	w25, w25, 1
	bne	.L26
	sub	sp, x29, #16
	ldp	x19, x20, [sp,32]
	ldp	x21, x22, [sp,48]
	ldp	x23, x24, [sp,64]
	ldp	x25, x26, [sp,80]
	ldp	x27, x28, [sp,96]
	ldp	x29, x30, [sp,16]
	add	sp, sp, 112
	ret
	.size	blockAnalise, .-blockAnalise
	.align	2
	.global	dinamTimestepExp
	.type	dinamTimestepExp, %function
dinamTimestepExp:
	sub	sp, sp, #160
	stp	x29, x30, [sp,16]
	add	x29, sp, 16
	stp	x23, x24, [sp,64]
	stp	x19, x20, [sp,32]
	mov	w23, w5
	sbfiz	x19, x6, 3, 32
	sxtw	x5, w5
	str	w3, [x29,128]
	mul	x19, x19, x5
	sxtw	x3, w3
	stp	x21, x22, [sp,48]
	mul	x19, x19, x3
	mov	w22, w2
	ldr	w2, [x29,144]
	stp	x27, x28, [sp,96]
	str	w2, [x29,140]
	mov	w28, w7
	ldr	w2, [x29,160]
	ldr	w7, [x29,152]
	stp	x25, x26, [sp,80]
	mov	w25, w0
	mov	x0, x19
	str	w7, [x29,136]
	str	d8, [sp,112]
	mov	w24, w6
	str	w4, [x29,124]
	str	w2, [x29,132]
	str	x1, [x29,112]
	bl	malloc
	mov	x26, x0
	mov	x0, x19
	bl	malloc
	ldr	x1, [x29,112]
	mov	x27, x0
	mov	w0, w1
	bl	initAnalise
	ldr	w7, [x29,128]
	mov	x19, x0
	cmp	w7, w22
	blt	.L46
	ldr	d8, .LC2
	mov	w20, 5
	mov	w21, 0
.L47:
	mov	w0, w22
	mov	w1, w23
	mov	w2, w24
	mov	x3, x26
	bl	StencilInit
	mov	w0, w22
	mov	w1, w23
	mov	w2, w24
	mov	x3, x27
	bl	StencilInit
	bl	clear_cache
.L43:
	mov	x0, x19
	bl	startAnalise
	cmp	w25, 4
	bls	.L50
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
	mov	w0, 1
	bl	exit
.L50:
	adrp	x0, .L34
	add	x0, x0, :lo12:.L34
	ldrb	w0, [x0,w25,uxtw]
	adr	x1, .Lrtx34
	add	x0, x1, w0, sxtb #2
	br	x0
.Lrtx34:
	.section	.rodata
	.align	0
	.align	2
.L34:
	.byte	(.L33 - .Lrtx34) / 4
	.byte	(.L35 - .Lrtx34) / 4
	.byte	(.L36 - .Lrtx34) / 4
	.byte	(.L37 - .Lrtx34) / 4
	.byte	(.L38 - .Lrtx34) / 4
	.text
.L37:
	ldr	w5, [x29,140]
	ldr	w6, [x29,136]
	ldr	w7, [x29,132]
	str	w20, [sp]
	mov	x0, x26
	mov	x1, x27
	mov	w2, w22
	mov	w3, w23
	mov	w4, w24
	bl	StencilProbeOblivious
.L39:
	mov	x0, x19
	add	w21, w21, 1
	bl	finishAnalise
	mov	x0, x19
	bl	getTime
	scvtf	d2, w20
	scvtf	d1, w28
	fdiv	d2, d2, d0
	fmul	d3, d1, d8
	fcmpe	d0, d1
	fmul	d0, d3, d2
	fcvtzs	w20, d0
	bpl	.L49
	cmp	w21, 29
	ble	.L43
	mov	w0, 1
	bl	exit
.L36:
	ldr	w5, [x29,140]
	ldr	w6, [x29,136]
	ldr	w7, [x29,132]
	str	w20, [sp]
	mov	x0, x26
	mov	x1, x27
	mov	w2, w22
	mov	w3, w23
	mov	w4, w24
	bl	StencilProbeCircqueue
	b	.L39
.L35:
	ldr	w5, [x29,140]
	ldr	w6, [x29,136]
	ldr	w7, [x29,132]
	str	w20, [sp]
	mov	x0, x26
	mov	x1, x27
	mov	w2, w22
	mov	w3, w23
	mov	w4, w24
	bl	StencilProbeBlocked
	b	.L39
.L33:
	mov	x0, x26
	mov	x1, x27
	mov	w2, w22
	mov	w3, w23
	mov	w4, w24
	mov	w5, w20
	bl	StencilProbe
	b	.L39
.L38:
	ldr	w5, [x29,140]
	ldr	w6, [x29,136]
	ldr	w7, [x29,132]
	str	w20, [sp]
	mov	x0, x26
	mov	x1, x27
	mov	w2, w22
	mov	w3, w23
	mov	w4, w24
	bl	StencilProbeTimeskew
	b	.L39
.L49:
	ldr	w7, [x29,124]
	ldr	w4, [x29,140]
	ldr	w5, [x29,136]
	ldr	w6, [x29,132]
	mov	w1, w22
	mov	x0, x19
	mov	w2, w23
	mov	w3, w24
	add	w22, w22, w7
	bl	printResult
	ldr	w0, [x29,128]
	cmp	w0, w22
	bge	.L47
.L46:
	mov	x0, x26
	bl	free
	mov	x0, x27
	bl	free
	sub	sp, x29, #16
	mov	x0, x19
	ldr	d8, [sp,112]
	ldp	x19, x20, [sp,32]
	ldp	x21, x22, [sp,48]
	ldp	x23, x24, [sp,64]
	ldp	x25, x26, [sp,80]
	ldp	x27, x28, [sp,96]
	ldp	x29, x30, [sp,16]
	add	sp, sp, 160
	b	releaseAnaliseData
	.size	dinamTimestepExp, .-dinamTimestepExp
	.align	3
.LC2:
	.word	858993459
	.word	1072902963
	.align	2
	.global	constTimestepExp
	.type	constTimestepExp, %function
constTimestepExp:
	sub	sp, sp, #144
	stp	x29, x30, [sp,16]
	add	x29, sp, 16
	stp	x19, x20, [sp,32]
	stp	x21, x22, [sp,48]
	mov	w20, w5
	sbfiz	x22, x6, 3, 32
	sxtw	x5, w5
	str	w3, [x29,124]
	mul	x22, x22, x5
	sxtw	x3, w3
	stp	x25, x26, [sp,80]
	mul	x22, x22, x3
	mov	w25, w0
	mov	x0, x22
	mov	w19, w2
	stp	x23, x24, [sp,64]
	stp	x27, x28, [sp,96]
	mov	w21, w6
	str	w4, [x29,120]
	str	w7, [x29,116]
	str	x1, [x29,96]
	ldr	w28, [x29,128]
	ldr	w27, [x29,136]
	ldr	w26, [x29,144]
	bl	malloc
	mov	x23, x0
	mov	x0, x22
	bl	malloc
	ldr	x1, [x29,96]
	mov	x24, x0
	mov	w0, w1
	bl	initAnalise
	mov	x22, x0
	ldr	w0, [x29,124]
	cmp	w0, w19
	adrp	x0, .L55
	add	x0, x0, :lo12:.L55
	str	x0, [x29,104]
	blt	.L61
.L63:
	mov	w0, w19
	mov	w1, w20
	mov	w2, w21
	mov	x3, x23
	bl	StencilInit
	mov	w0, w19
	mov	w1, w20
	mov	w2, w21
	mov	x3, x24
	bl	StencilInit
	bl	clear_cache
	mov	x0, x22
	bl	startAnalise
	cmp	w25, 4
	bls	.L64
	adrp	x0, .LC0
	add	x0, x0, :lo12:.LC0
	bl	puts
	mov	w0, 1
	bl	exit
.L64:
	ldr	x1, [x29,104]
	ldrb	w1, [x1,w25,uxtw]
	adr	x7, .Lrtx55
	add	x1, x7, w1, sxtb #2
	br	x1
.Lrtx55:
	.section	.rodata
	.align	0
	.align	2
.L55:
	.byte	(.L54 - .Lrtx55) / 4
	.byte	(.L56 - .Lrtx55) / 4
	.byte	(.L57 - .Lrtx55) / 4
	.byte	(.L58 - .Lrtx55) / 4
	.byte	(.L59 - .Lrtx55) / 4
	.text
.L58:
	ldr	w7, [x29,116]
	str	w7, [sp]
	mov	x0, x23
	mov	x1, x24
	mov	w2, w19
	mov	w3, w20
	mov	w4, w21
	mov	w5, w28
	mov	w6, w27
	mov	w7, w26
	bl	StencilProbeOblivious
.L60:
	mov	x0, x22
	bl	finishAnalise
	ldr	w7, [x29,120]
	mov	x0, x22
	mov	w1, w19
	mov	w2, w20
	mov	w3, w21
	mov	w4, w28
	mov	w5, w27
	mov	w6, w26
	add	w19, w19, w7
	bl	printResult
	ldr	w0, [x29,124]
	cmp	w0, w19
	bge	.L63
.L61:
	mov	x0, x23
	bl	free
	mov	x0, x24
	bl	free
	sub	sp, x29, #16
	mov	x0, x22
	ldp	x19, x20, [sp,32]
	ldp	x21, x22, [sp,48]
	ldp	x23, x24, [sp,64]
	ldp	x25, x26, [sp,80]
	ldp	x27, x28, [sp,96]
	ldp	x29, x30, [sp,16]
	add	sp, sp, 144
	b	releaseAnaliseData
.L57:
	ldr	w1, [x29,116]
	str	w1, [sp]
	mov	x0, x23
	mov	x1, x24
	mov	w2, w19
	mov	w3, w20
	mov	w4, w21
	mov	w5, w28
	mov	w6, w27
	mov	w7, w26
	bl	StencilProbeCircqueue
	b	.L60
.L56:
	ldr	w0, [x29,116]
	str	w0, [sp]
	mov	x1, x24
	mov	x0, x23
	mov	w2, w19
	mov	w3, w20
	mov	w4, w21
	mov	w5, w28
	mov	w6, w27
	mov	w7, w26
	bl	StencilProbeBlocked
	b	.L60
.L54:
	ldr	w5, [x29,116]
	mov	x0, x23
	mov	x1, x24
	mov	w2, w19
	mov	w3, w20
	mov	w4, w21
	bl	StencilProbe
	b	.L60
.L59:
	ldr	w0, [x29,116]
	str	w0, [sp]
	mov	x1, x24
	mov	x0, x23
	mov	w2, w19
	mov	w3, w20
	mov	w4, w21
	mov	w5, w28
	mov	w6, w27
	mov	w7, w26
	bl	StencilProbeTimeskew
	b	.L60
	.size	constTimestepExp, .-constTimestepExp
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC0:
	.string	"[execStencil.func] - Undefined optimization"
	.zero	4
.LC1:
	.string	"dx = %d; dy = %d\n"
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
