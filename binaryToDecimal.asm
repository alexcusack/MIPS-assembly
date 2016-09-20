.data
input: .asciiz  "10001101000"

.text
binary_convert:
	li	$v0, 0	# set accumulator to zero
	loop: 
		lbu	$t0, ($a0)	# load char byte value into $t0
		beqz 	$t0, exit 	# exit if byte if null byte
		sll 	$v0, $v0, 1	# shift v0 left by 1 byte. ex 001 -> 0010
		sub	$t0, $t0, 48 	# subtract 48 to get actual value 1 or 0
		or 	$v0, $v0, $t0	# or t0 value against current v0 and update v0 
		addi 	$a0, $a0, 1	# increment a0 by 1 byte 
		j 	loop		# recurse 
exit: 
	jr $ra
	
	
	
	
	
	
	
	
	

			

