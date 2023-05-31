/*
	Module: canvas.sv
	Authors: Shubham & Devul

*/


module  canvas( input         [9:0] BallX, BallY, DrawX, DrawY, Ball_size,
				    input 			[7:0] mouseButton,
				    input 					blank, pixel_clk, clk, 
				    output logic  [7:0] Red, Green, Blue,
					 input 			[18:0] addressFromPi, 
					 output 					dataToPi, restartToPi, charDoneToPi, solveToPi,
					 input         [9:0] SW,
					 output        [9:0] LEDR,
					 input			answerReadyFromPi
				  );
    
    logic cursor_on, freezeCursor;
	 
    int DistX, DistY, Size;
	 assign DistX = DrawX - BallX;
    assign DistY = DrawY - BallY;
    assign Size = Ball_size;
	 
	 assign charDoneToPi = SW[0];
	 assign solveToPi = SW[1];
	 assign restartToPi = SW[2];
	  
    always_comb
    begin:cursor_on_proc
        if ( ( DistX*DistX + DistY*DistY) <= (Size * Size) && freezeCursor == 0) 
            cursor_on = 1'b1;
        else 
            cursor_on = 1'b0;
    end 
		 
	 logic [18:0] addrA, addrB;
	 logic writeEnA, outputA, outputB, setDataA;
	 
	 assign addrA = DrawX + (DrawY * 640);
	 
	 assign addrB = addressFromPi;
	 assign dataToPi = outputB;
	 assign LEDR = SW;
	 
	 always_comb begin
		freezeCursor = 0;
		if((charDoneToPi == 1 || answerReadyFromPi == 0) && solveToPi == 0 && addressFromPi != 19'h00000) begin
			freezeCursor = 1;
		end
	 end
	
	 VRAM myVRAM (
		.address_a(addrA), // addra - for reading and writing to the white board
		.address_b(addrB), // addrb - for Pi to read data
		.clock(clk),
		.data_a(setDataA),
		.data_b(0),
		.wren_a(writeEnA),
		.wren_b(0),
		.q_a(outputA),
		.q_b(outputB)
	 );
	 
/* ONLY MARKER AND RESET AND ERASER */	
	 
	 // mouseButton = 1 -> Marker
	 // mouseButton = 2 -> Reset
	 // mouseButton = 4 -> Eraser
	 
	 always_comb begin
		if(mouseButton == 2 || restartToPi == 1 || answerReadyFromPi == 1) begin
			writeEnA = 1;
			setDataA = 0;		
		end else begin
			if(mouseButton == 1 && cursor_on == 1 && DrawX < 640 && DrawY < 480 && DrawX >= 0 && DrawY >= 0) begin
				writeEnA = 1;
				setDataA = 1;
			end else if(mouseButton == 4 && cursor_on == 1) begin
				writeEnA = 1;
				setDataA = 0;
			end else begin
				writeEnA = 0;
				setDataA = 0;
			end
		end
	 end
	 	
	 always_ff @ (posedge pixel_clk) begin
		if(blank == 0) begin
			// BLANKING
			Red = 8'h00; 
			Green = 8'h00;
			Blue = 8'h00;
		end else begin
			// NON BLANKING
			if (cursor_on == 1'b1) begin 
				// drawing cursor
				Red = 8'hff;
				Green = 8'h00;
				Blue = 8'h00;
			end else if (cursor_on == 1'b0) begin 
				//drawing background from memory
				if(outputA == 0) begin
					Red = 8'hff; 
					Green = 8'hff;
					Blue = 8'hff;
				end else begin
					Red = 8'h00; 
					Green = 8'h00;
					Blue = 8'h00;
				end
			end 
		end
	end

endmodule
