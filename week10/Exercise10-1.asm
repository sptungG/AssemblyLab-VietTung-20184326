# Change the PrintIntArray subprogram so that
# it prints the array from the last element to the
# first element.

.text
main:
	# Loading the address of the array base and the word sized integer for the .data
	### To do this, we need to multiply the array size by the number of bytes, then
	### subract based on the loop rather than count up 
	la $a0, array_base
	lw $a1, array_size
	jal PrintIntArray
	jal Exit
	
.data
array_size:	.word 8
array_base:	
	.word 2
	.word 4
	.word 1
	.word 5
	.word 3
	.word 6
	.word 7
	.word 8

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
   
.include "utils.asm"          
