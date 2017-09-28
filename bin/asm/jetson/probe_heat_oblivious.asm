	.arch armv8-a+fp+simd
	.file	"probe_heat_oblivious.c"
	.text
	.align	2
	.global	walk3
	.type	walk3, %function
walk3:
	sub	sp, sp, #400
	stp	x29, x30, [sp,80]
	add	x29, sp, 80
	stp	x19, x20, [sp,96]
	ldr	w19, [x29,352]
	ldr	w20, [x29,384]
	stp	d8, d9, [sp,176]
	fmov	s9, w3
	stp	x21, x22, [sp,112]
	stp	x23, x24, [sp,128]
	stp	x27, x28, [sp,160]
	str	x0, [x29,224]
	fmov	s8, w1
	mov	w0, w19
	mov	w1, w20
	ldr	w21, [x29,320]
	ldr	w27, [x29,336]
	ldr	w8, [x29,344]
	ldr	w23, [x29,368]
	ldr	w28, [x29,376]
	stp	x25, x26, [sp,144]
	str	w5, [x29,220]
	str	w2, [x29,316]
	str	w7, [x29,216]
	sub	w25, w5, w4
	mov	w24, -1
	mov	w19, w4
	mov	w20, w6
	mov	w26, w1
	mov	w22, w0
	stp	d10, d11, [sp,192]
	stp	d12, d13, [sp,208]
	stp	d14, d15, [sp,224]
.L2:
	cmp	w25, 1
	beq	.L35
.L3:
	sub	w0, w22, w27
	sub	w2, w21, w20
	sub	w1, w26, w23
	mul	w2, w2, w0
	mul	w2, w2, w1
	cmp	w2, 4095
	ble	.L35
	cmp	w25, 1
	ble	.L1
	ldr	w10, [x29,392]
	lsl	w2, w25, 2
	sub	w3, w10, w28
	mul	w3, w3, w25
	add	w1, w3, w1, lsl 1
	cmp	w1, w2
	bge	.L37
	ldr	w10, [x29,360]
	sub	w1, w10, w8
	mul	w1, w1, w25
	add	w0, w1, w0, lsl 1
	cmp	w2, w0
	bgt	.L26
	add	w0, w8, 2
	add	w0, w0, w10
	add	w1, w27, w22
	mul	w0, w0, w25
	str	w27, [sp,16]
	add	w0, w0, w1, lsl 1
	cmp	w0, wzr
	add	w27, w0, 3
	fmov	w1, s8
	fmov	w3, s9
	csel	w27, w27, w0, lt
	ldr	w14, [x29,328]
	ldr	w16, [x29,392]
	ldr	x0, [x29,224]
	ldr	w2, [x29,316]
	ldr	w5, [x29,220]
	ldr	w7, [x29,216]
	str	w8, [sp,24]
	asr	w27, w27, 2
	str	w21, [sp]
	str	w14, [sp,8]
	str	w27, [sp,32]
	str	w24, [sp,40]
	str	w23, [sp,48]
	str	w28, [sp,56]
	str	w26, [sp,64]
	str	w16, [sp,72]
	mov	w4, w19
	mov	w6, w20
	bl	walk3
	cmp	w25, 1
	mov	w8, -1
	bne	.L3
