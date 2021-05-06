
# ======================== ========================
#subprogram Exit
#Purpose: to use syscall service 10 to exit programm
#Side effect: The program is exited
#***input: None
#***Output: None
.text
Exit:
    li $v0,10
    syscall
# ======================== ========================
#subprogram PrintNewLine
#Purpose: to output a new line to user console
#Side effect: A new line character is printed to the user's console
#***input: None
#***Output: None
.text
PrintNewLine:
	li $v0,4
	la $a0, __PNL_newLine
	syscall
	jr $ra
.data
	__PNL_newLine: .asciiz "\n"
# ======================== ========================
#subprogram PrintString
#Purpose: to print String to the console
#***input: $a0 - the address of the sting to print
#***return: None
#Side effect: the String is printed to the console
.text 
PrintString:
	addi $v0, $zero, 4
	syscall
	jr $ra
# ======================== ========================
#subprogram PrintInt
#Purpose: to print String to the console
#***input: $a0 - the address of the sting to print
#	   $a1 - the value of the int to print
#***return: None
#Side effect: the String is printed followed by the integer value
.text 
PrintInt:
	#Print String. the string address is already in $a0
	li $v0, 4
	syscall
	#print integer. The integer value is in $a1, and must be first moved to $a0
	move $a0, $a1
	li $v0,1
	syscall
	# return
	jr $ra
# ======================== ========================
#subprogram PrintBinary
#***input: $a0 - the address of the sting to print
#	   $a1 - the value of the int to print
#***return: None
.text 
PrintBinary:
	# Print string. The string address is already in $a0
	li $v0, 4
	syscall
	# Print integer, the integer value is in $a1, and must be first moved to $a0
	move $a0, $a1
	li $v0, 35
	syscall
	# return
	jr $ra
# ======================== ========================
#subprogram PromptInt
#Purpose: to print the user for an integer input and return that input value to the caller
#***input: $a0 - the address of the sting to print
#***return: $v0 - The value the user entered
#Side effect: the String is printed followed by the integer value
.text
	PromptInt:
 	# Print the prompt, which is already in $a0
 	li $v0, 4
	syscall
 	# Read the integer value. Note that at the end of the
 	# syscall the value is already in $v0, so there is no
 	# need to move it anywhere.
 	move $a0, $a1
 	li $v0, 5
 	syscall
 	#return
 	jr $ra
# ======================== ========================
#subprogram PrintTab
.text
PrintTab:
	li $v0, 4
	la $a0, tab
	syscall
	jr $ra
.data 
	tab: .asciiz "\t"
# ======================== ======================== 
# Subprogram: PrintIntArray
# Purpose: print an array of ints
# inputs: $a0 - the base address of the array
#         $a1 - the size of the array
#
.text
PrintIntArray:
	addi $sp, $sp, -16	# Stack record
	sw $ra, 0($sp)
	sw $s0, 4($sp)
	sw $s1, 8($sp)
	sw $s2, 12($sp)

	# save the base of the array to $s0
	move $s0, $a0

	# initialization for counter loop
	# $s1 is the ending index of the loop
	# $s2 is the loop counter
	move $s1, $a1
	move $s2, $zero

   	la $a0 open_bracket
   	jal PrintString
loop:
    # check ending condition
    sge $t0, $s2, $s1
    bnez $t0, end_loop
        sll $t0, $s2, 2
        add $t0, $t0, $s0
        lw $a1, 0($t0)
        la $a0, comma
        jal PrintInt
        addi $s2, $s2, 1
        b loop
end_loop:
    li $v0, 4
    la $a0, close_bracket
    syscall
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    lw $s2, 12($sp)
    addi $sp, $sp, 16
    jr $ra
.data
    open_bracket:	.asciiz "["
    close_bracket:	.asciiz "]"
    comma:	.asciiz ","
    

