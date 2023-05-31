module atomic
import rv32i_types::*;
    (
     input        clk,
     input        rst,

     input        start_atomic_fsm,
     input        stall_atomic_fsm,
     input        rv32i_word atomic_instruction,

     output       rv32i_word instruction,
     output logic atomic_resp,
     output logic atomic_load,
     output logic atomic_use_pipereg_ex,
     output logic atomic_use_pipereg_mem,
     output logic atomic_swap_skip_fwd_rs1
     );

    // Translates a single atomic instruction
    // to a sequence of three instructions:
    // Read (load)
    // Modify
    // Write (store)
    // Stalls the front of the pipeline while
    // the atomic is "in execution".

    enum bit [1:0] {
      read = '0,
      stall, // Load-use stall.
      modify,
      write
    } state, next_state;

    always_comb begin
        next_state = read;
        unique case (state)
            read: if (start_atomic_fsm == 1'b1) next_state = stall;
            stall: next_state = modify;
            modify: next_state = write;
            write: next_state = read;
            default: next_state = read;
        endcase
        if (stall_atomic_fsm == 1'b1) begin
            next_state = state;
        end
    end

    always_comb begin
        instruction = '0;
        atomic_use_pipereg_ex = '0;
        atomic_use_pipereg_mem = '0;
        atomic_resp = '0;
        atomic_load = '0;
        atomic_swap_skip_fwd_rs1 = '0;

        unique case (state)
            read: begin
                atomic_load = 1'b1;
                instruction[6:0] = 7'(op_load); // load
                instruction[11:7] = atomic_instruction[11:7]; // RD
                instruction[14:12] = 3'b010; // LW
                instruction[19:15] = atomic_instruction[19:15]; // RS1
                instruction[31:20] = '0; // i-imm (offset)
            end

            stall: begin
                // No-op (currently is unimp, may have to change)
                instruction = '0;
            end

            modify: begin
                priority case (atomic_instruction[31:27])
                    5'b00000: begin : AMOADD
                        // The add instruction gets its inputs from
                        // the loaded value and rs2.
                        atomic_use_pipereg_ex = 1'b1;

                        instruction[6:0] = 7'(op_reg); // Register op
                        instruction[11:7] = '0; // RD = x0
                        instruction[14:12] = '0; // Add
                        instruction[19:15] = '0; // RS1=x0
                        instruction[24:20] = atomic_instruction[24:20];//RS2
                        instruction[31:25] = '0;
                    end : AMOADD

                    5'b00100: begin : AMOXOR
                        atomic_use_pipereg_ex = 1'b1;

                        instruction[6:0] = 7'(op_reg); // Register op
                        instruction[11:7] = '0; // RD = x0
                        instruction[14:12] = 3'b100; // XOR
                        instruction[19:15] = '0; // RS1=x0
                        instruction[24:20] = atomic_instruction[24:20];
                        instruction[31:25] = '0;
                    end : AMOXOR

                    5'b01100: begin : AMOAND
                        atomic_use_pipereg_ex = 1'b1;

                        instruction[6:0] = 7'(op_reg); // Register op
                        instruction[11:7] = '0; // RD = x0
                        instruction[14:12] = 3'b111; // AND
                        instruction[19:15] = '0; // RS1=x0
                        instruction[24:20] = atomic_instruction[24:20];
                        instruction[31:25] = '0;
                    end : AMOAND

                    5'b01000: begin : AMOOR
                        atomic_use_pipereg_ex = 1'b1;

                        instruction[6:0] = 7'(op_reg); // Register op
                        instruction[11:7] = '0; // RD = x0
                        instruction[14:12] = 3'b110; // OR
                        instruction[19:15] = '0; // RS1=x0
                        instruction[24:20] = atomic_instruction[24:20];
                        instruction[31:25] = '0;
                    end : AMOOR

                    5'b00001: begin : AMOSWAP
                        atomic_use_pipereg_ex = 1'b0;
                        atomic_swap_skip_fwd_rs1 = 1'b1;

                        instruction[6:0] = 7'(op_reg); // Register op
                        instruction[11:7] = '0; // RD=RS2
                        instruction[14:12] = 3'b000; // ADD
                        instruction[19:15] = '0; // RS1=x0
                        instruction[24:20] = atomic_instruction[24:20]; // RS2
                        instruction[31:25] = '0;
                    end : AMOSWAP

                    // [TD_MMU]
                    // I've left AMOMIN[U]/AMOMAX[U] unimplemented as of now
                    // since our Linux image doesn't use them.
                endcase
            end

            write: begin
                atomic_use_pipereg_mem = 1'b1;

                instruction[6:0] = 7'(op_store);
                instruction[11:7] = '0; // Offset = 0
                instruction[14:12] = 3'b010; // SW
                instruction[19:15] = atomic_instruction[19:15]; // RS1
                instruction[24:20] = '0; // RS2 = x0
                instruction[31:25] = '0; // Offset = 0

                atomic_resp = 1'b1;
            end

            default: begin
                instruction = '0;
                atomic_use_pipereg_ex = '0;
                atomic_use_pipereg_mem = '0;
                atomic_resp = '0;
                atomic_load = '0;
            end
        endcase
    end

    always_ff @(posedge clk) begin
        if (rst == 1'b1) state <= read;
        else state <= next_state;
    end

endmodule
