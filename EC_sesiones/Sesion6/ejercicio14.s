#Ejercicio 14
.data
array: .word 10, 8, 6, 4 , 2, 0
size: .word 6
cadena1: .asciiz "Vector inicial: "
cadena2: .asciiz "\nVector ordenado: "
salto: .asciiz ", "
.text
.globl main

main: 	li $v0, 4
	la $a0, cadena1
	syscall

	la $a0, array
	lw $a1, size
	
	jal mostrar
	
	la $a0, array
	lw $a1, size
	
	jal burbuja
	
	li $v0, 4
	la $a0, cadena2
	syscall
	
	la $a0, array
	lw $a1, size
	
	jal mostrar
	
	li $v0, 10
	syscall
	
mostrar: 
	li $t0, 0
	#hacer registro temporal
	move $s0, $a0
	
bucle:	bge $t0, $a1, finm
	lw $a0, 0($s0)
	li $v0, 1
	syscall 
	li $v0, 4
	la $a0, salto
	syscall
	addi $s0, $s0, 4
	addi $t0, $t0, 1
	b bucle	
finm: jr $ra	

burbuja:	li $t1, 0
		move $t0, $a1
     		move $t4, $a0
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
fin_desde: b mientras
fin_mientras: jr $ra

	