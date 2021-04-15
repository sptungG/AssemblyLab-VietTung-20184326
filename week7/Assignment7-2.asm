#.data
#x: .space 1000
#y: .asciiz "Hello"
#.text
#	la	$a0, x
#	la	$a1, y
#strcpy:
#	add 	$s0, $zero, $zero	# so = i = 0
#L1:
#	add	$t1, $s0, $a1		# t1 = s0 + a1 = i + y[0]
#					#    = address of y[i]
#	lb	$t2, 0($t1)		# t2 = value at t1 = y[i]
#	add	$t3, $s0, $a0		# t3 = s0 + a0 = i + x[0]
#					#    = address of x[i]
#	sb	$t2, 0($t3)		# x[i] = t2 = y[i]
#	beq	$t2, $zero, end_of_strcpy # if y[i] == 0, exit
#	nop
#	addi	$s0, $s0, 1		# s0 += 1 
#	j 	L1
#	nop
#end_of_strcpy:		

.data
	message1:	.asciiz "The sum of "
	and_mes:	.asciiz " and "
	is_mes:		.asciiz " is "
.text
	li	$s0, 99
	li	$s1, 100
	add	$s2, $s0, $s1 	# s2 = s1 + s2
	
	la	$a0, message1
	li	$v0, 4
	syscall
	move	$a0, $s0
	li	$v0, 1
	syscall
	la	$a0, and_mes
	li	$v0, 4
	syscall
	move	$a0, $s1
	li	$v0, 1
	syscall
	la	$a0, is_mes
	li	$v0, 4
	syscall
	move	$a0, $s2
	li	$v0, 1
	syscall
	
	