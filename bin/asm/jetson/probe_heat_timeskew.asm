	.arch armv8-a+fp+simd
	.file	"probe_heat_timeskew.c"
	.text
	.align	2
	.global	StencilProbeTimeskew
	.type	StencilProbeTimeskew, %function
StencilProbeTimeskew:
	sub	sp, sp, #368
	sub	w8, w4, #1
	cmp	w8, 1
	stp	x27, x28, [sp,64]
	stp	x19, x20, [sp]
	stp	x21, x22, [sp,16]
	stp	x23, x24, [sp,32]
	stp	x25, x26, [sp,48]
	str	w8, [sp,292]
	str	x0, [sp,312]
	str	x1, [sp,344]
	str	w5, [sp,276]
	str	w6, [sp,280]
	str	w7, [sp,284]
	stp	d8, d9, [sp,80]
	stp	d10, d11, [sp,96]
	stp	d12, d13, [sp,112]
	stp	d14, d15, [sp,128]
	mov	w27, w2
	fmov	s31, w3
	ldr	d14, [x0]
	ble	.L1
	sxtw	x0, w2
	sub	w4, w4, w7
	fmov	d3, d14
	sub	w2, w3, w6
	sub	w4, w4, #1
	sub	w3, w3, #1
	sub	w1, w27, w5
	str	w3, [sp,296]
	str	w4, [sp,336]
	sub	w21, w27, #1
	add	w3, w7, 1
	lsl	x28, x0, 3
	mov	w4, 1
	neg	x0, x0, lsl 3
	sub	w2, w2, #1
	sub	w1, w1, #1
	str	w21, [sp,300]
	str	w3, [sp,244]
	str	x0, [sp,144]
	str	w4, [sp,240]
	str	w2, [sp,360]
	str	w1, [sp,364]
	fmov	d12, 6.0e+0
	fmov	v13.2d, 6.0e+0
.L29:
	ldr	w5, [sp,240]
	ldr	w6, [sp,336]
	cmp	w5, 1
	ldr	w8, [sp,296]
	cset	w0, ne
	cmp	w5, w6
	csetm	w7, ne
	cmp	w8, 1
	str	w7, [sp,328]
	ble	.L38
	ldr	w2, [sp,280]
	ldr	w1, [sp,244]
	add	w2, w2, 1
	mov	w3, 1
	neg	w0, w0
	str	w1, [sp,320]
	str	w2, [sp,248]
	str	w3, [sp,236]
	str	w0, [sp,356]
.L27:
	ldr	w4, [sp,236]
	ldr	w5, [sp,360]
	cmp	w4, 1
	ldr	w7, [sp,300]
	cset	w0, ne
	cmp	w5, w4
	csetm	w6, ne
	cmp	w7, 1
	str	w6, [sp,324]
	ble	.L39
	ldr	w1, [sp,276]
	ldr	w21, [sp,248]
	add	w1, w1, 1
	mov	w2, 1
	neg	w0, w0
	mov	w26, w27
	str	w21, [sp,308]
	str	w1, [sp,228]
	str	w2, [sp,232]
	str	w0, [sp,352]
	mov	x27, x28
.L26:
	ldr	w3, [sp,232]
	ldr	w4, [sp,364]
	cmp	w3, 1
	ldr	w6, [sp,368]
	cset	w0, ne
	cmp	w4, w3
	csetm	w5, ne
	cmp	w6, wzr
	str	w5, [sp,332]
	ble	.L40
	neg	w0, w0
	ldr	w8, [sp,228]
	str	w0, [sp,340]
	ldr	w21, [sp,244]
	ldr	w0, [sp,248]
	ldr	w1, [sp,240]
	ldr	w2, [sp,236]
	ldr	w3, [sp,232]
	ldr	d30, [sp,344]
	ldr	x23, [sp,312]
	str	w8, [sp,304]
	str	w21, [sp,256]
	str	w0, [sp,264]
	str	w8, [sp,268]
	str	w1, [sp,260]
	str	w2, [sp,272]
	str	w3, [sp,252]
	str	wzr, [sp,288]
