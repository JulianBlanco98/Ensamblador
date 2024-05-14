.data
#varByte: .byte 16, 32, 48
#varHalf: .half 16, 32, 48
#varWord: .word 16, 32, 48


dato1: .byte 16
.align 2
dato2: .byte 32
.align 2
dato3: .byte 48
.align 2
dato4: .half 16
.align 2
dato5: .half 32
.align 2
dato6: .half 48
.align 2
varWord: .word 16, 32, 48


.text

#varByte apunta a la primera dirección de memoria. Almacena un 00302010 (primer segmento de 32 bits)
#varHalf apunta a la primera dirección de memoria. Alamcena 00200010 00000030 (segundo y tercer segmento)
#varWord apunta a la 1ra y 2da dirección de memoria. Almacena 00000010 00000030 00000030 (4to segmento y primer y segundo segmento)

#sb $s0, varByte ($zero)
#sh $s1, varHalf ($zero)
#sw $s2, varWord ($zero)