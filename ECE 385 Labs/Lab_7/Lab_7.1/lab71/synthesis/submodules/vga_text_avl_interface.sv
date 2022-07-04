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
	input  logic [9:0] AVL_ADDR,			// Avalon-MM Address
	input  logic [31:0] AVL_WRITEDATA,	// Avalon-MM Write Data
	output logic [31:0] AVL_READDATA,	// Avalon-MM Read Data
	
	// Exported Conduit (mapped to VGA port - make sure you export in Platform Designer)
	output logic [3:0]  red, green, blue,	// VGA color channels (mapped to output pins in top-level)
	output logic hs, vs						   // VGA HS/VS
);

logic [31:0] LOCAL_REG [`NUM_REGS]; // Registers

//put other local variables here
logic [7:0] ROW_PIXELS;
logic [9:0] drawxsig, drawysig;
logic blank, sync, VGA_Clk;

logic [11:0] foreground, background;

assign foreground = LOCAL_REG[`CTRL_REG][24:13];
assign background = LOCAL_REG[`CTRL_REG][12:1];

vga_controller myVGA (.Clk(CLK),           // 50 MHz clock
							 .Reset(RESET),     	 // reset signal
							 .hs(hs),        	    // Horizontal sync pulse.  Active low
							 .vs(vs),        	    // Vertical sync pulse.  Active low
							 .pixel_clk(VGA_Clk), 	 // 25 MHz pixel clock output
							 .blank(blank),     		 // Blanking interval indicator.  Active low.
							 .sync(sync),     		 // Composite Sync signal.  Active low.  We don't use it in this lab,
															 // but the video DAC on the DE2 board requires an input for it.
							 .DrawX(drawxsig),     	 // horizontal coordinate
							 .DrawY(drawysig));   	 // vertical coordinate
							 
font_rom myFontRom(.addr(AVL_ADDR), .data(relevant_char));

   
// Read and write from AVL interface to register block, note that READ waitstate = 1, so this should be in always_ff
always_ff @(posedge CLK) begin
	if(AVL_CS) begin
		if(AVL_WRITE) begin
			case (AVL_BYTE_EN)
				4'b1111 : LOCAL_REG[AVL_ADDR] <= AVL_WRITEDATA;
				4'b1100 : LOCAL_REG[AVL_ADDR][31:16] <= AVL_WRITEDATA[31:16];
				4'b0011 : LOCAL_REG[AVL_ADDR][15:0] <= AVL_WRITEDATA[15:0];
				4'b1000 : LOCAL_REG[AVL_ADDR][31:24] <= AVL_WRITEDATA[31:24];
				4'b0100 : LOCAL_REG[AVL_ADDR][23:16] <= AVL_WRITEDATA[23:16];
				4'b0010 : LOCAL_REG[AVL_ADDR][15:8] <= AVL_WRITEDATA[15:8];
				4'b0001 : LOCAL_REG[AVL_ADDR][7:0] <= AVL_WRITEDATA[7:0];
			endcase
		end
		else if(AVL_READ) begin
			AVL_READDATA <= LOCAL_REG[AVL_ADDR];
		end
	end
end

//Local vars
logic [9:0] base_addr_of_reg_VRAM;
logic [1:0] base_addr_of_reg_section_VRAM;
logic [11:0] temp;

logic [6:0] gylf_base_addr;
logic [3:0] gylf_row;
logic [10:0] gylf_final_addr;
logic [7:0] gylf_data;
logic [2:0] cur_col;
logic [1:0] char_num;
logic invert_bit;

font_rom myROM (.addr(gylf_final_addr), .data(gylf_data));

always_comb begin
	temp = (drawysig[9:4] * 80) + drawxsig[9:3]; // = ((Y/16) * 80) + (X/8)
	gylf_row = drawysig[3:0]; // = Y % 16
	cur_col = drawxsig[2:0];  // = X % 8
	base_addr_of_reg_VRAM = temp[11:2]; // = temp / 4
	char_num = temp[1:0]; // = temp % 4
	
	gylf_final_addr = {gylf_base_addr, gylf_row};
	
	case(char_num)
		2'b00 : begin 
			gylf_base_addr = LOCAL_REG[base_addr_of_reg_VRAM][6:0];
			invert_bit = LOCAL_REG[base_addr_of_reg_VRAM][7];
		end
		
		2'b01 : begin
			gylf_base_addr = LOCAL_REG[base_addr_of_reg_VRAM][14:8];
			invert_bit = LOCAL_REG[base_addr_of_reg_VRAM][15];		
		end
		
		2'b10 : begin
			gylf_base_addr = LOCAL_REG[base_addr_of_reg_VRAM][22:16];
			invert_bit = LOCAL_REG[base_addr_of_reg_VRAM][23];
		end
		
		2'b11 : begin
			gylf_base_addr = LOCAL_REG[base_addr_of_reg_VRAM][30:24];
			invert_bit = LOCAL_REG[base_addr_of_reg_VRAM][31];
		end
	endcase
end
	
always_ff @ (posedge VGA_Clk) begin
	if (blank == 1) begin
		if((invert_bit ^ gylf_data[7 - cur_col]) == 0) begin
				red = background[11:8];
				green = background[7:4];
				blue = background[3:0];
		end else begin
				red = foreground[11:8];
				green = foreground[7:4];
				blue = foreground[3:0];
		end
	end else begin
		red = 0;
		green = 0;
		blue = 0;
	end
end

//handle drawing (may either be combinational or sequential - or both).

endmodule