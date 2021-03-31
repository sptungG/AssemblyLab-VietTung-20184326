# Week 4 - Assignment 4-4

.data
prompt: .asciiz "Enter an integer number: "
output1: .asciiz "The number in binary: "
output2: .asciiz "\nIts 1's complement:   "

.text
main:
	# Input the number
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	# Output as binary number
	li $v0, 4
	la $a0, output1
	syscall
	
	li $v0, 35
	move $a0, $s0
	syscall
	
	# Using XOR to implement NOT
	xori $s0, 0xffffffff
	
	# Output after XORing
	li $v0, 4
	la $a0, output2
	syscall
	
	li $v0, 35
	move $a0, $s0
	syscall
	
	# Exit program
	li $v0, 10
	syscall