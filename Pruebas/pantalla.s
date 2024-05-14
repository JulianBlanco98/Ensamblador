#Imprime el siguiente mensaje: La media es: 55.63

.data

mensaje: 
	.ascii  "\n La media es: 55,63"

.text

main:	li $v0, 4
	la $a0, mensaje
	syscall 
	
	li $v0, 10
	syscall