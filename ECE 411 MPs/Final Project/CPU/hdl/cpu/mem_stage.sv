module mem_stage
import rv32i_types::*;
    (
        input              clk,
        input              rst,

        input rv32i_pipereg::ex_mem_t ex_mem,
        input rv32i_word              wb_alu_result,

        // Data memory itf
        input  rv32i_word  data_mem_rdata,
        output logic       data_read,
        output logic       data_write,
        output logic [3:0] data_mbe,
        output rv32i_word  data_mem_address,
        output rv32i_word  data_mem_wdata,

        output rv32i_word  mem_alu_or_cmp_result,
        output rv32i_pipereg::mem_wb_t mem_wb

    );

    // Pipeline
    assign mem_wb.pc = ex_mem.pc;
    assign mem_wb.instruction = ex_mem.instruction;
    assign mem_wb.ctrl = ex_mem.ctrl;
    assign mem_wb.imm = ex_mem.imm;
    assign mem_wb.csr_out = ex_mem.csr_out;

    // Clear MTIP on write to mtimecmp.
    assign mem_wb.clear_mtip = (mem_wb.alu_or_cmp_result == mtimecmpl_addr ||
                                mem_wb.alu_or_cmp_result == mtimecmph_addr) &&
                               data_write == 1'b1;

    assign mem_alu_or_cmp_result = mem_wb.alu_or_cmp_result;

    always_comb begin
        mem_wb.alu_or_cmp_result = ex_mem.alu_result;
        unique case (ex_mem.ctrl.ex_out_mux)
            ex_mux::alu_result: mem_wb.alu_or_cmp_result = ex_mem.alu_result;
            ex_mux::cmp_result: mem_wb.alu_or_cmp_result = ex_mem.cmp_result;
            ex_mux::mul_result: mem_wb.alu_or_cmp_result = ex_mem.mul_result;
            ex_mux::div_result: mem_wb.alu_or_cmp_result = ex_mem.div_result;
            default: mem_wb.alu_or_cmp_result = ex_mem.alu_result;
        endcase
    end

    // Data memory
    assign data_read = ex_mem.ctrl.mem_dread;
    assign data_write = ex_mem.ctrl.mem_dwrite;
    assign data_mem_address = mem_wb.alu_or_cmp_result;
    assign mem_wb.data_mem_out = data_mem_rdata;

    // Store
    store_funct3_t store_funct3;
    assign store_funct3 = store_funct3_t'(ex_mem.instruction[14:12]);

    // Figure out the byte enable mask.
    always_comb begin
        data_mbe = '0;
        unique case (store_funct3)
            sb: data_mbe = 4'(1'b1 << mem_wb.alu_or_cmp_result[1:0]);
            sh: data_mbe = 4'(2'b11 << mem_wb.alu_or_cmp_result[1:0]);
            sw: data_mbe = 4'b1111;
            default: data_mbe = '0;
        endcase
    end


    // Shift and sign extend ex_mem.rs2_out as required.
    rv32i_word data_mem_wdata_from_rs2;
    assign data_mem_wdata = (ex_mem.atomic_use_pipereg_mem == 1'b1) ? wb_alu_result
                            : data_mem_wdata_from_rs2;

    always_comb begin
        data_mem_wdata_from_rs2 = ex_mem.rs2_out;
        unique case (store_funct3)
            sb: begin
                unique case (mem_wb.alu_or_cmp_result[1:0])
                    2'b00: data_mem_wdata_from_rs2 = {{24{1'bx}}, ex_mem.rs2_out[7:0]};
                    2'b01: data_mem_wdata_from_rs2 = {{16{1'bx}}, ex_mem.rs2_out[7:0], {8{1'bx}}};
                    2'b10: data_mem_wdata_from_rs2 = {{8{1'bx}}, ex_mem.rs2_out[7:0], {16{1'bx}}};
                    2'b11: data_mem_wdata_from_rs2 = {ex_mem.rs2_out[7:0], {24{1'bx}}};
                    default: data_mem_wdata_from_rs2 = ex_mem.rs2_out;
                endcase

            end
            sh: begin
                unique case (mem_wb.alu_or_cmp_result[1:0])
                    2'b00: data_mem_wdata_from_rs2 = {{16{1'bx}}, ex_mem.rs2_out[15:0]};
                    // Case 01 isn't tested, since it raises a trap.
                    2'b01: data_mem_wdata_from_rs2 = {{8{1'bx}}, ex_mem.rs2_out[15:0], {8{1'bx}}};
                    2'b10: data_mem_wdata_from_rs2 = {ex_mem.rs2_out[15:0], {16{1'bx}}};
                    // Case 11 would be a misaligned access, which we don't allow
                    default: data_mem_wdata_from_rs2 = ex_mem.rs2_out;
                endcase
            end
            sw: data_mem_wdata_from_rs2 = ex_mem.rs2_out;
            default: data_mem_wdata_from_rs2 = ex_mem.rs2_out;
        endcase
    end

endmodule
