.data

string: .asciiz "Hola mundo"
item: .word 99
array: .word 11, 22, 33, 44, 55, 66, 77, 88, 99

.text
.globl main
main:
	#Mostrando por pantalla(print)
	la $a0, string
	li $v0, 4
	syscall 
	#Cargar 99 en a0 y lo muestra por consola
	lw $a0, item
	li $v0, 1
	syscall 
	#Lee un entero por consola
	li $v0, 5
	syscall 
	#Lee una cadena de consola
	li $v0, 8
	la $a0, string
	li $a1, 9 #tamaño del buffer: 9 caracteres
	syscall
	li $v0, 4
	syscall 
	
	li $t0, 3
	li $t1, 4
	mul $t2, $t1, $t0
	lw $a0, array($t2)
	li $v0, 1
	syscall
	
	li $v0, 10
	syscall