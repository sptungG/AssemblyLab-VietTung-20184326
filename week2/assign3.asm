#Write a program which prompts the user to enter their favorite type of pie.
#The program should then print out "So you like _____ pie", where the blank line is replaced by the pie type entered.
.data
	string1: .asciiz "Enter in your favorite kind of pie:"
	string2: .asciiz "So you like "
	string3: .asciiz "pie."
	userInput: .space 20 #can enter up to 20 chars(holds user input)
.text
	main:
	#tell user to enter in text 
	li $v0, 4
	la $a0, string1
	syscall
	#read in input
	li $v0, 8
	la $a0, userInput
	li $a1, 20
	syscall
	#ouput data
	li $v0, 4
	la $a0, string2
	syscall
	#output user data
	li $v0, 4
	la $a0, userInput
	syscall
	#ouput end of data
	li $v0, 4
	la $a0, string3
	syscall
	#exit the program
	li $v0, 10
	syscall