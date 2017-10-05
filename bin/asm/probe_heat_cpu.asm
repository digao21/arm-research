	.arch armv8-a+fp+simd
	.file	"probe_heat_cpu.c"
	.text
	.align	2
	.global	StencilProbeCPU
	.type	StencilProbeCPU, %function
StencilProbeCPU:
	sub	sp, sp, #80
	cmp	w5, wzr
	fmov	d22, x0
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	stp	x25, x26, [sp,48]
	stp	x27, x28, [sp,64]
	fmov	s23, w5
	ldr	d7, [x0]
	fmov	d27, x1
	fmul	d7, d7, d7
	ble	.L1
	sub	w4, w4, #1
	lsl	w0, w3, 1
	sxtw	x20, w2
	fmov	s24, w4
	fmov	s26, w0
	fmov	s25, wzr
	sub	w24, w2, #4
	sub	w19, w3, #1
	sub	w21, w2, #2
	neg	x18, x20, lsl 3
	lsl	x17, x20, 3
	lsr	w24, w24, 1
	fmov	d6, 3.0e+0
	fmov	d5, 2.0e+0
	fmov	d4, 4.0e+0
	fmov	d3, 5.0e+0
	fmov	d2, 6.0e+0
	fmov	d1, 7.0e+0
	fmov	d0, 2.6e+1
.L3:
	fmov	w4, s24
	cmp	w4, 1
	ble	.L9
	fmov	x5, d22
	fmov	w0, s26
	mov	w26, w3
	mov	w28, 0
	mov	w27, 2
	add	x25, x5, 32
.L12:
	cmp	w19, 1
	fmov	s28, w27
	ble	.L5
	add	w4, w0, 1
	fmov	x5, d22
	mul	w4, w2, w4
	add	w1, w26, 1
	add	w10, w28, 1
	mul	w1, w2, w1
	sxtw	x14, w4
	add	x23, x5, x1, sxtw 3
	add	x4, x5, x4, sxtw 3
	add	w12, w26, 2
	fmov	x5, d27
	mul	w10, w2, w10
	sxtw	x16, w1
	mul	w12, w2, w12
	mul	w11, w2, w26
	fmov	s28, w27
	sub	x4, x4, x10, sxtw 3
	sub	x23, x23, x10, sxtw 3
	add	x22, x5, x1, sxtw 3
	neg	x14, x14, lsl 3
	sub	x22, x22, x10, sxtw 3
	sbfiz	x12, x12, 3, 32
	sbfiz	x10, x10, 3, 32
	sbfiz	x11, x11, 3, 32
	neg	x13, x16, lsl 3
	mov	w15, 2
	add	x5, x4, 8
	add	x23, x23, 16
	add	x22, x22, 8
.L11:
	cmp	w21, 1
	mov	w4, w15
	ble	.L7
	add	x6, x16, x24, uxtw 1
	mov	w4, w15
	add	x1, x25, x6, lsl 3
	add	x8, x22, x10
	add	x6, x23, x10
	add	x7, x5, x10
.L8:
	add	x9, x14, x7
	ldr	d18, [x7]
	ldr	d17, [x9,x10]
	ldr	d16, [x6,-8]
	fmul	d17, d17, d6
	ldr	d21, [x9,x12]
	fmul	d16, d16, d0
	ldr	d20, [x9,x11]
	fmadd	d18, d18, d5, d17
	ldr	d17, [x6]
	fdiv	d19, d16, d7
	ldr	d16, [x6,-16]
	add	x9, x6, x13
	add	x8, x8, 16
	add	x7, x7, 16
	fmadd	d18, d21, d4, d18
	fmadd	d18, d20, d3, d18
	fmadd	d17, d17, d2, d18
	fmadd	d16, d16, d1, d17
	fsub	d16, d16, d19
	str	d16, [x8,-16]
	ldr	d17, [x9,x10]
	ldr	d16, [x7,-8]
	fmul	d17, d17, d6
	ldr	d20, [x6,8]
	ldr	d19, [x6,-8]
	ldr	d18, [x6],16
	fmadd	d16, d16, d5, d17
	ldr	d17, [x9,x12]
	fmul	d18, d18, d0
	ldr	d21, [x9,x11]
	cmp	x6, x1
	fdiv	d18, d18, d7
	fmadd	d16, d17, d4, d16
	fmadd	d16, d21, d3, d16
	fmadd	d16, d20, d2, d16
	fmadd	d16, d19, d1, d16
	fsub	d16, d16, d18
	str	d16, [x8,-8]
	bne	.L8
.L7:
	cmp	w19, w4
	add	w15, w15, 1
	add	x14, x14, x18
	add	x10, x10, x2, sxtw 3
	add	x12, x12, x17
	add	x11, x11, x17
	add	x13, x13, x18
	add	x16, x16, x20
	bgt	.L11
.L5:
	fmov	w1, s24
	fmov	w4, s28
	add	w27, w27, 1
	add	w0, w0, w3
	add	w28, w28, w3
	cmp	w1, w4
	add	w26, w26, w3
	bgt	.L12
.L9:
	fmov	w0, s25
	fmov	w1, s23
	add	w0, w0, 1
	cmp	w0, w1
	fmov	s25, w0
	beq	.L1
	fmov	x0, d27
	fmov	d27, d22
	fmov	d22, x0
	b	.L3
.L1:
	ldp	x19, x20, [sp]
	ldp	x21, x22, [sp,16]
	ldp	x23, x24, [sp,32]
	ldp	x25, x26, [sp,48]
	ldp	x27, x28, [sp,64]
	add	sp, sp, 80
	ret
	.size	StencilProbeCPU, .-StencilProbeCPU
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
