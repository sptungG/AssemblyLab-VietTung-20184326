.text
	# init a, b, test
	li $t0, 1
	li $t1, 1
	li $s0, 2
	
	# switch
	beq $s0, 0, caseZero
	beq $s0, 1, caseOne
	beq $s0, 2, caseTwo
	j default
	
	caseZero:
		addi $t0, $t0, 1
		j continue
	caseOne:
		addi $t0, $t0, -1
		j continue
	caseTwo:
		add $t1, $t1, $t1
		j continue
	default:
	continue:
		# print a and b
		move $a0, $t0
		jal printInt
		jal printSpace
		
		move $a0, $t1
		jal printInt
		jal printSpace
		
		li $v0, 10
		syscall
		
.include "utils.asm"
