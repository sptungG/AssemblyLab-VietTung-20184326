 .text

.globl main

main:
	la $a0,input
	jal PromptInt
	move $a0,$v0
	
	jal checkPrime
	beq $v0,0,case0
	beq $v0,1,case1
	beq $v0,2,case2
	j exit
case0:
	la $a0,notprime
	jal PrintString
	j exit
case1:
	la $a0,isprime
	jal PrintString
	j exit
case2:
	la $a0,error
	jal PrintString
	j exit
exit:
	jal Exit
	
.data
	input: .asciiz "Input the number :"
	error: .asciiz "Error Number"
	isprime: .asciiz "It's a prime number"
	notprime: .asciiz "It's not a prime number"

.include "utils.asm"