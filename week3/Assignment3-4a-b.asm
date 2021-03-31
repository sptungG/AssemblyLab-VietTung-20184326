#Program: Assignment 3.4a,b
#Purpose: Caculate the result of 5x+3y+z and ((5x+3y+z)/2)*3  

.data 
	prompt: .asciiz " Enter the value of x: " 
	prompt2: .asciiz "Enter the value of y: " 
	prompt3: .asciiz "Enter the value of z: " 
	result: .asciiz "Result is: " 
.text 
	addi $v0, $zero, 4 #Print the prompt 
	la $a0, prompt 
	syscall

	li $v0, 5   # Retrieve input x 
	syscall 
	move $s0, $v0 

	addi $v0, $zero, 4 #Print the prompt 
	la $a0, prompt2 
	syscall 

	li $v0, 5   # Retrieve input y 
	syscall 
	move $s1, $v0 
	
	addi $v0, $zero, 4 #Print the prompt 
	la $a0, prompt3 
	syscall 

	li $v0, 5   # Retrieve input z 
	syscall 
	move $s2, $v0 

#Caculate the equation 

	mul $t0, $s0, 5 
	mul $t1, $s1, 3 
	add $t1, $t1, $s2 
	add $t1, $t1, $t0 
	mul $t2, $t1, 3 
	div $t2, $t2, 2 
	addi $v0, $zero, 4 
	
	la $a0, result 
	syscall 
	
	addi $v0, $zero, 1 
	move $a0, $t2 
	Syscall 

 