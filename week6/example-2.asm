
.text
 	lw $t0, x
 	sgt $t1, $t0, $zero
 	li $t5, 10
 	slt $t2, $t0, $t5
 	rem $t3, $t0, 2
 	not $t3,$t3
 	and $t1, $t1, $t2
 	and $t1,$t1,$t3
	la $a0, PositiveNumber
	jal PrintString
# }
end_if:
 	jal Exit
.data
	x: .word 5
	PositiveNumber: .asciiz "|||| Number is positive"
.include "utils.asm"