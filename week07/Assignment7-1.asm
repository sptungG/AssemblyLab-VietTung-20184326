.data
prompt: .asciiz "What is your name? "
message: .asciiz "**** Hello "
string:	.space 20

.text

	li 	$v0, 4
	la	$a0, prompt
	syscall
	
	li	$v0, 8
	la	$a0, string
	li	$a1, 20
	syscall
	move	$s0, $a0
	
	la	$a0, message
	li	$v0, 4
	syscall
	move	$a0, $s0
	li	$v0, 4
	syscall
