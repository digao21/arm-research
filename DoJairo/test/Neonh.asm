	.cpu cortex-a53+fp+simd
	.file	"Neonh.c"
	.text
	.align	2
	.global	verifyInt
	.type	verifyInt, %function
verifyInt:
	stp	x29, x30, [sp, -32]!
	cmp	w2, w1
	add	x29, sp, 0
	mov	x2, x0
	beq	.L5
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	w0, 1
	str	x2, [x29,24]
	bl	__printf_chk
	ldr	x2, [x29,24]
	adrp	x1, .LC4
	ldp	x29, x30, [sp], 32
	mov	w0, 1
	add	x1, x1, :lo12:.LC4
	b	__printf_chk
.L5:
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	mov	w0, 1
	str	x2, [x29,24]
	bl	__printf_chk
	ldr	x2, [x29,24]
	adrp	x1, .LC4
	ldp	x29, x30, [sp], 32
	mov	w0, 1
	add	x1, x1, :lo12:.LC4
	b	__printf_chk
	.size	verifyInt, .-verifyInt
	.align	2
	.global	verifyFloat
	.type	verifyFloat, %function
verifyFloat:
	fsub	s0, s1, s0
	stp	x29, x30, [sp, -32]!
	mov	x2, x0
	add	x29, sp, 0
	fcvt	d0, s0
	ldr	d1, .LC5
	fcmpe	d0, d1
	ble	.L7
	ldr	d1, .LC6
	fcmpe	d0, d1
	bmi	.L13
.L7:
	adrp	x1, .LC3
	add	x1, x1, :lo12:.LC3
	mov	w0, 1
	str	x2, [x29,24]
	bl	__printf_chk
	ldr	x2, [x29,24]
	adrp	x1, .LC4
	ldp	x29, x30, [sp], 32
	mov	w0, 1
	add	x1, x1, :lo12:.LC4
	b	__printf_chk
.L13:
	adrp	x1, .LC2
	add	x1, x1, :lo12:.LC2
	mov	w0, 1
	str	x2, [x29,24]
	bl	__printf_chk
	ldr	x2, [x29,24]
	adrp	x1, .LC4
	ldp	x29, x30, [sp], 32
	mov	w0, 1
	add	x1, x1, :lo12:.LC4
	b	__printf_chk
	.size	verifyFloat, .-verifyFloat
	.align	3
.LC5:
	.word	3539053052
	.word	-1085250995
	.align	3
.LC6:
	.word	3539053052
	.word	1062232653
	.align	2
	.global	test_add_int32x2
	.type	test_add_int32x2, %function
