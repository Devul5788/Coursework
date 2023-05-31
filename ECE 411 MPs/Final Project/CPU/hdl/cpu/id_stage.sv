module id_stage
import rv32i_types::*;
    (
        input        clk,
        input        rst,

        input        rv32i_pipereg::if_id_t if_id,
        input        stall_atomic_fsm,
        input        flush_atomic_fsm,

        // From WB stage
        input        wb_ld,
        input        rv32i_reg wb_reg,
        input        rv32i_word wb_data,
        input        wb_csr_ld,
        input        csr_reg wb_csr_idx,
        input        rv32i_word wb_csr_data,
        input        wb_clear_mtip,

        // From EX stage
        input        ex_mret_restore_mstatus,
        input        ex_do_a_trap,
        input        rv32i_word ex_mepc_data,
        input        rv32i_word ex_mcause_data,
        input        ld_id_ex,

        output       rv32i_pipereg::id_ex_t id_ex,
        output logic stall_front_pipeline,
        output logic is_fence_i,
        output logic is_csr_stall
    );

    // ----------------------------------------------------------------------
    // Pipeline and atomics
    // ----------------------------------------------------------------------
    // Don't start the FSM for LR/SC -- check instr[28].
    wire        is_atomic_instruction = if_id.instruction[6:0] == 7'(op_atomic) &&
                                        if_id.instruction[28] != 1'b1;
    wire [31:0] atomic_fsm_instr;
    wire        atomic_resp;
    wire        atomic_load;
    wire        atomic_use_pipereg_ex;
    wire        atomic_use_pipereg_mem;
    wire        atomic_swap_skip_fwd_rs1;

    logic       atomic_resp_piped;
    always_ff @(posedge clk) begin
        if (rst == 1'b1) atomic_resp_piped <= '0;
        else atomic_resp_piped <= atomic_resp;
    end

    assign id_ex.pc = if_id.pc;
    assign id_ex.atomic_use_pipereg_ex = atomic_use_pipereg_ex;
    assign id_ex.atomic_use_pipereg_mem = atomic_use_pipereg_mem;
    assign id_ex.atomic_swap_skip_fwd_rs1 = atomic_swap_skip_fwd_rs1;
    assign stall_front_pipeline = is_atomic_instruction == 1'b1 &&
                                  atomic_resp == 1'b0;
    assign atomic_in_progress = is_atomic_instruction == 1'b1 &&
                                atomic_resp_piped == 1'b0;
    assign id_ex.instruction = (atomic_in_progress == 1'b1) ? atomic_fsm_instr
                               : if_id.instruction;

    // Trap and emulate AMOs with LR/SCs.
    atomic atomic_fsm
        (
         .clk,
         .rst                (rst || flush_atomic_fsm),
         .start_atomic_fsm   (is_atomic_instruction),
         .stall_atomic_fsm,
         .atomic_instruction (if_id.instruction),

         .instruction        (atomic_fsm_instr),
         .atomic_resp,
         .atomic_load,
         .atomic_use_pipereg_ex,
         .atomic_use_pipereg_mem,
         .atomic_swap_skip_fwd_rs1
         );

    // ----------------------------------------------------------------------
    // FENCE.I -- stalling FSM for magic_mem
    // ----------------------------------------------------------------------
    logic [1:0] fence_i_counter;
    logic start_fence_i;

    assign start_fence_i = rv32i_opcode'(if_id.instruction[6:0]) == op_fence
                           && if_id.instruction[14:12] == 3'b001;
    assign is_fence_i = start_fence_i || fence_i_counter;

    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            fence_i_counter <= '0;
        end else begin
            if (start_fence_i == 1'b1 || fence_i_counter != '0) begin
                fence_i_counter <= fence_i_counter + 1'b1;
            end
        end
    end


    // ----------------------------------------------------------------------
    // Register file
    // ----------------------------------------------------------------------
    // Dual port read, single port write.
    // Writes to \0 are ignored, reads from \0 yield \0.
    logic [4:0] rs1_idx;
    logic [4:0] rs2_idx;
    always_comb begin
        rs1_idx = if_id.instruction[19:15];
        rs2_idx = if_id.instruction[24:20];
        if (atomic_in_progress == 1'b1) begin
            rs1_idx = atomic_fsm_instr[19:15];
            if (atomic_load == 1'b0) rs2_idx = atomic_fsm_instr[24:20];
        end
    end

    logic [31:0] regfile [32];
    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            for (int i = 0; i < 32; i++) regfile[i] <= '0;
            regfile[11] <= 32'h83fff940;
        end
        else if (wb_ld == 1'b1 && wb_reg != '0) regfile[wb_reg] <= wb_data;

        // for (int i = 0; i < 32; i++) begin
        //     if (^regfile[i] === 1'bX) begin
        //         $display("x's have reached regfile[%0d] at time %0t!", i, $time);
        //     end
        // end
    end

    always_comb begin
        id_ex.rs1_out = (rs1_idx != '0) ? regfile[rs1_idx] : '0;
        id_ex.rs2_out = (rs2_idx != '0) ? regfile[rs2_idx] : '0;

        // Transparency
        if ((wb_ld == 1'b1) && (wb_reg != '0)) begin
            if (wb_reg == rs1_idx) id_ex.rs1_out = wb_data;
            if (wb_reg == rs2_idx) id_ex.rs2_out = wb_data;
        end
    end


    // ----------------------------------------------------------------------
    // CSR-file
    // ----------------------------------------------------------------------
    logic [31:0] csr_file [11];
    logic [1:0]  cpl; // Current privilege level. Currently unenforced.

    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            cpl <= 2'b11; // Start off in M-mode
            for (int i = 0; i < 11; i++) begin
                csr_file[i] <= '0;
            end
            // csr_file[0][12:11] <= 2'b11; [TD? starting MPP]
            // csr_file[9] <= 32'hece411bb;  // mvendorid
            csr_file[10] <= 32'h40001101; // misa
        end else begin
            // Increment the cycle counter.
            // We don't implement cycleh for now [TD?]
            csr_file[8] <= csr_file[8] + 1'b1;
            if (wb_csr_ld == 1'b1) begin
                unique case (wb_csr_idx)
                    mstatus:  csr_file[0] <= wb_csr_data;
                    mie:      csr_file[1] <= wb_csr_data;
                    mtvec:    csr_file[2] <= wb_csr_data;
                    mscratch: csr_file[3] <= wb_csr_data;
                    mepc:     csr_file[4] <= wb_csr_data;
                    mcause:   csr_file[5] <= wb_csr_data;
                    mtval:    csr_file[6] <= wb_csr_data;
                    mip:      csr_file[7] <= wb_csr_data;
                    default: begin end
                endcase
            end

            if (ld_id_ex == 1'b1) begin
                if (ex_mret_restore_mstatus == 1'b1) begin
                    csr_file[0][3] <= csr_file[0][7]; // MIE <= MPIE
                    csr_file[0][7] <= 1'b1; // MPIE <= MIE
                    csr_file[0][12:11] <= cpl;
                    cpl <= csr_file[0][12:11];
                end

                if  (ex_do_a_trap == 1'b1) begin
                    csr_file[0][7] <= csr_file[0][3]; // MPIE <= MIE
                    csr_file[0][3] <= '0; // MIE <= '0
                    csr_file[0][12:11] <= cpl;
                    csr_file[4] <= ex_mepc_data;
                    csr_file[5] <= ex_mcause_data;
                    cpl <= 2'b11;
                end
            end

            // MTIP bit -- set if interrupt pending.
            // This is left hanging even if id_ex.irq_en != 1
            // [TD_NOMMU] may cause bugs.
            if (if_id.irq == 1'b1) csr_file[7][7] <= 1'b1;

            // Unset MTIP if write to mtimecmp
            if (wb_clear_mtip == 1'b1) csr_file[7][7] <= 1'b0;
        end
    end

    always_comb begin
        unique case (csr_reg'(if_id.instruction[31:20]))
            mstatus:   id_ex.csr_out = csr_file[0];
            mie:       id_ex.csr_out = csr_file[1];
            mtvec:     id_ex.csr_out = csr_file[2];
            mscratch:  id_ex.csr_out = csr_file[3];
            mepc:      id_ex.csr_out = csr_file[4];
            mcause:    id_ex.csr_out = csr_file[5];
            mtval:     id_ex.csr_out = csr_file[6];
            mip:       id_ex.csr_out = csr_file[7];
            cyclel:    id_ex.csr_out = csr_file[8];
            mvendorid: id_ex.csr_out = csr_file[9];
            misa:      id_ex.csr_out = csr_file[10];
            default:   id_ex.csr_out = '0; // mhartid, other CSRs all read as zero.
        endcase

        // Transparency
        if (wb_csr_ld == 1'b1 && wb_csr_idx == if_id.instruction[31:20]) begin
            id_ex.csr_out = wb_csr_data;
        end
    end

    assign id_ex.mepc = csr_file[4];
    assign id_ex.mtvec = csr_file[2];
    assign id_ex.cpl = cpl;
    rv32i_opcode opcode;
    always_comb opcode = rv32i_opcode'(if_id.instruction[6:0]);
    wire check_branch_opcode = opcode == op_br  ||
                               opcode == op_jal ||
                               opcode == op_jalr;

    always_comb begin
        id_ex.irq_en = 1'b0;

        // IRQ == 1, mstatus.mie == 1, mie.mtip == 1
        // Don't accept an interrupt during a branch.
        // [TD_NOMMU] may cause bugs.
        // Account for transparency of CSR-file.
        if (if_id.irq == 1'b1 && check_branch_opcode == 1'b0 && is_csr_stall == 1'b0 && is_fence_i == 1'b0) begin
            if (wb_csr_ld == 1'b1) begin
                if (wb_csr_idx == mstatus) begin
                    if (wb_csr_data[3] == 1'b1 && csr_file[1][7] == 1'b1) begin
                        id_ex.irq_en = 1'b1;
                    end
                end else if (wb_csr_idx == mie) begin
                    if (csr_file[0][3] == 1'b1 && wb_csr_data[7] == 1'b1) begin
                        id_ex.irq_en = 1'b1;
                    end
                end
            end else if (csr_file[0][3] == 1'b1 && csr_file[1][7] == 1'b1) begin
                id_ex.irq_en = 1'b1;
            end
        end
    end

    // ----------------------------------------------------------------------
    // Stalling FSM for CSR ops.
    // ----------------------------------------------------------------------
    logic [1:0] csr_stall_count;
    logic start_csr_stall;

    // Stall on /all/ system instructions, since they talk to CSRs.
    assign start_csr_stall = rv32i_opcode'(if_id.instruction[6:0]) == op_system;
    assign is_csr_stall = start_csr_stall || csr_stall_count;

    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            csr_stall_count <= '0;
        end else begin
            if (start_csr_stall == 1'b1 || csr_stall_count != '0) begin
                csr_stall_count <= csr_stall_count + 1'b1;
            end
        end
    end


    // ----------------------------------------------------------------------
    // Control ROM
    // ----------------------------------------------------------------------
    wire [6:0] crom_opcode = (atomic_in_progress == 1'b1)
                             ?  atomic_fsm_instr[6:0]
                             :  if_id.instruction[6:0];

    wire [2:0] crom_funct3 = (atomic_in_progress == 1'b1)
                             ?  atomic_fsm_instr[14:12]
                             :  if_id.instruction[14:12];

    wire [6:0] crom_funct7 = (atomic_in_progress == 1'b1)
                             ?  atomic_fsm_instr[31:25]
                             :  if_id.instruction[31:25];

    rv32i_ctrl crom_ctrl;
    always_comb begin
        id_ex.ctrl = crom_ctrl;

        // Never RVFI commit an atomic, it doesn't support RV32A.
        if (atomic_in_progress) id_ex.ctrl.rvfi_commit = 1'b0;
        if (id_ex.irq_en == 1'b1) begin
            id_ex.ctrl.ex_do_a_trap = 1'b1;
            id_ex.ctrl.ex_pc_mux = pc_mux::mtvec;
        end
    end

    control_rom control_rom
        (
         .opcode (rv32i_opcode'(crom_opcode)),
         .funct3 (crom_funct3),
         .funct7 (crom_funct7),
         .rs2_idx(if_id.instruction[24:20]),
         .ctrl   (crom_ctrl)
         );

endmodule
