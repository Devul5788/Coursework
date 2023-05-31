module wb_stage
import rv32i_types::*;
    (
        input  clk,
        input  rst,

        input  rv32i_pipereg::mem_wb_t mem_wb,

        // To register file
        output wb_ld,
        output rv32i_reg wb_reg,
        output rv32i_word wb_data,
        output wb_csr_ld,
        output csr_reg wb_csr_idx,
        output rv32i_word wb_csr_data
    );

    logic [1:0] mem_low_bits;
    // assign mem_low_bits = mem_wb.alu_or_cmp_result[1:0];
    always_comb begin
        mem_low_bits = mem_wb.alu_or_cmp_result[1:0];

        // For MMIO, don't shift the bytes around on lb[u]/lh[u].
        if (mem_wb.alu_or_cmp_result[31-:8] == 8'h10 ||
            mem_wb.alu_or_cmp_result[31-:8] == 8'h11) begin
            mem_low_bits = '0;
        end
    end


    assign wb_ld = mem_wb.ctrl.wb_regfile_ld;
    assign wb_reg = mem_wb.instruction[11:7];

    assign wb_csr_ld = mem_wb.ctrl.wb_csrfile_ld;
    assign wb_csr_idx = csr_reg'(mem_wb.instruction[31:20]);
    assign wb_csr_data = mem_wb.alu_or_cmp_result;

    // Select data to writeback.
    always_comb begin
        wb_data = mem_wb.alu_or_cmp_result;
        unique case (mem_wb.ctrl.wb_data_sel)
            wb_mux::alu_or_cmp_result: wb_data = mem_wb.alu_or_cmp_result;
            wb_mux::imm: wb_data = mem_wb.imm;
            wb_mux::pc_plus4: wb_data = mem_wb.pc + 32'h4;
            wb_mux::csr_out: wb_data = mem_wb.csr_out;

            // [DOC_TD]
            // Black magic below.
            // It correctly extracts the value from mem_wb.data_mem_out depending on the load
            // address, then sign extends if necessary.
            wb_mux::lw: wb_data = mem_wb.data_mem_out;
            wb_mux::lb: wb_data = {{24{mem_wb.data_mem_out[((mem_low_bits + 1) * 8) - 1]}},
                                   mem_wb.data_mem_out[(mem_low_bits * 8) +: 8]};
            wb_mux::lbu: wb_data = {{24{1'b0}}, mem_wb.data_mem_out[(mem_low_bits * 8) +: 8]};
            wb_mux::lh: wb_data = {{16{mem_wb.data_mem_out[((mem_low_bits + 1) * 8) + 7]}},
                                   mem_wb.data_mem_out[(mem_low_bits * 8) +: 16]};
            wb_mux::lhu: wb_data = {{16{1'b0}}, mem_wb.data_mem_out[(mem_low_bits * 8) +: 16]};
            default: wb_data = 'x;
        endcase
    end // always_comb

endmodule
