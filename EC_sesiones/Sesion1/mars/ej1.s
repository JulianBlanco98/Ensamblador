.data
varByte: .byte 16, 32, 48
varHalf: .half 16, 32, 48
varWord: .word 16, 32, 48

#.text

#sb $s0, varByte ($zero)
#sh $s1, varHalf ($zero)
#sw $s2, varWord ($zero)