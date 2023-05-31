module soc_nommu
    (
     input               clk,
     input               rst,
     input               mmio_read,
     input               mmio_write,
     input [31:0]        mmio_data_in,
     input [31:0]        mmio_address,

     output logic [31:0] mmio_data_out,
     output logic        mmio_resp,
     output logic        irq
     );

    logic       uart_rd_en;
    logic       uart_wr_en;
    wire [31:0] uart_data_out;
    wire        uart_resp;
    logic       clint_rd_en;
    logic       clint_wr_en;
    wire [31:0] clint_data_out;
    wire        clint_resp;

    always_comb begin
        mmio_data_out = 'x;
        mmio_resp = 1'b0;

        if (mmio_read == 1'b1 || mmio_write == 1'b1) begin
            unique case (mmio_address[31-:8])
                8'h10: begin
                    mmio_data_out = uart_data_out;
                    mmio_resp = uart_resp;
                end
                8'h11: begin
                    mmio_data_out = clint_data_out;
                    mmio_resp = clint_resp;
                end
                default: begin end
            endcase
        end
    end

    always_comb begin
        uart_rd_en = 1'b0;
        uart_wr_en = 1'b0;
        clint_rd_en = 1'b0;
        clint_wr_en = 1'b0;

        if (mmio_read == 1'b1) begin
            unique case (mmio_address[31-:8])
                8'h10: uart_rd_en = 1'b1;
                8'h11: clint_rd_en = 1'b1;
                default: begin end
            endcase
        end

        if (mmio_write == 1'b1) begin
            unique case (mmio_address[31-:8])
                8'h10: uart_wr_en = 1'b1;
                8'h11: clint_wr_en = 1'b1;
                default: begin end
            endcase
        end
    end

    beh_uart beh_uart
        (
         .clk,
         .rst,
         .rd_en    (uart_rd_en),
         .wr_en    (uart_wr_en),
         .addr     (mmio_address[3:0]),
         .data_in  (mmio_data_in),
         .data_out (uart_data_out),
         .resp     (uart_resp)
         );

    clint clint
        (
         .clk,
         .rst,
         .rd_en    (clint_rd_en),
         .wr_en    (clint_wr_en),
         .addr     (mmio_address[15:0]),
         .data_in  (mmio_data_in),
         .data_out (clint_data_out),
         .resp     (clint_resp),
         .irq
         );

endmodule: soc_nommu
