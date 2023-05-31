module if_stage
import rv32i_types::*;
    (
        input        clk,
        input        rst,
        input        irq,

        // New PC computed due to branch, branch enable
        input        rv32i_word br_pc,
        input        br_en,

        input        ld_pc,
        input        rv32i_word instr_mem_rdata,
        output logic instr_read,
        output       rv32i_word instr_mem_address,

        // To IF/ID
        output       rv32i_pipereg::if_id_t if_id
    );


    rv32i_word pc;
    assign if_id.pc = pc;
    assign if_id.irq = irq;

    // Program counter.
    always_ff @(posedge clk) begin
        if (rst == 1'b1) pc <= 32'h80000000;
        else begin
            if (ld_pc == 1'b1) begin
                if (br_en == 1'b1) pc <= br_pc;
                else pc <= pc + 32'h4;
            end
        end
    end

    // Instruction memory.
    assign if_id.instruction = instr_mem_rdata;
    assign instr_mem_address = if_id.pc;
    assign instr_read = 1'b1;

endmodule
