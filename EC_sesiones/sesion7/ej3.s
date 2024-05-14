#Ejercicio3
.data
vector1: .word 6, 5, 4, 3, 2, 1
vector2: .word 1, 2, 3, 4, 5, 6
dim: .word 6
res: .space 4
cadena: .asciiz "Resultado de la suma: "

.text
.globl main

main:
		
	la $a0, vector1
	la $a1, vector2
	lw $a2, dim
	
	jal sumatorio
	
	add $s2, $v0, $zero
	
	li $v0, 4
	la $a0, cadena
	syscall
	
	
	li $v0, 1
	add $a0, $s2, $zero
	syscall 
		
	li $v0, 10
	syscall
		
sumatorio:
	
	addi $sp, $sp, -12
	sw $ra, 8 ($sp)		#Salva la dirección de retorno
	sw $a0, 4 ($sp)		#Salva el primer sumando
	sw $a1, 0 ($sp)		#Salva el segundo sumando
	move $t0, $a0
	move $t1, $a1
	move $t2, $a2
	li $t3, 1
	

for:	bgt $t3, $t2, fin
	lw $a0, ($t0)
	lw $a1, ($t1)
	
	jal suma
	
	add $t4, $t4, $v0
	addi $t3, $t3, 1
	addi $t0, $t0, 4
	addi $t1, $t1, 4
	j for

fin:	move $v0, $t4

	lw $a1, 0 ($sp)		#Recupera el valor del segundo sumando
	lw $a0, 4 ($sp)		#Recupera el valor del primer sumando
	lw $ra, 8 ($sp)
	
	addi $sp, $sp, 12
	jr $ra
	
suma:	add $v0, $a0, $a1
	jr $ra			