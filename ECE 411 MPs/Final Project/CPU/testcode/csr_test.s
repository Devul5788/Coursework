.align 4
.section .text
.globl _start
_start:
csrr x1, mvendorid
add x1, x1, x0

# Set the bottom four bits of mscratch
addi x3, x3, 0x7ff
lui x5, 0xfff
csrrw x4, mscratch, x5          # x4 <- 0, mscr <- 0xfff
csrrw x4, mscratch, x4          # mscr <- 0, x4 <- 0xfff
csrr x4, mscratch
csrr x4, mscratch
csrrw x4, mscratch, x5
csrr x4, mscratch
csrrw x4, mscratch, x3
csrr x4, mscratch
csrrsi x2, mscratch, 0xf
csrrci x2, mscratch, 0xf
csrr x4, mscratch
csrrsi x2, mscratch, 0xf
csrrci x2, mscratch, 0xf
csrr x4, mscratch
addi x4, x4, 0
addi x3, x3, 0
addi x2, x2, 0


halt:
        j halt