.L25:
	ldr	w4, [sp,252]
	ldr	w5, [sp,272]
	cmp	w4, wzr
	ldr	w6, [sp,260]
	csinc	w4, w4, wzr, gt
	ldr	w7, [sp,268]
	cmp	w5, wzr
	csinc	w5, w5, wzr, gt
	ldr	w8, [sp,264]
	cmp	w6, wzr
	csinc	w0, w6, wzr, gt
	ldr	w21, [sp,256]
	cmp	w7, wzr
	csinc	w7, w7, wzr, gt
	cmp	w8, wzr
	csinc	w8, w8, wzr, gt
	cmp	w21, wzr
	csinc	w1, w21, wzr, gt
	cmp	w0, w1
	str	w1, [sp,188]
	fmov	s22, w4
	fmov	s15, w5
	fmov	s5, w7
	fmov	s6, w8
	bge	.L9
	sub	w7, w7, w4
	fmov	w3, s31
	sxtw	x2, w4
	add	w4, w0, 1
	fmov	s29, w7
	lsr	w20, w7, 1
	fmov	w7, s5
	fmov	w6, s22
	fmov	s18, w4
	mul	w3, w0, w3
	lsl	w4, w20, 1
	sub	w1, w7, #1
	fmov	s17, w3
	sub	w5, w0, #1
	fmov	w21, s15
	sub	w0, w6, #1
	fmov	s7, w4
	fmov	w7, s31
	sub	w4, w1, w6
	add	w1, w6, 1
	fmov	w6, s18
	fmov	w8, s15
	fmov	d4, x2
	neg	x3, x2, lsl 3
	mul	w6, w6, w7
	sub	w2, w21, #1
	mul	w7, w5, w7
	fmov	w21, s17
	str	w6, [sp,184]
	str	w7, [sp,164]
	fmov	w6, s7
	fmov	w7, s22
	add	w8, w8, 1
	add	w21, w8, w21
	add	x1, x3, x1, sxtw 3
	add	x0, x3, x0, lsl 3
	str	w21, [sp,156]
	fmov	w5, s17
	str	x1, [sp,168]
	str	x0, [sp,176]
	add	w7, w7, w6
	fmov	x21, d4
	fmov	x0, d4
	fmov	x1, d4
	fmov	s8, s22
	fmov	s16, w7
	fmov	s22, s29
	str	w8, [sp,224]
	add	w5, w2, w5
	add	x8, x23, 8
	add	x21, x21, x4
	add	x0, x0, 2
	add	x1, x1, 1
	str	w5, [sp,160]
	str	x8, [sp,192]
	str	x21, [sp,200]
	str	x0, [sp,208]
	str	x1, [sp,216]
