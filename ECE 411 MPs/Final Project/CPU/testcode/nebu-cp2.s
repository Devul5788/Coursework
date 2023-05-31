#  nebu-cp1.s version 1.0
.align 4
.section .text
.globl _start
_start:
  la x3, data
  j target
  lw x2, 0(x3)
  add x4, x2, x1        # Load-use
        nop
        nop
        nop

target:
        lw x2, 0(x3)
        j halt

halt:
        j halt

.section .rodata
data:   .word 0x01020304
