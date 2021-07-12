module i2s_core
#(
		parameter DW = 32
)
(
		input  logic          SCLK, LRCLK, Reset, write,
		input  logic [DW-1:0] writedata,
		output logic          streamout
);

	// declarations
	logic prevLRCLK = 1'b0;
	logic shiftLChannel, loadR, loadL, shiftRChannel;
	logic shiftOutL, shiftOutR;
	logic [1:0] actionState;
	
	reg   [DW-1:0] dInRegL, dInRegR;
	reg   dOutReg;
	
	
	// Shift registers to shift out individual bits of each sample at the rate of SCLK = 64*LRCLK
	shiftreg_N #(DW)  shiftregL(
			.Clk(SCLK),
			.Reset(Reset),
			.Enable(write),
			.Shift_In(1'b0),
			.Load(loadL),
			.Shift_En(shiftLChannel),
			.D(dInRegL),
			.Shift_Out(shiftOutL),
			.Data_Out());
													  
	shiftreg_N #(DW) shiftregR(
			.Clk(SCLK),
			.Reset(Reset),
			.Enable(write),
			.Shift_In(1'b0),
			.Load(loadR),
			.Shift_En(shiftRChannel),
			.D(dInRegR),
			.Shift_Out(shiftOutR),
			.Data_Out());
													  

	// State machine to determine shift-register behavior
	always_ff @ (posedge SCLK) 
	begin
		actionState <= {prevLRCLK,LRCLK};
		prevLRCLK <= LRCLK;
	end

	always_comb 
	begin
		case (actionState)
			// LRCLK = prevLRCLK = 1'b0 <=> no clock transition, left channel
			2'b00 :
			begin
				shiftLChannel = 1'b1;
				loadL = 1'b0;
				loadR = 1'b0;
				shiftRChannel = 1'b0;
				dInRegR = 32'h0;
				dInRegL = writedata;
				dOutReg = shiftOutL;
			end
			2'b01 :
			begin
				shiftLChannel = 1'b0;
				loadL = 1'b0;
				loadR = 1'b1;
				shiftRChannel = 1'b0;
				dInRegR = writedata;
				dInRegL = 32'h0;
				dOutReg = shiftOutR;
			end
			2'b10 :
			begin
				shiftLChannel = 1'b0;
				loadL = 1'b1;
				loadR = 1'b0;
				shiftRChannel = 1'b0;
				dInRegR = 32'h0;
				dInRegL = writedata;
				dOutReg = shiftOutL;
			end
			2'b11 :
			begin
				shiftLChannel = 1'b0;
				loadL = 1'b0;
				loadR = 1'b0;
				shiftRChannel = 1'b1;
				dInRegR = writedata;
				dInRegL = 32'h0;
				dOutReg = shiftOutR;
			end
			default :
				begin
				shiftLChannel = 1'b0;
				loadL = 1'b0;
				loadR = 1'b0;
				shiftRChannel = 1'b0;
				dInRegR = 32'h0;
				dInRegL = 32'h0;
				dOutReg = shiftOutR;
				end
		endcase
	end
	
	assign streamout = dOutReg;
	//assign dInRegL = writedata;
	//assign dInRegR = writedata;
endmodule
