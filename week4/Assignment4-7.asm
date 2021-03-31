# Week 4 - Assignment 4.7
.data 
    prompt: .asciiz  "\nInput the number x =  " 
    output: .asciiz   "\nThe value of 10*x = " 

.text 
main:  

# print promt 
    ori $v0, $zero,4 
    la $a0, prompt 
    syscall 
# input and save x in s0 
    ori $v0, $zero, 5 
    syscall 
    move $s0,$v0  
# sll and add 
    sll $s1, $s0, 3 # 8*x 
    add $s1, $s1, $s0 # 8x+x 
    add $s1, $s1, $s0 # 8x+x+x 
# print output 
    ori $v0, $zero,4 
    la $a0, output 
    syscall 
# print 10*x 
    li, $v0, 1 
    move $a0, $s1 
    syscall 
# exit 
    li $v0,10 
    syscall 