.data
	myArr: .word 1:5
	n: .word 5
	step: .word 1
.text
main:
	# i = $t0, sum = $t1, n = $s0, step = $s1
	li $t0, 0
	li $t1, 0
	lw $s0, n
	lw $s1, step
	
	# loop
	loop:
		mul $t2, $t0, 4
		lw $t3, myArr($t2)
		add $t1, $t1, $t3
		add $t0, $t0, $s1
		ble $t0, $s0, loop
	endLoop:
		# print sum
		move $a0, $t1
		jal printInt
		
		li $v0, 10
		syscall
.include "utils.asm"
	