module control (input logic Clk, clearAX_LoadB, Run, M,
					  output logic shift_s, add_or_sub, clear_AX, load_B, load_AX);

    enum logic [2:0] {print, input_val, clear, working, add, sub, shift, hold}   curr_state, next_state; 

    always_ff @ (posedge Clk)  
    begin
        if (clearAX_LoadB)
            curr_state <= input_val;
        else 
            curr_state <= next_state;
    end
	 
	 logic shift_counter, reset_counter;
	 logic [2:0] count;
	 
	 counter counter(.clk(Clk), .shift(shift_counter), .reset(reset_counter), .count(count));

	always_comb
	
    begin
		  next_state  = curr_state;
        case (curr_state) 
		  
				print				 : if (Run)
											next_state = clear;
										else if (clearAX_LoadB)
											next_state = input_val;
				
				clear				 : next_state = working;
				
				input_val		 : if (~clearAX_LoadB)
											next_state = print;
				
				working			 : if (M == 1 & count != 3'b111)
											next_state = add;
										else if (M == 1 & count == 3'b111)
											next_state = sub;
										else if (M == 0)
											next_state = shift;
				
				add				 : next_state = shift;
				
				sub				 : next_state = shift;
				
				shift				 : if (count == 3'b000)
											next_state = hold;
										else 
											next_state = working;
				
				hold				 : if (Run == 0)
											next_state = print;
							  
        endcase

		 shift_counter = 0;
		 reset_counter = 0;
		 shift_s = 0;
		 add_or_sub = 0;
		 clear_AX = 0;
		 load_B = 0;
		 load_AX = 0;
	 
        case (curr_state) 
				input_val: 
	         begin
					 clear_AX = 1;
					 load_B = 1;
		      end
				
				clear: 
	         begin
					 reset_counter = 1;
					 clear_AX = 1;
		      end
				
				working: 
	         begin
					 shift_counter = 1;
		      end
				
				add: 
	         begin
					 load_AX = 1;
		      end
				
				sub: 
	         begin
					 add_or_sub = 1;
					 load_AX = 1;
		      end
				
				shift: 
	         begin
					 shift_s = 1;
		      end
        endcase
    end

endmodule