# Program: To compare addiu and ori
# Week 4 - Assignment 4.3
.data

.text
 addiu $t0, $zero, 60000
 ori $t0, $zero, 60000
	syscall