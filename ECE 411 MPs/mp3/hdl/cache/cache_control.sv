/* MODIFY. The cache controller. It is a state machine
that controls the behavior of the cache. */

module cache_control (
    input logic clk,
    input logic rst,

    // load signals for arrays
    output logic dirty_load0,
    output logic dirty_load1,
    output logic valid_load0,
    output logic valid_load1,
    output logic lru_load,
    output logic tag_load0,
    output logic tag_load1,

    // input signals for arrays
    output logic lru_input,
    output logic dirty_input0,
    output logic dirty_input1,
    output logic valid_input0,
    output logic valid_input1,

    // output signals from arrays
    input logic dirty_out0,
    input logic dirty_out1,
    input logic valid_out0,
    input logic valid_out1,
    input logic lru_out,

    // set associative signals
    output logic way_select0,
    output logic way_select1,
    input logic hit0,
    input logic hit1,

    // control input signals
    input logic mem_read,
    input logic mem_write,
    input logic pmem_resp,
    input logic [31:0] mem_byte_enable256,

    // control output signals 
    output logic mem_resp,
    output logic pmem_read,
    output logic pmem_write,
    output logic [31:0] mem_byte_enable256_0,
    output logic [31:0] mem_byte_enable256_1,

    // signal going to datapath (0 -> read miss (allocate) or 1 -> wb)
    output logic pmem_addr_sel
);

logic dirty;
logic hit;  

// block is evicted on the basis of lru. We need to make sure if the block that the lru
// is pointing to is dirty or not. 
assign block_dirty = (lru_out == 0 && dirty_out0 == 1) || (lru_out == 1 && dirty_out1 == 1);
assign hit = hit0 || hit1;

/* List of states */
enum int unsigned {
	idle,
	compare,
	write_back,
	allocate
} state, next_state;

function void set_defaults();
    dirty_load0 = 1'b0;
    dirty_load1 = 1'b0;
    valid_load0 = 1'b0;
    valid_load1 = 1'b0;
    lru_load = 1'b0;
    tag_load0 = 1'b0;
    tag_load1 = 1'b0;

    lru_input = lru_out;
    dirty_input0 = dirty_out0;
    dirty_input1 = dirty_out1;
    valid_input0 = valid_out0;
    valid_input1 = valid_out1;

    mem_resp = 1'b0;
    pmem_read = 1'b0;           
    pmem_write = 1'b0;
	pmem_addr_sel = 1'b0;
    way_select0 = 1'b0;
    way_select1 = 1'b0;

    // mem byte must 0 by default to avoid accidentily writing to memory.
    mem_byte_enable256_0 = {32{1'b0}}; 
    mem_byte_enable256_1 = {32{1'b0}};
endfunction

always_comb begin : state_actions
    /* set defaults */
    set_defaults();

    /* State Actions */
    case(state)
		idle: ;

		compare: begin
            if (hit == 1) begin
                lru_load = 1;

                if (hit0 == 1) begin
                    lru_input = 1;
                    if (mem_write == 1) begin
                        dirty_load0 = 1;
                        dirty_input0 = 1;
                        mem_byte_enable256_0 = mem_byte_enable256;
                    end
                end else if (hit1 == 1) begin
                    lru_input = 0; 
                    if (mem_write == 1) begin
                        dirty_load1 = 1;
                        dirty_input1 = 1;
                        mem_byte_enable256_1 = mem_byte_enable256;
                    end
                end

                mem_resp = 1;
            end
        end

        write_back: begin
            pmem_write = 1;
            pmem_addr_sel = 1;
        end

        allocate: begin
            pmem_read = 1;
            pmem_addr_sel = 0;

            if (lru_out == 1) begin
                valid_load1 = 1;
                way_select1 = 1;
                valid_input1 = 1;
                dirty_load1 = 1;
                dirty_input1 = 0; //since we are writing a new value
                tag_load1 = 1;
                mem_byte_enable256_1 = {32{1'b1}};
            end else begin
                valid_load0 = 1;
                way_select0 = 1;
                valid_input0 = 1;
                dirty_load0 = 1;
                dirty_input0 = 0; //since we are writing a new value
                tag_load0 = 1;
                mem_byte_enable256_0 = {32{1'b1}};
            end
        end

        default: ;
    endcase
end

always_comb begin : next_state_logic
    if(rst) begin
        next_state = idle; 
    end
    else begin
        next_state = state;

        case(state)
            idle: begin
                if(mem_read == 0 && mem_write == 0) begin
                    next_state = idle;
                end else begin
                    next_state = compare;
                end
            end

            compare: begin
                if(hit == 1) begin
                    next_state = idle;
                end else if (block_dirty == 1) begin
                    next_state = write_back;
                end else if (block_dirty == 0) begin
                    next_state = allocate;
                end
            end

            write_back: begin
                if(pmem_resp == 1) begin
                    next_state = allocate;
                end else begin
                    next_state = write_back;
                end
            end

            allocate: begin
                if(pmem_resp == 1) begin
                    next_state = compare;
                end else begin
                    next_state = allocate;
                end
            end
        endcase
    end
end

always_ff @(posedge clk) begin: next_state_assignment
    state <= next_state;
end

endmodule : cache_control
