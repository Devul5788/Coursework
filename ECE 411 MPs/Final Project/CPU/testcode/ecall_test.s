.align 4
.globl _start

_start:
        addi x1, x1, 0x600
        add x1, x1, x1
        add x1, x1, x1
        la x2, usermode_subr
        csrw mtvec, x2
        csrrc x0, mstatus, x1
        ecall

halt:
        j halt


usermode_subr:
        la x9, random_label
        addi x2, x2, 2
        mul x2, x2, x2
        mul x2, x2, x2
        mul x2, x2, x2
        csrr x3, mepc
        addi x3, x3, 4
        csrw mepc, x3
        lw x2, (x9)
        mret


random_label:   .word 0x1234abcd
