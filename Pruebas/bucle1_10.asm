#Escribir los números del 1 al 10
.text
main: 	addi $t1, $0, 10
	addi $t0, $0, 1
	add $a0, $t0, $0
	li $2, 1
	syscall

bucle:  addi $t0, $t0, 1
	add $a0, $t0, $0
	li $2, 1
	syscall
	bne $t1, $t0, bucle
	li $2, 10
	syscall
