# Purpose: To show the XOR operation is reversible
.data
	output1: .asciiz "\n Please Enter a value: "
	output2: .asciiz "\n Input value: "
	output3: .asciiz "\n Result after 1st XOR: "
	output4: .asciiz "\n Result after 2nd XOR: "
.text
.globl main 
 main:
 	ori $v0,$zero,4
 	la $a0,output1
 	syscall
 	
 	ori $v0,$zero,5
 	syscall
 	move $s0,$v0
 	
 	ori $v0,$zero,4
 	la $a0,output2
 	syscall
 	
 	ori $v0,$zero,34
 	move $a0,$s0
 	syscall
 	
 	ori $v0,$zero,4
 	la $a0,output3
 	syscall
 	
 	xori $s0,$s0,0xffffffff  # the results in $t1 will be fedcba98
 	move $a0,$s0
 	
 	ori $v0,$zero,34
 	syscall
 	
 	ori $v0,$zero,4
 	la $a0,output4
 	syscall
 	
 	xori $s0,$s0,0xffffffff  # the results in $t1 will be fedcba98
 	move $a0,$s0
 	ori $v0,$zero,34
 	syscall
 	
 	ori $v0,$zero,10 # Exit program
 	syscall
 