#Factorial

.data

cadena: .asciiz "Introduce el término de la serie de fibonnaci: "
cadena1: .asciiz "Es el número: "

.text
.globl main
main: #----------------------------# La rutina main crea su marco de pila (de 32 bytes) en memoria.
# (0)
	subu $sp, $sp, 32 # Nuevo stack pointer (puntero de pila): $sp <-- $sp+32
	sw $ra, 20($sp) # M[$sp+20] <-- $ra. Guarda direcc. de vuelta
	sw $fp, 16($sp) # M[$sp+16] <-- $fp. Guarda $fp antiguo
	sw $s0, 12($sp)
	sw $s1, 8($sp)
	addu $fp, $sp, 32 # Nuevo frame pointer (puntero de estructura): $fp <-- $sp+32 (donde estaba sp antes)
	
	li $v0, 4
	la $a0, cadena
	syscall
	
	li $v0, 5 #Introduce el lugar de la serie de fibonnaci
	syscall
	
	move $a0, $v0
	jal fib # Llama fact, almacena en $ra dir. sig. instrucc.
	add $s2, $v0, $zero # Resultado está en $s2.
	li $v0, 4
	la $a0, cadena1
	syscall
	
	li $v0, 1 # Se escribe en consola
	add $a0, $s2, $zero
	syscall
	
	lw $ra, 20($sp) # Restaura registros
	lw $fp, 16($sp)
	addu $sp, $sp, 32
# (10)
	
	
	#j $ra # Finaliza
	
	li $v0, 10
	syscall
	

fib:	subu $sp, $sp, 32 # Crea marco de pila
	sw $ra, 20($sp) # M[$sp+20] <-- $ra. Guarda direcc. de vuelta
	sw $fp, 16($sp) # M[$sp+16] <-- $fp. Guarda $fp antiguo
	sw $s0, 12($sp)
	sw $s1, 8($sp) 
	addu $fp, $sp, 32
	
	move $s0, $a0 #Muevo el argumento a $s0
	
	li $v0, 1
	ble $a0, $0, casoBase
	
	addi $a0, $s0, -1 #(n-1) 
	jal fib
	
	move $s1, $v0 #Guardo el resultado de la función
	addi $a0, $s0, -2 #(n-2)
	jal fib
	
	add $v0, $s1, $v0 #sumo el resultado de fibonacci (n-1)

casoBase:
			
	lw $ra, 20($sp)
	lw $fp, 16($sp)
	lw $s0, 12($sp)
	lw $s1, 8($sp) 
	
	jr $ra
	
	
			
	

	
	




