## Testing this with spike is tricky, since
## it sets the privilege level to 0 after an
## mret, so our script fails.

.align 4

.globl _start
_start:

        la x3, ret_addr
        csrw mepc, x3
        nop
        mret
        nop
        nop
        nop
        nop
        nop
        nop

ret_addr:
        addi x4, x4, 10
        addi x2, x2, 0

halt:
        j halt
