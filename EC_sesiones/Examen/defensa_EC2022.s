#Defensa EC 2022

.data

base: 		.asciiz "\nIntroduce la base: "
exponente:	.asciiz "\nIntroduce el exponente: "	
resultado:	.asciiz "\nEl resultado es: "

.text


main:

	#Mostrar primer mensaje por pantalla
	li $v0, 4
	la $a0, base
	syscall
	
	#Leer la base
	li $v0, 5
	syscall
	
	add $s0, $zero, $v0	#Guardar en s0, la base
	
	#Mostrar segundo mensaaje por pantalla
	li $v0, 4
	la $a0, exponente
	syscall
	
	
	#Leer el exponente
	li $v0, 5
	syscall
	
	add $s1, $zero, $v0	#Guardar en s1, el exponente
		
	add $a0, $zero, $s0	#Muevo a a0 la base
	add $a1, $zero, $s1	#Muevo a a1 el exponente
	
	jal pot			#Salto a la llamada
	
	add $s2, $v0, $zero	#Añado el resultado a s2
	#Mostrar primer mensaje por pantalla
	li $v0, 4
	la $a0, resultado
	syscall
	
	#Mostrar resultado por pantalla
	addi $v0, $zero, 1
	add $a0, $s2, $zero
	syscall
	
	li $v0, 10
	syscall
	
pot:
	slti $t0, $a1, 1
	beq $t0, $zero, pot2	
	addi $v0, $zero, 1
	jr $ra				#Devuelvo 1
	
#Función que recoge el caso recursivo: x*pot(x,n-1)		
pot2:	addi $sp, $sp, -12	#Hacer espacio en la pila
	sw $ra, 8 ($sp)		#Salva la direcciÃ³n de retorno
	sw $a0, 4 ($sp)		#Salva la x
	sw $a1, 0 ($sp)		#Salva la n	
	
	sub $a1, $a1, -1	#n=n-1	
	jal pot 
	
	mul $v0, $v0, $a0			
					
	lw $a1, 0($sp)
	lw $a0, 4($sp)
	lw $ra, 8($sp)
	addi $sp, $sp, 12
	
	jr $ra			#llamada de retorno
	
	
			