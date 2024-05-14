	.data 			#zona de datos#
palabra1: .word 8
palabra2: .space 4
palabra3: .word 0xffffffff

	.text			#zona de instrucciones
	lw $s0, palabra1($0)	
	sw $s0, palabra2($0)	#M[ p al a b r a 2]<?$s 0
	sw $s0, palabra3($0)	#M[ p al a b r a 3]<?$s 0
