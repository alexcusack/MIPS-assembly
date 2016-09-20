# Factorial
# fact(4) -> 4 * 3 * 2 * 1 --> 24

li $a0, 4
jal facti 	# jumpt to facti with link location ($ra) set to this line # + 1

# syscall
move $a0, $v0 	# value you want to print move to $t1
li $v0, 1 	# prep for syscall, use code 1 - print integer
syscall 	# prints the value in $a0 (this is by convention)

li $v0, 10 	# load 10 (which means exit program) into v0 
syscall 	# call syscall, which by default checks the value of $v0 

facti:
	li $v0, 1 # set v0 to 1 
	loop: 
	mul $v0, $v0, $a0 # we're ignoring mfho overlow bits since v0 is already 32 bits. maybe crash program instead?
	sub $a0, $a0, 1 
	bgt $a0, 1, loop # if a0 > 1 repeat this loop 
	jr $ra # return to caller location when done 