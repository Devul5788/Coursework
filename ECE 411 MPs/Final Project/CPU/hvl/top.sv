module mp4_tb;
`timescale 1ns/10ps

/********************* Do not touch for proper compilation *******************/
// Instantiate Interfaces
tb_itf itf();
rvfi_itf rvfi(itf.clk, itf.rst);

// Instantiate Testbench
source_tb tb(
    .magic_mem_itf(itf),
    .mem_itf(itf),
    .sm_itf(itf),
    .tb_itf(itf),
    .rvfi(rvfi)
);

// Dump signals
// initial begin
//     $fsdbDumpfile("dump.fsdb");
//     $fsdbDumpvars(0, "+all");
// end
/****************************** End do not touch *****************************/



/***************************** Spike Log Printer *****************************/
// Can be enabled for debugging
spike_log_printer printer(.itf(itf), .rvfi(rvfi));
/*************************** End Spike Log Printer ***************************/


/************************ Signals necessary for monitor **********************/
// This section not required until CP2

// Set high when a valid instruction is modifying regfile or PC
assign rvfi.commit = dut.cpu.wb_stage.mem_wb.ctrl.rvfi_commit;

// Set high when target PC == Current PC for a branch
assign rvfi.halt = (dut.cpu.br_pc == dut.cpu.id_ex.pc) && dut.cpu.br_en;
initial rvfi.order = 0;
always @(posedge itf.clk iff rvfi.commit) rvfi.order <= rvfi.order + 1; // Modify for OoO

// Instruction and trap:
    assign rvfi.inst = dut.cpu.mem_wb.instruction;
    assign rvfi.trap = 1'b0; // For now, don't trap.


// Regfile:
    assign rvfi.rs1_addr = dut.cpu.mem_wb.instruction[19:15];
    assign rvfi.rs2_addr = dut.cpu.mem_wb.instruction[24:20];
    assign rvfi.rs1_rdata = dut.cpu.rs1_rdata[1];
    assign rvfi.rs2_rdata = dut.cpu.rs2_rdata[1];
    assign rvfi.load_regfile = dut.cpu.wb_ld;
    assign rvfi.rd_addr = dut.cpu.wb_reg;
    assign rvfi.rd_wdata = dut.cpu.wb_reg ? dut.cpu.wb_data : '0;

// PC:
    assign rvfi.pc_rdata = dut.cpu.mem_wb.pc;
    assign rvfi.pc_wdata = dut.cpu.br_en_piped[1] ? dut.cpu.br_pc_piped[1] :  (dut.cpu.mem_wb.pc + 4);

// Memory:
    assign rvfi.mem_addr = dut.cpu.mem_addr;
    assign rvfi.mem_rmask = dut.cpu.mem_rmask;
    assign rvfi.mem_wmask = dut.cpu.mem_wmask;
    assign rvfi.mem_rdata = dut.cpu.mem_wb.data_mem_out;
    assign rvfi.mem_wdata = dut.cpu.mem_wdata;

// Please refer to rvfi_itf.sv for more information.

/**************************** End RVFIMON signals ****************************/



/********************* Assign Shadow Memory Signals Here *********************/
// This section not required until CP2
// The following signals need to be set:
// // icache signals:
//     assign itf.inst_read = dut.instr_read;
//     assign itf.inst_addr = dut.instr_mem_address;
//     assign itf.inst_resp = dut.instr_mem_resp;
//     assign itf.inst_rdata = dut.instr_mem_rdata;

// // dcache signals:
//     assign itf.data_read = dut.data_read;
//     assign itf.data_write = dut.data_write;
//     assign itf.data_mbe = dut.data_mbe;
//     assign itf.data_addr = dut.data_mem_address;
//     assign itf.data_wdata = dut.data_mem_wdata;
//     assign itf.data_resp = dut.data_mem_resp;
//     assign itf.data_rdata = dut.data_mem_rdata;

// Please refer to tb_itf.sv for more information.

/*********************** End Shadow Memory Assignments ***********************/

// Set this to the proper value
assign itf.registers = dut.cpu.id_stage.regfile;

/*********************** Instantiate your design here ************************/
/*
The following signals need to be connected to your top level for CP2:
Burst Memory Ports:
    itf.mem_read
    itf.mem_write
    itf.mem_wdata
    itf.mem_rdata
    itf.mem_addr
    itf.mem_resp

Please refer to tb_itf.sv for more information.
*/

    logic        data_resp;
    logic [31:0] data_rdata;
    logic        mmio_resp;
    logic [31:0] mmio_data_out;

    always_comb begin
        data_resp = itf.data_resp;
        data_rdata = itf.data_rdata;

        if (itf.data_addr[31-:8] == 8'h10 || itf.data_addr[31-:8] == 8'h11) begin
            data_resp = mmio_resp;
            data_rdata = mmio_data_out;
        end
    end

    logic [31:0] non_aligned_mem_addr;
    always_comb itf.data_addr = {non_aligned_mem_addr[31:2], 2'b00};

    // always_ff @(posedge itf.clk) begin
    //     if (itf.data_addr == 'h8028de40 && (itf.data_read || itf.data_write)) begin
    //         $display("--------------------------------------------------");
    //         $display("CPU tried to access 0x8028de40.");
    //         $display("Transaction details: ");
    //         $display("Time = %t", $time);
    //         if (itf.data_read == 1'b1) begin
    //             $display("data_read = %x", itf.data_read);
    //             $display("data_rdata = %x", itf.data_rdata);
    //         end else if (itf.data_write == 1'b1) begin
    //             $display("data_write = %x", itf.data_write);
    //             $display("data_wdata = %x", itf.data_wdata);
    //         end
    //         $display("--------------------------------------------------");
    //     end
    // end

    soc_nommu soc
        (
         .clk (itf.clk),
         .rst (itf.rst),

         .mmio_read(itf.data_read),
         .mmio_write(itf.data_write),
         .mmio_data_in(itf.data_wdata),
         .mmio_address(non_aligned_mem_addr),

         .mmio_data_out,
         .mmio_resp,
         .irq(itf.irq)
         );


    mp4 dut(
            .clk               (itf.clk),
            .rst               (itf.rst),
            .irq               (itf.irq),

            // Magic mem
            .instr_mem_resp    (itf.inst_resp),
            .instr_mem_rdata   (itf.inst_rdata),
            .data_mem_resp     (data_resp),
            .data_mem_rdata    (data_rdata),
            .instr_read        (itf.inst_read),
            .instr_mem_address (itf.inst_addr),
            .data_read         (itf.data_read),
            .data_write        (itf.data_write),
            .data_mbe          (itf.data_mbe),
            .data_mem_address  (non_aligned_mem_addr),
            .data_mem_wdata    (itf.data_wdata)

            // .pmem_read(itf.mem_read),
            // .pmem_write(itf.mem_write),
            // .pmem_wdata(itf.mem_wdata),
            // .pmem_rdata(itf.mem_rdata),
            // .pmem_address(itf.mem_addr),
            // .pmem_resp(itf.mem_resp)
            );
/***************************** End Instantiation *****************************/

endmodule
