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
	.file	"gameScreen.c"
	.text
	.global	gameScreenPal
	.global	gameScreenMap
	.global	gameScreenTiles
	.section	.rodata
	.align	2
	.type	gameScreenPal, %object
	.size	gameScreenPal, 512
gameScreenPal:
	.space	512
	.type	gameScreenMap, %object
	.size	gameScreenMap, 2048
gameScreenMap:
	.space	2048
	.type	gameScreenTiles, %object
	.size	gameScreenTiles, 32
gameScreenTiles:
	.space	32
	.ident	"GCC: (devkitARM release 53) 9.1.0"
