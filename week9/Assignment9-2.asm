# In the utils.asm file, fix the PrintInt subprogram
# so that it can call the PrintNewLine
# subprogram to print a new line character.

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
	# Print integer. The integer value is in $a1, and must
	# be first moved to $a0.
	move $a0, $a1
	li $v0, 1
	syscall
	
	# Print a new line character
	# jal PrintNewLine
	
	#return 
	jr $ra