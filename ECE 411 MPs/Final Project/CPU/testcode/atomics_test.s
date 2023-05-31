#######################################
## Test for atomic memory operation. ##
#######################################
# To use this test, simply replace the atomic
# with any atomic from:
        ## amoadd
        ## amoand
        ## amoor
        ## amoswap
        ## amoxor
# The processor currently leaves the max/min
# AMOs unimplemented.

la x1, loc
addi x2, x2, 0x0f
amoswap.w x3, x3, (x1)
lw x4, 0(x1)
add x3, x3, x0
add x2, x2, x0
add x1, x1, x0

halt:
        j halt

loc:    .word 0x1234abcd
loc2:    .word 0x3250873a
