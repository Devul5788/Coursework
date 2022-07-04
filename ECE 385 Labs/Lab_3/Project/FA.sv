module FA (input A, B, c_in, output logic S, c_out);

	always_comb begin
		S = A ^ B ^ c_in;
		c_out = (A & B) | (B & c_in) | (A & c_in);
	end

endmodule