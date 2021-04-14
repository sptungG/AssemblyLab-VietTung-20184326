.data
	myArr: .space 16
	n: .word 4
.text
	# init array {1, -2, -5, 3}
	la $s0, myArr
	li $t0, 1
	sw $t0, 0($s0)
	li $t0, -2
	sw $t0, 4($s0)
	li $t0, -5
	sw $t0, 8($s0)
	li $t0, 3
	sw $t0, 12($s0)
	
	# i -> $t0, n -> $s0, max -> $t1, idx_max -> $t2
	li $t0, 0
	lw $s0, n
	li $t1, 0
	loop:
		beq $t0, $s0, exitLoop
		# take current element
		mul $t3, $t0, 4
		lw $a0, myArr($t3)
		# take the abs of current element
		jal abs
		move $t3, $v0
		# if
		blt $t1, $t3, if
		j continue
		if:
			# store value and index of max element
			move $t1, $t3
			move $t2, $t0
		continue:
			addi $t0, $t0, 1
			j loop
	exitLoop:
		# print element that has max abs value
		mul $t2, $t2, 4
		lw $a0, myArr($t2)
		jal printInt
		
		li $v0, 10
		syscall

.include "utils.asm"