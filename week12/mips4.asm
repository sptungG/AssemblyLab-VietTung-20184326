.eqv IN_ADRESS_HEXA_KEYBOARD	0xffff0012
.eqv COUNTER			0xffff0013 # Time Counter
.eqv MASK_CAUSE_COUNTER		0x00000400 # Bit 10: Counter interrupt
.eqv MASK_CAUSE_KEYMATRIX	0x00000800 # Bit 11: Key matrix interrupt
.eqv OUT_ADRESS_HEXA_KEYBOARD	0xffff0014

.data
msg_keypress: .asciiz "Someone has pressed a key!\n"
msg_counter:	.asciiz "Time inteval!\n"
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# MAIN Procedure
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.text
	#---------------------------------------------------------
	# Enable interrupts you expect
	#---------------------------------------------------------
	# Enable the interrupt of Keyboard matrix 4x4 of Digital Lab Sim
	li $t1, IN_ADRESS_HEXA_KEYBOARD
	li $t3, 0x80 		# bit 7 = 1 to enable
	sb $t3, 0($t1)
	# Enable the interrupt of TimeCounter of Digital Lab Sim
	li $t1, COUNTER
	sb $t1, 0($t1)
	
	#---------------------------------------------------------
	# Loop an print sequence numbers
	#---------------------------------------------------------
loop:
	nop 
	nop
	nop
	li $v0, 32
	li $a0, 200
	syscall
	nop
	b loop
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# GENERAL INTERRUPT SERVED ROUTINE for all interrupts
#~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
.ktext 0x80000180
IntSR:
	#--------------------------------------------------------
	# Temporary disable interrupt
	#--------------------------------------------------------
dis_int: 
	li $t1, COUNTER
	sb $zero, 0($t1)
				# no need to disable keyboard matrix interrupt
	#--------------------------------------------------------
	# Processing
	#--------------------------------------------------------
get_cause:
	mfc0 $t1, $13 		# $t1 = Coproc0.cause
IsCount:
	li $t2, MASK_CAUSE_COUNTER # if Cause value confirm Counter..
	and $at, $t1, $t2
	beq $at, $t2, Counter_Intr
IsKeyMa:
	li $t2, MASK_CAUSE_KEYMATRIX # if Cause value confirm Key..
	and $at, $t1, $t2
	beq $at, $t2, KeyMatrix_Intr
	j end_process

KeyMatrix_Intr:
	li $v0, 4 		# Processing Key Matrix Interrupt
	la $a0, msg_keypress
	syscall
	j end_process
Counter_Intr: 
	li $v0, 4 		# Processing Counter Interrupt
	la  $a0, msg_counter
	syscall
	j end_process
end_process:
	mtc0, $zero, $13 	# Must clear cause reg
	li $t1, COUNTER
	sb $t1, 0($t1)
next_pc:
	mfc0 $at, $14 		# $at <= Coproc0.$14 = Coproc0.epc
	addi $at, $at, 4 	# $at = $at + 4	(next instruction)
	mtc0 $at, $14 		# Coproc0.$14 = Coproc0.epc <= $at
	eret			# Return from exception