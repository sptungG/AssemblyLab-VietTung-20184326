# Week 4 - Assignment 4.6

.data
	inputA: .asciiz "Enter an integer A: "
	inputB: .asciiz "Enter an integer B: "

	output: .asciiz "In binary: \n"
	binaryA: .asciiz "    A    = "
	binaryB: .asciiz "\n    B    = "
	AnandB: .asciiz "\nA NAND B = "

.text
main:
	# Input the number A
	li $v0, 4
	la $a0, inputA
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	# Input the number B
	li $v0, 4
	la $a0, inputB
	syscall
	
	li $v0, 5
	syscall
	move $s1, $v0
	
	# Output A as binary number
	li $v0, 4
	la $a0, output
	syscall
	
	li $v0, 4
	la $a0, binaryA
	syscall
	
	li $v0, 35
	move $a0, $s0
	syscall
	
	# Output B as binary number
	li $v0, 4
	la $a0, binaryB
	syscall
	
	li $v0, 35
	move $a0, $s1
	syscall
	
	# A AND B
	and $t0, $s0, $s1
	
	# A NAND B 
	xori $t0, 0xffffffff
	
	# Output A NAND B
	li $v0, 4
	la $a0, AnandB
	syscall
	
	li $v0, 35
	move $a0, $t0
	syscall
	
	# Exit program
	li $v0, 10
	syscall