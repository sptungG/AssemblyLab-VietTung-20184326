.data
	num: .word -5
	PositiveNumber: .asciiz "++++++ Number is Positive"
	NegativeNumber: .asciiz "------ Number is Negative"

.text
	lw $t0,num
	sgt $t1,$t0,$zero
	beqz $t1, else
		#if block
		la $a0, PositiveNumber
		jal PrintString
		b end_if
		#else block
	else:
		la $a0,NegativeNumber
		jal PrintString
	end_if:
	jal Exit
.include "utils.asm"