.L35:
	str	w8, [x29,344]
	ldr	x8, [x29,224]
	mov	w0, w22
	ldr	w10, [x29,220]
	mov	w22, w19
	mov	w19, w0
	ldr	x0, [x8]
	str	w28, [x29,376]
	str	w27, [x29,336]
	str	w23, [x29,368]
	cmp	w10, w22
	mov	w1, w26
	fmov	w28, s8
	mov	w26, w20
	ldr	d13, [x0]
	mov	w20, w1
	ble	.L1
	ldr	w16, [x29,368]
	ldr	w14, [x29,368]
	ldr	w8, [x29,316]
	add	w14, w14, 1
	sub	w1, w16, #1
	str	w14, [x29,192]
	ldr	w2, [x29,376]
	mul	w10, w16, w8
	mul	w1, w8, w1
	ldr	w14, [x29,336]
	ldr	w16, [x29,192]
	mul	w2, w2, w8
	str	w1, [x29,168]
	ldr	w1, [x29,344]
	add	w14, w14, 1
	mul	w16, w16, w8
	sxtw	x0, w28
	add	w1, w1, w2
	str	w2, [x29,184]
	str	w10, [x29,196]
	add	w2, w14, w10
	ldr	w8, [x29,328]
	ldr	w10, [x29,216]
	str	w14, [x29,200]
	sub	w8, w8, w10
	neg	x14, x0, lsl 3
	sub	w10, w21, w26
	str	wzr, [x29,232]
	fmov	s30, w21
	fmov	s28, w19
	fmov	s24, w10
	fmov	d31, x14
	str	w16, [x29,172]
	ldr	w16, [x29,232]
	add	w22, w22, 1
	mov	w27, w26
	str	w20, [x29,244]
	str	w22, [x29,236]
	str	w1, [x29,176]
	str	w2, [x29,208]
	str	w8, [x29,180]
	lsl	x24, x0, 3
	str	w16, [x29,212]
	str	w16, [x29,204]
	fmov	d11, 6.0e+0
	fmov	v12.2d, 6.0e+0
.L23:
	ldr	w4, [x29,368]
	ldr	w1, [x29,204]
	ldr	w5, [x29,244]
	add	w0, w4, w1
	cmp	w5, w0
	ldr	w6, [x29,236]
	sub	w0, w6, #1
	ble	.L38
	add	w1, w27, 1
	fmov	w8, s24
	sxtw	x14, w1
	ldr	w10, [x29,236]
	sxtw	x7, w27
	lsr	w25, w8, 1
	ldr	w5, [x29,232]
	neg	x14, x14, lsl 3
	ldr	w4, [x29,336]
	lsr	w3, w10, 31
	lsl	w16, w25, 1
	fmov	d20, x7
	add	x7, x14, x7, lsl 3
	ldr	w8, [x29,212]
	add	w4, w5, w4
	add	w1, w10, w3
	str	w10, [x29,188]
	str	x7, [x29,256]
	ldr	w10, [x29,172]
	ldr	w7, [x29,168]
	fmov	s6, w16
	str	w4, [x29,312]
	ldr	w4, [x29,196]
	lsr	w2, w0, 31
	add	w7, w8, w7
	add	w10, w8, w10
	ldr	w6, [x29,208]
	add	w0, w0, w2
	add	w16, w16, w27
	add	w4, w4, w8
	str	w7, [x29,300]
	ldr	w8, [x29,232]
	str	w10, [x29,292]
	ldr	w7, [x29,200]
	fmov	w10, s24
	sub	w6, w6, #2
	str	w16, [x29,308]
	and	w1, w1, 1
	ldr	w16, [x29,208]
	and	w0, w0, 1
	add	w7, w8, w7
	sub	w0, w0, w2
	str	w6, [x29,284]
	str	w16, [x29,296]
	ldr	w6, [x29,192]
	ldr	w5, [x29,204]
	sub	w1, w1, w3
	ldr	x16, [x29,224]
	ldr	x8, [x29,224]
	add	x16, x16, x1, sxtw 3
	add	x8, x8, x0, sxtw 3
	fmov	d19, x16
	fmov	d18, x8
	fmov	s7, s6
	sub	w19, w27, #1
	sub	w2, w10, #1
	add	w5, w6, w5
	mov	x10, 8
	str	w4, [x29,288]
	add	x2, x10, x2, uxtw 3
	str	w5, [x29,304]
	str	w7, [x29,240]
	str	x2, [x29,248]
	mov	w21, w25
	mov	w20, w19
	mov	w17, w28
