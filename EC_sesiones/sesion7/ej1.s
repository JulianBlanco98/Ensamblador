.data

dato1: .word 6
dato2: .word 3
dato3: .word 2
dato4: .word 5
res1: .space 4
res2: .space 4

.text


main:	lw $a0, dato1($0)
	lw $a1, dato2($0)
	jal suma
	sw $v0, res1($0)
	lw $a0, dato3($0)
	lw $a1, dato4($0)
	jal suma
	sw $v0, res2($0)
	li $v0, 10
	syscall 
	
suma: 	
	addi $sp, $sp, -12
	sw $ra, 8 ($sp)		#Salva la dirección de retorno
	sw $a0, 4 ($sp)		#Salva el primer sumando
	sw $a1, 0 ($sp)		#Salva el segundo sumando
	
	add $v0, $a0, $a1
	
	lw $a1, 0 ($sp)		#Recupera el valor del segundo sumando
	lw $a0, 4 ($sp)		#Recupera el valor del primer sumando
	lw $ra, 8 ($sp)
	
	addi $sp, $sp, 12
	jr $ra
	