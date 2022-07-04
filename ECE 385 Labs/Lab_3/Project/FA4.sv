module FA4 (A, B, c_in, S, c_out);

	input [3:0] A, B;
	input c_in;
	
	output [3:0] S;
	output c_out;

	logic c1, c2, c3;
	
	FA FA0 (.A(A[0]), .B(B[0]), .c_in(c_in), .S(S[0]), .c_out(c1));
	FA FA1 (.A(A[1]), .B(B[1]), .c_in(c1), .S(S[1]), .c_out(c2));
	FA FA2 (.A(A[2]), .B(B[2]), .c_in(c2), .S(S[2]), .c_out(c3));
	FA FA3 (.A(A[3]), .B(B[3]), .c_in(c3), .S(S[3]), .c_out(c_out));

endmodule