module forwarding_unit
import rv32i_types::*;
import alu_mux::*;
    (
     input  rv32i_reg rs1_idx,
     input  rv32i_reg rs2_idx,
     input  mem_rd_write,
     input  rv32i_reg mem_rd_idx,
     input  wb_rd_write,
     input  rv32i_reg wb_rd_idx,
     input  atomic_use_pipereg_ex,
     input  atomic_swap_skip_fwd_rs1,
     // input  csr_ld,
     // input  wb_csr_ld,
     // input  mem_csr_ld,
     // input  csr_reg csr_idx,
     // input  csr_reg wb_csr_idx,
     // input  csr_reg mem_csr_idx,
     // input  is_csr_instr,

     output alu_fwdmux fwd_a,
     output alu_fwdmux fwd_b
     );

    always_comb begin
        // By default, just use the regfile.
        fwd_a = no_fwd;
        fwd_b = no_fwd;

        // If the antepenultimate instruction to that one is planning
        // to write to the register file...
        if (wb_rd_write == 1'b1 && wb_rd_idx != '0) begin
            if (wb_rd_idx == rs1_idx) fwd_a = fwd_wb;
            if (wb_rd_idx == rs2_idx) fwd_b = fwd_wb;
        end

        // If the penultimate instruction is planning to write
        // to the register file...
        if (mem_rd_write == 1'b1 && mem_rd_idx != '0) begin
            if (mem_rd_idx == rs1_idx) fwd_a = fwd_mem;
            if (mem_rd_idx == rs2_idx) fwd_b = fwd_mem;
        end

        // Special case for atomic_modify.
        if (atomic_use_pipereg_ex == 1'b1) begin
            fwd_a = fwd_wb;
            fwd_b = no_fwd;
        end

        if (atomic_swap_skip_fwd_rs1 == 1'b1) begin
            fwd_a = no_fwd;
            fwd_b = no_fwd;
        end
    end

endmodule
