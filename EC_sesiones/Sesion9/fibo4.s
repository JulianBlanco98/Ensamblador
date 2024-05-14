.text
main:
    addi $a0, $zero, 5        # suppose we want to find F(5)
    jr   $ra

fib:                          # start of the Fibonacci function
    addi $sp, $sp, -12        # save registers
    sw   $ra, 0($sp)
    sw   $a0, 4($sp)
    sw   $s0, 8($sp)
    bgt  $a0, $zero, testmore
    add  $v0, $zero, $zero    # fib(0)=0
    j    rtn
testmore:
    addi $t0, $zero, 1
    bne  $a0, $t0, recur
    add  $v0, $t0, $zero      # fib(1)=1
    j    rtn
recur:
    addi $a0, $a0, -1         # find fib(n-1)
    jal  fib
    addi $s0, $v0, $zero      # result of fib(n-1). 
                              # Why not put it in $v0? 
                              # And why $s0 instead of $t0?

    lw   $a0, 4($sp)          # restore $a0. 
                              # Why? Don't we already know it is n-1?
    addi $a0, $a0, -2         # find fib(n-2)
    jal  fib
    add  $v0, $v0, $s0        # fib(n)=fib(n-1)+fib(n-2)
rtn:
    lw   $s0, 8($sp)          # restore (almost) all registers
    lw   $ra, 0($sp)
    add  $sp, $sp, 12
    jr   $ra