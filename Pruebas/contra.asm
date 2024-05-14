#Contraseña

.data

princ:	.asciiz "Introduzca la contraseña:"
error:	.asciiz "contraseña no válida, preparados para autodestrucción"
ok:	.asciiz "eres el jefe"
.text
main: 	addi $s0, $0, 230181
	la $a0, princ
	li $2, 4
	syscall
	li $2, 5
	syscall
	add $t0, $2, $0
	beq $s0, $t0, vale
	la $a0, error
	li $2, 4
	syscall
tal: 	addi $a0, $0, 1
	li $2, 1
	syscall
	j tal
fin: 	li $2, 10
	syscall
vale: 	la $a0, ok
	li $2, 4
	syscall
	j fin