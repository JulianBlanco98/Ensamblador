.data
numero: .word 30

.text

main: 	lw $t0, numero($0)
	addi $t1, $t0, 4