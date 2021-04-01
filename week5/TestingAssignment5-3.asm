#testutils Assignment5
.data
	prompt_a: .asciiz "----- NOR...\n"
	prompt_b: .asciiz "----- NAND...\n"
	prompt_c: .asciiz "----- NOT...\n"
	prompt_f: .asciiz "----- SWAP..."
	prompt_d: .asciiz "\n-----Testing Mult4 subprogram...\n"
 	prompt_e: .asciiz "\n-----Testing Mult10 subprogram...\n"
 	prompt_g: .asciiz "\n-----Testing RightCircularShift\n"
 	prompt_h: .asciiz "\n-----Testing LeftCircularShift\n"
 	
 	result_d: .asciiz "==> Mult4 : "
 	result_e: .asciiz "==> Mult10 : "
 	before_swap: .asciiz "\n=== Before the swap: \n"
        after_swap: .asciiz "\n==> After the swap: \n"
 	result_g: .asciiz "\nValue after right circular shift: "
 	result_gg: .asciiz "Value of the bit which has been shifted: "
 	result_h: .asciiz "\nValue after left circular shift: "
.text
	main:
	jal PromptInt 
	move $a1, $v0
	jal PromptInt
	move $a2, $v0
	
	# a/ NOR subprogram
	li $v0, 4
	la $a0, prompt_a
	syscall
	jal NOR
	move $s0, $v0
	
	addi $v0, $zero, 35
	la $a0, ($s0)
	syscall
	jal PrintNewLine
	
	# b/ NAND subprogram
	li $v0, 4
	la $a0, prompt_b
	syscall
	jal NAND
	move $s0, $v0
	addi $v0, $zero, 35
	la $a0, ($s0)
	syscall
	jal PrintNewLine
	
	# c/ NOT subprogram
	li $v0, 4
	la $a0, prompt_c
	syscall
	jal NOT
	move $s0, $v0
  	addi $v0, $zero, 35
	la $a0, ($s0)
	syscall
	jal PrintNewLine
	
	# f/ SWAP subprogram
	li $v0, 4
	la $a0, prompt_f
	syscall
	# Print out the before presentation
	addi $v0, $zero, 4
	la $a0, before_swap	#TODO
	syscall
	
	# Print out the before integers in binary
	addi $v0, $zero, 35
	la $a0, ($a1)
	syscall
	jal PrintNewLine
	addi $v0, $zero, 35
	la $a0, ($a2)
	syscall
	
	jal Swap
	
	# Print out the after presentation
	addi $v0, $zero, 4
	la $a0, after_swap
	syscall
	# Print out the integers in binary swapped
	addi $v0, $zero, 35
	la $a0, ($a1)
	syscall
        jal PrintNewLine
	addi $v0, $zero, 35
	la $a0, ($a2)
	syscall
	jal PrintNewLine
	
	# d/ Mult4
	la $a0, prompt_d
	syscall
	jal PromptInt
	jal Mult4 #returns the value in $v0
	move $a1, $v0 #moves the returned result of mult10 to a1 argument register for PrintInt
	li $v0, 4
	la $a0, result_d
	jal PrintInt #display results with added string
	
	# e/ Mult10
	li $v0, 4
	la $a0, prompt_e
	syscall
	jal PromptInt
	jal Mult10 #returns the value in $v0
	move $a1, $v0#moves the returned result of mult10 to a1 argument register for PrintInt
	li $v0, 4
	la $a0, result_e
	jal PrintInt#display results with added string
	
	# g/ RightCircularShift ror
	li $v0, 4
	la $a0, prompt_g
	syscall
	jal PromptInt
	jal RightCircularShift
	move $a1, $t0#moves the returned result of RCS to a1 argument register for PrintInt
	li $v0, 4
	la $a0, result_gg
	jal PrintInt#display results with added string

	move $a1, $v1#moves the returned result of RCS to a1 argument register for PrintInt
	li $v0, 4
	la $a0, result_g
	jal PrintInt#display results with added string
	
	# h/ LeftCircularShift rol
	li $v0, 4
	la $a0, prompt_h
	syscall
	jal PromptInt
	jal LeftCircularShift
	move $a1, $t1#moves the returned result of RCS to a1 argument register for PrintInt
	li $v0, 4
	la $a0, result_gg
	jal PrintInt#display results with added string
	move $a1, $v1#moves the returned result of RCS to a1 argument register for PrintInt
	li $v0, 4
	la $a0, result_h
	jal PrintInt#display results with added string
	
	#exit program
	jal Exit#always call this to exit
	
.include "utils.asm"
