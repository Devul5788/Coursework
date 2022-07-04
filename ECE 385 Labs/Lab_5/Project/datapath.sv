module datapath (
		input logic LD_MAR, 
						LD_MDR,
						LD_IR, 
						LD_BEN, 
						LD_CC, 
						LD_REG, 
						LD_PC, 
						LD_LED,

						GatePC,
						GateMDR,
						GateALU,
						GateMARMUX,

		input logic [1:0] PCMUX,
								ALUK,
		input logic DRMUX,
						SR1MUX,
						SR2MUX,
						ADDR1MUX,
		input logic [1:0] ADDR2MUX,
		input logic Mem_OE,
						Mem_WE,
						MIO_EN,
						Reset,
		input logic Clk,
		
		input logic [15:0] MDR_In, 
		
		output [15:0] IR,
						  MAR,
						  MDR,
						  
		output logic BEN
);

//Main wire
logic [15:0] BUS;

//internal wires
logic MIOEN;
logic [15:0] MDR_DATA_FROM_MUX, PC_DATA_FROM_MUX, PC_DATA, ADDER_A, ADDER_B, ADDER_OUT, SR1_OUT, SR2_OUT, ALUK_B, ALUK_OUT;
logic [2:0] DRMUX_OUT, SR1MUX_OUT;
logic [15:0] RF_OUT [8];
logic [7:0] LD_REG_ARR;
logic [2:0] NZP, NZP_OUT;

//Main registers
reg_16 PC_REG(.Clk(Clk), .Reset(Reset), .Load(LD_PC), .D(PC_DATA_FROM_MUX), .Data_Out(PC_DATA));
reg_16 MAR_REG(.Clk(Clk), .Reset(Reset), .Load(LD_MAR), .D(BUS), .Data_Out(MAR));
reg_16 MDR_REG(.Clk(Clk), .Reset(Reset), .Load(LD_MDR), .D(MDR_DATA_FROM_MUX), .Data_Out(MDR));
reg_16 IR_REG(.Clk(Clk), .Reset(Reset), .Load(LD_IR), .D(BUS), .Data_Out(IR));
reg_1 BEN_REG(.Clk(Clk), .Reset(Reset), .Load(LD_BEN), .D((IR[11] & NZP_OUT[2]) | (IR[10] & NZP_OUT[1]) | (IR[9] & NZP_OUT[0])), .Data_Out(BEN));
reg_3 NZP_REG(.Clk(Clk), .Reset(Reset), .Load(LD_CC), .D(NZP), .Data_Out(NZP_OUT));

//Register File
reg_16 RF_0(.Clk(Clk), .Reset(Reset), .Load(LD_REG_ARR[0]), .D(BUS), .Data_Out(RF_OUT[0]));
reg_16 RF_1(.Clk(Clk), .Reset(Reset), .Load(LD_REG_ARR[1]), .D(BUS), .Data_Out(RF_OUT[1]));
reg_16 RF_2(.Clk(Clk), .Reset(Reset), .Load(LD_REG_ARR[2]), .D(BUS), .Data_Out(RF_OUT[2]));
reg_16 RF_3(.Clk(Clk), .Reset(Reset), .Load(LD_REG_ARR[3]), .D(BUS), .Data_Out(RF_OUT[3]));
reg_16 RF_4(.Clk(Clk), .Reset(Reset), .Load(LD_REG_ARR[4]), .D(BUS), .Data_Out(RF_OUT[4]));
reg_16 RF_5(.Clk(Clk), .Reset(Reset), .Load(LD_REG_ARR[5]), .D(BUS), .Data_Out(RF_OUT[5]));
reg_16 RF_6(.Clk(Clk), .Reset(Reset), .Load(LD_REG_ARR[6]), .D(BUS), .Data_Out(RF_OUT[6]));
reg_16 RF_7(.Clk(Clk), .Reset(Reset), .Load(LD_REG_ARR[7]), .D(BUS), .Data_Out(RF_OUT[7]));

//Memory Unit
always_comb begin
	MDR_DATA_FROM_MUX = 16'b0;
	case (MIO_EN)
		1'b0 : begin
			MDR_DATA_FROM_MUX = BUS;
		end
		1'b1 : begin
			MDR_DATA_FROM_MUX = MDR_In;
		end
	endcase
end


