# Assignment 2
# Create a new project, type in, and build the program of Home Assignment 2.
# Upgrade the source code so that it could defect all 16 key buttons, from 0 to F.

.eqv IN_ADDRESS_HEXA_KEYBOARD		0xFFFF0012

.data
Message: .asciiz "Oh my god. Someone's pressed a button.\n"
#-------------------------------------------------------------
# MAIN PROCEDURE
#-------------------------------------------------------------
.text	
main:
	#-------------------------------------------------------------
	# Enable interrupts up expect
	#-------------------------------------------------------------
	# Enable the interrupt of Keyboard matrix 4x4 of Digital Lab Sim
	
	li	$t1, IN_ADDRESS_HEXA_KEYBOARD
	li	$t3, 0x80	# bit 7 = 1 to enable interrupt
	sb	$t3, 0($t1)
	
	#-------------------------------------------------------------
	# No-end loop, main program, to demo the effectiveness of interrupt
	#-------------------------------------------------------------
Loop:
	nop
	nop
	nop
	nop
	b	Loop		# Wait for interrupt
end_main:

#-------------------------------------------------------------
# GENERAL INTERRUP SERVED ROUTINE for all interrupts
#-------------------------------------------------------------
.ktext	0x80000180
	#-------------------------------------------------------------
	# Processing
	#-------------------------------------------------------------
IntSR:
	addi	$v0, $zero, 4	# show message
	la	$a0, Message
	syscall
	#-------------------------------------------------------------
	# Evaluate the return address of main routine
	# epc <= epc + 4
next_pc:
	mfc0	$at, $14	# $at <= Coproc0.$14 = Coproc0.epc
	addi	$at, $at, 4	# $at = $at + 4 (next instruction)
	mtc0	$at, $14	# Coproc.$14 = Coproc0.epc <= $at

return:
	eret			# return from exception