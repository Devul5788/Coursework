addi x5, x0, 32
addi x4, x0, -10
## addi x6, x0, -5

## test_muls:
##         mul x3, x4, x5
##         mulh x3, x4, x5
##         mulhu x3, x4, x5
##         mulhsu x3, x4, x5
##         addi x5, x5, -16
##         addi x4, x4, -1
        ## bne x4, x6, test_muls

div x3, x5, x4
mul x3, x5, x4
divu x3, x5, x4
mulh x3, x5, x4
rem x2, x5, x4
mulhu x3, x5, x4
remu x2, x5, x3
mulhsu x3, x5, x4

div x3, x5, x0
rem x2, x5, x0
divu x3, x5, x0
remu x2, x5, x0


addi x2, x0, 1
sll x2, x2, 31
div x2, x2, x3

halt:
        j halt

##         nop
##         nop
##         nop
##         nop
##         nop
##         nop
##         nop
##         nop
## A:
##         .word 0x1234abcd
##         nop
##         nop
##         nop
##         nop
##         nop
##         nop
