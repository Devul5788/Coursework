module test_bench_1();

timeunit 10ns;

timeprecision 1ns;

logic [9:0] SW;
logic	Clk, Run, Continue;
logic [9:0] LED;
logic [6:0] HEX0, HEX1, HEX2, HEX3;
logic [15:0] PC_sim, IR_sim, MDR_sim, MAR_sim;

//logic [15:0] R0_val, R1_val,R2_val, R3_val,cpu_bus_sim;


slc3_testtop topTest(.*);
assign PC_sim = topTest.slc.d0.PC_DATA;
assign MDR_sim = topTest.slc.d0.MDR;
assign MAR_sim = topTest.slc.d0.MAR;
assign IR_sim = topTest.slc.d0.IR;


always begin : CLOCK_GENERATION

#1 Clk = ~Clk;

end

initial begin : CLOCK_INITIALIZATION

Clk = 0;

end

initial begin : TEST_VECTOR
SW = 10'b0;
Run = 0;
Continue = 0;

#6 Run = 1;
	 Continue = 1;

#2 Run = 0;
#2 Run = 1;
	
#2 Continue = 0;
#2 Continue = 1;
	
#20 Continue = 0;
#2 Continue = 1;

#20 Continue = 0;
#2 Continue = 1;

#20 Continue = 0;
#2 Continue = 1;

#6 Run = 1;
	 Continue = 1;
	 
/*0
#2  Run = 0;
    Continue = 0;
#2  Run = 1;
#2 Continue = 1;
#4 Run = 0;
#2 Run = 1;
#70 SW = 10'b0001101101;
#10 Continue = 0;
	 
#2 Continue = 1;
#10 Continue = 0;
	 
#2 Continue = 1;
#40 SW = 10'b000001001;
#10 Continue = 0;
	 
#2 Continue = 1;
*/

/// MEM2IO test 3

/*
// normal test
#2  Run = 0;
    Continue = 0;
#2  Continue = 1;
	 
#4 Run = 1;
	 
#10 Continue = 0;
	 
#2 Continue = 1;
 
#10 Continue = 0;
	 
#2 Continue = 1;
#10 Continue = 0;
	 
#2 Continue = 1;
#10 Continue = 0;
	 
#2 Continue = 1;
#10 Continue = 0;
	 
#2 Continue = 1;
#10 Continue = 0;
	 
#2 Continue = 1;
#10 Continue = 0;
	 
#2 Continue = 1;
*/	 
end

endmodule 