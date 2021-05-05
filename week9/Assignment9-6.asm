# Implement a recursive program that takes in a
# number and finds the square of that number
# through addition.

# Program: To recursively call a subprogram to sum an inputted value until it is squared entered
.text
main:
	# Read in the input from the user
	la $a0, prompt
	jal PromptInt
	
	# Send in the input to the recursive function
	move $a0, $v0
	move $a1, $v0
	jal RecurseSquare
	move $s0, $v0
	
	# Print out the returned value
	la $a0, present
	la $a1, ($s0)
	jal PrintInt
	jal PrintNewLine
	jal Exit
	
RecurseSquare:

	# If the value inputted by the user is the stopping value (-1)
	beq $a0, 1, return
	
	  # Decrement the input and push stack for return value
	  addi $a0, $a0, -1
	  addi $sp, $sp, -4
	  sw $ra, 0($sp)
	  jal RecurseSquare
	  
	# Return the input plus the return value 
	return:
	add $v0, $v0, $a1
	lw $ra, 0($sp)
	addi $sp, $sp, 4
	jr $ra
	
.data
prompt:		.asciiz "----Enter an integer to square: "
present:	.asciiz ">>>> Here is the square: "
	
.include "utils.asm"