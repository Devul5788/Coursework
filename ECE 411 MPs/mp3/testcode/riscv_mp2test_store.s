riscv_mp2test.s:
.align 4
.section .text
.globl _start
    # Refer to the RISC-V ISA Spec for the functionality of
    # the instructions in this test program.
_start:
    # Note that the comments in this file should not be taken as
    # an example of good commenting style!!  They are merely provided
    # in an effort to help you understand the assembly style.

    la x1, bad # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    sw x1, 4(x1)
    la x2, threshold
    sw x1, 0(x2)
    sw x1, 4(x2)
    la x3, result
    sw x1, 0(x3)
    sw x1, 4(x3)
    la x4, good
    sw x1, 0(x4)
    sw x1, 4(x4)
    la x5, five
    sw x1, 0(x5)
    sw x1, 4(x5)
    la x6, six
    sw x1, 0(x6)
    sw x1, 4(x6)
    la x7, seven
    sw x1, 0(x7)
    sw x1, 4(x7)
    la x8, eight
    sw x1, 0(x8)
    sw x1, 4(x8)

    la x1, bad1 # load the address of the memory location "mem_location" into register x1
    sb x1, 0(x1)
    sb x1, 1(x1)
    sb x1, 2(x1)
    sb x1, 3(x1)
    la x2, threshold1
    sb x1, 0(x2)
    sb x1, 1(x2)
    sb x1, 2(x2)
    sb x1, 3(x2)
    la x3, result1
    sb x1, 0(x3)
    sb x1, 1(x3)
    sb x1, 2(x3)
    sb x1, 3(x3)
    la x4, good1
    sb x1, 0(x4)
    sb x1, 1(x4)
    sb x1, 2(x4)
    sb x1, 3(x4)
    la x5, five1
    sb x1, 0(x5)
    sb x1, 1(x5)
    sb x1, 2(x5)
    sb x1, 3(x5)
    la x6, six1
    sb x1, 0(x6)
    sb x1, 1(x6)
    sb x1, 2(x6)
    sb x1, 3(x6)
    la x7, seven1
    sb x1, 0(x7)
    sb x1, 1(x7)
    sb x1, 2(x7)
    sb x1, 3(x7)
    la x8, eight1
    sb x1, 0(x8)
    sb x1, 1(x8)
    sb x1, 2(x8)
    sb x1, 3(x8)

    la x1, bad2 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold2
    sw x1, 0(x2)
    la x3, result2
    sw x1, 0(x3)
    la x4, good2
    sw x1, 0(x4)
    la x5, five2
    sw x1, 0(x5)
    la x6, six2
    sw x1, 0(x6)
    la x7, seven2
    sw x1, 0(x7)
    la x8, eight2
    sw x1, 0(x8)

    la x1, bad3 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold3
    sw x1, 0(x2)
    la x3, result3
    sw x1, 0(x3)
    la x4, good3
    sw x1, 0(x4)
    la x5, five3
    sw x1, 0(x5)
    la x6, six3
    sw x1, 0(x6)
    la x7, seven3
    sw x1, 0(x7)
    la x8, eight3
    sw x1, 0(x8)

    la x1, bad4 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold4
    sw x1, 0(x2)
    la x3, result4
    sw x1, 0(x3)
    la x4, good4
    sw x1, 0(x4)
    la x5, five4
    sw x1, 0(x5)
    la x6, six4
    sw x1, 0(x6)
    la x7, seven4
    sw x1, 0(x7)
    la x8, eight4
    sw x1, 0(x8)

    la x1, bad5 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold5
    sw x1, 0(x2)
    la x3, result5
    sw x1, 0(x3)
    la x4, good5
    sw x1, 0(x4)
    la x5, five5
    sw x1, 0(x5)
    la x6, six5
    sw x1, 0(x6)
    la x7, seven5
    sw x1, 0(x7)
    la x8, eight5
    sw x1, 0(x8)

    la x1, bad6 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold6
    sw x1, 0(x2)
    la x3, result6
    sw x1, 0(x3)
    la x4, good6
    sw x1, 0(x4)
    la x5, five6
    sw x1, 0(x5)
    la x6, six6
    sw x1, 0(x6)
    la x7, seven6
    sw x1, 0(x7)
    la x8, eight6
    sw x1, 0(x8)

    la x1, bad7 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    sw x1, 4(x1)
    la x2, threshold7
    sw x1, 0(x2)
    sw x1, 4(x2)
    la x3, result7
    sw x1, 0(x3)
    sw x1, 4(x3)
    la x4, good7
    sw x1, 0(x4)
    sw x1, 4(x4)
    la x5, five7
    sw x1, 0(x5)
    sw x1, 4(x5)
    la x6, six7
    sw x1, 0(x6)
    sw x1, 4(x6)
    la x7, seven7
    sw x1, 0(x7)
    sw x1, 4(x7)
    la x8, eight7
    sw x1, 0(x8)
    sw x1, 4(x8)

    la x1, bad8 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    sw x1, 4(x1)
    la x2, threshold8
    sw x1, 0(x2)
    sw x1, 4(x1)
    la x3, result8
    sw x1, 0(x3)
    sw x1, 4(x3)
    la x4, good8
    sw x1, 0(x4)
    sw x1, 4(x4)
    la x5, five8
    sw x1, 0(x5)
    sw x1, 4(x5)
    la x6, six8
    sw x1, 0(x6)
    sw x1, 4(x6)
    la x7, seven8
    sw x1, 0(x7)
    sw x1, 4(x7)
    la x8, eight8
    sw x1, 0(x8)
    sw x1, 4(x8)

    la x1, bad9 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold9
    sw x1, 0(x2)
    la x3, result9
    sw x1, 0(x3)
    la x4, good9
    sw x1, 0(x4)
    la x5, five9
    sw x1, 0(x5)
    la x6, six9
    sw x1, 0(x6)
    la x7, seven9
    sw x1, 0(x7)
    la x8, eight9
    sw x1, 0(x8)

    la x1, bad10 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold10
    sw x1, 0(x2)
    la x3, result10
    sw x1, 0(x3)
    la x4, good10
    sw x1, 0(x4)
    la x5, five10
    sw x1, 0(x5)
    la x6, six10
    sw x1, 0(x6)
    la x7, seven10
    sw x1, 0(x7)
    la x8, eight10
    sw x1, 0(x8)

    la x1, bad11 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold11
    sw x1, 0(x2)
    la x3, result11
    sw x1, 0(x3)
    la x4, good11
    sw x1, 0(x4)
    la x5, five11
    sw x1, 0(x5)
    la x6, six11
    sw x1, 0(x6)
    la x7, seven11
    sw x1, 0(x7)
    la x8, eight11
    sw x1, 0(x8)

    la x1, bad12 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold12
    sw x1, 0(x2)
    la x3, result12
    sw x1, 0(x3)
    la x4, good12
    sw x1, 0(x4)
    la x5, five12
    sw x1, 0(x5)
    la x6, six12
    sw x1, 0(x6)
    la x7, seven12
    sw x1, 0(x7)
    la x8, eight12
    sw x1, 0(x8)

    la x1, bad13 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold13
    sw x1, 0(x2)
    la x3, result13
    sw x1, 0(x3)
    la x4, good13
    sw x1, 0(x4)
    la x5, five13
    sw x1, 0(x5)
    la x6, six13
    sw x1, 0(x6)
    la x7, seven13
    sw x1, 0(x7)
    la x8, eight13
    sw x1, 0(x8)

    la x1, bad14 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold14
    sw x1, 0(x2)
    la x3, result14
    sw x1, 0(x3)
    la x4, good14
    sw x1, 0(x4)
    la x5, five14
    sw x1, 0(x5)
    la x6, six14
    sw x1, 0(x6)
    la x7, seven14
    sw x1, 0(x7)
    la x8, eight14
    sw x1, 0(x8)

    la x1, bad15 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold15
    sw x1, 0(x2)
    la x3, result15
    sw x1, 0(x3)
    la x4, good15
    sw x1, 0(x4)
    la x5, five15
    sw x1, 0(x5)
    la x6, six15
    sw x1, 0(x6)
    la x7, seven15
    sw x1, 0(x7)
    la x8, eight15
    sw x1, 0(x8)

    la x1, bad16 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold16
    sw x1, 0(x2)
    la x3, result16
    sw x1, 0(x3)
    la x4, good16
    sw x1, 0(x4)
    la x5, five16
    sw x1, 0(x5)
    la x6, six16
    sw x1, 0(x6)
    la x7, seven16
    sw x1, 0(x7)
    la x8, eight16
    sw x1, 0(x8)

    la x1, bad17 # load the address of the memory location "mem_location" into register x1
    sw x1, 0(x1)
    la x2, threshold17
    sw x1, 0(x2)
    la x3, result17
    sw x1, 0(x3)
    la x4, good17
    sw x1, 0(x4)
    la x5, five17
    sw x1, 0(x5)
    la x6, six17
    sw x1, 0(x6)
    la x7, seven17
    sw x1, 0(x7)
    la x8, eight17
    sw x1, 0(x8)

