module cacheline_adaptor
(
    input clk,
    input reset_n,

    // Port to LLC (Lowest Level Cache)
    input logic [255:0] line_i,
    output logic [255:0] line_o,
    input logic [31:0] address_i,
    input read_i,
    input write_i,
    output logic resp_o,

    // Port to memory
    input logic [63:0] burst_i,
    output logic [63:0] burst_o,
    output logic [31:0] address_o,
    output logic read_o,
    output logic write_o,
    input resp_i
);

	logic read_flag;
	logic write_flag;

    enum int unsigned {
        dword_1_r_1_w    = 0,
        dword_2_r_2_w    = 1,
        dword_3_r_3_w    = 2,
        dword_4_r_done_w = 3,
        reset_signals    = 4
    } state;

    // The line burst_o <= line_i[63:0] is placed inside the if condition for write requests 
    // because it only makes sense to transmit data to the memory if there is actually a write request. 
    // The rest of the data will be transmitted in subsequent states in the state machine.

    // It cannot be added in state 0 when writing data because in state 0, the design is waiting for a response
    // from the memory indicating that it is ready to receive the next burst of data. Only after receiving the 
    // response will the design transmit the next burst of data.
	
	always_ff @(posedge clk) begin
		if(reset_n <= 1'b0) begin
			state <= dword_1_r_1_w;
			read_flag <= 1'b0;
			write_flag <= 1'b0;
			read_o <= 1'b0;
			write_o <= 1'b0;
		end
		else if(read_i == 1'b1 && read_flag == 1'b0) begin
			read_flag <= 1'b1;
			read_o <= 1'b1;
			write_o <= 1'b0;
			address_o <= address_i;
			state <= dword_1_r_1_w;
		end
		else if(write_i == 1'b1 && write_flag == 1'b0) begin
			write_flag <= 1'b1;
			read_o <= 1'b0;
			write_o <= 1'b1;
			address_o <= address_i;
			state <= dword_1_r_1_w;
			burst_o <= line_i[63:0];
		end
		
        case(state)
            dword_1_r_1_w: begin
                if(resp_i == 1'b1 && read_flag == 1'b1) begin
                    line_o [63:0] <= burst_i;
                    state <= dword_2_r_2_w;
                end
                else if (write_flag == 1'b1 && resp_i == 1'b1) begin
                    burst_o <= line_i [127:64];
                    state <= dword_2_r_2_w;
                end
            end
            dword_2_r_2_w: begin
                if(resp_i == 1'b1 && read_flag == 1'b1) begin
                    line_o [127:64] <= burst_i;
                    state <= dword_3_r_3_w;
                end
                else if (write_flag == 1'b1 && resp_i == 1'b1) begin
                    burst_o <= line_i [191:128];
                    state <= dword_3_r_3_w;
                end 
            end
            dword_3_r_3_w: begin
                if(resp_i == 1'b1 && read_flag == 1'b1) begin
                    line_o [191:128] <= burst_i;
                    state <= dword_4_r_done_w;
                end
                else if (write_flag == 1'b1 && resp_i == 1'b1) begin
                    burst_o <= line_i [255:192];
                    state <= dword_4_r_done_w;
                end
            end
            dword_4_r_done_w: begin					
                if(resp_i == 1'b1 && read_flag == 1'b1) begin
                    line_o [255:192] <= burst_i;
                    resp_o <= 1'b1;
                    state <= reset_signals;
                end
                else if (write_flag == 1'b1 && resp_i == 1'b1) begin
                    resp_o <= 1'b1;
                    state <= reset_signals;
                end
            end
            reset_signals: begin
                if (read_flag == 1'b1) begin
                    resp_o <= 1'b0;
                    read_o <= 1'b0;
                    read_flag <= 1'b0;
                    state <= dword_1_r_1_w;
                end
                else if (write_flag == 1'b1) begin
                    resp_o <= 1'b0;
					write_o <= 1'b0;
					write_flag <= 1'b0;
					state <= dword_1_r_1_w;
                end
            end
        endcase
	end
endmodule : cacheline_adaptor