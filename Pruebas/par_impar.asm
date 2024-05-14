.data
par: .asciiz "yo pa mi que es par"
impar:.asciiz "hasta mi abuela sabe que es impar"
inic:.asciiz "El número introducido es: "
.text
main: 	addi $t0, $0, 2
	la $a0, inic
	li $2, 4
	syscall
	li $2, 5
	syscall
	div $2, $t0
	mfhi $t1
	beq $t1, $0, print_1
	la $a0, impar
	li $2, 4

	syscall
	j fin
print_1: la $a0, par
	li $2, 4
	syscall
	j fin
fin: 	li $2, 10
	syscall	