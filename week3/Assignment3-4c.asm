#Program: Assignment 3.4c
#Purpose: Caculate the result of x^3 + 2x^2 + 3x + 4  

.data 
	prompt: .asciiz "Enter value of x: " 
	result: .asciiz "Result is: " 

.text 
	addi $v0, $zero, 4 
	la $a0, prompt 
	syscall 

	addi $v0, $zero, 5 	
    syscall 

	move $s0, $v0 
	mul $t0, $s0, $s0 
	mul $t0, $t0, $s0 
	mul $t1, $s0, $s0 
	mul $t1, $t1, 2 
	mul $t2, $s0, 3 
	add $t3, $t0, $t1 
	add $t3, $t3, $t2 

	addi $t3, $t3, 4 
	li $v0, 4 
	la $a0, result 
	syscall 

	li $v0, 1 
	move $a0, $t3 
	syscall 