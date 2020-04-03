	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	initialize
	.arch armv4t
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #256
	ldr	r4, .L4
	mov	r0, #3
	ldr	r2, .L4+4
	ldr	r1, .L4+8
	mov	lr, pc
	bx	r4
	mov	r0, #3
	ldr	r2, .L4+12
	ldr	r1, .L4+16
	mov	r3, #16384
	mov	lr, pc
	bx	r4
	ldr	r3, .L4+20
	mov	lr, pc
	bx	r3
	mov	r2, #67108864
	mov	r1, #4096
	ldr	r3, .L4+24
	strh	r1, [r2]	@ movhi
	mov	lr, pc
	bx	r3
	mov	r3, #0
	ldr	r2, .L4+28
	ldr	ip, .L4+32
	ldrh	lr, [r2, #48]
	ldr	r0, .L4+36
	ldr	r1, .L4+40
	ldr	r2, .L4+44
	strh	lr, [ip]	@ movhi
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	83886592
	.word	spriteSheetPal
	.word	100728832
	.word	spriteSheetTiles
	.word	hideSprites
	.word	initSnake
	.word	67109120
	.word	buttons
	.word	state
	.word	hasLost
	.word	seed
	.size	initialize, .-initialize
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #0
	ldr	r0, .L7
	ldr	r1, .L7+4
	ldr	r2, .L7+8
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
	bx	lr
.L8:
	.align	2
.L7:
	.word	state
	.word	hasLost
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #512
	mov	r6, #67108864
	ldr	r5, .L22
	ldr	r3, [r5]
	add	r3, r3, #1
	str	r3, [r5]
	ldr	r4, .L22+4
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r6]	@ movhi
	ldr	r1, .L22+8
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	mov	r3, #384
	mov	r0, #3
	strh	r2, [r6, #10]	@ movhi
	ldr	r1, .L22+12
	mov	r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L22+16
	ldr	r1, .L22+20
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #0
	ldr	r3, .L22+24
	add	r1, r3, #1024
.L10:
	strh	r2, [r3]	@ movhi
	strh	r2, [r3, #2]	@ movhi
	strh	r2, [r3, #4]	@ movhi
	add	r3, r3, #8
	cmp	r3, r1
	bne	.L10
	ldr	r6, .L22+28
	mov	r3, #512
	mov	r2, #117440512
	mov	r0, #3
	ldr	r1, .L22+24
	mov	lr, pc
	bx	r4
	ldrh	r3, [r6]
	tst	r3, #8
	beq	.L11
	ldr	r2, .L22+32
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L21
.L11:
	tst	r3, #32
	beq	.L9
	ldr	r3, .L22+32
	ldrh	r3, [r3]
	tst	r3, #32
	moveq	r2, #4
	ldreq	r3, .L22+36
	streq	r2, [r3]
.L9:
	pop	{r4, r5, r6, lr}
	bx	lr
.L21:
	ldr	r0, [r5]
	ldr	r3, .L22+40
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+44
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+48
	mov	lr, pc
	bx	r3
	mov	r1, #1
	ldr	r2, .L22+36
	ldrh	r3, [r6]
	str	r1, [r2]
	b	.L11
.L23:
	.align	2
.L22:
	.word	seed
	.word	DMANow
	.word	startScreenPal
	.word	startScreenTiles
	.word	100726784
	.word	startScreenMap
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	state
	.word	srand
	.word	initGame
	.word	hideSprites
	.size	start, .-start
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L26
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L26+4
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L27:
	.align	2
.L26:
	.word	hideSprites
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #4608
	mov	r5, #67108864
	ldr	r4, .L39
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	ldr	r1, .L39+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	mov	r3, #16
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L39+8
	mov	r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L39+12
	ldr	r1, .L39+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L39+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L39+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L29
	ldr	r3, .L39+28
	ldrh	r3, [r3]
	tst	r3, #8
	moveq	r2, #2
	ldreq	r3, .L39+32
	streq	r2, [r3]
.L29:
	ldr	r3, .L39+36
	ldr	r3, [r3, #40]
	cmp	r3, #20
	moveq	r2, #3
	ldreq	r3, .L39+32
	streq	r2, [r3]
	ldr	r3, .L39+40
	ldr	r3, [r3]
	cmp	r3, #0
	movne	r2, #4
	ldrne	r3, .L39+32
	pop	{r4, r5, r6, lr}
	strne	r2, [r3]
	bx	lr
.L40:
	.align	2
.L39:
	.word	DMANow
	.word	gameScreenPal
	.word	gameScreenTiles
	.word	100726784
	.word	gameScreenMap
	.word	updateGame
	.word	oldButtons
	.word	buttons
	.word	state
	.word	snakeHead
	.word	hasLost
	.size	game, .-game
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #2
	ldr	r3, .L42
	str	r2, [r3]
	bx	lr
.L43:
	.align	2
.L42:
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #512
	mov	r5, #67108864
	ldr	r4, .L51
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	ldr	r1, .L51+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	mov	r3, #96
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L51+8
	mov	r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L51+12
	ldr	r1, .L51+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L51+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L44
	ldr	r3, .L51+24
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L50
.L44:
	pop	{r4, r5, r6, lr}
	bx	lr
.L50:
	ldr	r3, .L51+28
	mov	lr, pc
	bx	r3
	mov	r2, #1
	ldr	r3, .L51+32
	pop	{r4, r5, r6, lr}
	str	r2, [r3]
	bx	lr
.L52:
	.align	2
.L51:
	.word	DMANow
	.word	pauseScreenPal
	.word	pauseScreenTiles
	.word	100726784
	.word	pauseScreenMap
	.word	oldButtons
	.word	buttons
	.word	hideSprites
	.word	state
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #3
	ldr	r3, .L54
	str	r2, [r3]
	bx	lr
.L55:
	.align	2
.L54:
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #512
	mov	r5, #67108864
	ldr	r4, .L62
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	ldr	r1, .L62+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L62+8
	mov	r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L62+12
	ldr	r1, .L62+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L62+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r3, .L62+24
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bne	.L56
	ldr	r0, .L62+28
	ldr	r1, .L62+32
	ldr	r2, .L62+36
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
.L56:
	pop	{r4, r5, r6, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	DMANow
	.word	winScreenPal
	.word	winScreenTiles
	.word	100726784
	.word	winScreenMap
	.word	oldButtons
	.word	buttons
	.word	state
	.word	hasLost
	.word	seed
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r2, #4
	ldr	r3, .L65
	str	r2, [r3]
	bx	lr
.L66:
	.align	2
.L65:
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	r2, #512
	mov	r5, #67108864
	ldr	r4, .L73
	mov	r3, #256
	mov	r0, #3
	strh	r2, [r5]	@ movhi
	ldr	r1, .L73+4
	mov	r2, #83886080
	mov	lr, pc
	bx	r4
	mov	r2, #7936
	mov	r3, #176
	mov	r0, #3
	strh	r2, [r5, #10]	@ movhi
	ldr	r1, .L73+8
	mov	r2, #100663296
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	mov	r0, #3
	ldr	r2, .L73+12
	ldr	r1, .L73+16
	mov	lr, pc
	bx	r4
	ldr	r3, .L73+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L67
	ldr	r3, .L73+24
	ldrh	r3, [r3]
	ands	r3, r3, #8
	bne	.L67
	ldr	r0, .L73+28
	ldr	r1, .L73+32
	ldr	r2, .L73+36
	str	r3, [r0]
	str	r3, [r1]
	str	r3, [r2]
.L67:
	pop	{r4, r5, r6, lr}
	bx	lr
.L74:
	.align	2
.L73:
	.word	DMANow
	.word	loseScreenPal
	.word	loseScreenTiles
	.word	100726784
	.word	loseScreenMap
	.word	oldButtons
	.word	buttons
	.word	state
	.word	hasLost
	.word	seed
	.size	lose, .-lose
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r6, .L85
	push	{r4, r7, fp, lr}
	ldr	r3, .L85+4
	mov	lr, pc
	bx	r3
	ldr	fp, .L85+8
	ldr	r3, [r6]
	ldr	r10, .L85+12
	ldr	r9, .L85+16
	ldr	r8, .L85+20
	ldr	r5, .L85+24
	ldr	r7, .L85+28
	ldr	r4, .L85+32
.L83:
	cmp	r3, #4
	ldrls	pc, [pc, r3, asl #2]
	b	.L76
.L78:
	.word	.L82
	.word	.L81
	.word	.L80
	.word	.L79
	.word	.L77
.L77:
	ldr	r3, .L85+36
	mov	lr, pc
	bx	r3
	ldr	r3, [r6]
.L76:
	ldrh	r1, [r7]
	strh	r1, [r5]	@ movhi
	ldrh	r1, [r4, #48]
	strh	r1, [r7]	@ movhi
	b	.L83
.L79:
	mov	lr, pc
	bx	r8
	ldr	r3, [r6]
	b	.L76
.L80:
	mov	lr, pc
	bx	r9
	ldr	r3, [r6]
	b	.L76
.L82:
	mov	lr, pc
	bx	fp
	ldr	r3, [r6]
	b	.L76
.L81:
	mov	lr, pc
	bx	r10
	ldr	r3, [r6]
	b	.L76
.L86:
	.align	2
.L85:
	.word	state
	.word	initialize
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	oldButtons
	.word	buttons
	.word	67109120
	.word	lose
	.size	main, .-main
	.comm	state,4,4
	.comm	seed,4,4
	.comm	shadowOAM,1024,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	apple,32,4
	.comm	snakeBodyArray,1232,4
	.comm	snakeHead,44,4
	.ident	"GCC: (devkitARM release 53) 9.1.0"
