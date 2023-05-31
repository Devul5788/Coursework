package rv32i_types;

parameter mtimecmpl_addr = 32'h11004000;
parameter mtimecmph_addr = 32'h11004004;

typedef logic [31:0] rv32i_word;
typedef logic [4:0] rv32i_reg;
typedef logic [3:0] rv32i_mem_wmask;

typedef enum bit [6:0] {
    op_lui    = 7'b0110111, // load upper immediate (U type)
    op_auipc  = 7'b0010111, // add upper immediate PC (U type)
    op_jal    = 7'b1101111, // jump and link (J type)
    op_jalr   = 7'b1100111, // jump and link register (I type)
    op_br     = 7'b1100011, // branch (B type)
    op_load   = 7'b0000011, // load (I type)
    op_store  = 7'b0100011, // store (S type)
    op_imm    = 7'b0010011, // arith ops with register/immediate operands (I type)
    op_reg    = 7'b0110011, // arith ops with register operands (R type)
    op_system = 7'b1110011, // system: csr / ecall / ebreak (I type)
    op_atomic = 7'b0101111, // atomics
    op_fence  = 7'b0001111  // fences
} rv32i_opcode;

typedef enum bit [2:0] {
    beq  = 3'b000,
    bne  = 3'b001,
    blt  = 3'b100,
    bge  = 3'b101,
    bltu = 3'b110,
    bgeu = 3'b111
} branch_funct3_t;

typedef enum bit [2:0] {
    lb  = 3'b000,
    lh  = 3'b001,
    lw  = 3'b010,
    lbu = 3'b100,
    lhu = 3'b101
} load_funct3_t;

typedef enum bit [2:0] {
    sb = 3'b000,
    sh = 3'b001,
    sw = 3'b010
} store_funct3_t;

typedef enum bit [2:0] {
    add  = 3'b000, //check bit30 for sub if op_reg opcode
    sll  = 3'b001,
    slt  = 3'b010,
    sltu = 3'b011,
    axor = 3'b100,
    sr   = 3'b101, //check bit30 for logical/arithmetic
    aor  = 3'b110,
    aand = 3'b111
} arith_funct3_t;

typedef enum bit [3:0] {
    alu_add    = 4'b0000,
    alu_sll    = 4'b0001,
    alu_sra    = 4'b0010,
    alu_sub    = 4'b0011,
    alu_xor    = 4'b0100,
    alu_srl    = 4'b0101,
    alu_or     = 4'b0110,
    alu_and    = 4'b0111,
    alu_pass_a = 4'b1000,
    alu_pass_b = 4'b1001
} alu_ops;

typedef enum bit [11:0] {
    mstatus   = 12'h300,
    misa      = 12'h301,
    mie       = 12'h304,
    mtvec     = 12'h305,
    mscratch  = 12'h340,
    mepc      = 12'h341,
    mcause    = 12'h342,
    mtval     = 12'h343,
    mip       = 12'h344,
    cyclel    = 12'hc00,
    mvendorid = 12'hf11
} csr_reg;


typedef struct packed {
    // EX
    imm_mux::imm_mux ex_imm_sel;
    logic ex_rs1n_pc;
    logic ex_rs2_immn;
    logic ex_cmp_rs2_immn;
    alu_ops ex_aluop;
    branch_funct3_t ex_cmpop;
    logic ex_br;
    logic ex_jmp;
    pc_mux::pc_mux ex_pc_mux;
    ex_mux::ex_mux ex_out_mux;
    logic ex_mult_start;
    logic ex_div_start;
    logic ex_c_imm;
    logic ex_mret_restore_mstatus;
    logic ex_do_a_trap;

    // MEM
    logic mem_dread;
    logic mem_dwrite;
    // WB
    wb_mux::wb_mux wb_data_sel;
    logic wb_regfile_ld;
    logic wb_csrfile_ld;

    // For RVFI
    logic rvfi_commit;
} rv32i_ctrl;

endpackage : rv32i_types

package rv32i_pipereg;
import rv32i_types::*;
    typedef struct packed {
        rv32i_word instruction;
        rv32i_word pc;
        logic      irq;
    } if_id_t;

    typedef struct packed {
        rv32i_word instruction;
        rv32i_word pc;
        rv32i_word rs1_out;
        rv32i_word rs2_out;
        rv32i_ctrl ctrl;
        logic atomic_use_pipereg_ex;
        logic atomic_swap_skip_fwd_rs1;
        logic atomic_use_pipereg_mem;
        rv32i_word csr_out;
        rv32i_word mepc;
        rv32i_word mtvec;
        logic [1:0] cpl;
        logic       irq_en;
    } id_ex_t;

    typedef struct packed {
        rv32i_word instruction;
        rv32i_word pc;
        rv32i_word rs2_out;
        rv32i_ctrl ctrl;
        rv32i_word imm;
        rv32i_word alu_result;
        rv32i_word cmp_result;
        rv32i_word mul_result;
        rv32i_word div_result;
        logic atomic_use_pipereg_mem;
        rv32i_word csr_out;
    } ex_mem_t;

    typedef struct packed {
        rv32i_word instruction;
        rv32i_word pc;
        rv32i_ctrl ctrl;
        rv32i_word imm;
        rv32i_word alu_or_cmp_result;
        rv32i_word data_mem_out;
        rv32i_word csr_out;
        logic clear_mtip;
    } mem_wb_t;
endpackage
