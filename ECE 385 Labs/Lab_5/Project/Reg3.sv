module reg_3 (input Clk, Reset, Load, input [2:0] D, output logic [2:0] Data_Out);		
	always_ff @ (posedge Clk or posedge Reset)
	begin
		if(Reset)
			Data_Out <= 3'b0;
		else if(Load)
			Data_Out <= D;
	end
endmodule 