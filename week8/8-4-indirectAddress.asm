# Program Name: indirect_address.asm
# Program: To implement addressing by indirect address
.text
main:
	# Prompt user for the two inputs
	# Storing the first value in the first bytes of the .data section
	la $a0, prompt
	jal PromptInt
	lui $t0, 0x1001
	sw $v0, 0($t0)
	addi $t0, $t0, 4
	
	# Storing the second value in the second 4 bytes of the .data section
	jal PrintNewLine
	la $a0, prompt2
	jal PromptInt
	sw $v0, 0($t0)
	
	# Calculate mpg (using labels)
	subi $t0, $t0, 4
	lw $t1, 0($t0)
	addi $t0, $t0, 4
	lw $t2, 0($t0)
	addi $t0, $t0, 4
	div $t1, $t2
	mflo $t0
	move $a1, $t0
	
	# Print out the presentation
	la $a0, div_present
	jal PrintInt
	jal Exit
	
	
.data
	.word 0
	.word 0
	.word 0
    prompt:		.asciiz "---Please enter your number of miles: "
    prompt2:	.asciiz "---Please enter your number of gallons: "
    div_present:	.asciiz ">>>> Here is your mpg: "
.include "utils.asm"
	