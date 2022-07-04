module counter (
	input logic clk, shift, reset,
	output logic [2:0] count
);

	// logic [2:0] temp;
	
	always_ff @ (posedge clk) begin
	
		if(shift) begin
			count <= count + 1;
		end else if (reset) begin
			count <= 0;
		end
		
	end
	
	// assign count[2:0] = temp[2:0];

endmodule