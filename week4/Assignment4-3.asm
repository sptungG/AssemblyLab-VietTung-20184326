# Program: To compare addiu and ori
.data

.text
 addiu $t0, $zero, 60000
 ori $t0, $zero, 60000
	syscall