.data
	maxBound: .asciiz "Enter an max bound: "
	guess: .asciiz "Enter a guess: "
	tooHigh: .asciiz "Too high\n"
	tooLow: .asciiz "Too low\n"
	num: .asciiz "Number of guesses: "
	win: .asciiz "Congratulations! Random number is: "
.text
	# prompt to get max bound
	la $a0, maxBound
	jal printString
	jal readInt
	
	# random a number
	move $a1, $v0
	li $v0, 42
	syscall
	move $s0, $a0
	
	# number of gueses -> $t0
	li $t0, 0
	loop:
		# prompt a guess
		la $a0, guess
		jal printString
		jal readInt
		move $t1, $v0
		addi $t0, $t0, 1
		# if correct
		beq $t1, $s0, endLoop
		# else if a guess is smaller than a random
		blt $t1, $s0, printTooLow
		# else
		la $a0, tooHigh
		jal printString
		j continueToLoop
		
		printTooLow:
			la $a0, tooLow
			jal printString
		continueToLoop:
			j loop
		
	endLoop:
		la $a0, win
		move $a1, $s0
		jal printStringAndInt
		
		jal printNewLine
		
		la $a0, num
		move $a1, $t0
		jal printStringAndInt
		
		li $v0, 10
		syscall
		
.include "utils.asm"
	