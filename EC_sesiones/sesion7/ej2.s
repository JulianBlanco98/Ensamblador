.data

dato1: .word 6
dato2: .word 3
dato3: .word 2
dato4: .word 5
res1: .space 4
res2: .space 4

.text

suma: 	add $v0, $a0, $a1
	jal otra
	jr $ra
	
main:	lw $a0, dato1($0)
	lw $a1, dato2($0)
	jal suma
	sw $v0, res1($0)
	lw $a0, dato3($0)
	lw $a1, dato4($0)
	jal suma
	sw $v0, res2($0)
	li $v0, 10
	
otra:	jr $ra