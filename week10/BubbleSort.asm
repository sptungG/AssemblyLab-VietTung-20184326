.text
.globl main
main:
	la $a0, array_base
	lw $a1, array_size
	jal PrintIntArray
	la $a0, array_base
	lw $a1, array_size
	jal BubbleSort
	jal PrintNewLine
	la $a0, array_base
	lw $a1, array_size
	jal PrintIntArray
	jal Exit
.data
array_size: .word 8
array_base:
	.word 55
	.word 27
	.word 13
	.word 5
	.word 44
	.word 32
	.word 17
	.word 36

.include "utils.asm"
.include "bubbleSortt.asm"