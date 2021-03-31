.data 
    prompt: .asciiz "What is your favorite type of pie? "
    result_text: .asciiz "So you like "
    pie_text: .asciiz " .pie"
    input: .space 21
    input_size: .word 20
.text
    # print prompt
        li $v0, 4
        la $a0, prompt
        syscall 
    # take input of user
        li $v0, 0
        la $a0, input
        lb $a1, input_size
        syscall
    #print result
        li $v0, 4
        la $a0, result_text
        syscall 
        
        li $v0, 4
        la $a0, input
        syscall 
 
        li $v0, 4
        la $a0, pie_text
        syscall 
  
   
    
     
      
       
        
         
           
