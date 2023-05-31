module beh_uart_tb;
`timescale 1ns/10ps


    import "DPI-C" function void setup_term();
    import "DPI-C" function void restore_term();

    // ----------------------------- Dump Signals ------------------------------
    initial begin
        $fsdbDumpfile("dump.fsdb");
        $fsdbDumpvars(0, beh_uart_tb, "+all");
        $display("Compilation Successful");
    end

    logic clk;
    logic rst;
    logic rd_en;
    logic wr_en;
    logic [31:0] data_in;
    logic [3:0]  addr;

    wire [31:0]  data_out;
    wire         resp;

    beh_uart dut
        (
         // Outputs
         .data_out (data_out),
         .resp     (resp),
         // Inputs
         .clk      (clk),
         .rst      (rst),
         .rd_en    (rd_en),
         .wr_en    (wr_en),
         .data_in  (data_in),
         .addr     (addr)
         );

    always begin
        clk = 1'b0;
        #5;
        clk = 1'b1;
        #5;
    end

    logic [31:0] tmp;

    initial begin
        setup_term();
        rst <= 1'b1;
        #20;
        rst <= 1'b0;
        #10;
        for (int i = 0; i < 25; ++i) begin
            do begin
                rd_en <= 1'b1;
                addr <= 'h5;
                @(posedge clk iff (resp == 1'b1));
            end while (data_out == 'd96);

            addr <= '0;
            @(posedge clk iff (resp == 1'b1));
            rd_en <= 1'b0;
            tmp <= data_out;
            #20;
            data_in <= tmp;
            wr_en <= 1'b1;
            @(posedge clk iff (resp == 1'b1));
            wr_en <= 1'b0;
            #10;
        end
        #100;
        restore_term();
        $finish;
    end


endmodule
