module lookahead_adder (
	input  [15:0] A, B,
	input         cin,
	output [15:0] S,
	output        cout
);
    /* TODO
     *
     * Insert code here to implement a CLA adder.
     * Your code should be completly combinational (don't use always_ff or always_latch).
     * Feel free to create sub-modules or other files. */

	logic c4, c8, c12;
	logic Pg0, Pg4, Pg8, Pg12;
	logic Gg0, Gg4, Gg8, Gg12;
	
	FA4_CLA FA4_0(.A(A[3:0]), .B(B[3:0]), .c_in(c_in), .S(S[3:0]), .Pg(Pg0), .Gg(Gg0));
	assign c4 = (c_in & Pg0) | Gg0;
	
	FA4_CLA FA4_1(.A(A[7:4]), .B(B[7:4]), .c_in(c4), .S(S[7:4]), .Pg(Pg4), .Gg(Gg4));
	assign c8 = (c_in & Pg0 & Pg4) | (Gg0 & Pg4) | Gg4;
	
	FA4_CLA FA4_2(.A(A[11:8]), .B(B[11:8]), .c_in(c8), .S(S[11:8]), .Pg(Pg8), .Gg(Gg8));
	assign c12 = (c_in & Pg0 & Pg4 & Pg8) | (Gg0 & Pg4 & Pg8) | (Gg4 & Pg8) | Gg8;
	
	FA4_CLA FA4_3(.A(A[15:12]), .B(B[15:12]), .c_in(c12), .S(S[15:12]), .Pg(Pg12), .Gg(Gg12));
	assign cout = (c_in & Pg0 & Pg4 & Pg8 & Pg12) | (Gg0 & Pg4 & Pg8 & Pg12) | (Gg4 & Pg8 & Pg12) | (Gg8 & Pg12) | Gg12;

endmodule
