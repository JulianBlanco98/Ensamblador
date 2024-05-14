.data


#mostrar vector desordenado
 .text
 .globl main

main:
     li $t1, 0
     li $t0, 6
  mientras:  bnez $t1, fin_mientras
            li $t1, 1
            li $t2, 0
            sub $t3, $t0, 2
  desde:    bgt $t2, $t3, fin_desde
           sll $t4, $t2, 2
           lw $t5, a($t4)
           lw $t6, a+4($t4)
           ble $t5, $t6, no_interc
           sw $t6, a($t4)
           sw $t5, a+4($t4)
           li $t1, 0
  no_interc:  addi $t2, $t2, 1
             b desde
  fin_desde: b mientras
  fin_mientras: #mostrar vector ordenado