halt:                 # Infinite loop to keep the processor
    beq x0, x0, halt  # from trying to execute the data below.
                      # Your own programs should also make use
                      # of an infinite loop at the end.

deadend:
    lw x8, bad     # X8 <= 0x1 
deadloop:
    beq x8, x8, deadloop

.section .rodata
bad:        .word 0x1
threshold:  .word 0x2
result:     .word 0x3
good:       .word 0x4
five:       .word 0x5
six:        .word 0x6
seven:      .word 0x7
eight:      .word 0x8

bad1:        .word 0x1
threshold1:  .word 0x2
result1:     .word 0x3
good1:       .word 0x4
five1:       .word 0x5
six1:        .word 0x6
seven1:      .word 0x7
eight1:      .word 0x8

bad2:        .word 0x1
threshold2:  .word 0x2
result2:     .word 0x3
good2:       .word 0x4
five2:       .word 0x5
six2:        .word 0x6
seven2:      .word 0x7
eight2:      .word 0x8

bad3:        .word 0x1
threshold3:  .word 0x2
result3:     .word 0x3
good3:       .word 0x4
five3:       .word 0x5
six3:        .word 0x6
seven3:      .word 0x7
eight3:      .word 0x8

bad4:        .word 0x1
threshold4:  .word 0x2
result4:     .word 0x3
good4:       .word 0x4
five4:       .word 0x5
six4:        .word 0x6
seven4:      .word 0x7
eight4:      .word 0x8

