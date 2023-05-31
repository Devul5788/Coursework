.align 4
.globl _start

_start:
        j start

timer_handler:
        la x1, uart_data
        lw x1, (x1)
        addi x2, x0, 0x53
        sw x2, (x1)
        csrw mip, x0
        la x31, timecmpl_addr
        lw x31, (x31)
        addi x30, x30, 10
        sw x30, (x31)
        mret

start:
        la x31, timecmpl_addr
        lw x31, (x31)
        addi x30, x0, 100
        sw x30, (x31)   # timecmpl = 500
        csrrsi x0, mstatus, 0x8
        la x31, timer_handler
        csrw mtvec, x31
        addi x31, x0, 0x80
        csrrs x0, mie, x31
tmp:
        nop # Spin in a tight loop
        j tmp

halt:
        j halt


timerl_addr:   .word 0x1100bff8
timerh_addr:   .word 0x1100bffc
timecmpl_addr: .word 0x11004000
timecmph_addr: .word 0x11004004

uart_poll:     .word 0x10000005
uart_data:     .word 0x10000000
