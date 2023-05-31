module SignDriver (input In0, output logic [7:0] Out0);
	
	always_comb begin
		Out0 = 8'b11111111;
		if(In0 == 1) begin
			Out0 = 8'b10111111;
		end
	end

endmodule