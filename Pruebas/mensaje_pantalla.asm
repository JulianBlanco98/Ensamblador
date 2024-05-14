#a) Imprime el siguiente mensaje: La media es: 55.63
#b) Lee tu nombre por teclado: Introduzca su nombre:

.data

mensaje: .asciiz  "\n La media es: 55,63"
mensaje2: .asciiz "\n Introduzca su nombre: "

.text

main:	j a
	j b
	j fin

a:	li $v0, 4	#llamada para imprimir str
	la $a0, mensaje	#dirección del str a imprimir
	syscall 

b:	la $a0, mensaje2
	li $v0, 4
	syscall
	
	li $v0, 8
	syscall 
	la $a0, Julian
	li $v0, 8
	syscall 
	
fin:	li $v0, 10	#llamada al sistema para terminar
	syscall 	#termina		