 .text

.globl main

main:
    # put mssge 1
    la $a0, msg1
    jal PromptInt
    move $t1, $v0
    # put mssge 2
    la $a0, msg2
    jal PromptInt
    move $t2, $v0
    # if n1 == n2
    bne $t1, $t2, continue1
    la $a0, msg4
    jal PrintString
    j exit

    continue1:

    blt $t1,$t2, continue2
    la $a0, msg3
    jal PrintString

    move $t4, $t1
    move $t1, $t2
    move $t2, $t4

    continue2:

    bgt $zero,$t1, negRange
    j continue3

    negRange:
        la $a0, msg5
        jal PrintString

        j exit

    continue3:
    addi $t1, $t1, 1
	
    # n and n+1 handle
    beq $t1, $t2, noRange
    j loop
    noRange:
  
        la $a0, msg4
        jal PrintString
        j exit
    # for loop for printing primes
    loop:       
        # put num in $a0
        #checkPrime called with jal 
        move $a0, $t1
        jal checkPrime
        #if $v0 is yes print else dont
        move $t8, $v0
        beq $t8, $zero, continue

        li $v0, 1
        move $a0, $t1
        syscall
        jal PrintNewLine
    continue:
        #update n1
        addi $t1, $t1, 1
        #loop till _i < n2
        beq $t1, $t2, end_loop
        j loop
    end_loop:
exit:
    jal Exit

# function for checking a number prime
# a0 gets number, v0 gets the return yes/no
# without stack

checkPrime:
    li $t0, 2
    # loop
    li $t6, 1
    beq $a0, $t6, not_prime 
    
    loopCheck:
        rem $t3, $a0, $t0
        beq $a0,$t0,end_loop_yes
        beq $t3, $zero, not_prime
        addi $t0, $t0, 1
        beq $t0, $a0, end_loop_yes
        j loopCheck
    # put yes/no in $v0
    not_prime:
        li $v0, 0
        jr $ra
    end_loop_yes:
        li $v0, 1
        jr $ra


.data
	msg1: .asciiz "Enter first number: "
	msg2: .asciiz "Enter second number: "
	msg3: .asciiz "Second number is less than First, exchanging and finding\n"
	msg4: .asciiz "no number in between the range!\n"
	msg5: .asciiz "negative range!\n"
	endline: .asciiz "\n"

.include "utils.asm"