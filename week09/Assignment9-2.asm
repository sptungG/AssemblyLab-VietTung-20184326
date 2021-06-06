# In the utils.asm file, fix the PrintInt subprogram
# so that it can call the PrintNewLine
.text
main:
	# read an input value from the user
	la $a0, prompt
	li $v0, 4
	syscall
	move $a0, $a1
	li $v0, 5
	syscall
	
	move $s0, $v0
	# print the value back to the user
	la $a0, result
	move $a1, $s0
	jal PrintInt
	# call the Exit subprogram to exit
	jal Exit
.data
	prompt: .asciiz "Please enter an integer: "
	result: .asciiz ">>>> You entered: "

.text
PrintNewLine:
	li $v0,4
	la $a0, __PNL_newLine
	syscall
	jr $ra
.data
	__PNL_newLine: .asciiz "\n"

.text
PrintInt:
	li $v0, 4
	syscall
	# Print integer. The integer value is in $a1, and must
	# be first moved to $a0.
	move $a0, $a1
	li $v0, 1
	syscall
	# Print a new line character
	# Saving the return register so we can jump the PrintNewLine subprogram
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	jal PrintNewLine
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	
	jr $ra
.text
Exit:
	li $v0, 10
	syscall

