
module cmp_module
import rv32i_types::*;
(
    input branch_funct3_t op,
    input rv32i_word a,
    input rv32i_word b, 
    output logic f
);

always_comb begin
    unique case (op)
        rv32i_types::beq: f = (a == b);
        rv32i_types::bne: f = (a != b);
        rv32i_types::blt: f = ($signed(a) < $signed(b));
        rv32i_types::bge: f = ($signed(a) >= $signed(b));
        rv32i_types::bltu: f = ($unsigned(a) < $unsigned(b));
        rv32i_types::bgeu: f = ($unsigned(a) >= $unsigned(b));
        default: f = 0;
    endcase
end
endmodule : cmp_module

module datapath
import rv32i_types::*;
(
    input clk,
    input rst,
    input load_mdr,
    input rv32i_word mem_rdata,
    output rv32i_word mem_wdata, // signal used by RVFI Monitor

    input load_pc,
    input load_ir,
    input load_regfile,
    input load_mar,
    input load_data_out,
    input pcmux::pcmux_sel_t pcmux_sel,
    input branch_funct3_t cmpop,
    input alumux::alumux1_sel_t alumux1_sel,
    input alumux::alumux2_sel_t alumux2_sel,
    input regfilemux::regfilemux_sel_t regfilemux_sel,
    input marmux::marmux_sel_t marmux_sel,
    input cmpmux::cmpmux_sel_t cmpmux_sel,
    input alu_ops aluop,
    output rv32i_opcode opcode,
    output logic [2:0] funct3,
    output logic [6:0] funct7,
    output logic br_en,
    output logic [4:0] rs1,
    output logic [4:0] rs2,
    output rv32i_word mem_address,
    output logic [1:0] shift_bits 
    /* You will need to connect more signals to your datapath module*/
);

/******************* Signals Needed for RVFI Monitor *************************/
rv32i_word pcmux_out;
rv32i_word rs1_out;
rv32i_word rs2_out;
rv32i_reg rd;
rv32i_word pc_out;
rv32i_word regfilemux_out;
rv32i_word mdrreg_out;
rv32i_word cmp_mux_out;
rv32i_word alu_out;
rv32i_word alumux1_out;
rv32i_word alumux2_out;
rv32i_word marmux_out;
rv32i_word i_imm;
rv32i_word s_imm;
rv32i_word b_imm;
rv32i_word u_imm;
rv32i_word j_imm;
rv32i_word write_data;
rv32i_word mar_out;

