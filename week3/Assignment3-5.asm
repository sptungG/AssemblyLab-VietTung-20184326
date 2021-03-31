#Program: Assignment 3.5
.data
prompt: .asciiz "Enter temperature: "
prompt2: .asciiz "Enter mol: "
prompt3: .asciiz "Enter pressure: "
result: .asciiz "Volume is: "
.text
	li $v0, 4
	la $a0, prompt
	syscall
	
	li $v0, 5
	syscall
	move $s0, $v0
	
	li $v0, 4
	la $a0, prompt2
	syscall
	
	li $v0, 5
	syscall 
	move $s1, $v0
	
	li $v0, 4
	la $a0, prompt3
	syscall
	
	li $v0, 5
	syscall
	move $s2, $v0
	
	mul $t0, $s0, $s1
	mul $t0, $t0, 8314
	mul $t1, $s2, 1000
	div $t2, $t0, $t1
	
	li $v0, 4
	la $a0, result
	syscall
	
	li $v0, 1
	move $a0, $t2
	syscall
	
