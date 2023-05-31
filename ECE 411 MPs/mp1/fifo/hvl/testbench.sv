`ifndef testbench
`define testbench


module testbench(fifo_itf itf);
import fifo_types::*;

fifo_synch_1r1w dut (
    .clk_i     ( itf.clk     ),
    .reset_n_i ( itf.reset_n ),

    // valid-ready enqueue protocol
    .data_i    ( itf.data_i  ),
    .valid_i   ( itf.valid_i ),
    .ready_o   ( itf.rdy     ),

    // valid-yumi deqeueue protocol
    .valid_o   ( itf.valid_o ),
    .data_o    ( itf.data_o  ),
    .yumi_i    ( itf.yumi    )
);

initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars();
end

// Clock Synchronizer for Student Use
default clocking tb_clk @(negedge itf.clk); endclocking

task reset();
    itf.reset_n <= 1'b0;
    ##(10);
    itf.reset_n <= 1'b1;
    ##(1);
endtask : reset

function automatic void report_error(error_e err); 
    itf.tb_report_dut_error(err);
endfunction : report_error

// DO NOT MODIFY CODE ABOVE THIS LINE

initial begin
    reset();
    /************************ Your Code Here ***********************/
    // Feel free to make helper tasks / functions, initial / always blocks, etc.


    
    // You must enqueue words while the FIFO has size in [0, cap_p-1].

    for (int i = 0; i < cap_p; i++) begin
        itf.valid_i <= 1'b1;
        itf.data_i <= i;
        @(tb_clk);
        itf.valid_i <= 1'b0;
    end

    // You must dequeue words while the FIFO has size in [1, cap_p]
    for (int i = 0; i < cap_p; i++) begin
        itf.yumi <= 1'b1;
        @(tb_clk);
        itf.yumi <= 1'b0;
        // itf.valid_i <= 1'b0;
    end

    reset();

    // You must simultaneously enqueue and dequeue while the FIFO has size in [1, cap_p-1].

    itf.valid_i <= 1'b1;
    itf.data_i <= -1;
    @(tb_clk);
    for (int i = 0; i < cap_p; i++) begin
        itf.data_i <= i;
        itf.yumi <= 1'b1;
        @(tb_clk);
        itf.yumi <= 1'b0;
        itf.data_i <= i+1;
        @(tb_clk);
    end
    itf.valid_i <= 1'b0;
    



    /***************************************************************/
    // Make sure your test bench exits by calling itf.finish();
    itf.finish();
    $error("TB: Illegal Exit ocurred");
end

endmodule : testbench
`endif

