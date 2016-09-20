# run with test suite in  octalrunner.mips

.data
	input: .asciiz  "1234567"

.text 

# la $a0, input 			# to match test suite configuration
# input in a0 
# output in v0 
# bytes and values in t0 
octal_convert: 
	li 	$v0, 0			# set v0 to 0 
	loop: 
		lb 	$t0, ($a0) 	# load first byte into t0 
		beqz 	$t0, exit
		subi 	$t0, $t0, 48 	# subtract 48 to get 1 or zero 
		sll 	$v0, $v0, 3 	# left shift 3 to multiply value by 8
		or 	$v0, $v0, $t0 	# add t0 value to v0
		addi 	$a0, $a0, 1	# increment a0 
		j loop	
	
exit: 
	jr 	$ra 			# jump back to tests 	