module arbiter
import rv32i_types::*;
    (
     input                clk,
     input                rst,
     // I$
     output logic         icache_resp,
     output logic [255:0] icache_rdata,
     input [31:0]         icache_addr,
     input                icache_read,

     // D$
     output logic         dcache_resp,
     output logic [255:0] dcache_rdata,
     input [31:0]         dcache_addr,
     input                dcache_read,
     input [255:0]        dcache_wdata,
     input                dcache_write,

     // cla
     output logic [255:0] cla_wdata,
     input [255:0]        cla_rdata,
     output logic [31:0]  cla_addr,
     output logic         cla_read,
     output logic         cla_write,
     input                cla_resp
     );

    enum logic [1:0] {
      idle = '0,
      instr,
      data
    } state, next_state;


    always_comb begin
        unique case (state)
            instr: begin
                cla_addr = icache_addr;
                cla_read = icache_read;
                cla_write = 1'b0;
                cla_wdata = {256{1'bx}};
                icache_rdata = cla_rdata;
                icache_resp = cla_resp;
                dcache_resp = 1'b0;
                dcache_rdata = {256{1'bx}};
            end

            data: begin
                cla_addr = dcache_addr;
                cla_read = dcache_read;
                cla_write = dcache_write;
                cla_wdata = dcache_wdata;
                dcache_resp = cla_resp;
                dcache_rdata = cla_rdata;
                icache_resp = 1'b0;
                icache_rdata = {256{1'bx}};
            end

            default: begin
                cla_addr = {32{1'bx}};
                cla_read = 1'b0;
                cla_write = 1'b0;
                cla_wdata = {256{1'bx}};
                icache_rdata = {256{1'bx}};
                icache_resp = 1'b0;
                dcache_resp = 1'b0;
                dcache_rdata = {256{1'bx}};
            end
        endcase
    end

    always_comb begin
        next_state = state;
        unique case (state)
            idle: begin
                if ((dcache_read == 1'b1) || (dcache_write == 1'b1)) begin
                    next_state = data;
                end
                if (icache_read == 1'b1) begin
                    next_state = instr;
                end
            end

            instr: if (cla_resp == 1'b1) next_state = idle;
            data: if (cla_resp == 1'b1) next_state = idle;

            default: next_state = idle;

        endcase
    end

    always_ff @(posedge clk) begin
        if (rst == 1'b1) state <= '0;
        else state <= next_state;
    end

endmodule
