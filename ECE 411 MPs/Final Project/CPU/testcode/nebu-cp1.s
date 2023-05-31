#  nebu-cp1.s version 1.0
.align 4
.section .text
.globl _start
_start:
        la x10, data
        addi x7, x0, 5
        add x3, x7, x7 # x3 = 10
        add x3, x3, x3 # x3 = 20
        add x3, x3, x3 # x3 = 40
        add x3, x3, x3 # x3 = 80
        add x3, x3, x3 # x3 = 160
        add x3, x3, x3 # x3 = 320
        add x3, x3, x3 # x3 = 640
        add x3, x3, x3 # x3 = 1280 = 0x500
        ## sw x3, 0(x10)
        ## lw x20, 0(x10)
        ## addi x31, x20, 0
        sltu x4, x0, x3
        slti x4, x4, 1
        slti x4, x4, 1
        slti x4, x4, 1
        slti x4, x4, 1
        slti x4, x4, 1
        slti x4, x4, 1
        slti x4, x4, 1
        slti x4, x4, 1 # x4 == 1
        addi x1, x0, 4
        beq x0, x4, hell # Untaken branch, should be a nop.

halt:
        j halt
        addi x1, x0, 100 # This instruction should never take place.
        addi x5, x0, 800 # This instruction should never take place.



hell:
        nop

.section .rodata
data:   .word 0x01020304
