#Ejercicio 5.3 Mostrar los positivos y negativos de un array usando una funcion

.data
array: .word -12, 5, -34, -75, -10, 25
tam: .word 6
n1: .word 0	#Contador positivos
n2: .word 0	#Contador negativos
cadena1: .asciiz "Numeros positivos: "
cadena2: .asciiz "\nNumeros negativos: "
cad: .asciiz "------------Ejercicio con función----------\n"

.text
.globl main

main:	
	
	li $v0, 4
	la $a0, cad
	syscall
	
	la $a0, array
	lw $a1, tam
	lw $a2, n1
	lw $a3, n2
	
	
	jal PositivosNegativos
	
	li $v0, 4
	la $a0, cadena1
	syscall
	
	move $a0, $a2
	li $v0, 1
	syscall
	
	li $v0, 4
	la $a0, cadena2
	syscall
	
	move $a0, $a3
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall

PositivosNegativos: 
	
	li $t0, 0
	

bucle:	bge $t0, $a1, fuera
	
	lw $t3, 0($a0)
	bltz $t3, else
	addi $a2, $a2, 1
	b finif
	
else:	addi $a3, $a3, 1
	 		 	
finif: addi $t0, $t0, 1
       addi $a0, $a0, 4
	b bucle
	 		 		 		 	 		 		 		 
fuera: jr $ra	 		 	