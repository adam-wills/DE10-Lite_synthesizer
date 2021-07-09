module sawTables
(
		input  logic        Clk, readEn,
		input  logic [7:0]  octave,
		input  logic [11:0] sampAddrA,
		output logic [15:0] interpOuts[2],
		output logic [15:0] antiInterpOuts[2]
);							 

	//internal signal delcarations
	reg   [15:0] sawOutputsInterp0[8];
	reg   [15:0] sawOutputsAntiInterp0[8];
	reg   [15:0] interpBank[2];
	reg   [15:0] antiInterpBank[2];

	logic [11:0] sampAddrB;
	assign sampAddrB = sampAddrA+12'h001;
	assign interpOuts = interpBank;
	assign antiInterpOuts = interpBank;


	// Sawtooth-wave ROM: 8 banks (corresponding to 8 playable octaves) with
	// 4192 samples each. 0th bank (corresponding to the highest playable octave) is
	// simply a sinewave, while the 1st bank contains a sum of 2 sinewaves whose amplitudes
	// correspond to the fourier series decomposition of the sawtooth wave; 2nd bank
	// contains a sum of 4 sinewaves, 3rd bank 8...
	sawRom4096_0	sawRom4096_0inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawOutputsInterp0[0]),
		.q_b (sawOutputsAntiInterp0[0])
	);
								 
	sawRom4096_1	sawRom4096_1inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawOutputsInterp0[1]),
		.q_b (sawOutputsAntiInterp0[1])
	);
												
	sawRom4096_2	sawRom4096_2inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawOutputsInterp0[2]),
		.q_b (sawOutputsAntiInterp0[2])
	);
												
	sawRom4096_3	sawRom4096_3inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawOutputsInterp0[3]),
		.q_b (sawOutputsAntiInterp0[3])
	);
												
	sawRom4096_4	sawRom4096_4inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawOutputsInterp0[4]),
		.q_b (sawOutputsAntiInterp0[4])
	);
								 
	sawRom4096_5	sawRom4096_5inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawOutputsInterp0[5]),
		.q_b (sawOutputsAntiInterp0[5])
	);
												
	sawRom4096_6	sawRom4096_6inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawOutputsInterp0[6]),
		.q_b (sawOutputsAntiInterp0[6])
	);
												
	sawRom4096_7	sawRom4096_7inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawOutputsInterp0[7]),
		.q_b (sawOutputsAntiInterp0[7])
	);
								 
	mux_oneHot sawMuxInterp 
	(
		.oneHot(octave),
		.dataIn(sawOutputsInterp0),
		.dataOut(interpBank[0])
	);
									
	mux_oneHot sawMuxAntiInterp 
	(
		.oneHot(octave),
		.dataIn(sawOutputsAntiInterp0),
		.dataOut(antiInterpBank[0])
	);

	mux_oneHot sawMuxInterp1 
	(
		.oneHot((octave >> 1)),
		.dataIn(sawOutputsInterp0),
		.dataOut(interpBank[1])
	);
		
	mux_oneHot sawMuxAntiInterp1 
	(
		.oneHot((octave >> 1)),
		.dataIn(sawOutputsAntiInterp0),
		.dataOut(antiInterpBank[1])
	);	
	
endmodule
