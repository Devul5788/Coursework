
`ifndef testbench
`define testbench
module testbench(multiplier_itf.testbench itf);
import mult_types::*;

add_shift_multiplier dut (
    .clk_i          ( itf.clk          ),
    .reset_n_i      ( itf.reset_n      ),
    .multiplicand_i ( itf.multiplicand ),
    .multiplier_i   ( itf.multiplier   ),
    .start_i        ( itf.start        ),
    .ready_o        ( itf.rdy          ),
    .product_o      ( itf.product      ),
    .done_o         ( itf.done         )
);

assign itf.mult_op = dut.ms.op;
default clocking tb_clk @(negedge itf.clk); endclocking

initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars();
end

// DO NOT MODIFY CODE ABOVE THIS LINE

/* Uncomment to "monitor" changes to adder operational state over time */
//initial $monitor("dut-op: time: %0t op: %s", $time, dut.ms.op.name);


// Resets the multiplier
task reset();
    itf.reset_n <= 1'b0;
    ##5;
    itf.reset_n <= 1'b1;
    ##1;
endtask : reset

// error_e defined in package mult_types in file ../include/types.sv
// Asynchronously reports error in DUT to grading harness
function void report_error(error_e error);
    itf.tb_report_dut_error(error);
endfunction : report_error


initial itf.reset_n = 1'b0;
initial begin
    reset();
    /********************** Your Code Here *****************************/

    // If the ``ready_o`` signal is not asserted after a reset, report a ``NOT_READY`` error.
    assert (itf.rdy == 1'b1) 
    else begin
      $error ("%0d: %0t: NOT_READY error detected", `__LINE__, $time);
      report_error (NOT_READY);
    end

/*  From a 'ready' [#]_ state, assert ``start_i`` with every possible combination of multiplicand and
    multiplier, and without any resets until the multiplier enters a 'done' state (resets while the
    device is in a 'done' state are acceptable).
*/
    for (int i = 0; i < 256; i++)  begin
        for (int j = 0; j < 256; j++) begin
            itf.multiplier <= i;
            itf.multiplicand <= j;
            // #1;
            @(tb_clk);
            itf.start <= 1'b1;

            @(tb_clk iff (itf.done == 1'b1));


            // Upon entering the 'DONE' state, if the output signal ``product_o`` holds an incorrect product, report a ``BAD_PRODUCT`` error.
            assert (itf.product == (i * j))
            else begin
                $error ("%0d: %0t: BAD_PRODUCT error detected", `__LINE__, $time);
                report_error (BAD_PRODUCT);
            end

            // If the ``ready_o`` signal is not asserted upon completion of a multiplication, report a ``NOT_READY`` error.
            assert (itf.rdy == 1'b1) 
            else begin
                $error ("%0d: %0t: NOT_READY error detected", `__LINE__, $time);
                report_error (NOT_READY);
            end
        end
    end

    // For each 'run' state ``s``, assert the ``start_i`` signal while the multiplier is in state ``s``
    itf.start <= 1'b1;
    @(tb_clk iff (itf.mult_op == ADD));
    itf.start <= 1'b1;
    @(tb_clk iff (itf.done == 1'b1));

    itf.start <= 1'b1;
    @(tb_clk iff (itf.mult_op == SHIFT));
    itf.start <= 1'b1;
    @(tb_clk iff (itf.done == 1'b1));

    itf.start <= 1'b1;
    @(tb_clk iff (itf.mult_op == ADD));
    reset();

    itf.start <= 1'b1;
    @(tb_clk iff (itf.mult_op == SHIFT));
    reset();

    /*******************************************************************/
    itf.finish(); // Use this finish task in order to let grading harness
                  // complete in process and/or scheduled operations
    $error("Improper Simulation Exit");
end


endmodule : testbench
`endif
