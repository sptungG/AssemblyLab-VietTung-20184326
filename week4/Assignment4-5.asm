# Week 4 - Assignment 4-5

.data
prompt: .asciiz "Enter an integer number: "
output: .asciiz "The number in binary: "
output1: .asciiz "\nIts 1's complement:   "
output2: .asciiz "\nIts 2's complement:   "
output3: .asciiz "\nIn decimal: "

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
	la $a0, output
	syscall
	
	li $v0, 35
	move $a0, $s0
	syscall
	
	# Using XOR to implement 1's complement
	xori $s0, 0xffffffff
	
	# Output 1's complement
	li $v0, 4
	la $a0, output1
	syscall
	
	li $v0, 35
	move $a0, $s0
	syscall
	
	# 2's comlement
	addiu $s0, $s0, 1
	
	# Output 1's complement
	li $v0, 4
	la $a0, output2
	syscall
	
	li $v0, 35
	move $a0, $s0
	syscall
	
	# Output 2's complement in decimal
	li $v0, 4
	la $a0, output3
	syscall
	
	li $v0, 1
	move $a0, $s0
	syscall
	
	# Exit program
	li $v0, 10
	syscall