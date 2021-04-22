# 2 ch? trong ctr b? xung ??t -> ctr ?? khi ch?n delayBranching 
# quan sat thanh ghi ra
.text 
.globl main
# get input value and store it in $s0
	main: 
	la $a0,prompt
	jal PromptInt
	move $s0, $v0
	# Load constants a,b and c into registers
	lw $t5,a 
	lw $t6,b
	lw $t7,c
	# Calculate the result of y = a*x*x + b*x + c and store it
	mul $t0, $s0, $s0
	mul $t0, $t0, $t5
	mul $t1, $s0, $t6
	add $t0, $t0, $t1
	add $s1, $t0, $t7
	#
	sw $s1, y
	#Print output from memory y
	la $a0, result
	lw $a1, y
	move $a1,$s1
	jal PrintInt
	jal PrintNewLine #
	
	jal Exit
.data
	a: .word 5
	b: .word 2
	c: .word 3
	y: .word 0
	prompt: .asciiz "Enter a value for x: "
	result: .asciiz "The reult is: "
.include "utils.asm"


