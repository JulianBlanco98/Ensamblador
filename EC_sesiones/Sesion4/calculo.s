#Ejercicio 8

.data
array1: .word 1, 3, 5, 7
array2: .word 0, 2, 4, 6
arrayFinal: .word 0, 0, 0, 0 
size: .word 4 
string: .asciiz "Ejercicio 8. C�lculo sobre arrays\n 0. Sumar por posici�n\n 1. Restar por posici�n\n Resto: vector soluci�n a 0\n"
pedir: .asciiz "Introduce la elecci�n: "
string2: .asciiz "Array resultado: "
salto: .asciiz ", "

.text
.globl main

main:	li $v0, 4		#Cadena 1 por pantalla
	la $a0, string
	syscall
	
	li $v0, 4		#Cadena pedir por pantalla
	la $a0, pedir
	syscall
	
	li $v0, 5		#Coger la elecci�n del usuario por teclado	
	syscall
	add $a3, $zero, $v0	#Guardo en a3 la elecci�n del usuario
	
	jal calc		#salto a calculo
	
	li $v0, 4
	la $a0, string2		#Cadena 2 por pantalla
	syscall
	
	la $s0, arrayFinal	#Guardo en s0, el arrayFinal	
	li $t0, 0  		#�ndice segundo bucle
		
mostar:	bge $t0, $t2, ipx	#Procedimiento para mostrar el array por pantalla
	
	lw $a0, 0($s0)
	li $v0, 1
	syscall 
	li $v0, 4
	la $a0, salto
	syscall
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	b mostar

ipx:	li $v0, 10
	syscall
	
#C�lculo-------------------------------------------------
calc:	
	la $a0, array1		#Par�metro: array1
	la $a1, array2		#Par�metro: array2
	la $a2, arrayFinal	#Par�metro: array final
	
	li $t0, 0		#�ndice
	lw $t2, size		#Tama�o array
			
bucle:	bge $t0, $t2, fuera	#Saltar� al final cuando el �ndice sea igual o mayor al tama�o del array
	lw $t3, 0($a0)		#t0 cojo la posici�n del array 1
	lw $t4, 0($a1)		#t1 cojo la posici�n del array 2
	
	bne $a3, 0 , c1 	#Empieza el switch. Si la elecci�n es diferente a 0, salta a c1
	add $t5, $t3, $t4	#Si es 0, hace la suma de los elementos del array de la misma posici�n
	sw $t5, 0($a2)		#Cargo el resultado en la posci�n del arrayFinal correspondiente
	
	b finS			#Salto incondicional a la etiqueta para incrementar el �ndice de los arrays
	
c1:	bne $a3, 1, c2		#Si la elecci�n es diferente a 1, salta a c2
	sub $t5, $t3, $t4	#Si es 1, hace la resta de los elementos del array de la misma posici�n
	sw $t5, 0($a2)		#Cargo el resultado en la posci�n del arrayFinal correspondiente
	
	b finS			#Salto incondicional a la etiqueta para incrementar el �ndice de los arrays
	

c2:	addi $t7, $t7, 0	#caso default del Switch
	sw $t7, 0($a2)		#Pone la posici�n del arrayFinal a 0
	b finS			#Salto incondicional a la etiqueta para incrementar el �ndice de los arrays
	
	
finS:	addi $t0, $t0, 1	#Fynci�n para incrementar el �ndice de los arrays-
	addi $a0, $a0, 4
	addi $a1, $a1, 4
	addi $a2, $a2, 4
	b bucle			#Salto incondicional a bucle. Aqu� se producen las iteracciones
		
	
	
fuera: jr $ra			#Salto incondicional a la direcci�n alamcenada en el registro $ra, que coincide con la direcci�n de retorno de jal.
	
	
		

#switch eleccion


