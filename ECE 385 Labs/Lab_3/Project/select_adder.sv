module select_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);

    /* TODO
     *
     * Insert code here to implement a CSA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */
	  
		logic c1, c2, c3, c4, c5, c6, c7;
		logic [3:0] s1, s2, s3, s4, s5, s6, s7;
		logic t4, t8, t12;
		
		assign t8 = (t4 & c3) | c2;
		assign t12 = (c5 & t8) | c4;
		
		assign S[7:4] = (t4 == 0) ? s2 : s3;
		assign S[11:8] = (t8 == 0) ? s4 : s5;
		assign S[15:12] = (t12 == 0) ? s6 : s7;
	  
		FA4 FA4_CSA_0 (.A(A[3:0]), .B(B[3:0]), .c_in(cin), .S(S[3:0]), .c_out(t4));
		
		FA4 FA4_CSA_1_0 (.A(A[7:4]), .B(B[7:4]), .c_in(1'b0), .S(s2), .c_out(c2));
		FA4 FA4_CSA_1_1 (.A(A[7:4]), .B(B[7:4]), .c_in(1'b1), .S(s3), .c_out(c3));
		
		FA4 FA4_CSA_2_0 (.A(A[11:8]), .B(B[11:8]), .c_in(1'b0), .S(s4), .c_out(c4));
		FA4 FA4_CSA_2_1 (.A(A[11:8]), .B(B[11:8]), .c_in(1'b1), .S(s5), .c_out(c5));
		
		FA4 FA4_CSA_3_0 (.A(A[15:12]), .B(B[15:12]), .c_in(1'b0), .S(s6), .c_out(c6));
		FA4 FA4_CSA_3_1 (.A(A[15:12]), .B(B[15:12]), .c_in(1'b1), .S(s7), .c_out(c7));

		assign cout = (t12 & c7) | c6;

endmodule
