.data

array: .word 6, 8, 10, 12
size: .word 4
string: .asciiz "Introduce un número: "
string2: .asciiz "Estos son los caracteres del array: "
salto: .asciiz "\t"


.text
	li $v0, 4
	la $a0, string
	syscall
	
	li $v0, 5
	syscall

	lw $t0, array
	sw $v0, array+4		#carga del valor introducido por consola en la segunda posición del array.
	lw $t1, array+4
	lw $t2, array+8
	lw $t3, array+12
	
	li $v0, 4
	la $a0, string2
	syscall
	
	#addi $v0, $zero, 1
	#add $a0, $t0, $zero
	#syscall
	#addi $v0, $zero, 1
	#add $a0, $t1, $zero
	#syscall
	#addi $v0, $zero, 1
	#add $a0, $t2, $zero
	#syscall
	#addi $v0, $zero, 1
	#add $a0, $t3, $zero
	#syscall
	
	li $v0, 4
	la $a0, salto
	syscall
	
	la $a0, array
	lw $a3, size
	li $t3, 0
	li $s0, 0
	
mostrar:bge $t3, $a3, ipx

	lw $a0, array($s0)
	
	li $v0, 1
	syscall 
	li $v0, 4
	la $a0, salto
	syscall
	addi $s0, $s0, 4
	addi $t3, $t3, 1
	b mostrar

ipx:	li $v0, 10
	syscall
	

	
	
	
	