.L10:
	fmov	w4, s15
	fmov	w5, s6
	fmov	s29, s18
	cmp	w4, w5
	bge	.L17
	ldr	w8, [sp,184]
	ldr	w21, [sp,164]
	add	w0, w4, w8
	fmov	w6, s17
	mul	w0, w26, w0
	ldr	w8, [sp,156]
	ldr	x7, [sp,216]
	fmov	s11, w0
	add	w0, w4, w21
	fmov	x21, d4
	mul	w0, w26, w0
	add	w1, w4, w6
	mul	w8, w26, w8
	mul	w1, w26, w1
	fmov	s21, w0
	add	x9, x21, x0, sxtw
	ldr	w0, [sp,160]
	sxtw	x3, w1
	fmov	s14, w1
	mul	w0, w26, w0
	fmov	w1, s11
	fmov	x2, d4
	add	x15, x3, x7
	fmov	s10, w8
	ldr	x4, [sp,200]
	add	x7, x21, x0, sxtw
	fmov	s9, w0
	fmov	w0, s11
	sxtw	x14, w1
	add	x16, x14, x4
	ldr	x6, [sp,208]
	fmov	x4, d30
	add	x5, x2, x3
	lsl	x5, x5, 3
	add	x10, x2, x14
	fmov	s11, s6
	add	x2, x3, x6
	fmov	s19, s10
	ldr	x6, [sp,192]
	fmov	s10, s5
	fmov	s29, s18
	fmov	s5, s14
	fmov	s23, s8
	fmov	s14, s21
	fmov	s24, s22
	fmov	s21, s7
	fmov	s6, w0
	sub	x17, x5, #8
	ldr	w18, [sp,224]
	add	x8, x21, x8, sxtw
	add	x1, x4, x5
	add	x16, x6, x16, lsl 3
	add	x10, x23, x10, lsl 3
	neg	x14, x14, lsl 3
	lsl	x3, x3, 3
	add	x2, x4, x2, lsl 3
	add	x9, x23, x9, lsl 3
	add	x8, x23, x8, lsl 3
	add	x7, x23, x7, lsl 3
	add	x5, x23, x5
	add	x15, x23, x15, lsl 3
	add	x17, x23, x17
	mov	w6, 0
	mov	x19, 0
.L24:
	fmov	w0, s23
	fmov	w4, s10
	mov	w12, w18
	cmp	w0, w4
	bge	.L19
	fmov	w21, s24
	cmp	x1, x15
	cset	w28, cs
	cmp	x2, x17
	cset	w13, ls
	add	x0, x5, 16
	cmp	w21, 3
	cset	w24, hi
	cmp	x1, x0
	cset	w21, cs
	add	x0, x5, 24
	cmp	x2, x5
	cset	w4, ls
	cmp	x1, x0
	cset	w25, cs
	add	x0, x7, 16
	cmp	x2, x15
	cset	w11, ls
	cmp	x1, x0
	cset	w22, cs
	add	x0, x8, 16
	cmp	x2, x7
	cset	w12, ls
	orr	w28, w28, w13
	cmp	x1, x0
	cset	w13, cs
	and	w28, w24, w28
	cmp	x2, x8
	orr	w21, w21, w4
	add	x0, x9, 16
	cset	w4, ls
	and	w21, w28, w21
	cmp	x1, x0
	orr	w0, w25, w11
	and	w21, w21, w0
	cset	w11, cs
	orr	w12, w22, w12
	cmp	x9, x2
	and	w12, w21, w12
	cset	w0, cs
	orr	w4, w13, w4
	and	w4, w12, w4
	orr	w0, w11, w0
	tst	w4, w0
	fmov	w4, s6
	fmov	w0, s5
	fmov	w21, s14
	mov	w12, w18
	add	w4, w4, w6
	add	w13, w0, w6
	fmov	s1, w4
	fmov	w0, s19
	fmov	w4, s9
	add	w21, w21, w6
	fmul	d22, d3, d3
	fmov	s2, w21
	add	w28, w0, w6
	add	w25, w4, w6
	beq	.L22
	add	x0, x10, 16
	cmp	x1, x0
	cset	w4, cs
	cmp	x10, x2
	cset	w0, cs
	orr	w0, w4, w0
	cbz	w0, .L22
	fmov	w21, s21
	cbz	w21, .L30
	mov	x0, 0
	mov	x24, x17
	mov	x11, x15
	mov	w4, w0
	dup	v27.2d, v22.d[0]
