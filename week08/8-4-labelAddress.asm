# Program Name: label_address.asm
# Program: To implement addressing by label
.text
main:
	
	# Calculate mpg (using labels)
	li $t0, 10
	li $t1, 2
	div $t0, $t1
	mflo $a1
	
	# Print out the presentation
	la $a0, div_present
	jal PrintInt
	jal Exit
	
	
.data
	prompt:		.asciiz "---Please enter your number of miles: "
	prompt2:	.asciiz "---Please enter your number of gallons: "
	div_present:	.asciiz ">>>> Here is your mpg: "
.include "utils.asm"