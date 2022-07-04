/*Avalon-MM Interface VGA Text mode display

Register Map:
0x000-0x0257 : VRAM, 80x30 (2400 byte, 600 word) raster order (first column then row)
0x258        : control register

VRAM Format:
X->
[ 31  30-24][ 23  22-16][ 15  14-8 ][ 7    6-0 ]
[IV3][CODE3][IV2][CODE2][IV1][CODE1][IV0][CODE0]

IVn = Draw inverse glyph
CODEn = Glyph code from IBM codepage 437

Control Register Format:
[[31-25][24-21][20-17][16-13][ 12-9][ 8-5 ][ 4-1 ][   0    ] 
[[RSVD ][FGD_R][FGD_G][FGD_B][BKG_R][BKG_G][BKG_B][RESERVED]

VSYNC signal = bit which flips on every Vsync (time for new frame), used to synchronize software
BKG_R/G/B = Background color, flipped with foreground when IVn bit is set
FGD_R/G/B = Foreground color, flipped with background when Inv bit is set

************************************************************************/

`define NUM_REGS 601 //80*30 characters / 4 characters per register
`define CTRL_REG 600 //index of control register

module vga_text_avl_interface (
	// Avalon Clock Input, note this clock is also used for VGA, so this must be 50Mhz
	// We can put a clock divider here in the future to make this IP more generalizable
	input logic CLK,
	
	// Avalon Reset Input
	input logic RESET,
	
	// Avalon-MM Slave Signals
	input  logic AVL_READ,					// Avalon-MM Read
	input  logic AVL_WRITE,					// Avalon-MM Write
	input  logic AVL_CS,					   // Avalon-MM Chip Select
	input  logic [3:0] AVL_BYTE_EN,	   // Avalon-MM Byte Enable
	input  logic [11:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						   // VGA HS/VS
);


VRAM myVRAM (
	.address_a(AVL_ADDR),
	.address_b(base_addr_of_reg_VRAM),
	.byteena_a(AVL_BYTE_EN),
	.clock(CLK),
	.data_a(AVL_WRITEDATA),
	.data_b(),
	.wren_a(AVL_WRITE & AVL_CS & ~AVL_ADDR[11]),
	.wren_b(1'b0),
	.q_a(temp_read),
	.q_b(Read_Data_For_VGA)
);

logic [31:0] myColors [8]; //palette :)

//put other local variables here
logic [9:0] drawxsig, drawysig;
logic blank, sync, VGA_Clk;
logic [31:0] Read_Data_For_VGA;
logic [3:0] foreground_idx, background_idx;

logic [31:0] temp_read;

//assign foreground = LOCAL_REG[`CTRL_REG][24:13];
//assign background = LOCAL_REG[`CTRL_REG][12:1];

vga_controller myVGA (.Clk(CLK),           	 // 50 MHz clock
							 .Reset(RESET),     	 	 // reset signal
							 .hs(hs),        	    	 // Horizontal sync pulse.  Active low
							 .vs(vs),        	    	 // Vertical sync pulse.  Active low
							 .pixel_clk(VGA_Clk), 	 // 25 MHz pixel clock output
							 .blank(blank),     		 // Blanking interval indicator.  Active low.
							 .sync(sync),     		 // Composite Sync signal.  Active low.  We don't use it in this lab,
															 // but the video DAC on the DE2 board requires an input for it.
							 .DrawX(drawxsig),     	 // horizontal coordinate
							 .DrawY(drawysig));   	 // vertical coordinate
							 
font_rom myFontRom(.addr(AVL_ADDR), .data(relevant_char));

//Local vars
logic [11:0] base_addr_of_reg_VRAM;
logic [11:0] temp;
logic [6:0] gylf_base_addr;
logic [3:0] gylf_row;
logic [10:0] gylf_final_addr;
logic [7:0] gylf_data;
logic [2:0] cur_col;
logic char_num;
logic invert_bit;

logic [2:0] color_row_b, color_row_f;
logic color_col_b, color_col_f;

font_rom myROM (.addr(gylf_final_addr), .data(gylf_data));

always_ff @(posedge CLK) begin
	if(AVL_CS) begin
		if(AVL_WRITE & AVL_ADDR[11]) begin
			myColors[AVL_ADDR[2:0]] <= AVL_WRITEDATA;
		end else if(AVL_READ & AVL_ADDR[11]) begin
			AVL_READDATA <= myColors[AVL_ADDR[2:0]];
		end else if(AVL_READ & AVL_ADDR[11] == 0) begin
			AVL_READDATA <= temp_read;
		end
	end
end

always_comb begin
	temp = (drawysig[9:4] * 80) + drawxsig[9:3]; // = ((Y/16) * 80) + (X/8)
	gylf_row = drawysig[3:0]; // = Y % 16
	cur_col = drawxsig[2:0];  // = X % 8
	base_addr_of_reg_VRAM = temp[11:1]; // = temp / 2
	char_num = temp[0]; // = temp % 2
	
	gylf_final_addr = {gylf_base_addr, gylf_row};
	
	case(char_num)
		1'b0 : begin 
			background_idx = Read_Data_For_VGA[3:0];
			foreground_idx = Read_Data_For_VGA[7:4];
			gylf_base_addr = Read_Data_For_VGA[14:8];
			invert_bit = Read_Data_For_VGA[15];
		end
		
		1'b1 : begin
			background_idx = Read_Data_For_VGA[19:16];
			foreground_idx = Read_Data_For_VGA[23:20];
			gylf_base_addr = Read_Data_For_VGA[30:24];
			invert_bit = Read_Data_For_VGA[31];		
		end
	endcase
end

always_comb begin
	color_row_b = background_idx[3:1];
	color_row_f = foreground_idx[3:1];
	color_col_b = background_idx[0];
	color_col_f = foreground_idx[0];
end

logic [11:0] background_color, foreground_color;

always_comb begin
	case(color_col_b)
		1'b0: background_color = myColors[color_row_b][12:1];
		1'b1: background_color = myColors[color_row_b][24:13];
	endcase
	
	case(color_col_f)
		1'b0: foreground_color = myColors[color_row_f][12:1];
		1'b1: foreground_color = myColors[color_row_f][24:13];
	endcase
end
	
always_ff @ (posedge VGA_Clk) begin
	if (blank == 1) begin
		if((invert_bit ^ gylf_data[7 - cur_col]) == 0) begin
				red = background_color[11:8];
				green = background_color[7:4];
				blue = background_color[3:0];
		end else begin
				red = foreground_color[11:8];
				green = foreground_color[7:4];
				blue = foreground_color[3:0];
		end
	end else begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

endmodule 