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
	
	
	sw $fp, 0 ($sp) #Cargar fp
	move $fp, $sp   #Mover fp a sp
	addi $sp, $sp, -20 #Guardar espacio en la pila
	sw $ra, -4 ($fp) #Salva la direcciÃ³n de retorno
	sw $a0, -8 ($fp) #Salva el primer sumando 
	sw $a1, -12 ($fp) #Salva el segundo sumando	
	sw $a2, -16 ($fp) #Salva el tamaño de los arrays
	
	#Mover los parámetros (posiciones de la pila) a registros		
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
	#Proceso de desapilar a la inversa
	lw $a2, -16 ($fp)	#Desapilar el tamño
	lw $a1, -12 ($fp)	#Desapilar el segundo sumando
	lw $a0, -8 ($fp)	#Desapilar el primer sumando
	lw $ra, -4 ($fp)	#Desapilar la dirección de retorno
	move $sp, $fp		#Mover fp para destruir el marco de pila de sumatorio
	lw $sp, 0 ($fp)		#Cargar la dirección de jal en sp.También se puede poner lw $sp, 0($fp)	
	
	jr $ra
	
suma:	add $v0, $a0, $a1
	jr $ra			
