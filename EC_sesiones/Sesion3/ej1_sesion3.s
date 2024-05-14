##Ejercicio1 sesion 3

.data
array_x: .word 1, 3, 5, 7
array_y: .word 2, 4, 6, 8
size: .word 4

.text
.globl main 
main:
	la $a0, array_x	
	la $a1, array_y
	lw $a2, size
	
	jal ip
	move $a0, $v0
	li $v0, 1
	syscall 
	#---------------------------
	li $v0, 10
	syscall
ip:	li $v0, 0

	li $t3, 0
ip1:	bge $t3, $a2, ipx
	lw $t0, 0($a0)
	lw $t1, 0($a1)
	mul $t2, $t0, $t1
	add $v0, $v0, $t2
	addi $a0, $a0, 4
	addi $a1, $a1, 4
	addi $t3, $t3, 1
	b ip1
	
ipx:	jr $ra	