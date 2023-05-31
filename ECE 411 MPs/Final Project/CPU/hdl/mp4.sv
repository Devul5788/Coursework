module mp4
import rv32i_types::*;
    (
    input              clk,
    input              rst,
    input              irq,

    // Magic memory itf -- leave for testing purposes.
    input              instr_mem_resp,
    input  rv32i_word  instr_mem_rdata,
    input              data_mem_resp,
    input  rv32i_word  data_mem_rdata,
    output logic       instr_read,
    output rv32i_word  instr_mem_address,
    output logic       data_read,
    output logic       data_write,
    output logic [3:0] data_mbe,
    output rv32i_word  data_mem_address,
    output rv32i_word  data_mem_wdata

    // Physical memory itf.
    // input pmem_resp,
    // input [63:0] pmem_rdata,
    // output logic pmem_read,
    // output logic pmem_write,
    // output rv32i_word pmem_address,
    // output [63:0] pmem_wdata
);
    // wire          instr_read;
    // wire [31:0]   instr_mem_address;
    // wire          instr_mem_resp;
    // wire [31:0]   instr_mem_rdata;

    // wire          data_read;
    // wire          data_write;
    // wire [3:0]    data_mbe;
    // wire [31:0]   data_mem_address;
    // wire [31:0]   data_mem_wdata;
    // wire          data_mem_resp;
    // wire [31:0]   data_mem_rdata;
    // wire          flush_icache;

    // mem mem
    //     (
    //      .clk,
    //      .rst,
    //      .flush_icache,

    //      // Physical memory itf
    //      .pmem_resp,
    //      .pmem_rdata,
    //      .pmem_read,
    //      .pmem_write,
    //      .pmem_address,
    //      .pmem_wdata,

    //      // I$ itf
    //      .instr_read,
    //      .instr_mem_address,
    //      .instr_mem_resp,
    //      .instr_mem_rdata,

    //      // D$ itf
    //      .data_read,
    //      .data_write,
    //      .data_mbe,
    //      .data_mem_address,
    //      .data_mem_wdata,
    //      .data_mem_resp,
    //      .data_mem_rdata
    //      );

    cpu cpu (
         .clk,
         .rst,
         .data_mbe,
         .data_mem_address,
         .data_mem_rdata,
         .data_mem_resp,
         .data_mem_wdata,
         .data_read,
         .data_write,
         .instr_mem_address,
         .instr_mem_rdata,
         .instr_mem_resp,
         .instr_read,
         .irq
         // .flush_icache
         );


endmodule : mp4
