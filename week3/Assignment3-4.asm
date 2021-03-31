#Program: Assignment 3.4
#Purpose: Caculate the result of (4x/3)*y 
.data
prompt: .asciiz "Enter value of x: "
prompt2: .asciiz "Enter value of y: "
result: .asciiz "Result is: "
.text
	addi $v0, $zero, 4
	la $a0, prompt
	syscall
	
	addi $v0, $zero, 5
	syscall
	move $s0, $v0
	
	addi $v0, $zero, 4
	la $a0, prompt2
	syscall
	
	addi $v0, $zero, 5
	syscall
	move $s1, $v0
	
	mul $t0, $s0, 4
	mul $t0, $t0, $s1
	div $t0, $t0, 3
	
	addi $v0, $zero, 4
	la $a0, result
	syscall
	
	addi $v0, $zero, 1
	move $a0, $t0
	syscall
	