.L11:
	add	x22, x10, x0
	add	x21, x9, x0
	add	w4, w4, 1
	ld1	{v28.2d}, [x22]
	ld1	{v0.2d}, [x21]
	add	x22, x8, x0
	add	x21, x7, x0
	cmp	w20, w4
	ld1	{v26.2d}, [x22]
	ld1	{v25.2d}, [x21]
	ld1	{v20.2d}, [x11],16
	ld1	{v8.2d}, [x24],16
	add	x22, x5, x0
	add	x21, x1, x0
	ld1	{v7.2d}, [x22]
	fadd	v0.2d, v28.2d, v0.2d
	fmul	v7.2d, v7.2d, v13.2d
	fadd	v0.2d, v0.2d, v26.2d
	fdiv	v7.2d, v7.2d, v27.2d
	fadd	v0.2d, v0.2d, v25.2d
	fadd	v0.2d, v0.2d, v20.2d
	fadd	v0.2d, v0.2d, v8.2d
	fsub	v0.2d, v0.2d, v7.2d
	st1	{v0.2d}, [x21]
	add	x0, x0, 16
	bhi	.L11
	fmov	w0, s21
	fmov	w4, s24
	cmp	w0, w4
	beq	.L19
	fmov	w0, s16
.L14:
	add	w4, w0, w13
	sbfiz	x24, x4, 3, 32
	fmov	w21, s1
	ldr	d0, [x23,x24]
	fmul	d7, d0, d12
	add	w11, w0, w21
	fmov	w21, s2
	ldr	d0, [x23,w11,sxtw 3]
	fdiv	d22, d7, d22
	add	w11, w0, w25
	add	w4, w0, w21
	ldr	d2, [x23,w4,sxtw 3]
	add	w4, w0, w28
	fadd	d0, d0, d2
	ldr	d2, [x23,w4,sxtw 3]
	add	w4, w0, 1
	add	w4, w4, w13
	fadd	d0, d0, d2
	ldr	d2, [x23,w11,sxtw 3]
	sub	w0, w0, #1
	add	w0, w0, w13
	fadd	d0, d0, d2
	ldr	d2, [x23,w4,sxtw 3]
	fadd	d0, d0, d2
	ldr	d2, [x23,w0,sxtw 3]
	fmov	x0, d30
	fadd	d0, d0, d2
	fsub	d22, d0, d22
	str	d22, [x0,x24]
.L19:
	fmov	w4, s11
	ldr	x21, [sp,144]
	add	w18, w18, 1
	add	x10, x10, x26, sxtw 3
	cmp	w4, w12
	add	x19, x19, x27
	add	x1, x1, x27
	add	x14, x14, x21
	add	x3, x3, x27
	add	x16, x16, x27
	add	x2, x2, x27
	add	x9, x9, x27
	add	x8, x8, x27
	add	x7, x7, x27
	add	x5, x5, x27
	add	x15, x15, x27
	add	x17, x17, x27
	add	w6, w6, w26
	bgt	.L24
	fmov	s7, s21
	fmov	s8, s23
	fmov	s5, s10
	fmov	s6, s11
	fmov	s22, s24
.L17:
	fmov	w8, s31
	fmov	w7, s18
	fmov	w0, s17
	fmov	w6, s29
	ldr	w21, [sp,184]
	ldr	w1, [sp,164]
	ldr	w2, [sp,156]
	ldr	w3, [sp,160]
	ldr	w5, [sp,188]
	add	w7, w7, 1
	add	w21, w21, w8
	add	w0, w0, w8
	add	w1, w1, w8
	add	w2, w2, w8
	add	w3, w3, w8
	cmp	w5, w6
	str	w21, [sp,184]
	str	w1, [sp,164]
	str	w2, [sp,156]
	str	w3, [sp,160]
	fmov	s18, w7
	fmov	s17, w0
	bgt	.L10
.L9:
	ldr	w7, [sp,288]
	ldr	w0, [sp,252]
	ldr	w21, [sp,340]
	ldr	w8, [sp,368]
	add	w7, w7, 1
	add	w0, w0, w21
	cmp	w7, w8
	ldr	w2, [sp,272]
	ldr	w4, [sp,260]
	ldr	w6, [sp,268]
	ldr	w8, [sp,264]
	str	w7, [sp,288]
	str	w0, [sp,252]
	ldr	w1, [sp,352]
	ldr	w0, [sp,256]
	ldr	w3, [sp,356]
	ldr	w5, [sp,332]
	ldr	w7, [sp,324]
	ldr	w21, [sp,328]
	add	w2, w2, w1
	add	w4, w4, w3
	add	w6, w6, w5
	add	w8, w8, w7
	add	w0, w0, w21
	str	w2, [sp,272]
	str	w4, [sp,260]
	str	w6, [sp,268]
	str	w8, [sp,264]
	str	w0, [sp,256]
	beq	.L8
	mov	x0, x23
	fmov	x23, d30
	fmov	d30, x0
	b	.L25
