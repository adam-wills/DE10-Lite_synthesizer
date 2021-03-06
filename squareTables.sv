module squareTables
(
		input  logic        Clk, readEn,
		input  logic [7:0]  octave,
		input  logic [11:0] sampAddrA,
		output logic [15:0] interpOuts[2],
		output logic [15:0] antiInterpOuts[2]
);							 

	//internal signal delcarations
	reg   [15:0] sqrOutputsInterp0[8];
	reg   [15:0] sqrOutputsInterp1[8];
	reg   [15:0] sqrOutputsAntiInterp0[8];
	reg   [15:0] sqrOutputsAntiInterp1[8];
	reg   [15:0] interpBank[2];
	reg   [15:0] antiInterpBank[2];

	logic [11:0] sampAddrB;
	assign sampAddrB = sampAddrA+12'h001;
	assign interpOuts = interpBank;
	assign antiInterpOuts = interpBank;
	


	// sqrtooth-wave ROM: 8 banks (corresponding to 8 playable octaves) with
	// 4192 samples each. 0th bank (corresponding to the highest playable octave) is
	// simply a sinewave, while the 1st bank contains a sum of 2 sinewaves whose amplitudes
	// correspond to the fourier series decomposition of the sqrtooth wave; 2nd bank
	// contains a sum of 4 sinewaves, 3rd bank 8...
	sqrRom4096_0	sqrRom4096_0inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrOutputsInterp0[0]),
		.q_b (sqrOutputsAntiInterp0[0])
	);
								 
	sqrRom4096_1	sqrRom4096_1inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrOutputsInterp0[1]),
		.q_b (sqrOutputsAntiInterp0[1])
	);
												
	sqrRom4096_2	sqrRom4096_2inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrOutputsInterp0[2]),
		.q_b (sqrOutputsAntiInterp0[2])
	);
												
	sqrRom4096_3	sqrRom4096_3inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrOutputsInterp0[3]),
		.q_b (sqrOutputsAntiInterp0[3])
	);
												
	sqrRom4096_4	sqrRom4096_4inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrOutputsInterp0[4]),
		.q_b (sqrOutputsAntiInterp0[4])
	);
								 
	sqrRom4096_5	sqrRom4096_5inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrOutputsInterp0[5]),
		.q_b (sqrOutputsAntiInterp0[5])
	);
												
	sqrRom4096_6	sqrRom4096_6inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrOutputsInterp0[6]),
		.q_b (sqrOutputsAntiInterp0[6])
	);
												
	sqrRom4096_7	sqrRom4096_7inst 
	(
		.address_a(sampAddrA),
		.address_b(sampAddrB),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrOutputsInterp0[7]),
		.q_b (sqrOutputsAntiInterp0[7])
	);
								 
	mux_oneHot sqrMuxInterp 
	(
		.oneHot(octave),
		.dataIn(sqrOutputsInterp0),
		.dataOut(interpBank[0])
	);
									
	mux_oneHot sqrMuxAntiInterp 
	(
		.oneHot(octave),
		.dataIn(sqrOutputsAntiInterp0),
		.dataOut(antiInterpBank[0])
	);

	mux_oneHot sqrMuxInterp1 
	(
		.oneHot((octave >> 1)),
		.dataIn(sqrOutputsInterp0),
		.dataOut(interpBank[1])
	);
		
	mux_oneHot sqrMuxAntiInterp1 
	(
		.oneHot((octave >> 1)),
		.dataIn(sqrOutputsAntiInterp0),
		.dataOut(antiInterpBank[1])
	);	
	
endmodule
