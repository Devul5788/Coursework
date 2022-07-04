module testbench();

timeunit 10ns;

timeprecision 1ns;

logic [7:0] SW;
logic Clk, Reset_Load_Clear, Run;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [7:0] Aval, Bval;
logic Xval;


multiplier test_mult (.*);

//logic shift;
//assign shift = test_mult.shift_s;
//
//logic [4:0] state;
//assign state = test_mult.Controller.curr_state;

always begin : CLOCK_GENERATION
	#1 Clk = ~Clk;
end

initial begin : CLOCK_INITIALIZATION
	Clk = 0;
end

initial begin: TEST_VECTORS
	Reset_Load_Clear = 1;
	Run = 1;
	SW = 8'b0000_0010;
	
	#2 Reset_Load_Clear = 0;
	
	#2 Reset_Load_Clear = 1;
	
	#4 SW = 8'b0000_0010;
	
	#2 Run = 0;
	
end

endmodule 