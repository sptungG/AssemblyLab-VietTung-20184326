.data
	output1: .asciiz "\n Please Enter a value: "
	output2: .asciiz " Input value: "
	result3:  .asciiz "\n Result after sll 4bits: "
	result4: .asciiz " \n Result after sllv 4bits: "
	result5: .asciiz "\n shift right arithmetic by 4 bits is "
	result6: .asciiz "\n rotate right by 4 bits is " 
	result7: .asciiz "\n rotate left by 4 bits is " 
.text
 .globl main
 main:
 	ori $v0, $zero, 4     #input the integer
        la $a0, output1
   	syscall
   
    	ori $v0, $zero, 5
    	syscall
    	move $s0, $v0
    	
    	ori $v0, $zero,4    #Out the result in binary
    	la $a0, output2
    	syscall
    
    	ori $v0, $zero, 35
    	move $a0, $s0
    	syscall
    	
 	ori $v0, $zero,4    #Result after sll 4bits
    	la $a0, result3
    	syscall
    
    	sll $s0, $s0,4    
    	ori $v0, $zero, 35
    	move $a0, $s0
    	syscall
    
    	ori $v0, $zero,4    #Result after sllv 4bits
    	la $a0, result4
    	syscall
    
    	sllv $s0,$s0,4
    	ori $v0, $zero, 35
    	move $a0, $s0
    	syscall
    
 #SRA example
#ror example
 	ori $t0, $zero, 123456789
 	ror $s0, $t0, 4 
 	li $v0, 4 
 	la $a0, result6
 	syscall
 	li $v0, 34
 	move $a0, $s0
 	syscall 
 #rol example
 	ori $t0, $zero, 123456789
 	rol $s0, $t0, 4 
 	li $v0, 4 
 	la $a0, result7
 	syscall
 	li $v0, 34
 	move $a0, $s0
 	syscall
 
 addi $v0, $zero, 10 # Exit program
 syscall
