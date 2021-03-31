# Purpose: To show the XOR operation is reversible
.data
	output1: .asciiz "\n Please Enter the 1st value: "
	output11: .asciiz "\n Please Enter the 2nd value: "
	output2: .asciiz "\n 1st Input value: "
	output22: .asciiz "\n 2nd Input value: "
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
 	

 	ori $v0,$zero,10 # Exit program
 	syscall
 