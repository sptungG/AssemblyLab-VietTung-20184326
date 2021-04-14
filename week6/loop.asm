.text
	#set sentinel value (prompt the user for input)
	la $a0, prompt
	jal PromptInt
	move $s0,$v0
	
	start_loop:
		sne $t1, $s0, -1
		beqz $t1,end_loop
		
		#code block
		la $a0, output
		move $a1, $s0
		jal PrintInt
		
		la $a0, prompt
		jal PromptInt
		move $s0,$v0
		b start_loop
	end_loop:
	jal Exit
.data
	prompt: .asciiz "\n Enter an integer, -1 to stop: "
	output: .asciiz "\n ----- You entered: "
.include "utils.asm"
