module i2s_slave
(
		input  logic        FPGACLK, LRCLK, Reset,
		input  logic [31:0] writedata,
		output logic        writeRequest, rden, wren, en,
		output logic [31:0] readdata_L, readdata_R
);
	//=======================================================
	//   Instantiate On-Chip Memory FIFO
	//=======================================================

	// On-chip memory FIFO is dual-clocked such that samples can be fed in and fed out at
	// different rates, allowing for samples to be generated using the 50 MHz Clock while they
	// are read out at the sample rate for the audio codec (44.1 kHz)
	
	// internal declarations
	logic [31:0]	fifoDout = 32'b0; 
	logic [31:0]	fifoDin = 32'b0;
	logic 			i2sReq = 1'b0;
	logic				sampReq = 1'b1;
	logic 			i2sEmpty = 1'b1;
	logic				i2sFull = 1'b0;
	logic				sampEmpty = 1'b1;
	logic				sampFull = 1'b0;
	logic [7:0] 	i2sUsedw = 8'b0;
	logic [7:0]		sampUsedw = 8'b0; // depth of FIFO is 256;
	logic 			i2sHalfEmpty, sampHalfFull;
	logic          sampGenEnable;
	
	
	onChipFIFO onChipFIFO_inst
	(
			.aclr(Reset),
			.data(fifoDin),
			.rdclk(LRCLK),
			.rdreq(i2sReq),
			.wrclk(FPGACLK),
			.wrreq(sampReq),
			.q(fifoDout),
			.rdempty(i2sEmpty),
			.rdfull(i2sFull),
			.rdusedw(i2sUsedw),
			.wrempty(sampEmpty),
			.wrfull(sampFull),
			.wrusedw(sampUsedw) 
	);
	
	// determine sampleRequest logic
	always_ff @(posedge FPGACLK, posedge Reset) begin
		if (Reset)
			sampReq <= 1'b0;
		else begin
			if (sampGenEnable)
				sampReq <= ~sampReq;
			else begin
				if (sampFull)
					sampReq <= 1'b0;
			end
		end
	end

	// determine i2sReq logic
	logic [31:0] sampleOutR, sampleOutL;
	always @ (posedge LRCLK) begin
		if (i2sEmpty == 1'b0)  begin
			if (i2sReq == 1'b0)  begin
				i2sReq <= 1'b1;
				sampleOutR <= fifoDout;
				sampleOutL <= fifoDout;
			end
			else
				i2sReq <= 1'b0;
		end
	end
	
	// FIFO assignments
	assign sampHalfFull = ~sampUsedw[7];
	assign i2sHalfEmpty = ~i2sUsedw[7];
	assign sampGenEnable = (sampHalfFull | sampEmpty | i2sEmpty | i2sHalfEmpty) & (~i2sFull);
	assign en = sampGenEnable;
	assign writeRequest = sampReq;
	
	assign fifoDin = writedata;
	assign readdata_L = sampleOutL;
	assign readdata_R = sampleOutR;
	assign rden = ~i2sEmpty;
	assign wren = ~sampFull;
	
endmodule