test_add_int32x2:
	stp	x29, x30, [sp, -240]!
	adrp	x3, __stack_chk_guard
	add	x29, sp, 0
	ldr	x2, [x3,#:lo12:__stack_chk_guard]
	stp	x19, x20, [sp,16]
	stp	x21, x22, [sp,32]
	stp	x23, x24, [sp,48]
	stp	x25, x26, [sp,64]
	stp	x27, x28, [sp,80]
	str	x2, [x29,232]
	stp	d8, d9, [sp,96]
	tbnz	x1, 0, .L15
	cmp	w1, wzr
	ble	.L25
	sub	w1, w1, #1
	mov	x19, x0
	lsr	w1, w1, 1
	add	x0, x0, 24
	mov	w2, 24
	adrp	x25, .LC8
	umaddl	x2, w1, w2, x0
	adrp	x28, .LC3
	adrp	x0, .LC2
	adrp	x24, .LC4
	add	x0, x0, :lo12:.LC2
	str	x2, [x29,120]
	add	x25, x25, :lo12:.LC8
	add	x28, x28, :lo12:.LC3
	str	x0, [x29,112]
	add	x24, x24, :lo12:.LC4
	b	.L23
.L18:
	mov	w0, 1
	mov	x1, x28
	bl	__printf_chk
.L19:
	mov	x1, x24
	add	x2, x29, 128
	mov	w0, 1
	sbfx	x22, x22, 32, 32
	bl	__printf_chk
	add	x0, x29, 128
	mov	w1, 1
	mov	x2, 100
	mov	x3, x25
	mov	w4, w22
	mov	w5, w21
	mov	w6, w20
	bl	__sprintf_chk
	cmp	w26, w22
	beq	.L26
	mov	x1, x28
	mov	w0, 1
	add	x19, x19, 24
	bl	__printf_chk
	mov	w0, 1
	mov	x1, x24
	add	x2, x29, 128
	bl	__printf_chk
	ldr	x0, [x29,120]
	cmp	x19, x0
	beq	.L25
.L23:
	ldr	w5, [x19,4]
	ldr	w6, [x19,8]
	ins	v8.s[0], w5
	ins	v9.s[0], w6
	ldr	w21, [x19,16]
	ldr	w20, [x19,20]
	ins	v8.s[1], w21
	ins	v9.s[1], w20
	add	x0, x29, 128
	add	v0.2s, v8.2s, v9.2s
	mov	w1, 1
	umov	x22, v0.d[0]
	mov	x2, 100
	mov	x3, x25
	mov	w4, w22
	ldr	w27, [x19]
	ldr	w26, [x19,12]
	bl	__sprintf_chk
	cmp	w27, w22
	bne	.L18
	ldr	x1, [x29,112]
	mov	w0, 1
	bl	__printf_chk
	b	.L19
.L26:
	ldr	x1, [x29,112]
	mov	w0, 1
	add	x19, x19, 24
	bl	__printf_chk
	mov	w0, 1
	mov	x1, x24
	add	x2, x29, 128
	bl	__printf_chk
	ldr	x0, [x29,120]
	cmp	x19, x0
	bne	.L23
.L25:
	adrp	x3, __stack_chk_guard
	ldr	x2, [x29,232]
	ldr	x1, [x3,#:lo12:__stack_chk_guard]
	cmp	x2, x1
	bne	.L27
	ldp	x19, x20, [sp,16]
	ldp	x21, x22, [sp,32]
	ldp	x23, x24, [sp,48]
	ldp	x25, x26, [sp,64]
	ldp	x27, x28, [sp,80]
	ldp	d8, d9, [sp,96]
	ldp	x29, x30, [sp], 240
	ret
.L15:
	adrp	x0, .LC7
	add	x0, x0, :lo12:.LC7
	bl	puts
	b	.L25
.L27:
	bl	__stack_chk_fail
	.size	test_add_int32x2, .-test_add_int32x2
	.align	2
	.global	test_add_int32x4
	.type	test_add_int32x4, %function
test_add_int32x4:
	stp	x29, x30, [sp, -304]!
	adrp	x4, __stack_chk_guard
	add	x29, sp, 0
	ldr	x3, [x4,#:lo12:__stack_chk_guard]
	stp	x19, x20, [sp,16]
	stp	x21, x22, [sp,32]
	stp	x23, x24, [sp,48]
	stp	x25, x26, [sp,64]
	stp	x27, x28, [sp,80]
	and	w2, w1, 3
	str	x3, [x29,296]
	cbnz	w2, .L29
	cmp	w1, wzr
	ble	.L43
	sub	w1, w1, #1
	mov	x19, x0
	lsr	w1, w1, 2
	add	x0, x0, 48
	mov	w2, 48
	adrp	x23, .LC8
	umaddl	x2, w1, w2, x0
	adrp	x24, .LC3
	adrp	x0, .LC2
	adrp	x22, .LC4
	add	x0, x0, :lo12:.LC2
	str	x2, [x29,128]
	add	x23, x23, :lo12:.LC8
	add	x24, x24, :lo12:.LC3
	str	x0, [x29,120]
	add	x22, x22, :lo12:.LC4
	b	.L41
.L32:
	mov	w0, 1
	mov	x1, x24
	bl	__printf_chk
.L33:
	mov	x1, x22
	add	x2, x29, 192
	mov	w0, 1
	bl	__printf_chk
	sbfx	x7, x20, 32, 32
	ldr	w5, [x29,156]
	ldr	w6, [x29,152]
	mov	w4, w7
	add	x0, x29, 192
	mov	w1, 1
	mov	x2, 100
	mov	x3, x23
	str	x7, [x29,104]
	bl	__sprintf_chk
	ldr	x7, [x29,104]
	ldr	w9, [x29,148]
	cmp	w9, w7
	beq	.L44
	mov	w0, 1
	mov	x1, x24
	bl	__printf_chk
.L35:
	mov	x1, x22
	add	x2, x29, 192
	mov	w0, 1
	str	x21, [x29,104]
	bl	__printf_chk
	ldr	x7, [x29,104]
	add	x0, x29, 192
	mov	w4, w7
	mov	w1, 1
	mov	x2, 100
	mov	x3, x23
	mov	w5, w28
	mov	w6, w27
	bl	__sprintf_chk
	ldr	x7, [x29,104]
	ldr	w9, [x29,144]
	cmp	w9, w7
	beq	.L45
	mov	w0, 1
	mov	x1, x24
	bl	__printf_chk
.L37:
	mov	x1, x22
	add	x2, x29, 192
	mov	w0, 1
	sbfx	x20, x21, 32, 32
	bl	__printf_chk
	add	x0, x29, 192
	mov	w1, 1
	mov	x2, 100
	mov	x3, x23
	mov	w4, w20
	mov	w5, w26
	mov	w6, w25
	bl	__sprintf_chk
	ldr	w9, [x29,140]
	cmp	w9, w20
	beq	.L46
	mov	x1, x24
	mov	w0, 1
	add	x19, x19, 48
	bl	__printf_chk
	mov	w0, 1
	mov	x1, x22
	add	x2, x29, 192
	bl	__printf_chk
	ldr	x9, [x29,128]
	cmp	x19, x9
	beq	.L43
.L41:
	add	x9, x29, 176
	ldr	w5, [x19,4]
	ld1	{v0.4s}, [x9]
	ins	v0.s[0], w5
	st1	{v0.4s}, [x9]
	ldr	w9, [x19,16]
	str	w9, [x29,156]
	ldr	w9, [x19,20]
	add	x0, x29, 160
	ldr	w6, [x19,8]
	ld1	{v0.4s}, [x0]
	str	w9, [x29,152]
	ins	v0.s[0], w6
	add	x9, x29, 176
	st1	{v0.4s}, [x0]
	ld1	{v0.4s}, [x9]
	ldr	w9, [x29,156]
	ins	v0.s[1], w9
	add	x9, x29, 176
	st1	{v0.4s}, [x9]
	ld1	{v0.4s}, [x0]
	ldr	w9, [x29,152]
	ins	v0.s[1], w9
	ldr	w28, [x19,28]
	st1	{v0.4s}, [x0]
	mov	x9, x0
	add	x0, x29, 176
	ld1	{v0.4s}, [x0]
	ins	v0.s[2], w28
	ldr	w27, [x19,32]
	st1	{v0.4s}, [x0]
	ld1	{v0.4s}, [x9]
	ins	v0.s[2], w27
	add	x0, x29, 176
	st1	{v0.4s}, [x9]
	ldr	w26, [x19,40]
	ld1	{v0.4s}, [x0]
	ins	v0.s[3], w26
	ldr	w25, [x19,44]
	st1	{v0.4s}, [x0]
	ld1	{v0.4s}, [x9]
	ins	v0.s[3], w25
	st1	{v0.4s}, [x9]
	ldr	w9, [x19,12]
	str	w9, [x29,148]
	ldr	w9, [x19,24]
	ldr	w8, [x19]
	add	x0, x29, 176
	ld1	{v1.4s}, [x0]
	str	w9, [x29,144]
	ldr	w9, [x19,36]
	add	v0.4s, v1.4s, v0.4s
	add	x0, x29, 192
	umov	x20, v0.d[0]
	mov	w1, 1
	mov	x2, 100
	mov	x3, x23
	mov	w4, w20
	str	x8, [x29,112]
	umov	x21, v0.d[1]
	str	w9, [x29,140]
	str	x20, [x29,104]
	bl	__sprintf_chk
	ldr	x7, [x29,104]
	ldr	x8, [x29,112]
	cmp	w8, w7
	bne	.L32
	ldr	x1, [x29,120]
	mov	w0, 1
	bl	__printf_chk
	b	.L33
.L46:
	ldr	x1, [x29,120]
	mov	w0, 1
	add	x19, x19, 48
	bl	__printf_chk
	mov	w0, 1
	mov	x1, x22
	add	x2, x29, 192
	bl	__printf_chk
	ldr	x9, [x29,128]
	cmp	x19, x9
	bne	.L41
.L43:
	adrp	x0, __stack_chk_guard
	ldr	x2, [x29,296]
	ldr	x1, [x0,#:lo12:__stack_chk_guard]
	cmp	x2, x1
	bne	.L47
	ldp	x19, x20, [sp,16]
	ldp	x21, x22, [sp,32]
	ldp	x23, x24, [sp,48]
	ldp	x25, x26, [sp,64]
	ldp	x27, x28, [sp,80]
	ldp	x29, x30, [sp], 304
	ret
.L45:
	ldr	x1, [x29,120]
	mov	w0, 1
	bl	__printf_chk
	b	.L37
.L44:
	ldr	x1, [x29,120]
	mov	w0, 1
	bl	__printf_chk
	b	.L35
.L29:
	adrp	x0, .LC9
	add	x0, x0, :lo12:.LC9
	bl	puts
	b	.L43
.L47:
	bl	__stack_chk_fail
	.size	test_add_int32x4, .-test_add_int32x4
	.align	2
	.global	test_mula_float32x4
	.type	test_mula_float32x4, %function
test_mula_float32x4:
	stp	x29, x30, [sp, -336]!
	adrp	x4, __stack_chk_guard
	add	x29, sp, 0
	ldr	x3, [x4,#:lo12:__stack_chk_guard]
	stp	x19, x20, [sp,16]
	stp	x21, x22, [sp,32]
	stp	x23, x24, [sp,48]
	stp	x25, x26, [sp,64]
	stp	x27, x28, [sp,80]
	and	w2, w1, 3
	str	x3, [x29,328]
	stp	d8, d9, [sp,96]
	str	d10, [sp,112]
	cbnz	w2, .L49
	cmp	w1, wzr
	ble	.L60
	sub	w1, w1, #1
	mov	x20, x0
	lsr	w1, w1, 2
	add	x0, x0, 64
	mov	w2, 64
	ldr	d9, .LC12
	ldr	d10, .LC13
	umaddl	x2, w1, w2, x0
	adrp	x28, .LC3
	adrp	x0, .LC2
	add	x0, x0, :lo12:.LC2
	str	x2, [x29,136]
	add	x24, x29, 144
	add	x23, x29, 176
	add	x22, x29, 192
	add	x21, x29, 208
	add	x26, x29, 160
	adrp	x27, .LC4
	add	x28, x28, :lo12:.LC3
	str	x0, [x29,128]
.L51:
	ldr	w0, [x20,48]
	ldr	w3, [x20]
	ldr	w15, [x20,4]
	ldr	w14, [x20,8]
	ldr	w13, [x20,12]
	ldr	w2, [x20,16]
	ldr	w12, [x20,20]
	ldr	w11, [x20,24]
	ldr	w10, [x20,28]
	ldr	w1, [x20,32]
	ldr	w9, [x20,36]
	ldr	w8, [x20,40]
	ldr	w7, [x20,44]
	ldr	w6, [x20,52]
	ldr	w5, [x20,56]
	ldr	w4, [x20,60]
	str	w0, [x29,172]
	adrp	x0, .LC11
	mov	x19, 0
	add	x25, x0, :lo12:.LC11
	str	w15, [x29,176]
	str	w14, [x29,192]
	str	w13, [x29,208]
	str	w12, [x29,180]
	str	w11, [x29,196]
	str	w10, [x29,212]
	str	w9, [x29,184]
	str	w8, [x29,200]
	str	w7, [x29,216]
	str	w6, [x29,188]
	str	w5, [x29,204]
	str	w4, [x29,220]
	str	w3, [x29,160]
	str	w2, [x29,164]
	str	w1, [x29,168]
	ld1	{v2.4s}, [x22]
	ld1	{v1.4s}, [x21]
	ld1	{v0.4s}, [x23]
	fmla	v0.4s, v2.4s, v1.4s
	st1	{v0.4s}, [x24]
.L58:
	ldr	s8, [x24,x19]
	ldr	s1, [x23,x19]
	ldr	s2, [x22,x19]
	ldr	s3, [x21,x19]
	fcvt	d0, s8
	fcvt	d1, s1
	fcvt	d2, s2
	fcvt	d3, s3
	add	x0, x29, 224
	mov	w1, 1
	mov	x2, 100
	mov	x3, x25
	bl	__sprintf_chk
	ldr	s0, [x26,x19]
	fsub	s8, s0, s8
	fcvt	d8, s8
	fcmpe	d8, d9
	ble	.L53
	fcmpe	d8, d10
	bmi	.L63
.L53:
	mov	w0, 1
	mov	x1, x28
	bl	__printf_chk
.L56:
	mov	w0, 1
	add	x1, x27, :lo12:.LC4
	add	x2, x29, 224
	add	x19, x19, 4
	bl	__printf_chk
	cmp	x19, 16
	bne	.L58
	ldr	x4, [x29,136]
	add	x20, x20, 64
	cmp	x20, x4
	bne	.L51
.L60:
	adrp	x4, __stack_chk_guard
	ldr	x2, [x29,328]
	ldr	x1, [x4,#:lo12:__stack_chk_guard]
	cmp	x2, x1
	bne	.L64
	ldp	x19, x20, [sp,16]
	ldp	x21, x22, [sp,32]
	ldp	x23, x24, [sp,48]
	ldp	x25, x26, [sp,64]
	ldp	x27, x28, [sp,80]
	ldp	d8, d9, [sp,96]
	ldr	d10, [sp,112]
	ldp	x29, x30, [sp], 336
	ret
.L63:
	ldr	x1, [x29,128]
	mov	w0, 1
	bl	__printf_chk
	b	.L56
.L49:
	adrp	x0, .LC10
	add	x0, x0, :lo12:.LC10
	bl	puts
	b	.L60
.L64:
	bl	__stack_chk_fail
	.size	test_mula_float32x4, .-test_mula_float32x4
	.align	3
.LC12:
	.word	3539053052
	.word	-1085250995
	.align	3
.LC13:
	.word	3539053052
	.word	1062232653
	.align	2
	.global	test_mula_float64x2
	.type	test_mula_float64x2, %function
test_mula_float64x2:
	stp	x29, x30, [sp, -320]!
	adrp	x4, __stack_chk_guard
	add	x29, sp, 0
	ldr	x3, [x4,#:lo12:__stack_chk_guard]
	stp	x19, x20, [sp,16]
	stp	x21, x22, [sp,32]
	stp	x23, x24, [sp,48]
	stp	x25, x26, [sp,64]
	stp	x27, x28, [sp,80]
	and	w2, w1, 3
	str	x3, [x29,312]
	stp	d8, d9, [sp,96]
	stp	d10, d11, [sp,112]
	cbnz	w2, .L66
	cmp	w1, wzr
	ble	.L79
	sub	w27, w1, #1
	ldr	d10, .LC15
	mov	x19, x0
	lsr	w27, w27, 1
	add	x0, x0, 32
	mov	w2, 32
	adrp	x28, .LC2
	adrp	x26, .LC3
	umaddl	x27, w27, w2, x0
	adrp	x25, .LC4
	add	x23, x29, 128
	add	x22, x29, 176
	add	x21, x29, 160
	add	x20, x29, 192
	adrp	x24, .LC11
	ldr	d9, .LC16
	add	x28, x28, :lo12:.LC2
	add	x26, x26, :lo12:.LC3
	fmov	d11, d10
	b	.L68
.L75:
	mov	x1, x26
	mov	w0, 1
	bl	__printf_chk
.L74:
	add	x1, x25, :lo12:.LC4
	add	x2, x29, 208
	mov	w0, 1
	bl	__printf_chk
	ldr	d8, [x29,136]
	ldr	d1, [x29,168]
	ldr	d2, [x29,184]
	ldr	d3, [x29,200]
	fcvt	s8, d8
	fcvt	s1, d1
	fcvt	s2, d2
	fcvt	s3, d3
	fcvt	d0, s8
	fcvt	d1, s1
	fcvt	d2, s2
	fcvt	d3, s3
	add	x0, x29, 208
	mov	w1, 1
	mov	x2, 100
	add	x3, x24, :lo12:.LC11
	bl	__sprintf_chk
	ldr	d0, [x29,152]
	fcvt	s0, d0
	fsub	s8, s0, s8
	fcvt	d8, s8
	fcmpe	d8, d9
	ble	.L70
	fcmpe	d8, d11
	bmi	.L82
.L70:
	mov	x1, x26
	mov	w0, 1
	add	x19, x19, 32
	bl	__printf_chk
	mov	w0, 1
	add	x1, x25, :lo12:.LC4
	add	x2, x29, 208
	bl	__printf_chk
	cmp	x19, x27
	beq	.L79
.L68:
	ldr	s1, [x19,4]
	ldr	s2, [x19,8]
	ldr	s3, [x19,12]
	ldr	s5, [x19,20]
	ldr	s4, [x19,24]
	ldr	s0, [x19,28]
	fcvt	d1, s1
	fcvt	d2, s2
	fcvt	d3, s3
	fcvt	d5, s5
	fcvt	d4, s4
	fcvt	d0, s0
	str	d1, [x29,160]
	str	d2, [x29,176]
	str	d3, [x29,192]
	str	d5, [x29,168]
	str	d4, [x29,184]
	str	d0, [x29,200]
	ld1	{v5.2d}, [x22]
	ld1	{v4.2d}, [x20]
	ld1	{v0.2d}, [x21]
	fmla	v0.2d, v5.2d, v4.2d
	st1	{v0.2d}, [x23]
	ldr	d8, [x29,128]
	fcvt	s1, d1
	fcvt	s8, d8
	fcvt	s2, d2
	fcvt	s3, d3
	ldr	s0, [x19,16]
	ldr	s4, [x19]
	fcvt	d5, s0
	fcvt	d4, s4
	fcvt	d0, s8
	fcvt	d1, s1
	fcvt	d2, s2
	fcvt	d3, s3
	add	x0, x29, 208
	mov	w1, 1
	mov	x2, 100
	add	x3, x24, :lo12:.LC11
	str	d4, [x29,144]
	str	d5, [x29,152]
	bl	__sprintf_chk
	ldr	d0, [x29,144]
	fcvt	s0, d0
	fsub	s8, s0, s8
	fcvt	d8, s8
	fcmpe	d8, d9
	ble	.L75
	fcmpe	d8, d10
	bpl	.L75
	mov	x1, x28
	mov	w0, 1
	bl	__printf_chk
	b	.L74
.L82:
	mov	x1, x28
	mov	w0, 1
	add	x19, x19, 32
	bl	__printf_chk
	mov	w0, 1
	add	x1, x25, :lo12:.LC4
	add	x2, x29, 208
	bl	__printf_chk
	cmp	x19, x27
	bne	.L68
.L79:
	adrp	x0, __stack_chk_guard
	ldr	x2, [x29,312]
	ldr	x1, [x0,#:lo12:__stack_chk_guard]
	cmp	x2, x1
	bne	.L83
	ldp	x19, x20, [sp,16]
	ldp	x21, x22, [sp,32]
	ldp	x23, x24, [sp,48]
	ldp	x25, x26, [sp,64]
	ldp	x27, x28, [sp,80]
	ldp	d8, d9, [sp,96]
	ldp	d10, d11, [sp,112]
	ldp	x29, x30, [sp], 320
	ret
.L66:
	adrp	x0, .LC14
	add	x0, x0, :lo12:.LC14
	bl	puts
	b	.L79
.L83:
	bl	__stack_chk_fail
	.size	test_mula_float64x2, .-test_mula_float64x2
	.align	3
.LC15:
	.word	3539053052
	.word	1062232653
	.align	3
.LC16:
	.word	3539053052
	.word	-1085250995
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.type	main, %function
main:
	stp	x29, x30, [sp, -400]!
	adrp	x0, .LC17
	add	x29, sp, 0
	add	x0, x0, :lo12:.LC17
	str	x19, [sp,16]
	adrp	x19, .LANCHOR0
	bl	puts
	add	x19, x19, :lo12:.LANCHOR0
	mov	x2, 240
	mov	x1, x19
	add	x0, x29, 160
	bl	memcpy
	mov	w1, 20
	add	x0, x29, 160
	bl	test_add_int32x2
	mov	w0, 10
	bl	putchar
	adrp	x0, .LC18
	add	x0, x0, :lo12:.LC18
	bl	puts
	mov	w1, 20
	add	x0, x29, 160
	bl	test_add_int32x4
	mov	w0, 10
	bl	putchar
	adrp	x0, .LC19
	add	x0, x0, :lo12:.LC19
	bl	puts
	mov	x2, 128
	add	x1, x19, 240
	add	x0, x29, 32
	bl	memcpy
	mov	w1, 8
	add	x0, x29, 32
	bl	test_mula_float32x4
	mov	w0, 10
	bl	putchar
	adrp	x0, .LC20
	add	x0, x0, :lo12:.LC20
	bl	puts
	mov	w1, 8
	add	x0, x29, 32
	bl	test_mula_float64x2
	mov	w0, 10
	bl	putchar
	ldr	x19, [sp,16]
	ldp	x29, x30, [sp], 400
	ret
	.size	main, .-main
	.section	.rodata
	.align	3
.LANCHOR0 = . + 0
.LC0:
	.word	3
	.word	1
	.word	2
	.word	4
	.word	1
	.word	3
	.word	10
	.word	5
	.word	5
	.word	18
	.word	9
	.word	9
	.word	1
	.word	6
	.word	-5
	.word	0
	.word	5
	.word	-5
	.word	1
	.word	-5
	.word	6
	.word	0
	.word	-5
	.word	5
	.word	-1
	.word	-6
	.word	5
	.word	-1
	.word	5
	.word	-6
	.word	-2
	.word	-1
	.word	-1
	.word	-5
	.word	-2
	.word	-3
	.word	-10
	.word	-5
	.word	-5
	.word	-18
	.word	-9
	.word	-9
	.word	100
	.word	50
	.word	50
	.word	1024
	.word	512
	.word	512
	.word	2147483647
	.word	1073741824
	.word	1073741823
	.word	-2147483648
	.word	-1073741824
	.word	-1073741824
	.word	0
	.word	1073741824
	.word	-1073741824
	.word	-1
	.word	-2147483648
	.word	2147483647
.LC1:
	.word	1092616192
	.word	1065353216
	.word	1077936128
	.word	1077936128
	.word	1086324736
	.word	1077936128
	.word	1065353216
	.word	1077936128
	.word	1086324736
	.word	1077936128
	.word	1077936128
	.word	1065353216
	.word	1086324736
	.word	1073741824
	.word	1073741824
	.word	1073741824
	.word	1112103977
	.word	1084647014
	.word	1086534451
	.word	1089260749
	.word	3284843102
	.word	1113928499
	.word	1097544499
	.word	3254507274
	.word	3274227057
	.word	3256877056
	.word	3257139200
	.word	1078523331
	.word	1148650560
	.word	3254747136
	.word	3254747136
	.word	3254747136
	.section	.rodata.str1.8,"aMS",%progbits,1
	.align	3
.LC2:
	.string	"[OK] "
	.zero	2
.LC3:
	.string	"[ERROR] "
	.zero	7
.LC4:
	.string	"%s"
	.zero	5
.LC7:
	.string	"ERROR int32x4 tests must be divisible by 2"
	.zero	5
.LC8:
	.string	"%d = %d + %d\n"
	.zero	2
.LC9:
	.string	"ERROR int32x4 tests must be divisible by 4"
	.zero	5
.LC10:
	.string	"ERROR mula_float32x4 tests must be divisible by 4"
	.zero	6
.LC11:
	.string	"%f = %f + %f*%f\n"
	.zero	7
.LC14:
	.string	"ERROR mula_float64x2 tests must be divisible by 2"
	.zero	6
.LC17:
	.string	"Test vadd_s32"
	.zero	2
.LC18:
	.string	"Test vaddq_s32"
	.zero	1
.LC19:
	.string	"Test vmlaq_f32"
	.zero	1
.LC20:
	.string	"Test vmlaq_f64"
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
