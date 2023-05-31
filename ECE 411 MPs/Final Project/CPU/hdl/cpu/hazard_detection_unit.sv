module hazard_detection_unit
import rv32i_types::*;
    (
     input        br_en,
     input        id_ex_ctrl_mem_dread,
     input        ex_mem_ctrl_mem_dread,
     input        ex_mem_ctrl_mem_dwrite,
     input        id_ex_mult,
     input        id_ex_div,
     input        id_ex_div_start,
     input [4:0]  if_id_rs1_idx,
     input [4:0]  if_id_rs2_idx,
     input [4:0]  id_ex_rd_idx,
     input        instr_mem_resp,
     input        data_mem_resp,
     input        mult_resp,
     input        div_resp,
     input        stall_front_pipeline,
     input        is_fence_i,
     input        is_csr_stall,

     output logic flush_if_id,
     output logic flush_id_ex_ctrl,
     output logic flush_id_ex,
     output logic flush_atomic_fsm,
     output logic flush_mem_wb_rvfi_valid,
     output logic ld_pc,
     output logic ld_if_id,
     output logic ld_id_ex,
     output logic ld_ex_mem,
     output logic ld_mem_wb,
     output logic stall_ex_multicycle_op,
     output logic stall_atomic_fsm,
     output logic flush_icache
     );

    always_comb begin
        ld_pc = 1'b1;
        flush_icache = 1'b0;
        ld_if_id = 1'b1;
        flush_if_id = 1'b0;
        flush_atomic_fsm = 1'b0;
        stall_atomic_fsm = 1'b0;
        ld_id_ex = 1'b1;
        flush_id_ex = 1'b0;
        flush_id_ex_ctrl = 1'b0;
        ld_ex_mem = 1'b1;
        stall_ex_multicycle_op = 1'b0;
        ld_mem_wb = 1'b1;
        flush_mem_wb_rvfi_valid = 1'b0;

        // If the memory isn't responding for ins fetch.
        if (instr_mem_resp == 1'b0) begin
            // Stall the start of the pipeline.
            ld_pc = 1'b0;
            ld_if_id = 1'b0;

            // Flush the control signals for id_ex
            // to prevent accidental side-effects.
            flush_id_ex_ctrl = 1'b1;
            // flush_atomic_fsm = 1'b1; // TODO: Check.
        end

        if (is_fence_i == 1'b1) begin
            // TODO: Zifencei.
            // For now, we simply stall until the next instruction
            // completes its execution.
            ld_pc = 1'b0;
            ld_if_id = 1'b0;
            flush_if_id = 1'b1;
        end

        if (is_csr_stall == 1'b1) begin
            ld_pc = 1'b0;
            ld_if_id = 1'b0;
            flush_if_id = 1'b1; // Assumes id_ex isn't being flushed.
        end

        // Load-use hazard.
        // If the instruction in EX is a load instruction...
        if (id_ex_ctrl_mem_dread == 1'b1) begin
            // And if we want to read the result
            if ((if_id_rs1_idx == id_ex_rd_idx)
                || (if_id_rs2_idx == id_ex_rd_idx)) begin
                ld_pc = 1'b0;
                ld_if_id = 1'b0; // Assumes if_id isn't being flushed.
                flush_if_id = 1'b0;
                flush_id_ex = 1'b1;
                // flush_atomic_fsm = 1'b1; // TODO: Check.
            end
        end

        if (stall_front_pipeline == 1'b1) begin
            ld_pc = 1'b0;
            ld_if_id = 1'b0;
        end

        // Flushing logic
        if (br_en == 1'b1) begin
            // Get rid of the next 2 instructions we fetched.
            flush_if_id = 1'b1;
            flush_id_ex = 1'b1;
            flush_atomic_fsm = 1'b1;
            ld_pc = 1'b1;
        end

        if (id_ex_mult == 1'b1) begin
            // Stall the entire pipeline.
            if (mult_resp == 1'b0) begin
                ld_pc = 1'b0;
                ld_if_id = 1'b0;
                ld_id_ex = 1'b0;
                ld_ex_mem = 1'b0;
                ld_mem_wb = 1'b0;
                flush_mem_wb_rvfi_valid = 1'b1;
                flush_if_id = 1'b0;
                flush_id_ex = 1'b0;
                flush_id_ex_ctrl = 1'b0;
                stall_atomic_fsm = 1'b1;
            end
        end

        if (id_ex_div == 1'b1) begin
            // Stall the entire pipeline.
            if (div_resp == 1'b0 || id_ex_div_start == 1'b1) begin
                ld_pc = 1'b0;
                ld_if_id = 1'b0;
                ld_id_ex = 1'b0;
                ld_ex_mem = 1'b0;
                ld_mem_wb = 1'b0;
                flush_mem_wb_rvfi_valid = 1'b1;
                flush_if_id = 1'b0;
                flush_id_ex = 1'b0;
                flush_id_ex_ctrl = 1'b0;
                stall_atomic_fsm = 1'b1;
            end
        end

        if ((ex_mem_ctrl_mem_dread == 1'b1) || (ex_mem_ctrl_mem_dwrite == 1'b1)) begin
            // Stall the *entire* pipeline.
            if (data_mem_resp == 1'b0) begin
                ld_pc = 1'b0;
                ld_if_id = 1'b0;
                ld_id_ex = 1'b0;
                ld_ex_mem = 1'b0;
                ld_mem_wb = 1'b0;
                flush_mem_wb_rvfi_valid = 1'b1;
                flush_id_ex_ctrl = 1'b0;
                flush_id_ex = 1'b0;
                flush_if_id = 1'b0;
                stall_atomic_fsm = 1'b1;
            end
        end
    end
endmodule
