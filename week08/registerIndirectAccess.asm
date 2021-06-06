# nap dia chi vao trong thanh ghi
.text 
.globl main
# get input value and store it in $s0
	main: 
	la $a0,prompt
	jal PromptInt
	move $s0, $v0
	# Load constants a,b and c into registers
	lui $t0, 0x1001 #nap base vào thanh ghi $t0 ---> $t0 = 0x10010000 
	lw $t5, 0($t0) # ? offset 0 luu vào thanh ghi t0 
	addi $t0, $t0, 4 # --> t0 = 4 0x10010004 
	lw $t6, 0($t0) # ? offset 0 luu vào thanh ghi t0 
	addi $t0, $t0, 4 # --> t0 = 4 0x10010008 
	lw $t7,0($t0)
	# Calculate the result of y = a*x*x + b*x + c and store it
	mul $t0, $s0, $s0
	mul $t0, $t0, $t5
	mul $t1, $s0, $t6
	add $t0, $t0, $t1
	add $s1, $t0, $t7
	#Print output from memory y
	la $a0, result
	move $a1,$s1
	jal PrintInt
	jal PrintNewLine #
	
	jal Exit
.data
	.word 5
	.word 2
	.word 3
	y: .word 0
	prompt: .asciiz "Enter a value for x: "
	result: .asciiz "The reult is: "
.include "utils.asm"


