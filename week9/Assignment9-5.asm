# Implement a subprogram that prompts a user
# to enter values from 0..100 until a sentinel
# value of -1 is entered. Return the average of
# the numbers to the calling program

.text
.globl main
main:
	li $s0, 0
	li $s1, 0
	
	jal GetNumber
	move $s2, $v0
	
	la $a0, result
	div $a1, $s2, $s1  
	jal PrintInt
	
	jal Exit
GetNumber:
	addi $sp, $sp, -8
	sw $ra, 0($sp)
	
	move $t1, $ra
	la $a0, prompt	# get the number
	jal PromptInt
	move $s0, $v0
	move $ra, $t1

	seq $t0, $s0, -1
	addi $v0, $zero, 0
	bnez $t0, Return

	sw $s0, 4($sp)	# save $a0
	
	jal GetNumber
	lw $s0, 4($sp)
	addi $s1, $s1, 1
	add $v0, $s0, $v0
	
	Return:
	lw $ra, 0($sp)
	addi $sp, $sp, 8
	jr $ra
	
.data
prompt: .asciiz "----Enter a number form 0 to 100 (-1 to break): "
result: .ascii ">>>> The average number is : "
.include "utils.asm"
