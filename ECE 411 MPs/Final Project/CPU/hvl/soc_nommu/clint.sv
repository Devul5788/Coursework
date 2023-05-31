module clint
    (
     input               clk,
     input               rst,
     input               rd_en,
     input               wr_en,
     input [15:0]        addr,
     input [31:0]        data_in,

     output logic [31:0] data_out,
     output logic        resp,
     output              irq
     );

    logic [63:0] count_max;
    wire [63:0]  count;

    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            count_max <= '0;
            data_out <= '0;
            resp <= '0;
        end else begin
            resp <= 1'b0;
            if (wr_en == 1'b1) begin
                unique case (addr)
                    16'h4000: count_max[31:0] <= data_in;
                    16'h4004: count_max[63:32] <= data_in;
                    default: begin end
                endcase
                resp <= 1'b1;
            end
            data_out <= count[31:0];
            if (addr == 16'hbffc) data_out <= count[63:32];
            if (rd_en == 1'b1 && resp != 1'b1) resp <= 1'b1;
        end
    end

    counter #(.TICK_COUNT (1)) counter
        (
         .clk,
         .rst,
         .count_max,
         .count,
         .irq
         );

endmodule: clint
