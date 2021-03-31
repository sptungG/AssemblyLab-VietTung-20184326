# Hello Assembly!

.data 
	#message: .asciiz  "Hello World \n"
	#myCharacter: .byte 'a'
	#age: .word 21 # a word or integer
	#PI: .float 3.14
	#myDouble: .double 7.2323
	#zeroDouble: .double 0.0
	num1: .word 5
	num2: .word 10
.text
	#li $v0, 4 #sys
	 #la $a0, message
	 #la $a0, myCharacter
	
	#print an integer
	 #li $v0, 1
	 #lw $a0, age
	
	#print a float 
	 #li $v0, 2
	 #lwc1 $f12, PI 
	 
	#print a double
	 #ldc1 $f2, myDouble
	 #ldc1 $f0, zeroDouble
	 
	 #li $v0, 3 #double
	 #add.d $f12, $f2, $f0
	 
	# ADD integer
	  lw $t0, num1($zero)
	  lw $t1, num2($zero)
	 
	  add $t2, $t0, $t1 # t2 = t0 + t1
	 
	  li $v0, 1
	  add $a0, $zero, $t2
	# Subtrac integer
	  lw $s0, num1 #s0 = 5
	  lw $s1, num2 # s1 = 10
	 
	  sub $t0, $s0, $s1 # t0 = 5 - 10
	 
	  li $v0, 1
	  move $a0, $t0
	#===== Multiplying Integers mul
	 addi $s0, $zero, 10 # add 10 + 0 to s0
	 addi $s1, $zero, 4 
	 # Only mul small, & 2 integers
	 mul $t0, $s0 , $s1
	 # Display the product
	 li $v0, 1
	 add $a0, $zero, $t0
	
	#----- mult, BIG num
	addi $t0, $zero, 2000
	addi $t1, $zero, 10
	
	 mult $t0, $t1
	
	 mflo $s0
	 #mfhi $s1
	
	 #display the product
	 li $v0,1
	 add $a0, $zero, $s0
	
	#----- sll
	 addi $s0, $zero, 4
	 
	 sll $t0, $s0, 2
	 #print
	 li $v0, 1
	 add $a0, $zero, $t0 
	
	syscall 