.L22:
	fmov	w16, s28
	ldr	w0, [x29,312]
	cmp	w16, w0
	ble	.L39
	ldr	w4, [x29,292]
	ldr	w2, [x29,312]
	ldr	w7, [x29,288]
	ldr	w6, [x29,312]
	ldr	w8, [x29,296]
	ldr	w10, [x29,284]
	add	w3, w4, w2
	ldr	w5, [x29,300]
	add	w4, w7, w6
	fmov	x16, d20
	mul	w1, w17, w8
	mul	w0, w17, w10
	mul	w4, w17, w4
	add	w2, w5, w2
	mul	w3, w17, w3
	mul	w2, w17, w2
	sxtw	x28, w1
	sxtw	x25, w0
	sxtw	x5, w4
	sub	x9, x28, x16
	sub	x8, x25, x16
	sub	x9, x9, x5
	sub	x8, x8, x5
	sxtw	x19, w3
	sxtw	x26, w2
	sub	w1, w1, w4
	sub	w0, w0, w4
	sub	w3, w3, w4
	sub	w2, w2, w4
	lsl	x9, x9, 3
	lsl	x8, x8, 3
	sub	x7, x19, x16
	sub	x6, x26, x16
	add	x19, x16, x19
	add	x26, x16, x26
	fmov	s9, s7
	fmov	s21, w1
	fmov	s17, w0
	fmov	s16, w3
	fmov	s6, w2
	fmov	d23, x9
	fmov	d22, x8
	fmov	d7, d19
	fmov	d8, d18
	fmov	d15, x14
	neg	x18, x5, lsl 3
	lsl	x26, x26, 3
	add	x12, x16, x5
	add	x28, x16, x28
	add	x25, x16, x25
	sub	x7, x7, x5
	sub	x6, x6, x5
	ldr	w10, [x29,304]
	lsl	x19, x19, 3
	ldr	w23, [x29,240]
	lsl	x7, x7, 3
	lsl	x6, x6, 3
	fmov	s14, w20
	str	w10, [x29,280]
	mov	x20, x18
	lsl	x12, x12, 3
	mov	w18, w17
	lsl	x28, x28, 3
	mov	x17, x26
	lsl	x25, x25, 3
	str	x7, [x29,272]
	str	x6, [x29,264]
	mov	x26, x19
.L21:
	fmov	w14, s30
	mov	w22, w23
	cmp	w27, w14
	bge	.L13
	fmov	x16, d8
	fmov	x0, d7
	fmov	w8, s24
	ldr	x2, [x16]
	ldr	x15, [x0]
	add	x5, x2, x12
	add	x1, x15, x12
	add	x3, x5, 16
	cmp	x1, x3
	cset	w3, cs
	add	x0, x1, 16
	add	x9, x2, x17
	fmov	s4, w3
	cmp	x5, x0
	add	x3, x9, 16
	cset	w13, cs
	cmp	x1, x3
	cset	w7, cs
	cmp	x0, x9
	add	x10, x2, x26
	cset	w6, ls
	cmp	w8, 3
	cset	w14, hi
	add	x3, x10, 16
	cmp	x1, x3
	add	x11, x2, x25
	fmov	s5, w14
	cset	w16, cs
	fmov	w14, s4
	add	x3, x11, 16
	cmp	x0, x10
	add	x8, x2, x28
	cset	w19, ls
	cmp	x1, x3
	add	x3, x8, 16
	orr	w13, w14, w13
	fmov	d2, x3
	orr	w6, w7, w6
	and	w6, w13, w6
	fmov	s3, w16
	fmov	s4, w6
	fmov	x16, d2
	cset	w22, cs
	cmp	x0, x11
	cset	w3, ls
	fmov	w14, s5
	cmp	x1, x16
	fmov	w16, s4
	cset	w7, cs
	orr	w22, w22, w3
	fmov	s2, w7
	and	w14, w14, w16
	cmp	x8, x0
	fmov	s4, w14
	fmov	w14, s3
	add	x7, x5, 8
	cset	w13, cs
	fmov	w16, s4
	orr	w14, w14, w19
	cmp	x1, x7
	sub	x6, x5, #8
	and	w16, w16, w14
	and	w22, w16, w22
	fmov	w14, s2
	fmov	w16, s21
	cset	w19, cs
	cmp	x6, x0
	cset	w3, cs
	orr	w13, w14, w13
	add	w16, w4, w16
	and	w13, w22, w13
	orr	w3, w19, w3
	tst	w13, w3
	fmov	s27, w16
	fmov	w3, s17
	fmov	w14, s16
	fmov	w16, s6
	mov	w22, w23
	add	w3, w4, w3
	add	w14, w4, w14
	add	w16, w4, w16
	fmov	s26, w3
	fmov	s25, w14
	fmov	s10, w16
	fmul	d5, d13, d13
	beq	.L14
	add	x3, x5, 24
	cmp	x1, x3
	cset	w3, cs
	cmp	x7, x0
	cset	w0, cs
	orr	w0, w3, w0
	cbz	w0, .L14
	fmov	w0, s9
	cbz	w0, .L27
	fmov	w16, s14
	fmov	x14, d15
	mov	x0, 0
	mov	w3, w0
	dup	v29.2d, v5.d[0]
