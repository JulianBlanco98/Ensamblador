.data			#inicio del programa
			
str:			#etiqueta
	.ascii"hola mundo"		
.text		
	
main:	li $v0, 4	#llamada para imprimir str
	la $a0, str	#dirección del str a imprimir
	syscall 	#imprimir el string
	li $v0, 10	#llamada al sistema para terminar
	syscall 	#termina