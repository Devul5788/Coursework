module counter #(parameter TICK_COUNT)
    (
     input        clk,
     input        rst,
     input [63:0] count_max,
     output logic [63:0] count,
     output       irq
     );

    logic [63:0] tick_counter;

    always_ff @(posedge clk) begin
        if (rst == 1'b1) begin
            // tick_counter <= '0;
            count <= '0;
        end else begin
            // tick_counter <= tick_counter + 1'b1;
            // if (tick_counter == TICK_COUNT) begin
            //     tick_counter <= '0;
            //     count <= count + 1'b1;
            // end
            if (dut.cpu.wb_stage.mem_wb.ctrl.rvfi_commit == 1'b1
                || dut.cpu.id_stage.atomic_fsm.state == 2'b11) begin
                count <= count + 1'b1;
            end
        end
    end

    assign irq = count >= count_max;

endmodule: counter