.L18:
	add	x13, x5, x0
	add	w3, w3, 1
	ld1	{v1.2d}, [x13]
	add	x13, x11, x0
	add	x19, x8, x0
	ld1	{v4.2d}, [x13]
	cmp	w21, w3
	add	x13, x9, x0
	ld1	{v14.2d}, [x19]
	ld1	{v2.2d}, [x13]
	ld1	{v15.2d}, [x7],16
	ld1	{v0.2d}, [x6],16
	add	x19, x10, x0
	add	x13, x1, x0
	ld1	{v3.2d}, [x19]
	fneg	v1.2d, v1.2d
	fadd	v0.2d, v15.2d, v0.2d
	fadd	v0.2d, v0.2d, v14.2d
	fadd	v0.2d, v0.2d, v4.2d
	fadd	v0.2d, v0.2d, v3.2d
	fadd	v0.2d, v0.2d, v2.2d
	fmla	v0.2d, v1.2d, v12.2d
	fdiv	v0.2d, v0.2d, v29.2d
	st1	{v0.2d}, [x13]
	add	x0, x0, 16
	bhi	.L18
	fmov	w1, s9
	fmov	w3, s24
	fmov	s14, w16
	fmov	d15, x14
	cmp	w1, w3
	beq	.L13
	ldr	w8, [x29,308]
.L15:
	sub	w6, w8, #1
	add	w6, w6, w4
	add	w7, w8, 1
	ldr	d0, [x2,w6,sxtw 3]
	add	w7, w7, w4
	fmov	w6, s27
	ldr	d1, [x2,w7,sxtw 3]
	fmov	w7, s26
	fadd	d0, d1, d0
	add	w5, w8, w6
	fmov	w10, s25
	ldr	d1, [x2,w5,sxtw 3]
	add	w3, w8, w7
	fadd	d0, d0, d1
	ldr	d2, [x2,w3,sxtw 3]
	add	w1, w8, w10
	fmov	w14, s10
	fadd	d0, d0, d2
	ldr	d1, [x2,w1,sxtw 3]
	add	w0, w8, w14
	fadd	d0, d0, d1
	ldr	d2, [x2,w0,sxtw 3]
	add	w8, w4, w8
	sbfiz	x8, x8, 3, 32
	fadd	d0, d0, d2
	ldr	d1, [x2,x8]
	fmsub	d0, d1, d11, d0
	fdiv	d5, d0, d5
	str	d5, [x15,x8]
.L13:
	fmov	w0, s28
	fmov	x1, d31
	add	w23, w23, 1
	add	x12, x12, x18, sxtw 3
	cmp	w0, w22
	add	x20, x20, x1
	add	x28, x28, x24
	add	x25, x25, x24
	add	x26, x26, x24
	add	x17, x17, x24
	add	w4, w4, w18
	bgt	.L21
	fmov	d19, d7
	fmov	w20, s14
	fmov	s7, s9
	fmov	d18, d8
	fmov	x14, d15
	mov	w17, w18
