module ex_stage
import rv32i_types::*;
import alu_mux::*;
    (
        input        clk,
        input        rst,
        input        rv32i_pipereg::id_ex_t id_ex,

        input        mem_rd_write,
        input        rv32i_reg mem_rd_idx,
        input        wb_rd_write,
        input        rv32i_reg wb_rd_idx,
        input        rv32i_word ex_mem_alu_or_cmp_result,
        input        rv32i_word ex_mem_imm,
        input        rv32i_word mem_wb_wb_data,
        input        rv32i_opcode prev_opcode,
        input        stall_ex_multicycle_op,

        output       rv32i_pipereg::ex_mem_t ex_mem,
        output       mult_resp,
        output       div_resp,

        // To IF (for branches)
        output       rv32i_word br_pc,
        output logic br_en,

        // To ID (for traps)
        output       rv32i_word ex_mepc_data,
        output       rv32i_word ex_mcause_data
    );

    // ----------------------------------------------------------------------
    // Pipeline
    // ----------------------------------------------------------------------
    rv32i_word imm;
    assign ex_mem.pc = id_ex.pc;
    assign ex_mem.instruction = id_ex.instruction;
    assign ex_mem.ctrl = id_ex.ctrl;
    assign ex_mem.imm = imm;
    assign ex_mem.atomic_use_pipereg_mem = id_ex.atomic_use_pipereg_mem;

    rv32i_word alu_result;
    rv32i_word cmp_result;
    rv32i_word mul_result;
    rv32i_word div_result;

    assign ex_mem.alu_result = alu_result;
    assign ex_mem.cmp_result = cmp_result;
    assign ex_mem.mul_result = mul_result;
    assign ex_mem.div_result = div_result;

    // ----------------------------------------------------------------------
    // Immediate computation and selection.
    // ----------------------------------------------------------------------
    wire rv32i_word ir;
    assign ir = id_ex.instruction;
    always_comb begin
        unique case (id_ex.ctrl.ex_imm_sel)
            imm_mux::i_imm: imm = {{21{ir[31]}}, ir[30:20]};
            imm_mux::u_imm: imm = {ir[31:12], 12'h000};
            imm_mux::b_imm: imm = {{20{ir[31]}}, ir[7], ir[30:25], ir[11:8], 1'b0};
            imm_mux::s_imm: imm = {{21{ir[31]}}, ir[30:25], ir[11:7]};
            imm_mux::j_imm: imm = {{12{ir[31]}}, ir[19:12], ir[20], ir[30:21], 1'b0};
            imm_mux::c_imm: imm = {{27{1'b0}} , ir[19:15]};
            imm_mux::zero:  imm = '0;
            default: imm = 'x;
        endcase
    end

    // ----------------------------------------------------------------------
    // Forwarding
    // ----------------------------------------------------------------------
    rv32i_word fwd_mux_a;
    rv32i_word fwd_mux_b;
    rv32i_word fwd_mux_a_no_csr;
    rv32i_word fwd_mux_b_no_csr;
    assign ex_mem.rs2_out = fwd_mux_b;
    assign ex_mem.csr_out = id_ex.csr_out;

    alu_fwdmux fwd_a;
    alu_fwdmux fwd_b;

    forwarding_unit forwarding_unit
        (
         .rs1_idx(id_ex.instruction[19:15]),
         .rs2_idx(id_ex.instruction[24:20]),
         .mem_rd_write,
         .mem_rd_idx,
         .wb_rd_write,
         .wb_rd_idx,
         .atomic_use_pipereg_ex(id_ex.atomic_use_pipereg_ex),
         .atomic_swap_skip_fwd_rs1(id_ex.atomic_swap_skip_fwd_rs1),
         .fwd_a,
         .fwd_b
         );

    wire rv32i_word fwd_from_mem;
    // Special case for LUI and SC.W.
    // For SC.W, we don't need to check any other instruction bits
    // since no other atomic uses fwd_mem.
    assign fwd_from_mem = (prev_opcode == op_lui || prev_opcode == op_atomic)
                          ? ex_mem_imm
                          : ex_mem_alu_or_cmp_result;

    always_comb begin
        unique case (fwd_a)
            no_fwd: fwd_mux_a_no_csr = id_ex.rs1_out;
            fwd_wb: fwd_mux_a_no_csr = mem_wb_wb_data;
            fwd_mem: fwd_mux_a_no_csr = fwd_from_mem;
            default: fwd_mux_a_no_csr = 'x;
        endcase
        unique case (fwd_b)
            no_fwd: fwd_mux_b_no_csr = id_ex.rs2_out;
            fwd_wb: fwd_mux_b_no_csr = mem_wb_wb_data;
            fwd_mem: fwd_mux_b_no_csr = fwd_from_mem;
            default: fwd_mux_b_no_csr = 'x;
        endcase
    end

    assign fwd_mux_a = id_ex.ctrl.ex_c_imm == 1'b1
                       ? imm : fwd_mux_a_no_csr;

    assign fwd_mux_b = id_ex.ctrl.wb_csrfile_ld == 1'b1
                       ? id_ex.csr_out : fwd_mux_b_no_csr;

    // ----------------------------------------------------------------------
    // ALU
    // ----------------------------------------------------------------------
    wire rv32i_word alu_a;
    wire rv32i_word alu_b;
    assign alu_a = id_ex.ctrl.ex_rs1n_pc == 1'b1 ? id_ex.pc : fwd_mux_a;
    assign alu_b = id_ex.ctrl.ex_rs2_immn == 1'b1 ? fwd_mux_b : imm;

    always_comb begin
        unique case (id_ex.ctrl.ex_aluop)
            alu_add: alu_result = alu_a + alu_b;
            alu_sll: alu_result = alu_a << alu_b[4:0];
            alu_sra: alu_result = $signed(alu_a) >>> alu_b[4:0];
            alu_sub: alu_result = alu_a - alu_b;
            alu_xor: alu_result = alu_a ^ alu_b;
            alu_srl: alu_result = alu_a >> alu_b[4:0];
            alu_or:  alu_result = alu_a | alu_b;
            alu_and: begin
                alu_result = alu_a & alu_b;
                if (id_ex.ctrl.wb_csrfile_ld == 1'b1) begin
                    alu_result = ~alu_a & alu_b;
                end
            end
            alu_pass_a: alu_result = alu_a;
            alu_pass_b: alu_result = alu_b;
            default: alu_result = '0;
        endcase
    end

    // ----------------------------------------------------------------------
    // CMP
    // ----------------------------------------------------------------------
    wire rv32i_word cmp_a;
    wire rv32i_word cmp_b;
    assign cmp_a = fwd_mux_a;
    assign cmp_b = (id_ex.ctrl.ex_cmp_rs2_immn == 1'b1) ? fwd_mux_b : imm;

    always_comb begin
        cmp_result = '0;
        unique case (id_ex.ctrl.ex_cmpop)
            beq: cmp_result = 32'(cmp_a == cmp_b);
            bne: cmp_result = 32'(cmp_a != cmp_b);
            blt: cmp_result = 32'($signed(cmp_a) < $signed(cmp_b));
            bge: cmp_result = 32'($signed(cmp_a) >= $signed(cmp_b));
            bltu: cmp_result = 32'(cmp_a < cmp_b);
            bgeu: cmp_result = 32'(cmp_a >= cmp_b);
            default: cmp_result = '0;
        endcase
    end


    // ----------------------------------------------------------------------
    // Branch / Trap
    // ----------------------------------------------------------------------
    // Branch decision
    assign br_en = (id_ex.ctrl.ex_jmp == 1'b1) ||
                   (id_ex.ctrl.ex_br == 1'b1 && cmp_result == 32'b1) ||
                   id_ex.irq_en;

    assign ex_mepc_data = id_ex.irq_en == 1'b1 ?
                          id_ex.pc + 32'h4 : id_ex.pc;

    always_comb begin
        ex_mcause_data = 32'd7;
        if (id_ex.cpl == 2'b11) ex_mcause_data = 32'd11;

        // For now, all interrupts are timer interrupts.
        if (id_ex.irq_en == 1'b1) ex_mcause_data = 32'h80000007;
    end

    // Branch PC computation.
    always_comb begin
        unique case (id_ex.ctrl.ex_pc_mux)
            pc_mux::alu_result: br_pc = alu_result;
            pc_mux::alu_mod2: br_pc = {alu_result[31:1], 1'b0};
            pc_mux::mepc: br_pc = id_ex.mepc;
            pc_mux::mtvec: br_pc = id_ex.mtvec;
            default: br_pc = alu_result;
        endcase
    end


    // ----------------------------------------------------------------------
    // Multiplier
    // ----------------------------------------------------------------------
    wire [65:0] mult_product;
    reg [32:0]  mul_a;
    reg [32:0]  mul_b;

    DW_mult_seq
        #(33, // inst_a_width, (32 + 1)
          33, // inst_b_width, (32 + 1)
          1,  // inst_tc_mode (1 = two's complement mode)
          11, // inst_num_cyc, (#cycles-2)
          1,  // inst_rst_mode (1 = synchronous reset)
          1,  // inst_input_mode, (register inputs, for now)
          0,  // inst_output_mode, (don't register outputs)
          0   // inst_early_start
          ) multiplier
            (
             .clk(clk),
             .rst_n(~rst),
             .hold(stall_ex_multicycle_op),
             .start(id_ex.ctrl.ex_mult_start),
             .a(mul_a),
             .b(mul_b),
             .complete(mult_resp),
             .product(mult_product)
             );

    always_comb begin
        // By default, zero extend the inputs.
        mul_a = {1'b0, alu_a};
        mul_b = {1'b0, alu_b};

        unique case (id_ex.instruction[13:12])
            2'b01: begin
                mul_a = {alu_a[31], alu_a};
                mul_b = {alu_b[31], alu_b};
            end
            2'b10: begin
                mul_a = {alu_a[31], alu_a};
            end
            default: begin
                mul_a = {1'b0, alu_a};
                mul_b = {1'b0, alu_b};
            end
        endcase
    end

    always_comb begin
        // mulh, mulhu mulhsu
        mul_result = mult_product[63:32];

        // mul
        if (id_ex.instruction[14:12] == '0) begin
            mul_result = mult_product[31:0];
        end
    end


    // ----------------------------------------------------------------------
    // Divider
    // ----------------------------------------------------------------------
    wire [31:0] div_quotient;
    wire [31:0] div_remainder;
    rv32i_word div_a;
    rv32i_word div_b;

    DW_div_seq
        #(
          32, // inst_a_width,
          32, // inst_b_width,
          0,  // inst_tc_mode,
          17, // inst_num_cyc,
          1,  // inst_rst_mode,
          1,  // inst_input_mode,
          0,  // inst_output_mode,
          0   // inst_early_start
          ) divider
            (
             .clk(clk),
             .rst_n(~rst),
             .hold(stall_ex_multicycle_op),
             .start(id_ex.ctrl.ex_div_start),
             .a(div_a),
             .b(div_b),
             .complete(div_resp),
             .divide_by_0(),
             .quotient(div_quotient),
             .remainder(div_remainder)
             );


    always_comb begin
        div_a = alu_a;
        div_b = alu_b;
        if (alu_a[31] == 1'b1 && id_ex.instruction[12] == 1'b0) div_a = -alu_a;
        if (alu_b[31] == 1'b1 && id_ex.instruction[12] == 1'b0) div_b = -alu_b;
    end

    // div_result can be either the quotient or the remainder.
    // The div by zero and overflow cases are removed since
    // dw_div_seq follows what the RISC-V spec states.
    // May need to be used if the IP is changed.

    `define BITB_USING_DW_DIV_SEQ_IP
    always_comb begin
        div_result = div_quotient;
        unique case (id_ex.instruction[13:12])
            // div
            2'b00: begin
                if (alu_a[31] != alu_b[31]) div_result = -div_quotient;

                `ifndef BITB_USING_DW_DIV_SEQ_IP
                // Division by zero
                if (alu_b == '0) div_result = -1;

                // Signed overflow
                if (alu_a == {1'b1, {31{1'b0}}} && alu_b == {32{1'b1}}) begin
                    div_result = alu_a;
                end
                `endif
            end

            // divu
            2'b01: begin
                div_result = div_quotient;

                `ifndef BITB_USING_DW_DIV_SEQ_IP
                // Division by zero
                if (alu_b == '0) div_result = {32{1'b1}};
                `endif
            end

            // rem
            2'b10: begin
                if (alu_a[31] == 1'b1) div_result = -div_remainder;
                else div_result = div_remainder;

                `ifndef BITB_USING_DW_DIV_SEQ_IP
                // Division by zero
                if (alu_b == '0) div_result = alu_a;

                // Signed overflow
                if (alu_a == {1'b1, {31{1'b0}}} && alu_b == {32{1'b1}}) begin
                    div_result = '0;
                end
                `endif
            end

            // remu
            2'b11: begin
                div_result = div_remainder;

                `ifndef BITB_USING_DW_DIV_SEQ_IP
                // Division by zero
                if (alu_b == '0) div_result = alu_a;
                `endif
            end

            default: div_result = div_quotient;
        endcase // unique case (id_ex.instruction[13:12])
    end

endmodule
