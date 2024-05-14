.text
.globl main
main:
	li $s0, 0		#Esta es la opción que se mostrará por pantalla
	bne $s0, 0, c1		#Salta a c1 si s0 es diferente de 0
	la $a0, Badajoz		#Carga en a0, la cadena Badajoz
	b cx			#Salto incondicional a Cx (caso default de switch)
	
c1:	bne $s0, 1, c2		
	la $a0, Caceres
	b cx

c2:	bne $s0, 2, c3
	la $a0, Merida
	b cx

 c3:	bne $s0, 3, c4
	la $a0, Plasencia
	b cx
	
c4:	la $a0, Otras		

cx:	li $v0, 4		#Imprime por pantalla la cadena que ha elegido el usuario
	syscall
	li $v0, 10
	syscall
	
.data
Badajoz: .asciiz "Badajoz\n"
Caceres: .asciiz "Caceres\n"
Merida: .asciiz "Merida\n"
Plasencia: .asciiz "Plaencia\n"
Otras: .asciiz "Otras\n"
