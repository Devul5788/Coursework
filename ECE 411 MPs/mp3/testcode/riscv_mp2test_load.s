riscv_mp2test.s:
.section .text
.globl _start
    # Refer to the RISC-V ISA Spec for the functionality of
    # the instructions in this test program.
_start:
    # Note that the comments in this file should not be taken as
    # an example of good commenting style!!  They are merely provided
    # in an effort to help you understand the assembly style.

    lw x1, bad # load the address of the memory location "mem_location" into register x1
    lw x2, threshold
    lw x3, result
    lw x4, good
    lw x5, five
    lw x6, six
    lw x7, seven
    lw x8, eight

    lb x1, bad1 # load the address of the memory location "mem_location" into register x1
    lb x2, threshold1
    lb x3, result1
    lb x4, good1
    lb x5, five1
    lb x6, six1
    lb x7, seven1
    lb x8, eight1

    lbu x1, bad2 # load the address of the memory location "mem_location" into register x2
    lbu x2, threshold2
    lbu x3, result2
    lbu x4, good2
    lbu x5, five2
    lbu x6, six2
    lbu x7, seven2
    lbu x8, eight2

    lh x1, bad3 # load the address of the memory location "mem_location" into register x3
    lh x3, threshold3
    lh x3, result3
    lh x4, good3
    lh x5, five3
    lh x6, six3
    lh x7, seven3
    lh x8, eight3

    lhu x1, bad4 # load the address of the memory location "mem_location" into register x4
    lhu x4, threshold4
    lhu x4, result4
    lhu x4, good4
    lhu x5, five4
    lhu x6, six4
    lhu x7, seven4
    lhu x8, eight4

    la x1, bad5
    sb x1, 0(x1) 
    sb x1, 1(x1) 
    sb x1, 2(x1) 
    sb x1, 3(x1) 

    la x1, bad6 # load the address of the memory location "mem_location" into register x6
    sh x1, 0(x1) 
    sh x1, 2(x1) 

    lw x1, bad7 # load the address of the memory location "mem_location" into register x7
    lw x7, threshold7
    lw x7, result7
    lw x7, good7
    lw x7, five7
    lw x7, six7
    lw x7, seven7
    lw x8, eight7

    lw x1, bad7 # load the address of the memory location "mem_location" into register x7
    lw x7, threshold7
    lw x7, result7
    lw x7, good7
    lw x7, five7
    lw x7, six7
    lw x7, seven7
    lw x8, eight7

    lw x1, bad8 # load the address of the memory location "mem_location" into register x8
    lw x8, threshold8
    lw x8, result8
    lw x8, good8
    lw x8, five8
    lw x8, six8
    lw x8, seven8
    lw x8, eight8

    lw x1, bad9 # load the address of the memory location "mem_location" into register x9
    lw x9, threshold9
    lw x9, result9
    lw x9, good9
    lw x9, five9
    lw x9, six9
    lw x9, seven9
    lw x8, eight9

    lw x1, bad10 # load the address of the memory location "mem_location" into register x10
    lw x1, threshold10
    lw x1, result10
    lw x1, good10
    lw x1, five10
    lw x1, six10
    lw x1, seven10
    lw x8, eight10

    lw x1, bad11 # load the address of the memory location "mem_location" into register x11
    lw x1, threshold11
    lw x1, result11
    lw x1, good11
    lw x1, five11
    lw x1, six11
    lw x1, seven11
    lw x8, eight11

    lw x1, bad12 # load the address of the memory location "mem_location" into register x12
    lw x1, threshold12
    lw x1, result12
    lw x1, good12
    lw x1, five12
    lw x1, six12
    lw x1, seven12
    lw x8, eight12

    lw x1, bad13 # load the address of the memory location "mem_location" into register x13
    lw x1, threshold13
    lw x1, result13
    lw x1, good13
    lw x1, five13
    lw x1, six13
    lw x1, seven13
    lw x8, eight13

    lw x1, bad14 # load the address of the memory location "mem_location" into register x14
    lw x1, threshold14
    lw x1, result14
    lw x1, good14
    lw x1, five14
    lw x1, six14
    lw x1, seven14
    lw x8, eight14

    lw x1, bad15 # load the address of the memory location "mem_location" into register x15
    lw x1, threshold15
    lw x1, result15
    lw x1, good15
    lw x1, five15
    lw x1, six15
    lw x1, seven15
    lw x8, eight15

    lw x1, bad16 # load the address of the memory location "mem_location" into register x16
    lw x1, threshold16
    lw x1, result16
    lw x1, good16
    lw x1, five16
    lw x1, six16
    lw x1, seven16
    lw x8, eight16

    la x1, eight17
    sw x1, 0(x1);

 

    la x1, eight17 # load the address of the memory location "mem_location" into register x6
    sh x1, 0(x1) 
    sh x1, 2(x1) 

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
