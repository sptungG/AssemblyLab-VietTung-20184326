# The following pseudo code converts an input
# value of a single decimal number from
# 1?n?15 into a single hexadecimal digit.
# Translate this pseudo code into MIPS
# assembly.
# Program: To print out an inputted integer in it's hexadecimal form
.text
main:
	# Read in the integer
	la $a0, prompt	#TODO
	jal PromptInt
	move $s0, $v0
	
	la $a0, present
	li $v0, 4 # Print the prompt
	syscall
	# Multiply the input by 4 and print out the correct hex
	mul $s0, $s0, 4
	la $a0, base_address
	add $a0, $a0, $s0
	jal PrintString
	jal Exit	
.data
	prompt:		.asciiz "----Please enter an number from 0 to 15: "
	present:	.asciiz ">>>> Hex: "
base_address:
	.asciiz "0x0"
	.asciiz "0x1"
	.asciiz "0x2"
	.asciiz "0x3"
	.asciiz "0x4"
	.asciiz "0x5"
	.asciiz "0x6"
	.asciiz "0x7"
	.asciiz "0x8"
	.asciiz "0x9"
	.asciiz "0xa"
	.asciiz "0xb"
	.asciiz "0xc"
	.asciiz "0xd"
	.asciiz "0xe"
	.asciiz "0xf"
	
.include "utils.asm"