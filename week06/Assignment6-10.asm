.text
.globl main
main:
	la $a0,max
	jal PromptInt
	
	move $a1,$v0
    	li $v0, 42          # Service 41, random int    
    	syscall            # Generate random int (returns in $a0)
    	move $t1,$a0
#   	li $v0, 1          # Service 1, print int
#  	syscall 
while:	
	la $a0,guess
	jal PromptInt
	
	bgt $v0,$t1,great
	blt $v0,$t1,loww
	beq $v0,$t1,equal
great:
	la $a0,high
	jal PrintString
	j while
loww:
	la $a0,low
	jal PrintString
	j while
equal:
	la $a0,right
	jal PrintString
	j exit
exit:  	
    	jal Exit
    	
.data
	max: .asciiz"Max Value: "
	guess: .asciiz"\nYour guess:"
	high: .asciiz"\nYour guess is too high"
	low: .asciiz"\nYour guess to too low"
	right: .asciiz"\nYour guess is right"

.include "utils.asm"