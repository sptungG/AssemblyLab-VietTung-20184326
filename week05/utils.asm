# Assignment 5.3 

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
	la $a0, promptint
	syscall
 	# Read the integer value. Note that at the end of the
 	# syscall the value is already in $v0, so there is no
 	# need to move it anywhere.
 	move $a0, $a1
 	li $v0, 5
 	syscall
 	#return
 	jr $ra
 .data
 	promptint: .asciiz "---- Enter in an integer: "
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
# ======================== ======================== ======================== 
# Assignment 5.3  Assignment 5.3  Assignment 5.3
# Program: A few utility subprograms for inclusion in other files
# ======================== ========================
# Subprogram Name: NOR
# Purpose: To output the NOR of a given input values
# ***Input: $a0 - The first input integer
#	        $a1 - The second input intger
# ***Output: $v0 - The Nor version of the inputs
# Side Effects: None
.text
NOR:
	nor $v0, $a1, $a2
	jr $ra
# ======================== ========================
# Subprogram Name: NAND
# Program: To output the NAND of a given input values
# ***Input: $a0 - The first input integer
#	        $a1 - The second input intger
# ***Output: $v0 - The NAND version of the inputs
# Side Effects: None
.text
NAND:
	and $v0, $a1, $a2
	not $v0, $v0
	jr $ra
# ======================== ========================
# Subprogram Name: NOT
# Program: To output the NOT of a given input value
# ***Input: $a0 - The input integer
# ***Output: $v0 - The Not version of the input
# Side Effects: None
.text
NOT:
	not $v0, $a1
	jr $ra
# ======================== ========================
# Subprogram Name: Mult4
# Program: To output the integer multiplied by 4
# ***Input: $a0 - The input integer
# ***Output: $v0 - The integer multiplied by 4
# Side Effects: None
.text
Mult4:
 	#promptInt is always called before this so the in will already be in $v0
 	move $t5, $v0 #moves integer to $t5
	sll $t3, $t5, 2 #multiplies input by 2^1 = 2 stores answer in t3
	add $v0,$zero, $t3
	jr $ra
# ======================== ========================
# Subprogram Name: Mult10
# Program: To output the integer multiplied by 10
# ***Input: $a0 - The input integer
# ***Output: $v0 - The integer multiplied by 10
# Side Effects: None
.text
 Mult10:
 	#promptInt is always called before this so the in will already be in $v0
 	move $t5, $v0 #moves integer to $t5
 	sll $t2, $t5, 3 #multiplies input by 2^3 = 8 stores answer in t2
 	sll $t3, $t5, 1 #multiplies input by 2^1 = 2 stores answer in t3
 	add $v0,$t2, $t3 #adds the two sll ops($t2,$t3) together and stores in v0 return  register
 	jr $ra #return
# ======================== ========================
# Subprogram Name: Swap (with xor only)
# Program: To swap the given input positions without using a temporary value to hold the original values
# ***Input: $a0 - The first input integer
# 	        $a1 - The second input integer
# ***Output: None
# Side Effects: $a0 and $a1 will be swapped
.text
Swap:
	xor $t0, $a1, $a2
	xor $a1, $a1, $t0
	xor $a2, $a2, $t0
	jr $ra
# ======================== ========================
# Subprogram Name: RightCircularShift
# Program: To rotate the integer value and also show the original integer value in binary
# ***Input: $a0 - The input integer
# ***Output: $v0 - The rotated right integer value
#	         $v1 - The original value
# Side Effects: None
 .text
 RightCircularShift:
 	#promptInt is always called before this so the the entered int will be in $v0
 	andi $t0, $v0,1 # gets the least significant bit(LSB) that is lost by calling RCS stores in t0
 	srl $v1, $v0, 1 #rotates the entered number one bit to the right stores it in v1
 	#return values stored in $v1,$t0
 	jr $ra#return
# ======================== ========================
# Subprogram Name: LeftCircularShift
# Program: To rotate the integer value and also show the original integer value in binary
# ***Input: $a0 - The input integer
# ***Output: $v0 - The rotated left integer value
# 	         $v1 - The original integer value
# Side Effects: None
.text
 LeftCircularShift:
 	#promptInt is always called before this so the the entered int will be in $v0
 	and $t1, $v0, 0x8000 #this gives us the HSB that us shifted
 	sll $v1, $v0, 1 #rotates the entered number one bit to the left stores it in a1
 	#return values stored in $v1,$t1
 	jr $ra #return
# ======================== ========================
# Subprogram Name: ToUpper
# Program: To change a lowercase 3-char string into an uppercase one if it is lowercase
# ***Input:	$a0 - The original string
# ***Output:	None
# Side Effects: $a0 will contain the uppercase string
.text
ToUpper:
	and $a1, $a1, 0x000000df
	jr $ra
# ======================== ========================
# Subprogram Name: ToLower
# Program: To change an uppercase 3 char string into a lowercase one if it is uppercase
# ***Input: $a0 - The original string
# ***Output: None
# Side Effects: $a0 will contain the lowercase string
.text
ToLower:
	or $a1, $a1, 0x00000020
	jr $ra
# ======================== ========================
