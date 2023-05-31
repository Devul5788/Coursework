module mem
    import rv32i_types::*;
    (
     input         clk,
     input         rst,
     input         flush_icache, // // TODO: Zifencei support.

     // Interface w/physical memory.
     input         pmem_resp,
     input [63:0]  pmem_rdata,
     output logic  pmem_read,
     output logic  pmem_write,
     output        rv32i_word pmem_address,
     output [63:0] pmem_wdata,

     // Interface w/IF stage.
     input         instr_read,
     input         rv32i_word instr_mem_address,
     output        instr_mem_resp,
     output        rv32i_word instr_mem_rdata,

     // Interface w/MEM stage.
     input         data_read,
     input         data_write,
     input [3:0]   data_mbe,
     input         rv32i_word data_mem_address,
     input         rv32i_word data_mem_wdata,
     output        data_mem_resp,
     output        rv32i_word data_mem_rdata
     );


    // i$-arb wires
    wire           arb_icache_resp;
    wire [255:0]   arb_icache_rdata;
    wire [31:0]    arb_icache_addr;
    wire           arb_icache_read;

    // d$-arb wires
    wire           arb_dcache_resp;
    wire [255:0]   arb_dcache_rdata;
    wire [31:0]    arb_dcache_addr;
    wire           arb_dcache_read;
    wire [255:0]   arb_dcache_wdata;
    wire           arb_dcache_write;

    // arb-cla wires
    wire [255:0]   line_i;
    wire [255:0]   line_o;
    wire [31:0]    address_i;
    wire           read_i;
    wire           write_i;
    wire           resp_o;

    cache instruction_cache
        (
         .clk,
         .rst                 (rst || flush_icache),

         // Interface w/arbiter
         .pmem_resp           (arb_icache_resp),
         .pmem_rdata          (arb_icache_rdata),
         .pmem_address        (arb_icache_addr),
         .pmem_read           (arb_icache_read),
         .pmem_wdata          (),
         .pmem_write          (),

         // Interface w/CPU   (IF stage)
         .mem_read            (instr_read),
         .mem_write           ('0),
         .mem_byte_enable_cpu ('0),
         .mem_address         (instr_mem_address),
         .mem_wdata_cpu       ('0),
         .mem_resp            (instr_mem_resp),
         .mem_rdata_cpu       (instr_mem_rdata)
         );


    cache data_mem_cache
        (
         .clk,
         .rst,

         // Interface w/arbiter
         .pmem_resp           (arb_dcache_resp),
         .pmem_rdata          (arb_dcache_rdata),
         .pmem_address        (arb_dcache_addr),
         .pmem_read           (arb_dcache_read),
         .pmem_wdata          (arb_dcache_wdata),
         .pmem_write          (arb_dcache_write),

         // Interface w/CPU   (MEM stage)
         .mem_read            (data_read),
         .mem_write           (data_write),
         .mem_byte_enable_cpu (data_mbe),
         .mem_address         (data_mem_address),
         .mem_wdata_cpu       (data_mem_wdata),
         .mem_resp            (data_mem_resp),
         .mem_rdata_cpu       (data_mem_rdata)
         );

    arbiter arb
        (
         .clk,
         .rst,

         // Interface w/bottom of I$
         .icache_resp  (arb_icache_resp),
         .icache_rdata (arb_icache_rdata),
         .icache_addr  (arb_icache_addr),
         .icache_read  (arb_icache_read),

         // Interface w/bottom of D$
         .dcache_resp  (arb_dcache_resp),
         .dcache_rdata (arb_dcache_rdata),
         .dcache_addr  (arb_dcache_addr),
         .dcache_read  (arb_dcache_read),
         .dcache_wdata (arb_dcache_wdata),
         .dcache_write (arb_dcache_write),

         // Interface w/cacheline adaptor
         .cla_wdata    (line_i),
         .cla_rdata    (line_o),
         .cla_addr     (address_i),
         .cla_read     (read_i),
         .cla_write    (write_i),
         .cla_resp     (resp_o)
         );

    cacheline_adaptor cla
        (
         .clk,
         .reset_n   (~rst),

         // Interface w/arbiter
         .line_i,
         .line_o,
         .address_i,
         .read_i,
         .write_i,
         .resp_o,

         // Interface w/burst memory
         .burst_i   (pmem_rdata),
         .burst_o   (pmem_wdata),
         .address_o (pmem_address),
         .read_o    (pmem_read),
         .write_o   (pmem_write),
         .resp_i    (pmem_resp)
         );

endmodule
