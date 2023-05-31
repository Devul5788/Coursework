addi x4, x4, 0xab
la x1, loc0
lr.w x2, (x1)
addi x3, x2, 1
sw x4, (x1)
sc.w x4, x3, (x1)
addi x4, x4, 0
addi x3, x3, 0
addi x1, x1, 0
lw x5, (x1)

halt:
        j halt

loc0:   .word 0x1234abcd