// we assign mem_addr here instead of the output of the mar
// because the output of mar could be different mem_addr (other things could change it)
// This could lead to conflicts.
// Lets say mar_out is: 0x87654321
// shift bits would 01 here. Meaning that mem_wdata will be:  0x87654321 << 8*1 = 0x65432100
// now we have the mask such that 0x0001<<shift bits = 0x0001 << 1 = 0x0010. Meaning that 
// Only the second byte is relevant from  0x65432100, which is 0x21. This is what we wanted.
assign mem_address = {mar_out[31:2], 2'd0};
assign shift_bits = mar_out[1:0];
assign mem_wdata = write_data << (shift_bits * 8);

/*****************************************************************************/

/***************************** Registers *************************************/
// Keep Instruction register named `IR` for RVFI Monitor
ir IR(
    .clk(clk),
    .rst(rst),
    .load(load_ir),
    .in(mdrreg_out),
    .funct3(funct3),
    .funct7(funct7),
    .opcode(opcode),
    .i_imm(i_imm),
    .s_imm(s_imm),
    .b_imm(b_imm),
    .u_imm(u_imm),
    .j_imm(j_imm),
    .rs1(rs1),
    .rs2(rs2),
    .rd(rd)
);

pc_register PC(
    .clk(clk),
    .rst(rst),
    .load(load_pc),
    .in(pcmux_out),
    .out(pc_out)
);

register MDR(
    .clk  (clk),
    .rst (rst),
    .load (load_mdr),
    .in   (mem_rdata),
    .out  (mdrreg_out)
);

register MAR(
    .clk(clk),
    .rst(rst),
    .load(load_mar),
    .in(marmux_out),
    .out(mar_out)
);

register mem_data_out(
    .clk(clk),
    .rst(rst),
    .load(load_data_out),
    .in(rs2_out),
    .out(write_data)
);

regfile regfile(
    .clk(clk),
    .rst(rst),
    .load(load_regfile),
    .in(regfilemux_out),
    .src_a(rs1),
    .src_b(rs2),
    .dest(rd),
    .reg_a(rs1_out),
    .reg_b(rs2_out)
);

/*****************************************************************************/

/******************************* ALU and CMP *********************************/
alu alu_inst(
    .aluop(aluop),
    .a(alumux1_out),
    .b(alumux2_out),
    .f(alu_out)
);

cmp_module cmp(
    .op(cmpop),
    .a(rs1_out),
    .b(cmp_mux_out),
    .f(br_en)
);
/*****************************************************************************/

/******************************** Muxes **************************************/
always_comb begin : MUXES
    // We provide one (incomplete) example of a mux instantiated using
    // a case statement.  Using enumerated types rather than bit vectors
    // provides compile time type safety.  Defensive programming is extremely
    // useful in SystemVerilog. 
    unique case (pcmux_sel)
        pcmux::pc_plus4: pcmux_out = pc_out + 4;
        pcmux::alu_out: pcmux_out = alu_out;
        pcmux::alu_mod2: pcmux_out = {alu_out[31:1], 1'b0};
        default: pcmux_out = pc_out + 4;
    endcase

    unique case (regfilemux_sel)
        regfilemux::alu_out: regfilemux_out = alu_out;
        regfilemux::br_en: regfilemux_out =  {31'b0, br_en}; // br_en is 1 bit, it is zero extended by 31 bits
        regfilemux::u_imm: regfilemux_out = u_imm;
        regfilemux::lw: regfilemux_out = mdrreg_out;
        regfilemux::pc_plus4: regfilemux_out = pc_out + 4;
        regfilemux::lb:
            unique case (shift_bits)
                4'b00: regfilemux_out = {{24{mdrreg_out[7]}}, mdrreg_out[7:0]};
                4'b01: regfilemux_out = {{24{mdrreg_out[15]}}, mdrreg_out[15:8]};
                4'b10: regfilemux_out = {{24{mdrreg_out[23]}}, mdrreg_out[23:16]};
                4'b11: regfilemux_out = {{24{mdrreg_out[31]}}, mdrreg_out[31:24]};
            endcase
        regfilemux::lbu:
            unique case (shift_bits)
                4'b00: regfilemux_out = {24'b0, mdrreg_out[7:0]};
                4'b01: regfilemux_out = {24'b0, mdrreg_out[15:8]};
                4'b10: regfilemux_out = {24'b0, mdrreg_out[23:16]};
                4'b11: regfilemux_out = {24'b0, mdrreg_out[31:24]};
            endcase
        regfilemux::lh:
            unique case (shift_bits)
                4'b00: regfilemux_out = {{16{mdrreg_out[15]}}, mdrreg_out[15:0]};
                4'b10: regfilemux_out = {{16{mdrreg_out[31]}}, mdrreg_out[31:16]};
                default: regfilemux_out = {{16{mdrreg_out[15]}}, mdrreg_out[15:0]};
            endcase
        regfilemux::lhu:
            unique case (shift_bits)
                4'b00: regfilemux_out = {16'b0, mdrreg_out[15:0]};
                4'b10: regfilemux_out = {16'b0, mdrreg_out[31:16]};
                default: regfilemux_out = {16'b0, mdrreg_out[15:0]};
            endcase
        default: regfilemux_out = alu_out;
    endcase

    unique case (cmpmux_sel)
        cmpmux::rs2_out: cmp_mux_out = rs2_out;
        cmpmux::i_imm: cmp_mux_out = i_imm;
        default: cmp_mux_out = rs2_out;
    endcase

    unique case (marmux_sel)
        marmux::pc_out: marmux_out = pc_out;
        marmux::alu_out: marmux_out =  alu_out;
        default: marmux_out = pc_out;
    endcase

    unique case (alumux1_sel)
        alumux::rs1_out: alumux1_out = rs1_out;
        alumux::pc_out: alumux1_out =  pc_out;
        default: alumux1_out = rs1_out;
    endcase

    unique case (alumux2_sel)
        alumux::i_imm: alumux2_out = i_imm;
        alumux::u_imm: alumux2_out = u_imm;
        alumux::b_imm: alumux2_out = b_imm;
        alumux::s_imm: alumux2_out = s_imm;
        alumux::rs2_out: alumux2_out = rs2_out;
        default: alumux2_out = i_imm;
    endcase
end
/*****************************************************************************/
endmodule : datapath
