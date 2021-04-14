.text
main:
	# init x, y, z, i, j
	li $t0, 1
	li $t1, 1
	li $t2, 1
	li $s0,	1
	li $s1, 2
	
	# if
	ble $s0, $s1, if
	# else
	addi $t1, $t1, -1
	mul $t2, $t2, 2
	j endif
if:
	addi $t0, $t0, 1
	li $t2, 1
	j endif
	
endif:
	# print x, y, z
	add $a0, $t0, $zero
	jal printInt
	jal printSpace
	
	add $a0, $t1, $zero
	jal printInt
	jal printSpace
	
	add $a0, $t2, $zero
	jal printInt
	jal printSpace
	
	li $v0, 10
	syscall
	
.include "utils.asm"
	
	