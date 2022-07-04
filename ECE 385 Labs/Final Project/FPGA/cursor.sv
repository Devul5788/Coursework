/*

	Module: cursor.sv
	Authors: Shubham & Devul

*/


module cursor( input Reset, frame_clk,
					input [7:0] keycode,
					input [31:0] mouseX,
					input [31:0] mouseY,
					input [7:0] mouseButton,
               output [9:0]  BallX, BallY, BallS );
    
    logic [9:0] Ball_Size;

    assign Ball_Size = 8;
   
	 assign BallX = mouseX;
	 assign BallY = mouseY;
    assign BallS = Ball_Size;
    

endmodule
