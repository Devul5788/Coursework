
module testbench(cam_itf itf);
import cam_types::*;

cam dut (
    .clk_i     ( itf.clk     ),
    .reset_n_i ( itf.reset_n ),
    .rw_n_i    ( itf.rw_n    ),
    .valid_i   ( itf.valid_i ),
    .key_i     ( itf.key     ),
    .val_i     ( itf.val_i   ),
    .val_o     ( itf.val_o   ),
    .valid_o   ( itf.valid_o )
);

default clocking tb_clk @(negedge itf.clk); endclocking

initial begin
    $fsdbDumpfile("dump.fsdb");
    $fsdbDumpvars();
end

task reset();
    itf.reset_n <= 1'b0;
    repeat (5) @(tb_clk);
    itf.reset_n <= 1'b1;
    repeat (5) @(tb_clk);
endtask

// DO NOT MODIFY CODE ABOVE THIS LINE

task write(input key_t key, input val_t val);
    itf.rw_n <= 0;
    itf.valid_i <= 1;
    itf.key <= key;
    itf.val_i <= val;
    @(tb_clk);
    itf.valid_i <= 1'b0;
endtask

task read(input key_t key, output val_t val);
    itf.rw_n <= 1;
    itf.valid_i <= 1;
    itf.key <= key;
    @(tb_clk);
    val <= itf.val_o;
    itf.valid_i <= 0;
    @(tb_clk);
endtask

val_t val;

initial begin
    $display("Starting CAM Tests");

    reset();
    /************************** Your Code Here ****************************/
    // Feel free to make helper tasks / functions, initial / always blocks, etc.
    // Consider using the task skeltons above
    // To report errors, call itf.tb_report_dut_error in cam/include/cam_itf.sv


    /**********************************************************************/

    for (val_t i = 0; i < camsize_p; i++) begin
        write(i,i);
    end

    for (val_t i = 0; i < camsize_p; i++) begin
        write(i+8,i);
    end

    for (val_t i = 0; i < camsize_p; i++) begin
        read(i+8,val);
    end
    write(0,0);
    write(0,1);
    read(0,val);





    itf.finish();
end

endmodule : testbench