.L11:
	ldr	w2, [x29,244]
	ldr	w3, [x29,280]
	ldr	w8, [x29,316]
	ldr	w4, [x29,304]
	ldr	w10, [x29,288]
	ldr	w16, [x29,296]
	ldr	w0, [x29,284]
	ldr	w1, [x29,292]
	cmp	w2, w3
	ldr	w2, [x29,300]
	add	w4, w4, 1
	add	w10, w10, w8
	add	w16, w16, w8
	add	w0, w0, w8
	add	w1, w1, w8
	add	w2, w2, w8
	str	w4, [x29,304]
	str	w10, [x29,288]
	str	w16, [x29,296]
	str	w0, [x29,284]
	str	w1, [x29,292]
	str	w2, [x29,300]
	bgt	.L22
	mov	w28, w17
.L9:
	ldr	w8, [x29,220]
	ldr	w10, [x29,188]
	ldr	w16, [x29,244]
	ldr	w14, [x29,392]
	cmp	w8, w10
	fmov	w10, s28
	add	w16, w16, w14
	ldr	w8, [x29,360]
	ldr	w14, [x29,184]
	ldr	w1, [x29,208]
	ldr	w0, [x29,176]
	str	w16, [x29,244]
	ldr	w16, [x29,212]
	ldr	w5, [x29,204]
	ldr	w4, [x29,376]
	add	w10, w10, w8
	add	w16, w16, w14
	add	w1, w1, w0
	fmov	w14, s30
	fmov	w0, s24
	add	w5, w5, w4
	ldr	w6, [x29,236]
	str	w5, [x29,204]
	fmov	s28, w10
	ldr	w5, [x29,232]
	str	w16, [x29,212]
	ldr	w4, [x29,344]
	ldr	w10, [x29,328]
	ldr	w16, [x29,180]
	add	w6, w6, 1
	add	w5, w5, w4
	ldr	w8, [x29,216]
	add	w14, w14, w10
	add	w0, w0, w16
	str	w6, [x29,236]
	str	w1, [x29,208]
	str	w5, [x29,232]
	add	w27, w27, w8
	fmov	s30, w14
	fmov	s24, w0
	bgt	.L23
.L1:
	sub	sp, x29, #80
	ldp	d8, d9, [sp,176]
	ldp	d10, d11, [sp,192]
	ldp	x19, x20, [sp,96]
	ldp	x21, x22, [sp,112]
	ldp	x23, x24, [sp,128]
	ldp	x25, x26, [sp,144]
	ldp	x27, x28, [sp,160]
	ldp	d12, d13, [sp,208]
	ldp	d14, d15, [sp,224]
	ldp	x29, x30, [sp,80]
	add	sp, sp, 400
	ret
.L26:
	asr	w25, w25, 1
	fmov	w1, s8
	fmov	w3, s9
	add	w13, w19, w25
	ldr	w10, [x29,328]
	ldr	w14, [x29,360]
	ldr	w16, [x29,392]
	ldr	x0, [x29,224]
	ldr	w2, [x29,316]
	ldr	w7, [x29,216]
	mov	w4, w19
	str	w21, [sp]
	str	w27, [sp,16]
	str	w22, [sp,32]
	str	w23, [sp,48]
	str	w26, [sp,64]
	mov	w6, w20
	str	w10, [sp,8]
	str	w8, [sp,24]
	str	w14, [sp,40]
	str	w16, [sp,72]
	str	w28, [sp,56]
	mov	w5, w13
	mov	w19, w13
	str	x8, [x29,160]
	bl	walk3
	ldr	w10, [x29,216]
	ldr	w14, [x29,328]
	ldr	x8, [x29,160]
	mul	w4, w25, w10
	ldr	w16, [x29,360]
	ldr	w10, [x29,392]
	mul	w3, w25, w14
	mul	w2, w8, w25
	mul	w1, w25, w16
	mul	w0, w28, w25
	ldr	w14, [x29,220]
	mul	w25, w25, w10
	add	w20, w20, w4
	add	w26, w26, w25
	add	w21, w21, w3
	add	w27, w27, w2
	add	w22, w22, w1
	add	w23, w23, w0
	sub	w25, w14, w19
	b	.L2
