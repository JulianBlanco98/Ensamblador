.data
numero1: .word -54
numero2: .word 1
numero3: .word 2
.text
main:	lw $t0, numero1($0)
	lw $t1, numero2($0)
	subu $t0, $t0, $t1	#t0=t0-t1
	
	lw $t1, numero3($0)
	subu $t0, $t0, $t1
	sw $t0, numero3($0)