# Write a program to find prime numbers from 3 to n in
# a loop by dividing the number n by all numbers from
# 2...n/2 in an inner loop.
# - Using the remainder (rem) operation, determine if n
#   is divisible by any number.
# - If n is divisible, leave the inner loop.
# - If the limit of n/2 is reached and the inner loop has
#   not been exited, the number is prime and you
#   should output the number.
# - So if the user were to enter 25, your program would
#   print out "2, 3, 5, 7, 11, 13, 17, 19, 23".
 
# Pseudocode
#	int main() {
#		int n;
#		printf("Please enter your input here: ");
#		scanf("%i", &n);
#		printf('\n');
#		for (int i = 3; i <= n; i++){
#			for (int x = 2; x < i/2; x++){
#				if ((i % x) == 0){
#					break;
#				}
#				elseif ((x + 1) == n){
#					printf("%d", n);
#				{
#				else {
#					continue;
#				}
#			}
#		}
#	}

.text
main:
	# Prompt user for the integer
	la $a0, prompt
	jal PromptInt
	move $s0, $v0
	sge $t0, $s0, 3
	beqz $t0, main
	  # Register Convention: $t0 will be outer i (our incrementing variable/register)
	  # and $t1 will be our inner i (our incrementing variable/register)
	  la $t0, 3
	
	  # Outer Loop
	  BeginOuterLoop:
	  # Inner increment i ($t1)
	  la $t1, 2
	  
	  # Creating the variable ($t2) that will act as the inner limit
	  div $t2, $t0, 2
	  beq $t0, $s0, EndOuterLoop
	    # Inner Loop
	    BeginInnerLoop:
	      rem $t3, $t0, $t1
	      # To check if the remainder ($t3) is equal to one or zero
	      # and branch to the end of the InnerLoop if the remainder is 0
	      	beqz $t3, EndInnerLoop
	      	  # If adding one to the inner increment will equal the inner limit
	      	  # $t4 is the temporary variable used to check if the inner increment
	      	  # is one below the limit (prime)
	      	  addi $t4, $t1, 1
	      	  bge $t4, $t2, prime
	      	    addi $t1, $t1, 1
	      	    b BeginInnerLoop
	      	  prime:
	      	  # Printing out the number with a comma since it's prime
	      	  addi $v0, $zero, 1
	      	  la $a0, ($t0)
	      	  syscall
	      	  la $a0, comma
	      	  jal PrintString
	    EndInnerLoop:
	    # Incrementing the outer loop i
	    addi $t0, $t0, 1
	    b BeginOuterLoop
	  EndOuterLoop:
	jal Exit
	
.data
    prompt:		.asciiz "----Please enter a number greater than 3: "
.include "utils.asm"

