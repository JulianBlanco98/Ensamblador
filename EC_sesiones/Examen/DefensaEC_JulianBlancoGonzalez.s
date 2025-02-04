#Defensa EC 2022
.data						

cadena: 	.asciiz "DEFENSA EC 2022. Crear un c�digo que haga una potencia de manera recursiva"
base: 		.asciiz "\nBase: "
exponente:	.asciiz "\nExponente: "	
resultado:	.asciiz "\nEl resultado es: "

.text

main:		
	
	#Mostrar Titulo por pantalla
	li $v0, 4
	la $a0, cadena
	syscall
	
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
	add $a0, $zero, $s0
	add $a1, $zero, $s1
	jal pot			
	
	add $s2, $v0, $zero	#Guardo en s2, el resultado
	
	#Mostrar mensaje 3 por pantalla
	la $a0, resultado
	li $v0, 4
	
	syscall
	
	#Mostrar resultado por pantalla
	addi $v0, $zero, 1
	add $a0, $s2, $zero
	syscall
	
	#Fin programa
	li $v0, 10
	syscall
	
	
pot:	#caso base: n=0

	addi $sp, $sp, -12	#Hacer espacio en la pila
	sw $ra, 8 ($sp)		#Salva la direcci�n de retorno
	sw $a0, 4 ($sp)		#Salva la base
	sw $a1, 0 ($sp)		#Salva el exponente
	
	slti $t0, $a1, 2
	beq $t0, $zero, pot_recursiva		
	move $v0, $a0
	b fin				#Devuelvo 1

	
#Funci�nn que recoge el caso recursivo: x*pot(x,n-1)		
pot_recursiva:	
	
	sub $a1, $a1, 1	#n=n-1	
	jal pot
#Actualizar el valor del retorno
	mul $v0, $v0, $a0	#a0=x y v0=valor funcion(n-1)
	
fin:	
#Restauro los registros de la pila		
	lw $a1, 0 ($sp)		#Recupera el valor de n
	lw $a0, 4 ($sp)		#Recupera el valor de x
	lw $ra, 8 ($sp)		#Recupera la dirección de retorno
	addi $sp, $sp, 12
		
	jr $ra
	
	


