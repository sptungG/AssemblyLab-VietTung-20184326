# The AllocateArray subprogram is incorrect in that the allocation can fall on any boundary.
# This is a problem if the array is of elements that must fall on a specific boundary. For
# example, if the array is contains ints, the array allocation must fall on full word boundary.
# a) Using the PromptString and AllocateArray subprograms, show how this problem can
# 	occur.
# b) Change the AllocateArray program to always do allocations on a double word boundary


# Subprogram: AllocateArray
# Purpose: To allocate an array of $a0 items, each of size $a1.
# Author: Charles Kann
# Input: $a0 - the number of items in the array
#	 $a1 - the size of each item
# Output:$v0 - Address of the array allocated
AllocateArray:
	  addi $sp, $sp, -4
          sw $ra, 0($sp)
          mul $a0, $a0, 4	#<<< Question b
          li $v0, 9
          syscall
          lw $ra, 0($sp)
          addi $sp, $sp, 4
          jr $ra

# Purpose: To prompt for a string, allocate the string
# and return the string to the calling subprogram. $a0 - The prompt
# Input: $a1 - The maximum size of the string
#
# Output:$v0 - The address of the user entered string
PromptString:
    addi $sp, $sp, -12  # Push stack
    sw $ra, 0($sp)
    sw $a1, 4($sp)	# Number of word bytes you request
    sw $s0, 8($sp)
    li $v0, 4		# Print the prompt
    syscall
    li $v0, 9		# Allocate memory
    lw $a0, 4($sp)	# The amount requested is allocated
    syscall
    move $s0, $v0	# Read the string
    move $a0, $v0
    li $v0, 8
    lw $a1, 4($sp)	# The amount allocated is the only amount taken in (capped)
    syscall
    move $v0, $a0	# Save string address to return	
    lw $ra, 0($sp)	# Pop stack
    lw $s0, 8($sp)
    addi $sp, $sp, 12
    jr $ra