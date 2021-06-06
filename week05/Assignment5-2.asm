# - in utils.asm 
.text
PrintNewLine:
 	li $v0, 4
 	la $a0, __PNL_newline
 	syscall  
 	jr $ra
 .data
 	__PNL_newline: .asciiz "\n"

PrintTab:
 	li $v0, 4
 	la $a0, tab
 	syscall
 	jr $ra
.data
 	tab: .asciiz "\t"
 # =>>
# - Problem: 'PrintTab' is not in .text section
# - Solution: declare '.text' right above 'PrintTab' function
