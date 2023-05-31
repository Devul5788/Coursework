module control_rom
import rv32i_types::*;
(
    input  rv32i_opcode opcode,
    input  [2:0]        funct3,
    input  [6:0]        funct7,
    input  [4:0]        rs2_idx,
    output rv32i_ctrl   ctrl
);

    branch_funct3_t branch_funct3;
    store_funct3_t store_funct3;
    load_funct3_t load_funct3;
    arith_funct3_t arith_funct3;

    assign arith_funct3 = arith_funct3_t'(funct3);
    assign branch_funct3 = branch_funct3_t'(funct3);
    assign load_funct3 = load_funct3_t'(funct3);
    assign store_funct3 = store_funct3_t'(funct3);

    always_comb begin
        /* Default assignments */
        ctrl.ex_imm_sel = imm_mux::i_imm;
        ctrl.ex_rs1n_pc = '0;
        ctrl.ex_rs2_immn = '0;
        ctrl.ex_cmp_rs2_immn = '0;
        ctrl.ex_aluop = alu_add;
        ctrl.ex_cmpop = beq;
        ctrl.ex_out_mux = ex_mux::alu_result;
        ctrl.ex_br = '0;
        ctrl.ex_jmp = '0;
        ctrl.ex_pc_mux = pc_mux::alu_result;
        ctrl.ex_mult_start = '0;
        ctrl.ex_div_start = '0;
        ctrl.ex_c_imm = '0;
        ctrl.ex_mret_restore_mstatus = '0;
        ctrl.ex_do_a_trap = '0;
        ctrl.mem_dread = '0;
        ctrl.mem_dwrite = '0;
        ctrl.wb_data_sel = wb_mux::alu_or_cmp_result;
        ctrl.wb_regfile_ld = '0;
        ctrl.wb_csrfile_ld = '0;


        // By default, all instructions are valid.
        ctrl.rvfi_commit = 1'b1;

        /* Assign control signals based on opcode */
        unique case (opcode)
            op_imm: begin
                ctrl.ex_imm_sel = imm_mux::i_imm;
                ctrl.ex_rs1n_pc = 1'b0;
                ctrl.ex_rs2_immn = 1'b0;
                ctrl.ex_cmp_rs2_immn = 1'b0;
                ctrl.ex_aluop = alu_ops'(arith_funct3);
                ctrl.wb_regfile_ld = 1'b1;

                unique case (arith_funct3)
                    slt: begin
                        ctrl.ex_cmpop = blt;
                        ctrl.ex_out_mux = ex_mux::cmp_result;
                    end
                    sltu: begin
                        ctrl.ex_cmpop = bltu;
                        ctrl.ex_out_mux = ex_mux::cmp_result;
                    end
                    sr: begin
                        if (funct7[5] == 1'b1) begin
                            ctrl.ex_aluop = alu_sra;
                        end
                    end
                    default: begin end
                endcase
            end

            op_reg: begin
                ctrl.ex_rs1n_pc = 1'b0;
                ctrl.ex_rs2_immn = 1'b1;
                ctrl.ex_cmp_rs2_immn = 1'b1;
                ctrl.ex_aluop = alu_ops'(arith_funct3);
                ctrl.wb_regfile_ld = 1'b1;

                unique case (arith_funct3)
                    slt: begin
                        ctrl.ex_cmpop = blt;
                        ctrl.ex_out_mux = ex_mux::cmp_result;
                    end
                    sltu: begin
                        ctrl.ex_cmpop = bltu;
                        ctrl.ex_out_mux = ex_mux::cmp_result;
                    end
                    sr: begin
                        if (funct7[5] == 1'b1) begin
                            ctrl.ex_aluop = alu_sra;
                        end
                    end
                    add: begin
                        if (funct7[5] == 1'b1) begin
                            ctrl.ex_aluop = alu_sub;
                        end
                    end
                    default: begin end
                endcase

                // M extension
                if (funct7[0] == 1'b1) begin
                        ctrl.ex_rs1n_pc = 1'b0;
                        ctrl.ex_rs2_immn = 1'b1;
                        ctrl.wb_data_sel = wb_mux::alu_or_cmp_result;
                        ctrl.wb_regfile_ld = 1'b1;
                    if (funct3[2] == 1'b0) begin
                        ctrl.ex_mult_start = 1'b1;
                        ctrl.ex_out_mux = ex_mux::mul_result;
                    end else begin
                        ctrl.ex_div_start = 1'b1;
                        ctrl.ex_out_mux = ex_mux::div_result;
                    end
                end

            end

            op_lui: begin
                ctrl.ex_imm_sel = imm_mux::u_imm;
                ctrl.wb_data_sel = wb_mux::imm;
                ctrl.wb_regfile_ld = 1'b1;
            end

            op_auipc: begin
                ctrl.ex_imm_sel = imm_mux::u_imm;
                ctrl.ex_rs1n_pc = 1'b1;
                ctrl.ex_rs2_immn = 1'b0;
                ctrl.ex_aluop = alu_add;
                ctrl.wb_regfile_ld = 1'b1;
            end

            op_jal: begin
                ctrl.ex_imm_sel = imm_mux::j_imm;
                ctrl.ex_rs1n_pc = 1'b1;
                ctrl.ex_rs2_immn = 1'b0;
                ctrl.ex_aluop = alu_add;
                ctrl.ex_jmp = 1'b1;
                ctrl.wb_data_sel = wb_mux::pc_plus4;
                ctrl.wb_regfile_ld = 1'b1;
            end

            op_jalr: begin
                ctrl.ex_imm_sel = imm_mux::i_imm;
                ctrl.ex_rs1n_pc = 1'b0;
                ctrl.ex_rs2_immn = 1'b0;
                ctrl.ex_aluop = alu_add;
                ctrl.ex_jmp = 1'b1;
                ctrl.ex_pc_mux = pc_mux::alu_mod2;
                ctrl.wb_data_sel = wb_mux::pc_plus4;
                ctrl.wb_regfile_ld = 1'b1;
            end

            op_br: begin
                ctrl.ex_imm_sel = imm_mux::b_imm;
                ctrl.ex_rs1n_pc = 1'b1;
                ctrl.ex_rs2_immn = 1'b0;
                ctrl.ex_cmp_rs2_immn = 1'b1;
                ctrl.ex_aluop = alu_add;
                ctrl.ex_cmpop = branch_funct3;
                ctrl.ex_br = 1'b1;
            end

            op_load: begin
                ctrl.ex_imm_sel = imm_mux::i_imm;
                ctrl.ex_rs1n_pc = 1'b0;
                ctrl.ex_rs2_immn = 1'b0;
                ctrl.ex_aluop = alu_add;
                ctrl.mem_dread = 1'b1;
                ctrl.wb_regfile_ld = 1'b1;
                unique case (load_funct3)
                    rv32i_types::lb: ctrl.wb_data_sel = wb_mux::lb;
                    rv32i_types::lbu: ctrl.wb_data_sel = wb_mux::lbu;
                    rv32i_types::lh: ctrl.wb_data_sel = wb_mux::lh;
                    rv32i_types::lhu: ctrl.wb_data_sel = wb_mux::lhu;
                    rv32i_types::lw: ctrl.wb_data_sel = wb_mux::lw;
                endcase
            end

            op_store: begin
                ctrl.ex_imm_sel = imm_mux::s_imm;
                ctrl.ex_rs1n_pc = 1'b0;
                ctrl.ex_rs2_immn = 1'b0;
                ctrl.ex_aluop = alu_add;
                ctrl.mem_dwrite = 1'b1;
            end

            op_system: begin

                // Currently, we ignore the CSR side effects clauses.
                unique case (funct3[1:0])
                    2'b01: begin : RW
                        ctrl.ex_rs1n_pc = 1'b0;
                        ctrl.ex_rs2_immn = 1'b1;
                        ctrl.ex_aluop = alu_pass_a;
                        ctrl.wb_data_sel = wb_mux::csr_out;
                        ctrl.wb_regfile_ld = 1'b1;
                        ctrl.wb_csrfile_ld = 1'b1;
                    end : RW

                    2'b10: begin : RS
                        ctrl.ex_rs1n_pc = 1'b0;
                        ctrl.ex_rs2_immn = 1'b1;
                        ctrl.ex_aluop = alu_or;
                        ctrl.wb_data_sel = wb_mux::csr_out;
                        ctrl.wb_regfile_ld = 1'b1;
                        ctrl.wb_csrfile_ld = 1'b1;
                    end : RS

                    2'b11: begin : RC
                        ctrl.ex_rs1n_pc = 1'b0;
                        ctrl.ex_rs2_immn = 1'b1;
                        ctrl.ex_aluop = alu_and;
                        ctrl.wb_data_sel = wb_mux::csr_out;
                        ctrl.wb_regfile_ld = 1'b1;
                        ctrl.wb_csrfile_ld = 1'b1;
                    end : RC
                    default: begin end
                endcase // unique case (funct3)

                if (funct3[2] == 1'b1) begin
                    ctrl.ex_imm_sel = imm_mux::c_imm;
                    ctrl.ex_c_imm = 1'b1;
                    // ctrl.ex_aluop = alu_pass_b;
                end

                // Other SYSTEM instructions.
                if (funct3 == 3'b000) begin

                    // MRET
                    if (rs2_idx == 5'b00010 && funct7 == 7'b0011000) begin
                        ctrl.ex_jmp = 1'b1;
                        ctrl.ex_pc_mux = pc_mux::mepc;
                        ctrl.ex_mret_restore_mstatus = 1'b1;
                    end

                    // ECALL
                    if (rs2_idx == '0 && funct7 == '0) begin
                        ctrl.ex_jmp = 1'b1;
                        ctrl.ex_pc_mux = pc_mux::mtvec;
                        ctrl.ex_do_a_trap = 1'b1;
                    end

                    // WFI
                    if (rs2_idx == 5'b00101 && funct7 == 7'b0001000) begin
                        // Do nothing!
                        ctrl.rvfi_commit = 1'b1;
                    end
                end
            end

            // Only for LR/SC.
            // For now, do a normal load-store without any reservation.
            // [TD_MMU] -- may need actual reservation.
            op_atomic: begin
                priority case (funct7[6:2])
                    5'b00010: begin : LR
                        ctrl.ex_rs1n_pc = 1'b0;
                        ctrl.ex_rs2_immn = 1'b1;
                        ctrl.ex_aluop = alu_add;
                        ctrl.mem_dread = 1'b1;
                        ctrl.wb_regfile_ld = 1'b1;
                        ctrl.wb_data_sel = wb_mux::lw;
                    end : LR

                    5'b00011: begin : SC
                        ctrl.ex_imm_sel = imm_mux::zero;
                        ctrl.ex_rs1n_pc = 1'b0;
                        ctrl.ex_rs2_immn = 1'b0;
                        ctrl.ex_aluop = alu_add;
                        ctrl.mem_dwrite = 1'b1;
                        ctrl.wb_regfile_ld = 1'b1;
                        ctrl.wb_data_sel = wb_mux::imm;
                    end : SC
                endcase
            end

            op_fence: begin
                // Do nothing further down the pipeline.
                ctrl = '0;
                ctrl.rvfi_commit = 1'b1;
            end

            default: begin
                ctrl = '0;
                // $display("Invalid instruction: %x!", opcode);
            end
        endcase
    end
endmodule
