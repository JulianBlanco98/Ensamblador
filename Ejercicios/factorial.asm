# Prácticas ensamblador MIPS AOC
# UEX 2020/2021
.text
.globl main
main: 						#----------------------------# La rutina main crea su marco de pila
 						# (de 32 bytes) en memoria.
subu $sp, $sp, 32 				# Nuevo stack pointer (puntero de pila): $sp <-- $sp+32
sw $ra, 20($sp) 				# M[$sp+20] <-- $ra. Guarda direcc. de vuelta
sw $fp, 16($sp) 				# M[$sp+16] <-- $fp. Guarda $fp antiguo
addu $fp, $sp, 32 				# Nuevo frame pointer (puntero de estructura):
						# $fp <-- $sp+32 (donde estaba sp antes)
li $a0, 3 					# Pone argumento (n=3) en $a0
jal fact 					# Llama fact, almacena en $ra dir. sig. instrucc.
move $a0, $v0 					# Resultado está en $v0.
li $v0, 1 					# Se escribe en consola
syscall
lw $ra, 20($sp) 				# Restaura registros
lw $fp, 16($sp)
addu $sp, $sp, 32

j $ra 						# Finaliza
#-----------------------------------------------# Rutina fact: cálculo de factorial
fact: subu $sp, $sp, 32 			# Crea marco de pila
sw $ra, 20($sp) 				# M[$sp+20] <-- $ra. Guarda direcc. de vuelta
sw $fp, 16($sp) 				# M[$sp+16] <-- $fp. Guarda $fp antiguo
addu $fp, $sp, 32 				# Nuevo frame pointer (puntero de estructura):
						# $fp <-- $sp+32 (donde estaba sp antes)
sw $a0, 0($fp) 					# Guarda argumento $a0 en marco de pila (n)
lw $v0, 0($fp)
bgtz $v0, L2
li $v0, 1
j L1

L2: lw $v1, 0($fp)
subu $v0, $v1, 1
move $a0, $v0
jal fact
lw $v1, 0($fp)
mul $v0, $v0, $v1

L1: lw $ra, 20($sp)
lw $fp, 16($sp)
addu $sp, $sp, 32
jr $ra