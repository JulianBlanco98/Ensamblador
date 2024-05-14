.data
valor:	.word 5, 10, 15, 20
ind:	.word 1
	.byte 0x1a, 0x0b, 10

	.align 2

	.ascii "Hola"
	.asciiz"MIPS"
.text
.globl main

main:
	lw $s0, valor,($zero)	#Carga el s0, el primero valor de word= 5
	lw $s4, ind		#Carga en s4, el indice del array = 1
	mul $s5, $s4, 4		#Multiplica 1 x 4, para avanzar los 4 bytes y dejar el resultado en s5.
	lw $s1, valor($s5)	#Carga en s1, el segundo valor de word = a (10) porque apunta a la segunda posición.

	add $s4, $s4, 1		#Aumenta el indice para avanzar una posición del "array" = 2
	mul $s5, $s4, 4		#Multiplica 1 x 4, para avanzar los 4 bytes
	lw $s2, valor($s5)	#Carga en s2, el tercer valor de word = f (15) porque apunta a la tercera posición.

	add $s4, $s4, 1		#Aumenta el indice para avanzar una posición del "array" = 3
	mul $s5, $s4, 4		#Multiplica 1 x 4, para avanzar los 4 bytes
	lw $s3, valor($s5)	#Carga en s2, el cuarto valor de word = 14 (20) porque apunta a la cuarta posición.