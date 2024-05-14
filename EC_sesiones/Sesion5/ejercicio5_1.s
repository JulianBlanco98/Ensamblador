#Ejercicio 1. sesion5

.data
a: .word 12, 5, 34, 75, 10, 25
n: .word 6
max: .word 0

.text
.globl main

main:	li $t0, 0
	li $s0, 0		#Variable max
	lw $s1, n
	
m1:	bge $t0, $s1, m3
	mul $t1, $t0, 4
	lw $t2, a ($t1)
	ble $t2, $s0, m2
	move $s0, $t2
	
m2:	addi $t0, $t0, 1
	b m1
	
m3:	move $a0, $s0
	li $v0, 1
	syscall
	li $v0, 10
	syscall