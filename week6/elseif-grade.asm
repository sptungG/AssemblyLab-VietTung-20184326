.text
	la $a0, input
	jal PromptInt
	move $s0, $v0 
#if block
	slti $t1,$s0,0
	sgt $t2, $s0,100
	or $t1, $t1,$t2
	beqz $t1,grade_A
	#invalid input block
	la $a0, InvalidInput
	jal PrintString
	b end_if
grade_A:
	sge $t1,$s0,90
	#
	beqz $t1,grade_B
	#
	la $a0, OutputA
	jal PrintString
	b end_if
grade_B:
	sge $t1,$s0,80
	beqz $t1,grade_C
	la $a0, OutputB
	jal PrintString
	b end_if
grade_C:
	sge $t1,$s0,70
	beqz $t1,grade_D
	la $a0, OutputC
	jal PrintString
	b end_if
grade_D:
	sge $t1,$s0,60
	beqz $t1,else
	la $a0, OutputD
	jal PrintString
	b end_if
else: 
	la $a0, OutputF
	jal PrintString
 	b end_if
end_if: 
	jal Exit
.data 
	input: .asciiz "**** Enter your grade(0 100): "
	InvalidInput: .asciiz "<!>Number must be >0 and <100"
	OutputA: .asciiz "<A> A grade"
	OutputB: .asciiz "<B> B grade"
	OutputC: .asciiz "<C> C grade"
	OutputD: .asciiz "<D> D grade"
	OutputF: .asciiz "<F> F grade"
.include "utils.asm"