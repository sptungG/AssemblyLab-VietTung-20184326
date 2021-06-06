#File: Program 5.1
# ======================== ========================
.text
main:
    #Read an input value from the user
    la $a0, prompt
    jal PromptInt #
    move $s0, $v0
    
    #Print the value back to the user
    jal PrintNewLine #
    la $a0, result
    move $a1,$s0
    jal PrintInt
    
    #Call the Exit subprogram to exit
    jal Exit #chuyen dieu khien ve ctr con(Exit)
  
.data
prompt: .asciiz "Please enter an interger: "
result: .asciiz "\nYou entered: "
.include "utils.asm"