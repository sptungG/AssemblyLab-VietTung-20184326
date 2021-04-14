.text
main:
	# init i, j
	li $s0,	1
	li $s1, 1
	
	# i < j -> execute else -> result should be 1 0 2
	jal initXYZ
	jal caseOne
	
	# i >= j -> execute if -> result shouble be 2 1 1
	jal initXYZ
	jal caseTwo
	
	# i + j <= 0 -> execute else -> result should be 1 0 2
	jal initXYZ
	jal caseThree
	
	# i + j > m + n -> execute else -> result should be 1 0 2
	jal initXYZ
	li $s2, 2
	li $s3, 2
	jal caseFour
	
	# end program
	li $v0, 10
	syscall

caseOne:
	# if
	blt $s0, $s1, if
	# else
	j else
	
caseTwo:
	# if
	bge $s0, $s1, if
	# else
	j else
	
caseThree:
	add $t3, $s0, $s1
	# if
	ble $t3, 0, if
	# else
	j else

caseFour:
	add $t3, $s0, $s1
	add $t4, $s2, $s3
	# if
	bgt $t3, $t4, if
	# else
	j else

if:
	addi $t0, $t0, 1
	li $t2, 1
	j endif
	
else :
	addi $t1, $t1, -1
	mul $t2, $t2, 2
	j endif
	
endif:
	# store $ra
	addi $sp, $sp, -4
	sw $ra, 0($sp)
	
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
	
	jal printNewLine
	
	# load $ra and jump
	lw $ra, 0($sp)
	jr $ra
	
initXYZ:
	li $t0, 1
	li $t1, 1
	li $t2, 1
	jr $ra
	
		
.include "utils.asm"
	
	