# Program Name: offset_address.asm
# Program: To implement addressing by offset address
.text
main:
	# Prompt user for the two inputs
	# Storing the first value in the first bytes of the .data section
	la $a0, prompt
	jal PromptInt
	lui $t0, 0x1001
	lw $t0, 0($t0)
	sw $v0, 0($t0)
	
	# Storing the second value in the second 4 bytes of the .data section
	jal PrintNewLine
	la $a0, prompt2
	jal PromptInt
	sw $v0, 4($t0)
	
	# Calculate mpg (using labels)4
	lw $t1, 0($t0)
	lw $t2, 4($t0)
	div $t1, $t2
	mflo $a1
	
	# Print out the presentation
	la $a0, div_present
	jal PrintInt
	jal Exit
	
	
.data
	.word inputs
        prompt:		.asciiz "---Please enter your number of miles: "
        prompt2:	.asciiz "---Please enter your number of gallons: "
    inputs:	
	    .word 0
	    .word 0
    div_present:	.asciiz ">>>> Here is your mpg: "
.include "utils.asm"