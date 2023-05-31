module cpu
import rv32i_types::*;
    (
     input              clk,
     input              rst,
     input              irq,

     input              instr_mem_resp,
     input  rv32i_word  instr_mem_rdata,
     input              data_mem_resp,
     input  rv32i_word  data_mem_rdata,
     output logic       instr_read,
     output rv32i_word  instr_mem_address,
     output logic       data_read,
     output logic       data_write,
     output logic [3:0] data_mbe,
     output rv32i_word  data_mem_address,
     output rv32i_word  data_mem_wdata,
     output logic       flush_icache
     );

    // Internal signals
    csr_reg wb_csr_idx;
    logic br_en;
    logic is_fence_i;
    logic is_csr_stall;
    logic wb_csr_ld;
    logic wb_ld;
    rv32i_reg wb_reg;
    rv32i_word br_pc;
    rv32i_word ex_mcause_data;
    rv32i_word ex_mepc_data;
    rv32i_word wb_csr_data;
    rv32i_word wb_data;
    rv32i_word mem_alu_or_cmp_result;

    // Define pipeline registers.
    rv32i_pipereg::if_id_t if_id;
    rv32i_pipereg::id_ex_t id_ex;
    rv32i_pipereg::ex_mem_t ex_mem;
    rv32i_pipereg::mem_wb_t mem_wb;

    // Next state logic
    rv32i_pipereg::if_id_t if_id_next;
    rv32i_pipereg::id_ex_t id_ex_next;
    rv32i_pipereg::ex_mem_t ex_mem_next;
    rv32i_pipereg::mem_wb_t mem_wb_next;

    // Flush signals
    logic flush_if_id;
    logic flush_id_ex;
    logic flush_atomic_fsm;
    logic flush_id_ex_ctrl;
    logic flush_mem_wb_rvfi_valid;

    // Pipeline register enable signals for stalling
    logic ld_pc;
    logic ld_if_id;
    logic ld_id_ex;
    logic ld_ex_mem;
    logic ld_mem_wb;
    wire  mult_resp;
    wire  div_resp;
    wire  stall_ex_multicycle_op;
    wire  id_ex_mult;
    assign id_ex_mult = (id_ex.instruction[6:0] == 7'b0110011)
                           && (id_ex.instruction[25] == 1'b1)
                           && (id_ex.instruction[14] == 1'b0);
    wire  id_ex_div;
    assign id_ex_div = (id_ex.instruction[6:0] == 7'b0110011)
                           && (id_ex.instruction[25] == 1'b1)
                           && (id_ex.instruction[14] == 1'b1);


    // Atomics
    wire stall_front_pipeline;
    wire stall_atomic_fsm;

    hazard_detection_unit hazard_detection_unit
        (
         .br_en,
         .id_ex_ctrl_mem_dread   (id_ex.ctrl.mem_dread),
         .ex_mem_ctrl_mem_dread  (ex_mem.ctrl.mem_dread),
         .ex_mem_ctrl_mem_dwrite (ex_mem.ctrl.mem_dwrite),

         .id_ex_mult,
         .mult_resp,
         .id_ex_div,
         .id_ex_div_start        (id_ex.ctrl.ex_div_start),
         .div_resp,
         .if_id_rs1_idx          (if_id.instruction[19:15]),
         .if_id_rs2_idx          (if_id.instruction[24:20]),
         .id_ex_rd_idx           (id_ex.instruction[11:7]),
         .instr_mem_resp,
         .data_mem_resp,
         .stall_front_pipeline,
         .is_fence_i,
         .is_csr_stall,

         .flush_if_id,
         .flush_id_ex_ctrl,
         .flush_id_ex,
         .flush_atomic_fsm,
         .flush_mem_wb_rvfi_valid,
         .ld_pc,
         .ld_if_id,
         .ld_id_ex,
         .ld_ex_mem,
         .ld_mem_wb,
         .stall_ex_multicycle_op,
         .stall_atomic_fsm,
         .flush_icache
         );


    // Pipeline progresses at every posedge,
    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            if_id <= '0;
            id_ex <= '0;
            ex_mem <= '0;
            mem_wb <= '0;
        end else begin
            // Stalling logic
            if (ld_if_id == 1'b1) if_id <= if_id_next;
            if (ld_id_ex == 1'b1) id_ex <= id_ex_next;
            if (ld_ex_mem == 1'b1) ex_mem <= ex_mem_next;
            if (ld_mem_wb == 1'b1) mem_wb <= mem_wb_next;

            // Flushing logic
            // [TD_PERF] can use x's instead of 0's for most
            // of the pipeline registers for smaller area.
            if (flush_if_id) if_id <= '0;
            if (flush_id_ex) id_ex <= '0;
            if (flush_mem_wb_rvfi_valid) mem_wb.ctrl.rvfi_commit <= '0;
            if (flush_id_ex_ctrl) id_ex.ctrl <= '0;

            // For multiplier start pulse.
            if (id_ex.ctrl.ex_mult_start == 1'b1) id_ex.ctrl.ex_mult_start <= '0;
            if (id_ex.ctrl.ex_div_start == 1'b1) id_ex.ctrl.ex_div_start <= '0;
        end
    end


    // Setup up the stages
    if_stage if_stage
        (
         .clk,
         .rst,
         .irq,
         .br_pc,
         .br_en,
         .ld_pc,
         .instr_mem_rdata,
         .instr_mem_address,
         .instr_read,
         .if_id (if_id_next)
         );

    id_stage id_stage
        (
         .clk,
         .rst,
         .if_id,
         .wb_ld,
         .wb_reg,
         .wb_data,
         .wb_csr_ld,
         .wb_csr_idx,
         .wb_csr_data,
         .wb_clear_mtip           (mem_wb.clear_mtip),
         .ex_mret_restore_mstatus (id_ex.ctrl.ex_mret_restore_mstatus),
         .ex_do_a_trap            (id_ex.ctrl.ex_do_a_trap),
         .ex_mepc_data,
         .ex_mcause_data,
         .ld_id_ex,
         .stall_atomic_fsm,
         .flush_atomic_fsm,
         .id_ex                   (id_ex_next),
         .stall_front_pipeline,
         .is_fence_i,
         .is_csr_stall
         );

    ex_stage ex_stage
        (
         .clk,
         .rst,
         .id_ex                    (id_ex),
         // For forwarding
         .mem_rd_write             (ex_mem.ctrl.wb_regfile_ld),
         .mem_rd_idx               (ex_mem.instruction[11:7]),
         .wb_rd_write              (mem_wb.ctrl.wb_regfile_ld),
         .wb_rd_idx                (mem_wb.instruction[11:7]),
         .ex_mem_alu_or_cmp_result (mem_alu_or_cmp_result),
         .ex_mem_imm               (ex_mem.imm),
         .prev_opcode              (rv32i_opcode'(ex_mem.instruction[6:0])),
         .mem_wb_wb_data           (wb_data),
         .stall_ex_multicycle_op,
         // .wb_csr_ld                (mem_wb.ctrl.wb_csrfile_ld),
         // .mem_csr_ld               (ex_mem.ctrl.wb_csrfile_ld),
         // .wb_csr_idx               (csr_reg'(mem_wb.instruction[31:20])),
         // .mem_csr_idx              (csr_reg'(ex_mem.instruction[31:20])),
         // .mem_wb_wb_csr_data       (mem_wb.alu_or_cmp_result),

         .ex_mem                   (ex_mem_next),
         .mult_resp,
         .div_resp,
         .br_pc,
         .br_en,
         .ex_mepc_data,
         .ex_mcause_data
         );

    mem_stage mem_stage
        (
         .clk,
         .rst,
         .ex_mem,
         .wb_alu_result (mem_wb.alu_or_cmp_result),
         .data_mem_rdata,
         .data_read,
         .data_write,
         .data_mbe,
         .data_mem_address,
         .data_mem_wdata,
         .mem_alu_or_cmp_result,
         .mem_wb        (mem_wb_next)
         );

    wb_stage wb_stage
        (
         .clk,
         .rst,
         .mem_wb,
         .wb_ld,
         .wb_reg,
         .wb_data,
         .wb_csr_ld,
         .wb_csr_idx,
         .wb_csr_data
         );


    //--------------------------------------------------------------------------------
    // Pipeline some extra signals for RVFI/spike_printer.
    // Used *only* for verification.
    logic [31:0] rs1_rdata[2];
    logic [31:0] rs2_rdata[2];
    logic [31:0] mem_addr;
    logic [3:0] mem_rmask;
    logic [3:0] mem_wmask;
    logic [31:0] mem_wdata;
    logic [31:0] mem_rs2_out;
    logic [31:0] br_pc_piped[2];
    logic        br_en_piped[2];

    always @(posedge clk) begin
        if (rst == 1'b1) begin
            for (int i = 0; i < 2; ++i) begin
                rs1_rdata[i] <= '0;
                rs2_rdata[i] <= '0;
                br_pc_piped[i] <= '0;
                br_en_piped[i] <= '0;
            end
            mem_addr <= '0;
            mem_rmask <= '0;
            mem_wmask <= '0;
            mem_wdata <= '0;
            mem_rs2_out <= '0;
        end else begin // if (rst == 1'b1)
            // Pipeline moves forward only if it isn't stalled.
            if (ld_ex_mem == 1'b1) begin
                rs1_rdata[0] <= ex_stage.fwd_mux_a;
                rs2_rdata[0] <= ex_stage.fwd_mux_b;
                br_pc_piped[0] <= br_pc;
                br_en_piped[0] <= br_en;
            end

            if (ld_mem_wb == 1'b1) begin
                rs1_rdata[1] <= rs1_rdata[0];
                rs2_rdata[1] <= rs2_rdata[0];
                mem_addr <= mem_stage.mem_wb.alu_or_cmp_result;
                mem_wdata <= mem_stage.data_mem_wdata;
                mem_rs2_out <= mem_stage.ex_mem.rs2_out;
                br_pc_piped[1] <= br_pc_piped[0];
                br_en_piped[1] <= br_en_piped[0];
            end

            // If we're not reading, mbe is ignored.
            if (mem_stage.ex_mem.ctrl.mem_dread == 1'b1) begin
                unique case (load_funct3_t'(mem_stage.ex_mem.instruction[14:12]))
                    lw: mem_rmask <= 4'hf;
                    lh, lhu: mem_rmask <= 4'(2'b11 << mem_stage.mem_wb.alu_or_cmp_result[1:0]);
                    lb, lbu: mem_rmask <= 4'(2'b1 << mem_stage.mem_wb.alu_or_cmp_result[1:0]);
                    default: mem_rmask <= '0;
                endcase
            end else mem_rmask <= '0;

            // If we're not writing, mbe is ignored.
            if (mem_stage.ex_mem.ctrl.mem_dwrite == 1'b1) begin
                mem_wmask <= mem_stage.data_mbe;
            end else mem_wmask <= '0;

        end // else: !if(rst == 1'b1)
    end
    //--------------------------------------------------------------------------------

    // always_ff @(posedge clk) begin
    //     if (mem_wb.ctrl.rvfi_commit == 1'b1) begin
    //         if (rv32i_opcode'(mem_wb.instruction[6:0]) == op_load) begin
    //             $display("load : pc = %x ins = %x addr = %x loaded_value = %x  @ %t", mem_wb.pc, mem_wb.instruction, mem_addr, wb_data, $time);
    //         end else if (rv32i_opcode'(mem_wb.instruction[6:0]) == op_store) begin
    //             $display("store: pc = %x ins = %x addr = %x stored_value = %x  @ %t", mem_wb.pc, mem_wb.instruction, mem_addr, mem_rs2_out, $time);
    //         end else begin
    //             $display("pc = %x ir = %x", mem_wb.pc, mem_wb.instruction);
    //         end
    //     end
    // end

endmodule