.L37:
	add	w0, w28, 2
	add	w0, w0, w10
	add	w1, w23, w26
	mul	w0, w0, w25
	str	w23, [sp,48]
	add	w0, w0, w1, lsl 1
	cmp	w0, wzr
	add	w23, w0, 3
	fmov	w1, s8
	fmov	w3, s9
	csel	w23, w23, w0, lt
	ldr	w14, [x29,328]
	ldr	w16, [x29,360]
	ldr	x0, [x29,224]
	ldr	w2, [x29,316]
	ldr	w5, [x29,220]
	ldr	w7, [x29,216]
	str	w28, [sp,56]
	str	w8, [sp,24]
	asr	w23, w23, 2
	str	w21, [sp]
	str	w14, [sp,8]
	str	w27, [sp,16]
	str	w22, [sp,32]
	str	w16, [sp,40]
	str	w23, [sp,64]
	str	w24, [sp,72]
	mov	w4, w19
	mov	w6, w20
	str	x8, [x29,160]
	bl	walk3
	mov	w28, -1
	ldr	x8, [x29,160]
	b	.L2
.L27:
	mov	w8, w27
	b	.L15
.L14:
	ldr	x16, [x29,248]
	add	x5, x2, 8
	add	x3, x12, 8
	add	x0, x16, x12
	ldr	x6, [x29,272]
	ldr	x14, [x29,264]
	ldr	x16, [x29,256]
	add	x2, x2, x3
	add	x0, x5, x0
	fmov	x3, d23
	fmov	x5, d22
	add	x8, x12, x6
	add	x7, x12, x14
	add	x6, x16, x20
	fmov	x14, d15
	fmov	w16, s14
	add	x10, x12, x3
	add	x9, x12, x5
.L20:
	add	x3, x6, x2
	add	x5, x2, x27, sxtw 3
	add	x11, x2, x16, sxtw 3
	ldr	d2, [x2],8
	ldr	d0, [x11,x14]
	ldr	d1, [x3,x10]
	fadd	d0, d2, d0
	ldr	d4, [x3,x9]
	ldr	d3, [x3,x8]
	ldr	d2, [x3,x7]
	fadd	d0, d0, d1
	ldr	d1, [x5,x14]
	cmp	x2, x0
	fadd	d0, d0, d4
	fadd	d0, d0, d3
	fadd	d0, d0, d2
	fmsub	d0, d1, d11, d0
	fdiv	d0, d0, d5
	str	d0, [x1],8
	bne	.L20
	fmov	s14, w16
	fmov	d15, x14
	b	.L13
.L39:
	ldr	w1, [x29,304]
	str	w1, [x29,280]
	b	.L11
.L38:
	str	w6, [x29,188]
	b	.L9
	.size	walk3, .-walk3
	.align	2
	.global	StencilProbeOblivious
	.type	StencilProbeOblivious, %function
StencilProbeOblivious:
	sub	sp, sp, #112
	mov	w7, w3
	mov	w3, w4
	stp	x29, x30, [sp,80]
	add	x29, sp, 80
	mov	w4, 0
	ldr	w5, [x29,32]
	str	x0, [x29,16]
	str	x1, [x29,24]
	sub	w0, w3, #1
	sub	w1, w7, #1
	mov	w6, 1
	sub	w8, w2, #1
	str	w4, [sp,8]
	str	w8, [sp]
	str	w6, [sp,16]
	str	w4, [sp,24]
	str	w1, [sp,32]
	str	w4, [sp,40]
	str	w6, [sp,48]
	str	w4, [sp,56]
	str	w0, [sp,64]
	str	w4, [sp,72]
	add	x0, x29, 16
	mov	w1, w2
	mov	w2, w7
	mov	w7, w4
	bl	walk3
	sub	sp, x29, #80
	ldp	x29, x30, [sp,80]
	add	sp, sp, 112
	ret
	.size	StencilProbeOblivious, .-StencilProbeOblivious
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
