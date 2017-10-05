	.arch armv8-a+fp+simd
	.file	"util.c"
	.text
	.align	2
	.global	StencilInit
	.type	StencilInit, %function
StencilInit:
	mul	w1, w0, w1
	mul	w2, w1, w2
	cmp	w2, wzr
	ble	.L1
	sxtw	x1, w2
	ubfx	x0, x3, 3, 1
	cmp	x1, x0
	csel	x0, x1, x0, ls
	cmp	x1, 6
	csel	x0, x0, x1, hi
	cbz	x0, .L13
	fmov	d0, 1.0e+0
	cmp	x0, 1
	str	d0, [x3]
	bls	.L14
	cmp	x0, 2
	str	d0, [x3,8]
	bls	.L15
	cmp	x0, 3
	str	d0, [x3,16]
	bls	.L16
	cmp	x0, 4
	str	d0, [x3,24]
	bls	.L17
	cmp	x0, 5
	str	d0, [x3,32]
	bls	.L18
	mov	x5, 6
	str	d0, [x3,40]
.L5:
	cmp	x1, x0
	beq	.L1
	sub	x1, x1, x0
	lsr	x4, x1, 1
	lsl	x6, x4, 1
	cbz	x6, .L7
.L23:
	add	x2, x3, x0, lsl 3
	mov	x0, 0
	fmov	v0.2d, 1.0e+0
.L11:
	add	x0, x0, 1
	cmp	x4, x0
	st1	{v0.2d}, [x2],16
	bhi	.L11
	cmp	x1, x6
	add	x5, x5, x6
	beq	.L1
.L7:
	fmov	d0, 1.0e+0
	str	d0, [x3,x5,lsl 3]
.L1:
	ret
.L13:
	sub	x1, x1, x0
	lsr	x4, x1, 1
	lsl	x6, x4, 1
	mov	x5, x0
	cbnz	x6, .L23
	b	.L7
.L14:
	mov	x5, 1
	b	.L5
.L15:
	mov	x5, 2
	b	.L5
.L16:
	mov	x5, 3
	b	.L5
.L17:
	mov	x5, 4
	b	.L5
.L18:
	mov	x5, 5
	b	.L5
	.size	StencilInit, .-StencilInit
	.align	2
	.global	seconds_per_tick
	.type	seconds_per_tick, %function
seconds_per_tick:
	stp	x29, x30, [sp, -32]!
	add	x29, sp, 0
	stp	x19, x20, [sp,16]
	mov	w19, 3
.L27:
	bl	PAPI_get_real_cyc
	mov	x20, x0
	mov	w0, w19
	bl	sleep
	bl	PAPI_get_real_cyc
	sub	x0, x0, x20
	ucvtf	d0, w19
	scvtf	d1, x0
	add	w19, w19, 1
	fdiv	d0, d0, d1
	fcmpe	d0, #0.0
	bls	.L27
	ldp	x19, x20, [sp,16]
	ldp	x29, x30, [sp], 32
	ret
	.size	seconds_per_tick, .-seconds_per_tick
	.align	2
	.global	clear_cache
	.type	clear_cache, %function
clear_cache:
	ret
	.size	clear_cache, .-clear_cache
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
