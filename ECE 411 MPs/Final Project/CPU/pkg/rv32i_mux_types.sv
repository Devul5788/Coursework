// bitbanger MUXes.
package imm_mux;
typedef enum bit [2:0] {
    i_imm   = 3'b000,
    u_imm   = 3'b001,
    b_imm   = 3'b010,
    s_imm   = 3'b011,
    j_imm   = 3'b100,
    zero    = 3'b101,
    c_imm   = 3'b110
} imm_mux;
endpackage

package wb_mux;
typedef enum bit [3:0] {
    alu_or_cmp_result = 4'h0,
    imm               = 4'h1,
    pc_plus4          = 4'h2,
    lw                = 4'h3,
    lb                = 4'h4,
    lbu               = 4'h5,
    lh                = 4'h6,
    lhu               = 4'h7,
    csr_out           = 4'h8
} wb_mux;
endpackage

package pc_mux;
typedef enum bit [1:0] {
    alu_result = 2'b00,
    alu_mod2   = 2'b01,
    mepc       = 2'b10,
    mtvec      = 2'b11
} pc_mux;
endpackage

package alu_mux;
typedef enum bit [1:0] {
    no_fwd  = 2'b00,
    fwd_mem = 2'b01,
    fwd_wb  = 2'b10
} alu_fwdmux;
endpackage

package ex_mux;
typedef enum bit [1:0] {
    alu_result = 2'b00,
    cmp_result = 2'b01,
    mul_result = 2'b10,
    div_result = 2'b11
} ex_mux;
endpackage
