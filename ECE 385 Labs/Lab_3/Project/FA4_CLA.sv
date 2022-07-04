module FA4_CLA (A, B, c_in, S, c_out, Pg, Gg);

	input [3:0] A, B;
	input c_in;
	
	output [3:0] S;
	output c_out;
	output Pg, Gg;

	logic c1, c2, c3;
	logic p0, p1, p2, p3;
	logic g0, g1, g2, g3;
	
	FA_CLA FA_0(.A(A[0]), .B(B[0]), .c_in(c_in), .S(S[0]), .P(p0), .G(g0));
	assign c1 = (c_in & p0) | g0;
	
	FA_CLA FA_1(.A(A[1]), .B(B[1]), .c_in(c1), .S(S[1]), .P(p1), .G(g1));
	assign c2 = (c_in & p0 & p1) | (g0 & p1) | g1;
	
	FA_CLA FA_2(.A(A[2]), .B(B[2]), .c_in(c2), .S(S[2]), .P(p2), .G(g2));
	assign c3 = (c_in & p0 & p1 & p2) | (g0 & p1 & p2) | (g1 & p2) | g2;
	
	FA_CLA FA_3(.A(A[3]), .B(B[3]), .c_in(c3), .S(S[3]), .P(p3), .G(g3));
	assign c_out = (c_in & p0 & p1 & p2 & p3) | (g0 & p1 & p2 & p3) | (g1 & p2 & p3) | (g2 & p3) | g3;
	
	assign Pg = p0 & p1 & p2 & p3;
	assign Gg = g3 | (g2 & p3) | (g1 & p3 & p2) | (g0 & p3 & p2 & p1);
		
	
endmodule