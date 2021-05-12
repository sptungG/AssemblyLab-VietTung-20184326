# The following pseudo code programs calculates the Fibonacci numbers from 1..n, and stores 
# them in an array. Translate this pseudo code into MIPS assembly, and use the PrintIntArray 
# subprogram to print the results
# main{
#    int size = PromptInt("Enter a max Fibonacci number to calc: ")
#    int Fibonacci[size]
#    Fibonacci[0] = 0
#    Fibonacci[1] = 1
# for (int i = 2; i < size; i++){
#    Fibonacci[i] = Fibonacci[i-1] + Fibonacci[i-2]
# }
# PrintIntArray(Fibonacci, size)
#}

# Program:	To print out the fibonacci numbers up to an inputted number through an array
.text
main:
	# Read in the number
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	
	# Edge case of either 0 or 1 being inputted
	bgt $s0, 1, continue
	  la $a0, openbracket	#TODO
	  la $a1, 0
	  jal PrintInt
	  blt $s0, 1, short
	    la $a0, comma	#TODO
	    la $a1, 1
	    jal PrintInt
	    la $a0, closedbracket #TODO
	    jal PrintString
	    jal Exit
	  short:
	  la $a0, closedbracket
	  jal PrintString
	  jal Exit
	  
	continue:
	# Calculate the fibonacci numbers up to and store them in an array
	# $s0 - size of array
	# $s1 - base of the array
	# $t0 - Tracking how many bytes from the base
	# $t1 - First lagging number, $t2 - second lagging number
	# $t3 - The counter to make sure we don't surpass the given input
	# $t4 - To keep the sum of $t1 and $t2
	# $t5 - To keep the address of the $s1 and $t0 summed together
	# Allocate the memory, store 0 and 1 in the first two word spaces, then 
	# have a temporary variable $t0 be incremented by 4 for every space needed
	# and add that to the base address to know where to put the next number
    
	mul $a0, $s0, 4
	addi $v0, $zero, 9
	syscall
	move $s1, $v0
	sw $t1, 0($s1)
	addi $t1, $t1, 1
	sw $t1, 4($s1)
	
	# Pre-load $t0 with 8 since the first two spots are taken by 0 and 1
	addi $t0, $t0, 8
	
	# Fibonacci loop
	Fibloop:
	beq $t3, $s0, printingtime
	
	  # Our two lagging numbers for adding into the fib number
	  subi $t1, $t0, 4
	  subi $t2, $t0, 8
	  
	  # Getting the address of the two lagging numbers by adding to the base_address
	  add $t1, $s1, $t1
	  add $t2, $s1, $t2
	  lw $t1, ($t1)
	  lw $t2, ($t2)
	  
	  # Adding the numbers together then storing that word into the correct spot from the base
	  add $t4, $t1, $t2
	  add $t5, $t0, $s1
	  sw $t4, ($t5)
	  
	  # Incrementing the counter and $t0 (tracker of the location on the heap)
	  addi $t0, $t0, 4
	  addi $t3, $t3, 1
	  b Fibloop
	printingtime:
	la $a0, ($s1)
	la $a1, ($s0)
	jal PrintIntArray
	jal Exit

.data
prompt:		.asciiz "Please enter a number to find the fibonacci numbers up to it: "
openbracket:	.asciiz "["
closedbracket:	.asciiz "]"

.include "utils.asm"
	