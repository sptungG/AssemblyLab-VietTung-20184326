# - in utils.asm 
.text
PrintInt: 
 	# Print string. The string address is already in $a0
 	li $v0, 4
 	syscall
 # Print integer. The integer value is in $a1, and must
 # be first moved to $a0.
 	move $a0, $a1
 	li $v0, 1
 	syscall
 # Print a new line character
 	jal PrintNewLine 
 #return
 	jr $t0
# ==>
# -- The program is still run,but it never ends and acts
#    like it is stuck in an infinite loop
# -- Mechanism: 'main' function calls 'PrintInt' function, 'PrintInt' calls
#              'PrintNewLine' function. However, when 'PrintInt' calls 'PrintNewLine', command
#              'jal PrintNewLine' stores next instruction in $ra, which means $ra is overwriten
#              . Then 'jr $ra' will jump to itself infinite

#-- Solution: if we want to go back to 'main' function,
#             we just have to 'jr $t0'