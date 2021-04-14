.data
	numberText: .asciiz "Number "
	isPrimeText: .asciiz " is a prime\n"
	notPrimeText: .asciiz " is not a prime\n"
	prompt: .asciiz "Enter an integer: "
	errorText: .asciiz "Error\n"
.text
main:
	outerLoop:
		# prompt an integer
		la $a0, prompt
		jal printString
		jal readInt
		move $s0, $v0
		beq $s0, -1, exitOuterLoop
		
		# if $s0 <= 2
		ble $s0, 2, printError
		# else
		li $t0, 2
		li $t1, 0
		innerLoop:
			bge $t0, $s0, exitInnerLoop
			rem $t2, $s0, $t0
			# if $s0 is divible by $t0
			beqz $t2, divisible
			# else
			addi $t0, $t0, 1
			j innerLoop
			divisible:
				li $t1, 1
		exitInnerLoop:
			# if $t1 == 0 -> $s0 is a prime
			beqz $t1, printPrime
			# else
			j printNotPrime
			
			printPrime:
				la $a0, numberText
				jal printString
				move $a0, $s0
				jal printInt
				la $a0, isPrimeText
				jal printString
				j continueToOuterLoop
			printNotPrime:
				la $a0, numberText
				jal printString
				move $a0, $s0
				jal printInt
				la $a0, notPrimeText
				jal printString
				j continueToOuterLoop
			continueToOuterLoop:
				j outerLoop

		printError:
			la $a0, errorText
			jal printString
			j outerLoop
		
	exitOuterLoop:
		li $v0, 10
		syscall
		
.include "utils.asm"
	