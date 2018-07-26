	.arch armv4t
	.eabi_attribute 27, 3
	.fpu neon
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 2
	.eabi_attribute 30, 2
	.eabi_attribute 18, 4
	.file	"colourconversion_basic.c"
	.text
	.align	2
	.global	RGBtoYCC
	.type	RGBtoYCC, %function
RGBtoYCC:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 48
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	sub	sp, sp, #48
	str	r0, [sp, #12]
	mov	r0, #0
	str	r1, [sp, #16]
	str	r2, [sp, #20]
	str	r3, [sp, #24]
	str	r0, [sp, #0]
.L2:
	ldr	r1, [sp, #12]
	ldr	r2, [sp, #20]
	ldrb	r8, [r1, #0]	@ zero_extendqisi2
	ldrb	sl, [r2, #0]	@ zero_extendqisi2
	mov	r3, r8, asl #16
	mov	r2, r8, asl #11
	add	r2, r2, r3
	ldr	r3, [sp, #16]
	mov	r9, r8, asl #8
	ldrb	ip, [r3, #0]	@ zero_extendqisi2
	mov	r1, sl, asl #11
	mov	r3, sl, asl #13
	rsb	r2, r9, r2
	add	r1, r1, r3
	mov	r0, ip, asl #13
	mov	r3, ip, asl #20
	mov	r2, r2, asl #2
	mov	fp, ip, asl #8
	add	r0, r0, r3
	add	r2, r2, r9
	mov	r4, r1, asl #2
	add	r0, r0, fp
	mov	r2, r2, asl #2
	mov	r5, sl, asl #8
	add	r1, r1, r4
	rsb	r2, r9, r2
	mov	r0, r0, asl #2
	add	r1, r1, r5
	rsb	r0, fp, r0
	mov	r2, r2, asl #2
	str	r5, [sp, #36]
	rsb	r2, r9, r2
	mov	r1, r1, asl #2
	mov	r0, r0, asl #1
	mov	r3, ip, asl #14
	mov	r6, ip, asl #10
	rsb	r1, r5, r1
	add	r0, r0, r2
	ldr	r2, [sp, #36]
	add	r6, r6, r3
	mov	r7, r8, asl #18
	mov	r1, r1, asl #3
	rsb	r6, fp, r6
	mov	r3, sl, asl #12
	rsb	r1, r2, r1
	mov	r5, sl, asl #10
	sub	r7, r7, r8, asl #14
	add	r5, r5, r3
	rsb	r7, r9, r7
	mov	r4, r6, asl #4
	add	r0, r0, r1
	rsb	r4, r6, r4
	mov	r1, r5, asl #3
	mov	r3, r7, asl #4
	mov	r0, r0, lsr #16
	mov	r2, r8, asl #15
	rsb	r1, r5, r1
	rsb	r3, r7, r3
	ldr	r5, [sp, #36]
	ldr	r7, [sp, #24]
	mov	r4, r4, asl #3
	add	r0, r0, #4224
	rsb	r4, fp, r4
	sub	r2, r2, r8, asl #13
	mov	r0, r0, lsr #8
	strb	r0, [r7, #0]
	add	r1, r1, r5
	add	r2, r2, r9
	mov	r6, ip, asl #16
	mov	r5, r4, asl #2
	mov	ip, ip, asl #11
	ldr	r0, [sp, #0]
	rsb	r5, r4, r5
	add	ip, ip, r6
	mov	r4, r2, asl #2
	mov	r6, r1, asl #5
	mov	r3, r3, asl #1
	add	r2, r2, r4
	add	r1, r1, r6
	rsb	r3, r5, r3
	add	ip, ip, fp
	rsb	r3, r1, r3
	mov	r0, r0, asr #1
	mov	r1, r2, asl #2
	str	r0, [sp, #32]
	add	r2, r2, r1
	mov	ip, ip, asl #3
	ldr	r1, [sp, #80]
	rsb	ip, fp, ip
	ldrb	r0, [r1, r0, asl #1]	@ zero_extendqisi2
	ldr	r5, [sp, #36]
	mov	r4, sl, asl #18
	mov	r1, ip, asl #3
	mov	r3, r3, lsr #16
	ldr	r7, [sp, #32]
	sub	r4, r4, sl, asl #14
	add	r3, r3, #33280
	add	ip, ip, r1
	ldr	r1, [sp, #80]
	rsb	r4, r5, r4
	add	r0, r0, r3, lsr #10
	mov	r2, r2, asl #2
	strb	r0, [r1, r7, asl #1]
	rsb	r2, r9, r2
	mov	r3, r4, asl #4
	rsb	r3, r4, r3
	add	ip, ip, r2
	ldr	r2, [sp, #84]
	sub	ip, ip, r3, asl #1
	mov	ip, ip, lsr #16
	ldrb	r3, [r2, r7, asl #1]	@ zero_extendqisi2
	rsb	ip, ip, #33280
	add	r3, r3, ip, lsr #10
	strb	r3, [r2, r7, asl #1]
	ldr	r3, [sp, #12]
	ldr	r5, [sp, #20]
	ldrb	r8, [r3, #1]	@ zero_extendqisi2
	ldr	r7, [sp, #16]
	ldrb	sl, [r5, #1]	@ zero_extendqisi2
	mov	r3, r8, asl #16
	mov	r2, r8, asl #11
	ldrb	ip, [r7, #1]	@ zero_extendqisi2
	mov	r9, r8, asl #8
	add	r2, r2, r3
	mov	r1, sl, asl #11
	mov	r3, sl, asl #13
	rsb	r2, r9, r2
	add	r1, r1, r3
	mov	r0, ip, asl #13
	mov	r3, ip, asl #20
	mov	r2, r2, asl #2
	mov	fp, ip, asl #8
	add	r0, r0, r3
	add	r2, r2, r9
	mov	r3, sl, asl #8
	mov	r4, r1, asl #2
	add	r0, r0, fp
	mov	r2, r2, asl #2
	str	r3, [sp, #40]
	add	r1, r1, r4
	rsb	r2, r9, r2
	mov	r0, r0, asl #2
	ldr	r5, [sp, #40]
	add	r1, r1, r3
	rsb	r0, fp, r0
	mov	r2, r2, asl #2
	mov	r3, ip, asl #14
	rsb	r2, r9, r2
	mov	r6, ip, asl #10
	mov	r1, r1, asl #2
	mov	r0, r0, asl #1
	add	r6, r6, r3
	rsb	r1, r5, r1
	add	r0, r0, r2
	ldr	r2, [sp, #40]
	rsb	r6, fp, r6
	mov	r3, sl, asl #12
	mov	r5, sl, asl #10
	mov	r1, r1, asl #3
	add	r5, r5, r3
	rsb	r1, r2, r1
	mov	r7, r8, asl #18
	mov	r4, r6, asl #4
	rsb	r4, r6, r4
	sub	r7, r7, r8, asl #14
	add	r0, r0, r1
	mov	r1, r5, asl #3
	rsb	r7, r9, r7
	mov	r2, r8, asl #15
	rsb	r1, r5, r1
	mov	r4, r4, asl #3
	ldr	r5, [sp, #40]
	rsb	r4, fp, r4
	sub	r2, r2, r8, asl #13
	mov	r3, r7, asl #4
	add	r1, r1, r5
	add	r2, r2, r9
	mov	r6, ip, asl #16
	rsb	r3, r7, r3
	mov	r5, r4, asl #2
	mov	ip, ip, asl #11
	rsb	r5, r4, r5
	add	ip, ip, r6
	mov	r4, r2, asl #2
	mov	r6, r1, asl #5
	mov	r0, r0, lsr #16
	mov	r3, r3, asl #1
	add	r2, r2, r4
	add	r1, r1, r6
	ldr	r7, [sp, #24]
	rsb	r3, r5, r3
	add	r0, r0, #4224
	mov	r0, r0, lsr #8
	add	ip, ip, fp
	rsb	r3, r1, r3
	mov	r1, r2, asl #2
	strb	r0, [r7, #1]
	add	r2, r2, r1
	ldr	r5, [sp, #80]
	ldr	r1, [sp, #32]
	mov	ip, ip, asl #3
	rsb	ip, fp, ip
	ldrb	r0, [r5, r1, asl #1]	@ zero_extendqisi2
	ldr	r7, [sp, #40]
	mov	r4, sl, asl #18
	mov	r1, ip, asl #3
	mov	r3, r3, lsr #16
	sub	r4, r4, sl, asl #14
	add	r3, r3, #33280
	add	ip, ip, r1
	ldr	r1, [sp, #32]
	rsb	r4, r7, r4
	add	r0, r0, r3, lsr #10
	mov	r2, r2, asl #2
	strb	r0, [r5, r1, asl #1]
	rsb	r2, r9, r2
	mov	r3, r4, asl #4
	rsb	r3, r4, r3
	add	ip, ip, r2
	ldr	r2, [sp, #84]
	sub	ip, ip, r3, asl #1
	mov	ip, ip, lsr #16
	ldrb	r3, [r2, r1, asl #1]	@ zero_extendqisi2
	rsb	ip, ip, #33280
	add	r3, r3, ip, lsr #10
	strb	r3, [r2, r1, asl #1]
	ldr	r3, [sp, #12]
	ldr	r5, [sp, #20]
	ldrb	r8, [r3, #2]	@ zero_extendqisi2
	ldr	r7, [sp, #16]
	ldrb	sl, [r5, #2]	@ zero_extendqisi2
	mov	r3, r8, asl #16
	mov	r2, r8, asl #11
	ldrb	ip, [r7, #2]	@ zero_extendqisi2
	mov	r9, r8, asl #8
	add	r2, r2, r3
	mov	r1, sl, asl #11
	mov	r3, sl, asl #13
	rsb	r2, r9, r2
	add	r1, r1, r3
	mov	r0, ip, asl #13
	mov	r3, ip, asl #20
	mov	r2, r2, asl #2
	mov	fp, ip, asl #8
	add	r0, r0, r3
	add	r2, r2, r9
	mov	r3, sl, asl #8
	mov	r4, r1, asl #2
	add	r0, r0, fp
	mov	r2, r2, asl #2
	str	r3, [sp, #44]
	add	r1, r1, r4
	rsb	r2, r9, r2
	mov	r0, r0, asl #2
	ldr	r5, [sp, #44]
	add	r1, r1, r3
	rsb	r0, fp, r0
	mov	r2, r2, asl #2
	mov	r3, ip, asl #14
	rsb	r2, r9, r2
	mov	r6, ip, asl #10
	mov	r1, r1, asl #2
	mov	r0, r0, asl #1
	add	r6, r6, r3
	rsb	r1, r5, r1
	add	r0, r0, r2
	ldr	r2, [sp, #44]
	rsb	r6, fp, r6
	mov	r3, sl, asl #12
	mov	r7, r8, asl #18
	mov	r5, sl, asl #10
	mov	r1, r1, asl #3
	add	r5, r5, r3
	rsb	r1, r2, r1
	mov	r4, r6, asl #4
	sub	r7, r7, r8, asl #14
	rsb	r7, r9, r7
	rsb	r4, r6, r4
	add	r0, r0, r1
	mov	r1, r5, asl #3
	rsb	r1, r5, r1
	mov	r3, r7, asl #4
	ldr	r5, [sp, #44]
	mov	r4, r4, asl #3
	mov	r0, r0, lsr #16
	rsb	r4, fp, r4
	rsb	r3, r7, r3
	add	r0, r0, #4224
	ldr	r7, [sp, #24]
	add	r1, r1, r5
	mov	r6, ip, asl #16
	mov	r5, r4, asl #2
	mov	r0, r0, lsr #8
	mov	ip, ip, asl #11
	strb	r0, [r7, #2]
	rsb	r5, r4, r5
	add	ip, ip, r6
	mov	r3, r3, asl #1
	mov	r6, r1, asl #5
	ldr	r0, [sp, #32]
	add	r1, r1, r6
	rsb	r3, r5, r3
	mov	r2, r8, asl #15
	rsb	r3, r1, r3
	ldr	r1, [sp, #80]
	mov	r5, r0, asl #1
	sub	r2, r2, r8, asl #13
	add	r2, r2, r9
	add	r1, r1, r5
	str	r1, [sp, #8]
	mov	r4, r2, asl #2
	ldr	r7, [sp, #8]
	add	r2, r2, r4
	add	ip, ip, fp
	mov	r1, r2, asl #2
	ldrb	r0, [r7, #1]	@ zero_extendqisi2
	mov	r4, sl, asl #18
	add	r2, r2, r1
	mov	ip, ip, asl #3
	ldr	r1, [sp, #44]
	mov	r3, r3, lsr #16
	rsb	ip, fp, ip
	sub	r4, r4, sl, asl #14
	add	r3, r3, #33280
	rsb	r4, r1, r4
	add	r0, r0, r3, lsr #10
	mov	r1, ip, asl #3
	mov	r2, r2, asl #2
	strb	r0, [r7, #1]
	rsb	r2, r9, r2
	add	ip, ip, r1
	add	ip, ip, r2
	ldr	r2, [sp, #84]
	mov	r3, r4, asl #4
	add	r5, r2, r5
	str	r5, [sp, #28]
	rsb	r3, r4, r3
	sub	ip, ip, r3, asl #1
	mov	ip, ip, lsr #16
	ldrb	r3, [r5, #1]	@ zero_extendqisi2
	rsb	ip, ip, #33280
	add	r3, r3, ip, lsr #10
	strb	r3, [r5, #1]
	ldr	r3, [sp, #12]
	ldr	r5, [sp, #20]
	ldrb	r8, [r3, #3]	@ zero_extendqisi2
	ldr	r7, [sp, #16]
	ldrb	sl, [r5, #3]	@ zero_extendqisi2
	mov	r3, r8, asl #16
	mov	r2, r8, asl #11
	ldrb	ip, [r7, #3]	@ zero_extendqisi2
	mov	r9, r8, asl #8
	add	r2, r2, r3
	mov	r1, sl, asl #11
	mov	r3, sl, asl #13
	rsb	r2, r9, r2
	add	r1, r1, r3
	mov	r0, ip, asl #13
	mov	r3, ip, asl #20
	mov	r2, r2, asl #2
	mov	fp, ip, asl #8
	add	r0, r0, r3
	add	r2, r2, r9
	mov	r4, r1, asl #2
	add	r0, r0, fp
	mov	r2, r2, asl #2
	mov	r3, sl, asl #8
	add	r1, r1, r4
	mov	r0, r0, asl #2
	rsb	r2, r9, r2
	str	r3, [sp, #4]
	add	r1, r1, r3
	ldr	r5, [sp, #4]
	rsb	r0, fp, r0
	mov	r2, r2, asl #2
	mov	r3, ip, asl #14
	mov	r6, ip, asl #10
	rsb	r2, r9, r2
	mov	r1, r1, asl #2
	mov	r0, r0, asl #1
	add	r6, r6, r3
	rsb	r1, r5, r1
	add	r0, r0, r2
	ldr	r2, [sp, #4]
	rsb	r6, fp, r6
	mov	r3, sl, asl #12
	mov	r1, r1, asl #3
	mov	r5, sl, asl #10
	add	r5, r5, r3
	rsb	r1, r2, r1
	mov	r4, r6, asl #4
	mov	r7, r8, asl #18
	rsb	r4, r6, r4
	add	r0, r0, r1
	sub	r7, r7, r8, asl #14
	mov	r1, r5, asl #3
	rsb	r7, r9, r7
	rsb	r1, r5, r1
	mov	r4, r4, asl #3
	ldr	r5, [sp, #4]
	mov	r2, r8, asl #15
	rsb	r4, fp, r4
	mov	r3, r7, asl #4
	sub	r2, r2, r8, asl #13
	add	r1, r1, r5
	mov	r6, ip, asl #16
	rsb	r3, r7, r3
	add	r2, r2, r9
	mov	r5, r4, asl #2
	mov	r0, r0, lsr #16
	mov	ip, ip, asl #11
	ldr	r7, [sp, #24]
	rsb	r5, r4, r5
	add	ip, ip, r6
	mov	r4, r2, asl #2
	add	r0, r0, #4224
	mov	r3, r3, asl #1
	mov	r6, r1, asl #5
	add	r2, r2, r4
	mov	r0, r0, lsr #8
	rsb	r3, r5, r3
	add	r1, r1, r6
	strb	r0, [r7, #3]
	rsb	r3, r1, r3
	mov	r1, r2, asl #2
	add	r2, r2, r1
	ldr	r1, [sp, #8]
	add	ip, ip, fp
	ldrb	r0, [r1, #1]	@ zero_extendqisi2
	ldr	r5, [sp, #4]
	mov	ip, ip, asl #3
	mov	r4, sl, asl #18
	mov	r3, r3, lsr #16
	ldr	r7, [sp, #8]
	rsb	ip, fp, ip
	add	r3, r3, #33280
	sub	r4, r4, sl, asl #14
	rsb	r4, r5, r4
	add	r0, r0, r3, lsr #10
	mov	r1, ip, asl #3
	mov	r2, r2, asl #2
	strb	r0, [r7, #1]
	add	ip, ip, r1
	rsb	r2, r9, r2
	mov	r3, r4, asl #4
	add	ip, ip, r2
	rsb	r3, r4, r3
	ldr	r0, [sp, #28]
	sub	ip, ip, r3, asl #1
	ldr	r1, [sp, #0]
	ldrb	r3, [r0, #1]	@ zero_extendqisi2
	mov	ip, ip, lsr #16
	rsb	ip, ip, #33280
	add	r1, r1, #1
	add	r3, r3, ip, lsr #10
	str	r1, [sp, #0]
	strb	r3, [r0, #1]
	add	r2, sp, #12
	ldmia	r2, {r2, r3, r5, r7}	@ phole ldm
	add	r2, r2, #4
	add	r3, r3, #4
	add	r5, r5, #4
	add	r7, r7, #4
	cmp	r1, #4
	str	r2, [sp, #12]
	str	r3, [sp, #16]
	str	r5, [sp, #20]
	str	r7, [sp, #24]
	bne	.L2
	add	sp, sp, #48
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
	.size	RGBtoYCC, .-RGBtoYCC
	.align	2
	.global	YCCtoRGB
	.type	YCCtoRGB, %function
YCCtoRGB:
	@ Function supports interworking.
	@ args = 8, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	mov	fp, r0
	sub	sp, sp, #24
	mov	r0, #0
	str	r2, [sp, #16]
	str	r1, [sp, #20]
	str	r0, [sp, #4]
	mov	r9, r3
.L7:
	ldr	r3, [sp, #4]
	mov	sl, r3, asr #1
	ldr	r3, [sp, #60]
	ldrb	r0, [r3, sl, asl #1]	@ zero_extendqisi2
	ldr	r3, [sp, #56]
	ldrb	r4, [r9, #0]	@ zero_extendqisi2
	ldrb	r7, [r3, sl, asl #1]	@ zero_extendqisi2
	mov	ip, r0, asl #14
	mov	r8, r0, asl #8
	mov	r3, r4, asl #16
	mov	r2, r4, asl #11
	sub	ip, ip, r0, asl #10
	mov	r6, r7, asl #12
	add	ip, ip, r8
	mov	r4, r4, asl #8
	add	r2, r2, r3
	mov	r5, r7, asl #15
	mov	r3, r7, asl #14
	rsb	r3, r6, r3
	add	r2, r2, r4
	rsb	r5, r6, r5
	mov	r6, ip, asl #3
	mov	r7, r7, asl #8
	rsb	r6, ip, r6
	mov	r2, r2, asl #3
	mov	ip, r0, asl #18
	mov	r0, r0, asl #11
	rsb	r5, r7, r5
	rsb	r2, r4, r2
	mov	r1, r3, asl #4
	add	r0, r0, ip
	add	r3, r3, r1
	mov	ip, r5, asl #4
	mov	r1, r2, asl #3
	add	r0, r0, r8
	add	r2, r2, r1
	add	r3, r3, r7
	rsb	ip, r5, ip
	mov	r0, r0, asl #2
	add	r1, r2, #-939524096
	sub	ip, r2, ip, asl #3
	add	r0, r0, r8
	mov	r3, r3, asl #3
	add	r2, r2, #-1174405120
	add	r3, r3, r7
	add	r2, r2, #12845056
	mov	r0, r0, asl #3
	rsb	r0, r8, r0
	mov	r4, r6, asl #4
	add	r1, r1, #4521984
	mov	r3, r3, asl #2
	add	r2, r2, #36864
	add	r3, r3, r7
	rsb	r4, r6, r4
	add	r2, r2, r0
	add	r1, r1, #36864
	ldr	r0, [sp, #60]
	add	r4, r4, r8
	add	r1, r1, r3
	mov	r3, sl, asl #1
	add	r0, r0, r3
	rsb	ip, r4, ip
	str	r0, [sp, #12]
	mov	r1, r1, lsr #22
	ldr	r0, [sp, #56]
	add	ip, ip, #566231040
	cmp	r1, #1000
	add	ip, ip, #2031616
	add	r3, r0, r3
	movhi	r1, #0
	andls	r1, r1, #255
	add	ip, ip, #4096
	str	r3, [sp, #8]
	mov	ip, ip, lsr #22
	strb	r1, [fp, #0]
	ldr	r3, [sp, #20]
	cmp	ip, #1000
	movhi	ip, #0
	andls	ip, ip, #255
	strb	ip, [r3, #0]
	mov	r2, r2, lsr #22
	ldr	r0, [sp, #16]
	cmp	r2, #1000
	movhi	r2, #0
	andls	r2, r2, #255
	strb	r2, [r0, #0]
	ldr	r0, [sp, #56]
	ldrb	r4, [r9, #1]	@ zero_extendqisi2
	ldr	r3, [sp, #60]
	ldrb	r7, [r0, sl, asl #1]	@ zero_extendqisi2
	ldrb	ip, [r3, sl, asl #1]	@ zero_extendqisi2
	mov	r2, r4, asl #11
	mov	r3, r4, asl #16
	mov	r6, r7, asl #12
	mov	r4, r4, asl #8
	add	r2, r2, r3
	mov	r3, r7, asl #14
	rsb	r3, r6, r3
	mov	r0, ip, asl #14
	add	r2, r2, r4
	mov	r8, ip, asl #8
	sub	r0, r0, ip, asl #10
	mov	r1, r3, asl #4
	mov	r2, r2, asl #3
	add	r0, r0, r8
	rsb	r2, r4, r2
	mov	r5, r7, asl #15
	add	r3, r3, r1
	mov	r7, r7, asl #8
	rsb	r5, r6, r5
	add	r3, r3, r7
	mov	r6, r0, asl #3
	mov	r1, r2, asl #3
	rsb	r5, r7, r5
	rsb	r6, r0, r6
	add	r2, r2, r1
	mov	r0, ip, asl #18
	mov	r3, r3, asl #3
	mov	ip, ip, asl #11
	add	ip, ip, r0
	mov	r1, r5, asl #4
	mov	r4, r6, asl #4
	add	r3, r3, r7
	add	r0, r2, #-939524096
	rsb	r1, r5, r1
	rsb	r4, r6, r4
	add	r0, r0, #4521984
	mov	r3, r3, asl #2
	add	r4, r4, r8
	add	r3, r3, r7
	sub	r1, r2, r1, asl #3
	add	r0, r0, #36864
	rsb	r1, r4, r1
	add	r0, r0, r3
	mov	r0, r0, lsr #22
	add	ip, ip, r8
	add	r1, r1, #566231040
	cmp	r0, #1000
	mov	ip, ip, asl #2
	add	r1, r1, #2031616
	movhi	r0, #0
	andls	r0, r0, #255
	add	ip, ip, r8
	add	r2, r2, #-1174405120
	add	r1, r1, #4096
	strb	r0, [fp, #1]
	mov	r1, r1, lsr #22
	add	r2, r2, #12845056
	mov	ip, ip, asl #3
	ldr	r3, [sp, #20]
	cmp	r1, #1000
	rsb	ip, r8, ip
	add	r2, r2, #36864
	movhi	r1, #0
	andls	r1, r1, #255
	add	r2, r2, ip
	strb	r1, [r3, #1]
	mov	r2, r2, lsr #22
	ldr	r0, [sp, #16]
	cmp	r2, #1000
	movhi	r2, #0
	andls	r2, r2, #255
	strb	r2, [r0, #1]
	ldr	r0, [sp, #8]
	ldrb	r4, [r9, #2]	@ zero_extendqisi2
	ldr	r3, [sp, #12]
	ldrb	r7, [r0, #1]	@ zero_extendqisi2
	ldrb	ip, [r3, #1]	@ zero_extendqisi2
	mov	r2, r4, asl #11
	mov	r3, r4, asl #16
	mov	r6, r7, asl #12
	mov	r4, r4, asl #8
	add	r2, r2, r3
	mov	r3, r7, asl #14
	rsb	r3, r6, r3
	mov	r0, ip, asl #14
	add	r2, r2, r4
	mov	r8, ip, asl #8
	sub	r0, r0, ip, asl #10
	mov	r1, r3, asl #4
	mov	r2, r2, asl #3
	add	r0, r0, r8
	rsb	r2, r4, r2
	mov	r5, r7, asl #15
	add	r3, r3, r1
	mov	r7, r7, asl #8
	rsb	r5, r6, r5
	add	r3, r3, r7
	mov	r6, r0, asl #3
	mov	r1, r2, asl #3
	rsb	r5, r7, r5
	rsb	r6, r0, r6
	add	r2, r2, r1
	mov	r0, ip, asl #18
	mov	r3, r3, asl #3
	mov	ip, ip, asl #11
	add	ip, ip, r0
	mov	r1, r5, asl #4
	mov	r4, r6, asl #4
	add	r3, r3, r7
	add	r0, r2, #-939524096
	rsb	r1, r5, r1
	rsb	r4, r6, r4
	add	r0, r0, #4521984
	mov	r3, r3, asl #2
	add	r4, r4, r8
	add	r3, r3, r7
	sub	r1, r2, r1, asl #3
	add	r0, r0, #36864
	rsb	r1, r4, r1
	add	r0, r0, r3
	mov	r0, r0, lsr #22
	add	ip, ip, r8
	add	r1, r1, #566231040
	cmp	r0, #1000
	mov	ip, ip, asl #2
	add	r1, r1, #2031616
	movhi	r0, #0
	andls	r0, r0, #255
	add	ip, ip, r8
	add	r2, r2, #-1174405120
	add	r1, r1, #4096
	mov	r1, r1, lsr #22
	strb	r0, [fp, #2]
	add	r2, r2, #12845056
	mov	ip, ip, asl #3
	cmp	r1, #1000
	rsb	ip, r8, ip
	ldr	r3, [sp, #20]
	add	r2, r2, #36864
	movhi	r1, #0
	andls	r1, r1, #255
	add	r2, r2, ip
	mov	r2, r2, lsr #22
	strb	r1, [r3, #2]
	cmp	r2, #1000
	ldr	r0, [sp, #16]
	movhi	r2, #0
	andls	r2, r2, #255
	strb	r2, [r0, #2]
	add	r0, sp, #8
	ldmia	r0, {r0, r3}	@ phole ldm
	ldrb	r4, [r9, #3]	@ zero_extendqisi2
	ldrb	ip, [r3, #1]	@ zero_extendqisi2
	ldrb	r7, [r0, #1]	@ zero_extendqisi2
	mov	r3, r4, asl #16
	mov	r2, r4, asl #11
	mov	r6, r7, asl #12
	mov	r4, r4, asl #8
	add	r2, r2, r3
	mov	r0, ip, asl #14
	mov	r3, r7, asl #14
	mov	r8, ip, asl #8
	rsb	r3, r6, r3
	add	r2, r2, r4
	sub	r0, r0, ip, asl #10
	add	r0, r0, r8
	mov	r5, r7, asl #15
	mov	r1, r3, asl #4
	mov	r2, r2, asl #3
	mov	r7, r7, asl #8
	rsb	r2, r4, r2
	add	r3, r3, r1
	rsb	r5, r6, r5
	mov	r6, r0, asl #3
	rsb	r6, r0, r6
	rsb	r5, r7, r5
	mov	r0, ip, asl #18
	mov	r1, r2, asl #3
	add	r3, r3, r7
	mov	ip, ip, asl #11
	add	r2, r2, r1
	add	ip, ip, r0
	mov	r3, r3, asl #3
	mov	r1, r5, asl #4
	mov	r4, r6, asl #4
	add	r0, r2, #-939524096
	rsb	r1, r5, r1
	rsb	r4, r6, r4
	add	r3, r3, r7
	add	ip, ip, r8
	sub	r1, r2, r1, asl #3
	add	r0, r0, #4521984
	mov	r3, r3, asl #2
	add	r4, r4, r8
	mov	ip, ip, asl #2
	rsb	r1, r4, r1
	add	r0, r0, #36864
	add	r3, r3, r7
	add	r2, r2, #-1174405120
	add	ip, ip, r8
	add	r0, r0, r3
	add	r1, r1, #566231040
	add	r2, r2, #12845056
	mov	ip, ip, asl #3
	mov	r0, r0, lsr #22
	rsb	ip, r8, ip
	add	r1, r1, #2031616
	add	r2, r2, #36864
	add	r2, r2, ip
	add	r1, r1, #4096
	cmp	r0, #1000
	mov	r1, r1, lsr #22
	mov	r2, r2, lsr #22
	movhi	r0, #0
	andls	r0, r0, #255
.L32:
	strb	r0, [fp, #3]
	ldr	r3, [sp, #20]
	cmp	r1, #1000
	movhi	r1, #0
	andls	r1, r1, #255
	strb	r1, [r3, #3]
	ldr	r0, [sp, #4]
	cmp	r2, #1000
	ldr	r3, [sp, #16]
	add	r0, r0, #1
	movhi	r2, #0
	andls	r2, r2, #255
	str	r0, [sp, #4]
	strb	r2, [r3, #3]
	cmp	r0, #4
	ldr	r0, [sp, #20]
	add	r3, r3, #4
	add	r0, r0, #4
	str	r0, [sp, #20]
	str	r3, [sp, #16]
	add	fp, fp, #4
	add	r9, r9, #4
	bne	.L7
	add	sp, sp, #24
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp}
	bx	lr
	.size	YCCtoRGB, .-YCCtoRGB
	.align	2
	.global	main
	.type	main, %function
main:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 8
	@ frame_needed = 0, uses_anonymous_args = 0
	stmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	ldr	r0, .L62
	ldr	ip, .L62+4
	ldr	r4, .L62+8
	sub	sp, sp, #20
	add	r2, r0, #16
	ldr	r3, .L62+12
	ldr	r1, .L62+16
	stmia	sp, {r4, ip}	@ phole stm
	bl	RGBtoYCC
	ldr	r2, .L62+12
	ldr	lr, .L62+20
	mov	r3, #0
	str	r2, [sp, #12]
	ldr	fp, .L62+16
	str	r3, [sp, #8]
	sub	r9, lr, #13
.L35:
	add	r2, sp, #8
	ldmia	r2, {r2, r3}	@ phole ldm
	ldr	r4, .L62+4
	ldrb	r1, [r3, #0]	@ zero_extendqisi2
	mov	sl, r2, asr #1
	ldr	ip, .L62+8
	ldrb	r0, [r4, sl, asl #1]	@ zero_extendqisi2
	ldrb	r6, [ip, sl, asl #1]	@ zero_extendqisi2
	mov	r3, r1, asl #16
	mov	r2, r1, asl #11
	add	r2, r2, r3
	mov	r1, r1, asl #8
	mov	r3, r0, asl #14
	mov	r8, r0, asl #8
	mov	r4, r6, asl #12
	mov	ip, r6, asl #14
	add	r2, r2, r1
	mov	r5, r6, asl #15
	sub	r3, r3, r0, asl #10
	mov	r6, r6, asl #8
	add	r3, r3, r8
	rsb	ip, r4, ip
	rsb	r5, r4, r5
	mov	r2, r2, asl #3
	rsb	r5, r6, r5
	rsb	r2, r1, r2
	mov	r7, ip, asl #4
	mov	r4, r3, asl #3
	rsb	r4, r3, r4
	add	ip, ip, r7
	mov	r3, r2, asl #3
	mov	r1, r5, asl #4
	add	r2, r2, r3
	mov	r7, r0, asl #18
	rsb	r1, r5, r1
	add	ip, ip, r6
	mov	r3, r4, asl #4
	mov	r0, r0, asl #11
	rsb	r3, r4, r3
	add	r0, r0, r7
	mov	ip, ip, asl #3
	mov	r7, r1, asl #3
	add	r5, r3, r8
	add	ip, ip, r6
	rsb	r3, r7, r2
	add	r1, r2, #-939524096
	rsb	r3, r5, r3
	mov	ip, ip, asl #2
	add	r1, r1, #4521984
	add	ip, ip, r6
	add	r1, r1, #36864
	add	r3, r3, #566231040
	add	r0, r0, r8
	add	r1, r1, ip
	add	r3, r3, #2031616
	mov	r1, r1, lsr #22
	mov	r0, r0, asl #2
	add	r3, r3, #4096
	mov	r3, r3, lsr #22
	cmp	r1, #1000
	add	r0, r0, r8
	add	r2, r2, #-1174405120
	movhi	r1, #0
	andls	r1, r1, #255
	mov	r0, r0, asl #3
	cmp	r3, #1000
	add	r2, r2, #12845056
	rsb	r0, r8, r0
	movhi	r3, #0
	andls	r3, r3, #255
	ldr	r4, .L62+4
	add	r2, r2, #36864
	strb	r1, [r9, #-3]
	mov	sl, sl, asl #1
	strb	r3, [fp, #0]
	add	r2, r2, r0
	ldr	r3, [sp, #12]
	add	r8, r4, sl
	mov	r2, r2, lsr #22
	ldr	r4, .L62+8
	cmp	r2, #1000
	add	r6, r4, sl
	andls	r4, r2, #255
	ldrb	r2, [r3, #1]	@ zero_extendqisi2
	mov	r1, r2, asl #16
	mov	r3, r2, asl #11
	add	r3, r3, r1
	mov	r2, r2, asl #8
	add	r3, r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r1, r3, asl #3
	add	r3, r3, r1
	rsb	r1, r7, r3
	add	r2, r3, #-939524096
	rsb	r1, r5, r1
	add	r2, r2, #4521984
	add	r2, r2, #36864
	add	r1, r1, #566231040
	add	r2, ip, r2
	add	r1, r1, #2031616
	mov	r2, r2, lsr #22
	add	r1, r1, #4096
	mov	r1, r1, lsr #22
	movhi	r4, #0
	cmp	r2, #1000
	movhi	r2, #0
	andls	r2, r2, #255
	add	r3, r3, #-1174405120
	cmp	r1, #1000
	movhi	r1, #0
	andls	r1, r1, #255
	add	r3, r3, #12845056
	strb	r4, [lr, #0]
	add	r3, r3, #36864
	strb	r2, [r9, #-2]
	strb	r1, [fp, #1]
	ldr	r4, [sp, #12]
	add	r3, r0, r3
	mov	r0, r3, lsr #22
	ldrb	r1, [r4, #2]	@ zero_extendqisi2
	cmp	r0, #1000
	andls	sl, r0, #255
	ldrb	r0, [r8, #1]	@ zero_extendqisi2
	ldrb	r6, [r6, #1]	@ zero_extendqisi2
	mov	r3, r1, asl #16
	mov	r2, r1, asl #11
	add	r2, r2, r3
	mov	r1, r1, asl #8
	mov	r3, r0, asl #14
	mov	r8, r0, asl #8
	mov	r4, r6, asl #12
	mov	ip, r6, asl #14
	add	r2, r2, r1
	mov	r5, r6, asl #15
	sub	r3, r3, r0, asl #10
	mov	r6, r6, asl #8
	rsb	ip, r4, ip
	add	r3, r3, r8
	rsb	r5, r4, r5
	mov	r2, r2, asl #3
	rsb	r2, r1, r2
	rsb	r5, r6, r5
	mov	r7, ip, asl #4
	mov	r4, r3, asl #3
	rsb	r4, r3, r4
	add	ip, ip, r7
	mov	r3, r2, asl #3
	mov	r1, r5, asl #4
	add	r2, r2, r3
	mov	r7, r0, asl #18
	rsb	r1, r5, r1
	mov	r3, r4, asl #4
	add	ip, ip, r6
	mov	r0, r0, asl #11
	rsb	r3, r4, r3
	add	r0, r0, r7
	mov	ip, ip, asl #3
	mov	r7, r1, asl #3
	add	r5, r3, r8
	add	r1, r2, #-939524096
	rsb	r3, r7, r2
	add	ip, ip, r6
	mov	ip, ip, asl #2
	add	r1, r1, #4521984
	rsb	r3, r5, r3
	add	ip, ip, r6
	add	r1, r1, #36864
	add	r3, r3, #566231040
	add	r0, r0, r8
	add	r1, r1, ip
	add	r3, r3, #2031616
	mov	r1, r1, lsr #22
	mov	r0, r0, asl #2
	add	r3, r3, #4096
	mov	r3, r3, lsr #22
	movhi	sl, #0
	add	r0, r0, r8
	cmp	r1, #1000
	add	r2, r2, #-1174405120
	movhi	r1, #0
	andls	r1, r1, #255
	mov	r0, r0, asl #3
	cmp	r3, #1000
	add	r2, r2, #12845056
	rsb	r0, r8, r0
	movhi	r3, #0
	andls	r3, r3, #255
	add	r2, r2, #36864
	strb	sl, [lr, #1]
	add	r2, r2, r0
	strb	r1, [r9, #-1]
	strb	r3, [fp, #2]
	mov	r2, r2, lsr #22
	ldr	r3, [sp, #12]
	cmp	r2, #1000
	andls	r4, r2, #255
	ldrb	r2, [r3, #3]	@ zero_extendqisi2
	mov	r1, r2, asl #16
	mov	r3, r2, asl #11
	add	r3, r3, r1
	mov	r2, r2, asl #8
	add	r3, r3, r2
	mov	r3, r3, asl #3
	rsb	r3, r2, r3
	mov	r1, r3, asl #3
	add	r3, r3, r1
	add	r2, r3, #-939524096
	rsb	r1, r7, r3
	add	r2, r2, #4521984
	rsb	r1, r5, r1
	add	r2, r2, #36864
	add	r3, r3, #-1174405120
	add	r2, r2, ip
	add	r1, r1, #566231040
	add	r3, r3, #12845056
	mov	r2, r2, lsr #22
	add	r1, r1, #2031616
	add	r3, r3, #36864
	movhi	r4, #0
	add	r3, r3, r0
	add	r1, r1, #4096
	cmp	r2, #1000
	strb	r4, [lr, #2]
	mov	r1, r1, lsr #22
	mov	r0, r3, lsr #22
	movhi	r2, #0
	andls	r2, r2, #255
.L60:
	cmp	r1, #1000
	movhi	r1, #0
	andls	r1, r1, #255
	strb	r2, [r9, #0]
	strb	r1, [fp, #3]
	add	r4, sp, #8
	ldmia	r4, {r4, ip}	@ phole ldm
	cmp	r0, #1000
	add	r4, r4, #1
	movhi	r3, #0
	andls	r3, r0, #255
	add	ip, ip, #4
	cmp	r4, #4
	strb	r3, [lr, #3]
	str	r4, [sp, #8]
	str	ip, [sp, #12]
	add	lr, lr, #4
	add	fp, fp, #4
	add	r9, r9, #4
	bne	.L35
	mov	r0, #0
	add	sp, sp, #20
	ldmfd	sp!, {r4, r5, r6, r7, r8, r9, sl, fp, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	.LANCHOR0
	.word	cb
	.word	cr
	.word	y
	.word	.LANCHOR1
	.word	.LANCHOR0+16
	.size	main, .-main
	.global	r
	.global	g
	.global	b
	.comm	y,16,1
	.comm	cr,4,1
	.comm	cb,4,1
	.data
.LANCHOR0 = . + 0
	.type	r, %object
	.size	r, 16
r:
	.byte	-128
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.byte	-1
	.type	b, %object
	.size	b, 16
b:
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.byte	1
	.bss
.LANCHOR1 = . + 0
	.type	g, %object
	.size	g, 16
g:
	.space	16
	.ident	"GCC: (Sourcery G++ Lite 2008q3-72) 4.3.2"
	.section	.note.GNU-stack,"",%progbits
