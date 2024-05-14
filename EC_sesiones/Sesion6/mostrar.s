#Ejercicio14
.data
array: .word 10, 8, 6, 4 , 2, 0
size: .word 6
cadena1: .asciiz "Vector inicial: "
cadena2: .asciiz "Vector ordenado: "
coma: .asciiz ", "
salto: .asciiz "\n"

.text
.globl main

main: 	

	li $v0, 4		#Cadena 1 por pantalla
	la $a0, cadena1
	syscall
	
	la $s0, array
	lw $t2, size
	li $t0, 0
	
mostar:	bge $t0, $t2, ipx	#Procedimiento para mostrar el array por pantalla
	
	lw $a0, 0($s0)
	li $v0, 1
	syscall 
	li $v0, 4
	la $a0, coma
	syscall
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	b mostar

ipx:		
	li $v0, 4		#Cadena 1 por pantalla
	la $a0, salto
	syscall
	
	li $t1, 0		#Índice del vector [i]
     	lw $t0, size		#Tamaño array
mientras:  bnez $t1, fin_mientras
            li $t1, 1
            li $t2, 0
            sub $t3, $t0, 2
desde:    bgt $t2, $t3, fin_desde
           sll $t4, $t2, 2
           lw $t5, array($t4)
           lw $t6, array+4($t4)
           ble $t5, $t6, no_interc
           sw $t6, array($t4)
           sw $t5, array+4($t4)
           li $t1, 0
 no_interc:  addi $t2, $t2, 1
             b desde
 fin_desde:  b mientras
 fin_mientras: #mostrar vector ordenado
 
 
 	li $v0, 4		#Cadena 1 por pantalla
	la $a0, salto
	syscall
	
	li $v0, 4		#Cadena 1 por pantalla
	la $a0, cadena2
	syscall
	
	la $s0, array
	lw $t2, size
	li $t0, 0
	
mostar2: bge $t0, $t2, ipx2	#Procedimiento para mostrar el array por pantalla
	
	lw $a0, 0($s0)
	li $v0, 1
	syscall 
	li $v0, 4
	la $a0, coma
	syscall
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	b mostar2

ipx2:		

	li $v0, 10
	syscall	
  