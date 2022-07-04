module FA_CLA (input A, B, c_in, output logic S, c_out, P, G);

	always_comb begin
		S = A ^ B ^ c_in;
		c_out = (A & B) | (B & c_in) | (A & c_in);
		P = A ^ B;
		G = A & B;
	end

endmodule