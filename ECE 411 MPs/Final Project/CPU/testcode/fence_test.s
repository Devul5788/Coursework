.align 4
.globl _start
_start:
        la x1, new_ins
        la x2, to_change
        lw x3, (x1)
        addi x4, x0, 10
        sw x3, (x2)
        fence.i
to_change:
        addi x4, x0, 0

        fence
halt:
        j halt

new_ins:
        ## addi x4, x4, 100
        .word 0x06420213
