#Ejercicio 5.2 Mostrar los positivos y negativos de un array

.data
array: .word -12, 5, -34, -75, -10, 25
tam: .word 6
cadena1: .asciiz "Numeros positivos: "
cadena2: .asciiz "\nNumeros negativos: "

.text
.globl main

main: 	li $t0, 0
	lw $t1, array ($t0)
	lw $s1, tam
	li $s4, 0	#Contador positivos
	li $s5, 0	#Contador negativos
	
bucle: 	bge $t0, $s1, fuera
	mul $t2, $t0, 4
	lw $t3, array ($t2)
	bltz $t3, else	#Si menor que 0
	addi $s4, $s4, 1
	b finif
	
else:	addi $s5, $s5, 1	
	
		
finif:	addi $t0, $t0, 1
	b bucle				

fuera: 
	li $v0, 4
	la $a0, cadena1
	syscall
	
	move $a0, $s4
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, cadena2
	syscall
	
	move $a0, $s5
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall