module adder9
(
	input  [8:0] A, B,
	input         cin,
	output [8:0] S,
	output        cout
);
		
	logic c1, c2, c3, c4, c5, c6, c7, c8;
		
	FA FA1 (.A(A[0]), .B(B[0]), .c_in(cin),.S(S[0]), .c_out(c1));
	FA FA2 (.A(A[1]), .B(B[1]), .c_in(c1), .S(S[1]), .c_out(c2));
	FA FA3 (.A(A[2]), .B(B[2]), .c_in(c2), .S(S[2]), .c_out(c3));
	FA FA4 (.A(A[3]), .B(B[3]), .c_in(c3), .S(S[3]), .c_out(c4));
	FA FA5 (.A(A[4]), .B(B[4]), .c_in(c4), .S(S[4]), .c_out(c5));
	FA FA6 (.A(A[5]), .B(B[5]), .c_in(c5), .S(S[5]), .c_out(c6));
	FA FA7 (.A(A[6]), .B(B[6]), .c_in(c6), .S(S[6]), .c_out(c7));
	FA FA8 (.A(A[7]), .B(B[7]), .c_in(c7), .S(S[7]), .c_out(c8));
	FA FA9 (.A(A[8]), .B(B[8]), .c_in(c8), .S(S[8]), .c_out(cout));
     
endmodule