module beh_uart
    (
     input               clk,
     input               rst,
     input               rd_en,
     input               wr_en,
     input [3:0]         addr,
     input [31:0]        data_in,

     output logic [31:0] data_out,
     output logic        resp
     );

    import "DPI-C" function int get_one_char();
    import "DPI-C" function int is_char_available();
    import "DPI-C" function void write_one_char(input byte c);

    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            data_out <= '0;
            resp <= '0;
        end else begin
            resp <= '0;
            if (rd_en == 1'b1 && resp != 1'b1) begin
                unique case (addr)
                    4'h5: begin
                        data_out <= 32'h60 | is_char_available();
                        resp <= 1'b1;
                    end
                    4'h0: begin
                        if (is_char_available()) data_out <= get_one_char();
                        resp <= 1'b1;
                    end
                    default: begin
                        resp <= 1'b1;
                    end
                endcase
            end
            if (wr_en == 1'b1 && resp != 1'b1) begin
                if (addr == '0) write_one_char(data_in[7:0]);
                resp <= 1'b1;
            end
        end
    end

endmodule: beh_uart