.L30:
	fmov	w0, s23
	b	.L14
.L22:
	ldr	x4, [sp,168]
	ldr	x21, [sp,176]
	add	x25, x4, x14
	fmov	w4, s14
	add	x24, x21, x14
	mov	x11, x1
	mov	x0, x10
	add	x22, x19, x4, sxtw 3
	fmov	w4, s19
	add	x21, x19, x4, sxtw 3
	fmov	w4, s9
	add	x13, x19, x4, sxtw 3
.L13:
	add	x4, x0, x14
	ldr	d1, [x0]
	ldr	d2, [x4,x3]
	ldr	d0, [x4,x22]
	fmul	d2, d2, d12
	fadd	d0, d1, d0
	ldr	d20, [x4,x21]
	ldr	d8, [x4,x13]
	fdiv	d7, d2, d22
	fadd	d2, d0, d20
	add	x28, x25, x0
	add	x4, x24, x0
	ldr	d20, [x28,x3]
	fadd	d2, d2, d8
	ldr	d8, [x4,x3]
	add	x0, x0, 8
	cmp	x0, x16
	fadd	d2, d2, d20
	fadd	d2, d2, d8
	fsub	d2, d2, d7
	str	d2, [x11],8
	bne	.L13
	b	.L19
.L40:
	ldr	w7, [sp,228]
	str	w7, [sp,304]
.L8:
	ldr	w4, [sp,232]
	ldr	w3, [sp,276]
	ldr	w5, [sp,228]
	ldr	w1, [sp,300]
	ldr	w2, [sp,304]
	add	w4, w4, w3
	add	w5, w5, w3
	cmp	w1, w2
	str	w4, [sp,232]
	str	w5, [sp,228]
	bgt	.L26
	mov	x28, x27
	mov	w27, w26
	b	.L6
.L38:
	ldr	w21, [sp,244]
	str	w21, [sp,320]
.L4:
	ldr	w7, [sp,240]
	ldr	w6, [sp,284]
	ldr	w8, [sp,244]
	ldr	w4, [sp,292]
	ldr	w5, [sp,320]
	add	w7, w7, w6
	add	w8, w8, w6
	cmp	w4, w5
	str	w7, [sp,240]
	str	w8, [sp,244]
	bgt	.L29
.L1:
	ldp	x19, x20, [sp]
	ldp	x21, x22, [sp,16]
	ldp	x23, x24, [sp,32]
	ldp	x25, x26, [sp,48]
	ldp	x27, x28, [sp,64]
	ldp	d8, d9, [sp,80]
	ldp	d10, d11, [sp,96]
	ldp	d12, d13, [sp,112]
	ldp	d14, d15, [sp,128]
	add	sp, sp, 368
	ret
.L39:
	ldr	w8, [sp,248]
	str	w8, [sp,308]
.L6:
	ldr	w21, [sp,236]
	ldr	w8, [sp,280]
	ldr	w0, [sp,248]
	ldr	w6, [sp,296]
	ldr	w7, [sp,308]
	add	w21, w21, w8
	add	w0, w0, w8
	cmp	w6, w7
	str	w21, [sp,236]
	str	w0, [sp,248]
	bgt	.L27
	b	.L4
	.size	StencilProbeTimeskew, .-StencilProbeTimeskew
	.ident	"GCC: (Ubuntu/Linaro 4.8.4-2ubuntu1~14.04.3) 4.8.4"
	.section	.note.GNU-stack,"",%progbits
