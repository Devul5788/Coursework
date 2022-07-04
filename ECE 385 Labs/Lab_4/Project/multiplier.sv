module multiplier (
	input logic [7:0] SW,
	input logic Clk, Reset_Load_Clear, Run,
	output logic [6:0] HEX0, HEX1, HEX2, HEX3,
	output logic [7:0] Aval, Bval,
	output logic Xval);

	logic shift_s, add_or_sub, clear_AX, load_B, load_AX;
	logic Reset_H, Run_H;
	logic [7:0] A, B;
	logic [8:0] sum9;
	logic X, a_out;
	
	sync button_sync[1:0](.Clk(Clk), .d({~Reset_Load_Clear, ~Run}), .q({Reset_H, Run_H}));
	
	control Controller (.Clk(Clk), .clearAX_LoadB(Reset_H), .Run(Run_H), .M(B[0]), .shift_s(shift_s), .add_or_sub(add_or_sub), .clear_AX(clear_AX), .load_B(load_B), .load_AX(load_AX));
	
	reg8 RegA(.Clk(Clk), .Reset(clear_AX), .Shift_In(X), .Load(load_AX), .Shift_En(shift_s), .D(sum9[7:0]), .Shift_Out(a_out), .Data_Out(A));
	reg8 RegB(.Clk(Clk), .Reset(0), .Shift_In(a_out), .Load(load_B), .Shift_En(shift_s), .D(SW[7:0]), .Shift_Out(), .Data_Out(B));
	
	logic [7:0] SW_new;
	logic c_in;
	
	always_comb 
	begin
		if (add_or_sub == 1) begin
			SW_new = ~SW;
			c_in = 1;
		end else begin 
			SW_new = SW;
			c_in = 0;
		end
	
	end
	
	adder9 adder(.A({SW_new[7], SW_new[7:0]}), .B({A[7], A[7:0]}), .cin(c_in), .S(sum9));
	
	always_ff @ (posedge Clk) begin
		if (clear_AX == 1)
			X <= 1'b0;
		else if (load_AX)
			X <= sum9[8];
	end
	
	assign Aval = A;
	assign Bval = B;
	assign Xval = X;		
	
	HexDriver AhexL(.In0(B[3:0]), .Out0(HEX0));
	HexDriver AhexU(.In0(B[7:4]), .Out0(HEX1));
	HexDriver BhexL(.In0(A[3:0]), .Out0(HEX2));
	HexDriver BhexU(.In0(A[7:4]), .Out0(HEX3));
	
endmodule
	