bad5:        .word 0x1
threshold5:  .word 0x2
result5:     .word 0x3
good5:       .word 0x4
five5:       .word 0x5
six5:        .word 0x6
seven5:      .word 0x7
eight5:      .word 0x8

bad6:        .word 0x1
threshold6:  .word 0x2
result6:     .word 0x3
good6:       .word 0x4
five6:       .word 0x6
six6:        .word 0x6
seven6:      .word 0x7
eight6:      .word 0x8

bad7:        .word 0x1
threshold7:  .word 0x2
result7:     .word 0x3
good7:       .word 0x4
five7:       .word 0x5
six7:        .word 0x6
seven7:      .word 0x7
eight7:      .word 0x8

bad8:        .word 0x1
threshold8:  .word 0x2
result8:     .word 0x3
good8:       .word 0x4
five8:       .word 0x5
six8:        .word 0x6
seven8:      .word 0x7
eight8:      .word 0x8

bad9:        .word 0x1
threshold9:  .word 0x2
result9:     .word 0x3
good9:       .word 0x4
five9:       .word 0x5
six9:        .word 0x6
seven9:      .word 0x7
eight9:      .word 0x8

bad10:        .word 0x1
threshold10:  .word 0x2
result10:     .word 0x3
good10:       .word 0x4
five10:       .word 0x5
six10:        .word 0x6
seven10:      .word 0x7
eight10:      .word 0x8

bad11:        .word 0x1
threshold11:  .word 0x2
result11:     .word 0x3
good11:       .word 0x4
five11:       .word 0x5
six11:        .word 0x6
seven11:      .word 0x7
eight11:      .word 0x8

bad12:        .word 0x1
threshold12:  .word 0x00000100
result12:     .word 0x3
good12:       .word 0x1000d10d
five12:       .word 0x00000010
six12:        .word 0x00000010
seven12:      .word 0x00000010
eight12:      .word 0x8

bad13:        .word 0x1
threshold13:  .word 0x00000100
result13:     .word 0x3
good13:       .word 0x1000d10d
five13:       .word 0x00000010
six13:        .word 0x00000010
seven13:      .word 0x00000010
eight13:      .word 0x8

bad14:        .word 0x1
threshold14:  .word 0x00000100
result14:     .word 0x3
good14:       .word 0x1000d10d
five14:       .word 0x00000010
six14:        .word 0x00000010
seven14:      .word 0x00000010
eight14:      .word 0x8

bad15:        .word 0x1
threshold15:  .word 0x00000100
result15:     .word 0x3
good15:       .word 0x1000d10d
five15:       .word 0x00000010
six15:        .word 0x00000010
seven15:      .word 0x00000010
eight15:      .word 0x8

bad16:        .word 0x1
threshold16:  .word 0x00000100
result16:     .word 0x3
good16:       .word 0x1000d10d
five16:       .word 0x00000010
six16:        .word 0x00000010
seven16:      .word 0x00000010
eight16:      .word 0x8

bad17:        .word 0x1
threshold17:  .word 0x00000100
result17:     .word 0x3
good17:       .word 0x1000d10d
five17:       .word 0x00000010
six17:        .word 0x00000010
seven17:      .word 0x00000010
eight17:      .word 0x8
