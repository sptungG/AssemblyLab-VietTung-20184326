.text
main:
	# init n
	li $s0, 25
	
	li $s1, 2
	outerLoop:
		bgt $s1, $s0, outerLoopExit
		li $t0, 2
		# $t2 is a flag to check if $s1 to a prime
		li $t2, 0
		innerLoop:
			bge $t0, $s1, innerLoopExit
			rem $t1, $s1, $t0
			beqz $t1, divisibleIf
			addi $t0, $t0, 1
			j innerLoop
			divisibleIf:
				li $t2, 1
		innerLoopExit:
			beqz $t2, printPrime
			j continueToOuterLoop
			printPrime:
				add $a0, $zero, $s1
				jal printInt
				jal printSpace
			continueToOuterLoop:
				addi $s1, $s1, 1
				j outerLoop
	outerLoopExit:
		li $v0, 10
		syscall
		
.include "utils.asm"
			
			
			
			
	