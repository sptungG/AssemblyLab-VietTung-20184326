# Implement a Binary Search algorithm, and using the results from Exercise 10.3, show how long 
# the Binary Search takes (on average) for arrays of size 10, 100, and 1000. (You do not have 
# to print out the values in the array)

.data
	prompt: .asciiz "----Input array size: "
	generateArray: .asciiz "----Random array: "
	afterSorted: .asciiz "\n>>>>After sort: "
	absentMessage: .asciiz " was not found."
	presentMessage: .asciiz " was found."
	prompt1: .asciiz "\n----Input value to find: "
.text
.globl main
main:
	
	#--------------Ask for array size
	la $a0, prompt
	jal PromptInt
	move $s0, $v0 	#$s0 is array size now
	
	sll $t0, $s0, 2 	#t0 is total space needed to store whole s0 elements in array
	sub $sp, $sp, $t0
	
	#--------------start generate array
	addi $t0, $t0, -4
	generateLoop:
		#if $t0 <0 --> end loop
		slt $t1, $t0, $zero
		bnez $t1, end_generateLoop
		#get random number
		li $a1, 100 #boundary for random number
		li $v0, 42 #-->return to $a0
		syscall
		
		add $t1, $t0, $sp 	#get address of index ($t0/4)
		sw $a0, 0($t1)
		
		#decrease value of t0 by -4
		addi $t0, $t0, -4
		j generateLoop
	end_generateLoop:
	
la $a0, generateArray
jal PrintString
#Print initial array
move $a0, $sp
move $a1, $s0
jal PrintIntArray
#Sorting
move $a0, $sp
move $a1, $s0
jal BubbleSort

jal PrintNewLine

#print sorted array
la $a0, afterSorted
jal PrintString

move $a0, $sp
move $a1, $s0
jal PrintIntArray

la $a0, prompt1
jal PromptInt

move $a1, $v0	#Value to find
addi $a2, $s0, -1	#last index of array (size-1)
move $a0, $sp	#address of arrays

jal BinarySearch

addi $a2, $s1, 0
jal OutputMessage	# Execute OutputMessage subroutine	

jal Exit

#Subprogram: BinarySearch########################################
#Purpose: find specific value by Binary Search algorithms
#input: $a0 - base address of input array
#	$a1 - value needed to find in array
#	$a2 - last index of array (size-1)
#Ouput: s1 - 1 mean found, 0 means not found
BinarySearch:
		addi	$t1, $zero, 0		# Store 0 in register for start value
		add	$t2, $zero, $a2		# Store 4 in register for end value (length - 1)
		
	startLoop:		
		addi	$t3, $t1, 1		# Add 1 to start
				
		bgt	$t3, $t2, endLoop	# if (start + 1 > end)
		beq	$t3, $t2, endLoop	# if (start + 1 == end)
		
		sub	$t4, $t2, $t1		# (end - start)
		div	$t4, $t4, 2		# (end - start) / 2
		add	$t5, $t1, $t4		# mid = start + ((end - start) / 2)
		
		mul	$t7, $t5, 4		# Multiply mid by word length to use as offset
						
		add 	$t6, $a0, $t7		# testdata[mid] 
		lw	$t6, 0($t6)		# Load value from testdata[mid]
		
		bgt	$a1, $t6, afterElse	# if (target > data[mid]) jump to afterElse
		beq	$a1, $t6, afterElse	# if (target == data[mid]) jump to afterElse
		
		add	$t2, $zero, $t5		# end = mid
		j 	startLoop
		
	afterElse:
		add	$t1, $zero, $t5		# start = mid
		j	startLoop
		
	endLoop:	
		mul	$t7, $t1, 4		# Multiply start by word length to use as offset
		
		add 	$t6, $a0, $t7		# testdata[start]
		lw	$t6, 0($t6)		# Load value at testdata[start]
		
		bne	$a1, $t6, notStart	# If (target != testdata[start])
		addi	$s1, $zero, 1 		# Store 1 in register $s1, indicating presence of target value
		j	finish
		
	notStart:	
		mul	$t7, $t2, 4		# Multiply start by word length to use as offset
				
		add 	$t6, $a0, $t7		# testdata[end]
		lw	$t6, 0($t6)		# Load value at testdata[end]
		
		bne	$a1, $t6, notEnd	# If (target != testdata[end])
		addi	$s1, $zero, 1 		# Store 1 in register $s1, indicating presence of target value
		j	finish
	notEnd:		
		addi	$s1, $zero, 0		# Store 0 in register $s1, indicating absence of target value

finish:	
		jr	$ra	
#Subprogram###############
#Purpose: pring final result base on input value a2(1 or 0)
OutputMessage:	
		li	$v0, 1
		add	$a0, $a1, 0		# Print target number to preface output message
		syscall
				
		bne	$a2, 0, present		# Check register $a2 for presence of 0 (which would indicate the target number's absence)
		
	absent:		
		li	$v0, 4
		la	$a0, absentMessage	# Output message indicating absence of number
		syscall
		
		j	OutputMessageEnd

	present:
		li	$v0, 4
		la	$a0, presentMessage	# Output message indicating presence of number
		syscall
			
OutputMessageEnd:
	jr	$ra

.include "utils.asm"
.include "bubbleSortt.asm"