//Register Unit
always_comb begin
//	DRMUX_OUT = 3'b0;
//	SR1MUX_OUT = 3'b0;
//	SR1_OUT = RF_OUT[SR1MUX_OUT];
//	SR2_OUT = RF_OUT[IR[2:0]];
//	LD_REG_ARR = 8'b0;
	
//	if(LD_REG == 1'b1) begin
//		LD_REG_ARR[DRMUX_OUT] = 1'b1;
//	end
//	
//	if (DRMUX == 1'b0) begin
//		DRMUX_OUT = IR[11:9];
//	end else if (DRMUX == 1'b1) begin
//		DRMUX_OUT = 3'b111;
//	end
//	
//	if (SR1MUX == 1'b0) begin
//		SR1MUX_OUT = IR[11:9];
//	end else if (SR1MUX == 1'b1) begin
//		SR1MUX_OUT = IR[8:6];
//	end

//	DRMUX_OUT = 3'b0;
//	SR1MUX_OUT = 3'b0;

	LD_REG_ARR = 8'b0;
	
//	if (DRMUX == 1'b0) begin
//		DRMUX_OUT = IR[11:9];
//	end else begin
//		DRMUX_OUT = 3'b111;
//	end

	DRMUX_OUT = IR[11:9];
	if (DRMUX == 1'b1) begin
		DRMUX_OUT = 3'b111;
	end
	
	if(LD_REG == 1'b1) begin
		LD_REG_ARR[DRMUX_OUT] = 1'b1;
	end
	
	if (SR1MUX == 1'b0) begin
		SR1MUX_OUT = IR[11:9];
	end else begin
		SR1MUX_OUT = IR[8:6];
	end
	
	SR1_OUT = RF_OUT[SR1MUX_OUT];
	SR2_OUT = RF_OUT[IR[2:0]];
	
end

//Gates
always_comb begin
	BUS = 16'bx;
	if (GateMDR == 1'b1) begin
		BUS = MDR;
	end else if (GatePC == 1'b1) begin
		BUS = PC_DATA;
	end else if (GateMARMUX == 1'b1) begin
		BUS = ADDER_OUT;
	end else if (GateALU == 1'b1) begin
		BUS = ALUK_OUT;
	end
end

//PCMUX
always_comb begin
PC_DATA_FROM_MUX= 16'b0;
	case (PCMUX)
		2'b00: begin
			PC_DATA_FROM_MUX = PC_DATA + 1;
		end
		2'b01: begin
			PC_DATA_FROM_MUX = BUS;
		end
		2'b10: begin
			PC_DATA_FROM_MUX = ADDER_OUT;
		end
	endcase
	
end

always_comb begin 
	
	ADDER_A = 16'b0;
	ADDER_B = 16'b0;
	//Address Muxes	
	case (ADDR1MUX)
		1'b0: begin
			ADDER_A = PC_DATA;
		end
		1'b1: begin
			ADDER_A = SR1_OUT;
		end
	endcase
	
	case (ADDR2MUX)
		2'b00: begin
			ADDER_B = 16'b0;
		end
		2'b01: begin
			ADDER_B = {{10{IR[5]}}, IR[5:0]};
		end
		2'b10: begin
			ADDER_B = {{7{IR[8]}}, IR[8:0]};
		end
		2'b11: begin
			ADDER_B = {{5{IR[10]}}, IR[10:0]};
		end
	endcase
	
	ADDER_OUT = ADDER_A + ADDER_B;
end

//ALUK Section
always_comb begin	
	ALUK_B = 2'b0;
	ALUK_OUT = 16'b0;
	NZP = 3'b000;
	case (SR2MUX)
		1'b0: begin
			ALUK_B = SR2_OUT;
		end
		1'b1: begin
			ALUK_B = {{11{IR[4]}}, IR[4:0]};
		end
	endcase
	
	case (ALUK)
		2'b00: begin
			ALUK_OUT = SR1_OUT + ALUK_B;
		end
		2'b01: begin
			ALUK_OUT = SR1_OUT & ALUK_B;
		end
		2'b10: begin
			ALUK_OUT = ~SR1_OUT;
		end
		2'b11: begin
			ALUK_OUT = SR1_OUT;
		end
	endcase
	
	if (BUS == 16'b0) begin
		NZP = 3'b010;
	end else if(BUS[15] == 1'b1) begin
		NZP = 3'b100;
	end else if(BUS[15] == 1'b0) begin
		NZP = 3'b001;
	end
end

endmodule