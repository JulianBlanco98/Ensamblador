.data

texto_prueba: .asciiz "Ejercicio de prueba"

array: .byte 2, 4 , 6, 8, 10


.text
	#Mostrar primer mensaje por pantalla
	li $v0, 4
	la $a0, texto_prueba
	syscall
	
	
	#add $s1, $s1, 2
	#add $s2, $s2, 4
	#lb $t0, array($s1)
	#lb $t1, array($s2)
	
	#Otra manera
	lb $t0, array+2
	lb $t1, array+4
	
	#Registros
	#la $s0, array+2
	#lb $t0, array ($s0)
	
	#Valor
	#lb, $t0, (dirección del ensamblador)
	
	
	#Fin programa
	li $v0, 10
	syscall