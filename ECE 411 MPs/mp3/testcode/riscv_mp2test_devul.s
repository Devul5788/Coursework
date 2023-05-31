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

    # ADD instruction
    li x3, 2 # load the value 2 into register x1
    li x4, 5 # load the value 5 into register x2
    add x5, x3, x4 # add the values stored in x1 and x2 and store the

    # SUB instruction
    li x1, 5 # load the value 5 into register x1
    li x2, 2 # load the value 2 into register x2
    sub x3, x1, x2 # subtract the value stored in x2 from the value stored in x1 and store the result in x3

    # SLL instruction
    li x1, 5 # load the value 5 into register x1
    li x2, 2 # load the value 2 into register x2 (number of bits to shift)
    sll x3, x1, x2 # shift the value stored in x1 left by the number of bits specified in x2 and store the result in x3

    # SLT instruction
    li x1, 5 # load the value 5 into register x1
    li x2, 2 # load the value 2 into register x2
    slt x3, x1, x2 # compare the values stored in x1 and x2, and if x1 is less than x2, store 1 in x3, otherwise store 0

    # SLTU instruction
    li x1, -5 # load the value -5 into register x1
    li x2, 2 # load the value 2 into register x2
    sltu x3, x1, x2 # compare the values stored in x1 and x2 as unsigned integers, and if x1 is less than x2, store 1 in x3, otherwise store 0

    # XOR instruction
    li x1, 5 # load the value 5 into register x1
    li x2, 2 # load the value 2 into register x2
    xor x3, x1, x2 # perform a bitwise XOR operation between the values stored in x1 and x2 and store the result in x3

    # SRL instruction
    li x1, 5 # load the value 5 into register x1
    li x2, 2 # load the value 2 into register x2 (number of bits to shift)
    srl x3, x1, x2 # shift the value stored in x1 right by the number of bits specified in x2 and store the result in x3

    # SRA instruction
    li x1, -5 # load the value -5 into register x1
    li x2, 2 # load the value 2 into register x2 (number of bits to shift)
    sra x3, x1, x2 # shift the value stored in x1 right by the number of bits specified in x2, replicating the sign bit and store the result in x3

    # OR instruction
    li x1, 5 # load the value 5 into register x1
    li x2, 2 # load the value 2 into register x2
    or x3, x1, x2 # perform a bitwise OR operation between the values stored in x1 and x2 and store the result in x3

    # AND instruction
    li x1, 5 # load the value 5 into register x1
    li x2, 2 # load the value 2 into register x2
    and x3, x1, x2 # perform a bitwise AND operation between the values stored in x1 and x2 and store the result in x3

# JAL instruction
    jal x1, jalr_inst # jump to the instruction labeled "label" and store the return address in register $ra

jalr_inst:
    # JALR instruction
    la x1, load_inst # load the address of the label "label" into register x1
    jalr x3, x1, 0 # jump to the instruction at the address stored in x1 and store the return address in register $ra

load_inst:
    la x1, mem_location # load the address of the memory location "mem_location" into register x1

    # LB instruction
    lb x2, 0(x1) # load the contents of the memory location into register x2 as a signed 8-bit value

    # LB instruction
    lb x2, 1(x1) # load the contents of the memory location into register x2 as a signed 8-bit value

    # LB instruction
    lb x2, 2(x1) # load the contents of the memory location into register x2 as a signed 8-bit value

    # LB instruction
    lb x2, 3(x1) # load the contents of the memory location into register x2 as a signed 8-bit value
    
    # LBU instruction
    lbu x2, 0(x1) # load the contents of the memory location into register x2 as an unsigned 8-bit value

    # LBU instruction
    lbu x2, 1(x1) # load the contents of the memory location into register x2 as an unsigned 8-bit value

    # LBU instruction
    lbu x2, 2(x1) # load the contents of the memory location into register x2 as an unsigned 8-bit value

    # LBU instruction
    lbu x2, 3(x1) # load the contents of the memory location into register x2 as an unsigned 8-bit value

    # LH instruction
    lh x2, 0(x1) # load the contents of the memory location into register x2 as a signed 16-bit value

    # LHU instruction
    lhu x2, 0(x1) # load the contents of the memory location into register x2 as an unsigned 16-bit value

    # SB instruction (0 byte)
    li x2, 5 # load the value 5 into register x2
    sb x2, 0(x1) # store the 8-bit value stored in x2 into the memory location

    # SB instruction (1 byte)
    li x2, 5 # load the value 5 into register x2
    sb x2, 1(x1) # store the 8-bit value stored in x2 into the memory location

    # SB instruction (2 byte)
    li x2, 5 # load the value 5 into register x2
    sb x2, 2(x1) # store the 8-bit value stored in x2 into the memory location

    # SB instruction (3 byte)
    li x2, 5 # load the value 5 into register x2
    sb x2, 3(x1) # store the 8-bit value stored in x2 into the memory location

    # SH instruction (0 byte)
    li x2, 5 # load the value 5 into register x2
    sh x2, 0(x1) # store the 16-bit value stored in x2 into the memory

    # SH instruction
    li x2, 5 # load the value 5 into register x2
    sh x2, 2(x1) # store the 16-bit value stored in x2 into the memory

    # branching
    li x1, 10
    li x2, 20
    li x3, 5

    # branch based on values in registers
    beq x1, x2, equal # branch to "equal" if x1 == x2
    bne x1, x2, not_equal # branch to "not_equal" if x1 != x2
    blt x1, x3, less_than # branch to "less_than" if x1 < x3
    bgt x1, x3, greater_than # branch to "greater_than" if x1 > x3

# Equal label
equal:
    li x3, 1 # set x3 to 1 if x1 == x2
    j halt # jump to end of program

# Not Equal label
not_equal:
    li x3, 0 # set x3 to 0 if x1 != x2

# Less Than label
less_than:
  li x4, 2 # set x4 to 2 if x1 < x3
  j halt # jump to end of program

# Greater Than label
greater_than:
  li x4, 3 # set x4 to 3 if x1 > x3

halt:                 # Infinite loop to keep the processor
    beq x0, x0, halt  # from trying to execute the data below.
                      # Your own programs should also make use
                      # of an infinite loop at the end.

deadend:
    lw x8, bad     # X8 <= 0xdeadbeef
deadloop:
    beq x8, x8, deadloop

.section .rodata

bad:        .word 0xdeadbeef
threshold:  .word 0x00000040
result:     .word 0x00000000
good:       .word 0x600d600d
mem_location: .byte 0x12
