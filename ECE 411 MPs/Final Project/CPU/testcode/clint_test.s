.align 4
.globl _start

        la x15, timerh_addr
        lw x15, (x15)
        la x14, timerl_addr
        lw x14, (x14)

linux_loop:
        lw x13, (x15)
        lw x10, (x14)
        lw x11, (x15)
        bne x11, x13, linux_loop

halt:
        j halt

timerl_addr:   .word 0x1100bff8
timerh_addr:   .word 0x1100bffc
