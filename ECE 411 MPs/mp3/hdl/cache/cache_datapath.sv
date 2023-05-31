/* MODIFY. The cache datapath. It contains the data,
valid, dirty, tag, and LRU arrays, comparators, muxes,
logic gates and other supporting logic. */

module cache_datapath #(
    parameter s_offset = 5,
    parameter s_index  = 3,
    parameter s_tag    = 32 - s_offset - s_index,
    parameter s_mask   = 2**s_offset,
    parameter s_line   = 8*s_mask,
    parameter num_sets = 2**s_index
)
(
    input logic clk,
    input logic rst,
    
    // load signals from control
    input logic dirty_load0,
    input logic dirty_load1,
    input logic valid_load0,
    input logic valid_load1,
    input logic lru_load,
    input logic tag_load0,
    input logic tag_load1,

    // signals for arrays from control/cpu/mem
    input logic lru_input,
    input logic dirty_input0,
    input logic dirty_input1,
    input logic valid_input0,
    input logic valid_input1,

    // signals from arrays to control/cpu/mem
    output logic dirty_out0,
    output logic dirty_out1,
    output logic valid_out0,
    output logic valid_out1,
    output logic lru_out,

    // set associative signals to/from control
    input logic way_select0,
    input logic way_select1,
    output logic hit0,
    output logic hit1,

    // signals from/to bus adapter (CPU)
    input logic [31:0] mem_address, 
    input logic [255:0] mem_wdata256, 
    input logic [31:0] mem_byte_enable256, 
    output logic [255:0] mem_rdata256, 

    // signals from/to cacheline adapter (Memory)
    input logic [255:0] pmem_rdata, 
    output logic [255:0] pmem_wdata, 
    output logic [31:0] pmem_address,

    // signal coming from control (0 -> read miss (allocate) or 1 -> wb)
    input logic pmem_addr_sel,

    // signals for data byte enable when writing
    input logic [31:0] mem_byte_enable256_0,
    input logic [31:0] mem_byte_enable256_1
);

logic [23:0] tag_out0;
logic [23:0] tag_out1;
logic [255:0] data_out0;
logic [255:0] data_out1;
logic [255:0] data_in0;
logic [255:0] data_in1;
logic [31:0] wb_pmem_address_mux_out;

logic [23:0] tag;
logic [2:0] index;
logic [2:0] offset;

assign tag = mem_address[31:8];
assign index = mem_address[7:5];
assign offset = mem_address[4:2];

assign hit0 = ((tag_out0 == tag) && valid_out0);
assign hit1 = ((tag_out1 == tag) && valid_out1);

// tag arrays
array #(.s_index(3), .width(24)) tag0 (
    .clk (clk),
    .rst (rst),
    .read (1'b1),              
    .load (tag_load0),         
    .rindex (index),
    .windex (index),
    .datain (tag),
    .dataout (tag_out0)
);

array #(.s_index(3), .width(24)) tag1 (
    .clk (clk),
    .rst (rst),
    .read (1'b1),              
    .load (tag_load1),         
    .rindex (index),
    .windex (index),
    .datain (tag),
    .dataout (tag_out1)
);

// valid arrays
array valid0 (
    .clk (clk),
    .rst (rst),
    .read (1'b1),            
    .load (valid_load0),       
    .rindex (index),
    .windex (index),
    .datain (valid_input0),
    .dataout (valid_out0)
);

array valid1 (
    .clk (clk),
    .rst (rst),
    .read (1'b1),             
    .load (valid_load1),        
    .rindex (index),
    .windex (index),
    .datain (valid_input1),
    .dataout (valid_out1)
);

// dirty arrays
array dirty0 (
    .clk (clk),
    .rst (rst),
    .read (1'b1),              
    .load (dirty_load0),        
    .rindex (index),
    .windex (index),
    .datain (dirty_input0),
    .dataout (dirty_out0)
);

array dirty1 (
    .clk (clk),
    .rst (rst),
    .read (1'b1),              
    .load (dirty_load1),       
    .rindex (index),
    .windex (index),
    .datain (dirty_input1),
    .dataout (dirty_out1)
);

// data arrays
data_array data0 (
    .clk (clk),
    .read (1'b1),
    .write_en (mem_byte_enable256_0),
    .rindex (index),
    .windex (index),
    .datain (data_in0), 
    .dataout (data_out0)
);

data_array data1 (
    .clk (clk),
    .read (1'b1),
    .write_en (mem_byte_enable256_1),
    .rindex (index),
    .windex (index),
    .datain (data_in1), 
    .dataout (data_out1)
);

// LRU array
array lru (
    .clk (clk),
    .rst (rst),
    .read (1'b1),
    .load (lru_load),
    .rindex (index),
    .windex (index),
    .datain (lru_input),
    .dataout (lru_out)
);

/*****************************************************************************/

/******************************** Muxes **************************************/
always_comb begin : MUXES
    //Write Back Pmem Address Mux (for write back we must get pmem address from the tag bits stored in the tag array)
    unique case (lru_out)
        1'b0: wb_pmem_address_mux_out = {tag_out0, index, 5'b00000};
        1'b1: wb_pmem_address_mux_out = {tag_out1, index, 5'b00000};
        default: ;
    endcase

    //Pmem Address Mux (choose pmem to be either address coming from CPU (for read miss (allocate)) or through tag array fr write back)
    //In write back -> pmem_addr_sel goes from 0 to 1 (wb state) to 0 (allocate state).
    unique case (pmem_addr_sel)
        1'b0: pmem_address = {mem_address[31:5], 5'b00000};
        1'b1: pmem_address = wb_pmem_address_mux_out;
        default: ;
    endcase

    unique case (hit1)
        1'b0: mem_rdata256 = data_out0;
        1'b1: mem_rdata256 = data_out1;
        default: ;
    endcase

    // Write Back Physical Memory Data Mux (we want to evict the least recently used block)
    unique case (lru_out)
        1'b0: pmem_wdata = data_out0;
        1'b1: pmem_wdata = data_out1;
        default: ;
    endcase

    // Data Mux 1. If there was originally a hit then just write the data sent to the cache by CPU. If there is a miss
    // then write the data sent by physical memory. We cannot use hit0 and hit1 as those signals depend on valid bit, 
    // and can change to 1 even though originally there was a miss. 
    unique case (way_select0)
        1'b0: data_in0 = mem_wdata256;
        1'b1: data_in0 = pmem_rdata;
        default: ;
    endcase  

    // Data Mux 2. If there is a hit then just write the data sent to the cache by CPU. If there is a miss
    // then write the data sent by physical memory.
    unique case (way_select1)
        1'b0: data_in1 = mem_wdata256;
        1'b1: data_in1 = pmem_rdata;
        default: ;
    endcase  
end
/*****************************************************************************/


endmodule : cache_datapath
