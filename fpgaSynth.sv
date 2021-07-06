module fpgaSynth (
    // Top Level Inputs/Outputs //
	
      ///////// Clocks /////////
      input     MAX10_CLK1_50, 
		input		 MAX10_CLK2_50,

      ///////// KEY /////////
      input    [ 1: 0]   KEY,

      ///////// SW /////////
      input    [ 9: 0]   SW,

      ///////// LEDR /////////
      output   [ 9: 0]   LEDR,

      ///////// HEX /////////
      output   [ 7: 0]   HEX0,
      output   [ 7: 0]   HEX1,
      output   [ 7: 0]   HEX2,
      output   [ 7: 0]   HEX3,
      output   [ 7: 0]   HEX4,
      output   [ 7: 0]   HEX5,

      ///////// SDRAM /////////
      output             DRAM_CLK,
      output             DRAM_CKE,
      output   [12: 0]   DRAM_ADDR,
      output   [ 1: 0]   DRAM_BA,
      inout    [15: 0]   DRAM_DQ,
      output             DRAM_LDQM,
      output             DRAM_UDQM,
      output             DRAM_CS_N,
      output             DRAM_WE_N,
      output             DRAM_CAS_N,
      output             DRAM_RAS_N,


      ///////// ARDUINO /////////
      inout    [15: 0]   ARDUINO_IO,
      inout              ARDUINO_RESET_N

);

		

logic Reset_h;
logic Continue_h;
// Invert active-low reset and continue buttons
assign {Continue_h} =~ (KEY[1]);
assign {Reset_h} =~ (KEY[0]);	

			
//=======================================================
//   I2C Tristate Buffers and Declarations
//=======================================================


logic I2C_SDA_IN, I2C_SDA_OE, I2C_SCL_IN, I2C_SCL_OE;
	
// active I2C signals pull clock and data lines low
assign I2C_SDA_IN = ARDUINO_IO[14];
assign ARDUINO_IO[14] = I2C_SDA_OE ? 1'b0 : 1'bZ;  // I2C SDA tristate
	
assign I2C_SCL_IN = ARDUINO_IO[15];
assign ARDUINO_IO[15] = I2C_SCL_OE ? 1'b0 : 1'bZ;	// I2C SCL tristate
	
	
//=======================================================
//   Instantiate onChip-Memory Wavetables
//=======================================================
	
	
logic readEn;

reg   [12:0] sampAddrA;
reg   [12:0] sampAddrB;



reg   [15:0] waveSampsInterp[3][2];
reg	[15:0] waveSampsAntiInterp[3][2];

logic [31:0] tableInterpCoefs[30] = 
'{32'h04F68D17, 32'hEFA137C1, 32'hDA4BE26C, 32'hC4F68D16, 32'hAFA137C1, 32'h9A4BE26C, 
  32'h84F68D17, 32'h6FA137C1, 32'h5A4BE26C, 32'h44F68D17, 32'h2FA137C2, 32'h1A4BE26C, 
  32'h04F68D17, 32'hEFA137C1, 32'hDA4BE26C, 32'hC4F68D16, 32'hAFA137C1, 32'h9A4BE26C, 
  32'h84F68D17, 32'h6FA137C1, 32'h5A4BE26C, 32'h44F68D17, 32'h2FA137C2, 32'h1A4BE26C, 
  32'h04F68D17, 32'hEFA137C1, 32'hDA4BE26C, 32'hC4F68D16, 32'hAFA137C1, 32'h9A4BE26C};


// Sinewave ROM: 4192 Samples of a sinewave which can be read through
// at varying rates to produce corresponding frequencies
reg   [15:0] sineSamps[2];
sineRom4096	sineRom4096_inst 
(
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(waveSampsInterp[0][0]),
	.q_b (waveSampsAntiInterp[0][0])
);

assign waveSampsInterp[0][1] = waveSampsInterp[0][0];          // as there is only 1 table for the sinewave (no harmonic components aside from the fundamental), 
assign waveSampsAntiInterp[0][1] = waveSampsAntiInterp[0][0];  // it interpolates with itself (interpolation left in to allow for waveform mixing)
/*
sawTables sawTables_inst
(
	.Clk(MAX10_CLK2_50),
	.readEn(readEn),
	.octave(octave[voiceIdx]),
	.sampAddrA(sampAddrA),
	.interpOuts(waveSampsInterp[1][0:1]),
	.antiInterpOuts(waveSampsAntiInterp[1][0:1])
);


squareTables squareTables_inst
(
	.Clk(MAX10_CLK2_50),
	.readEn(readEn),
	.octave(octave[voiceIdx]),
	.sampAddrA(sampAddrA),
	.interpOuts(waveSampsInterp[2][0:1]),
	.antiInterpOuts(waveSampsAntiInterp[2][0:1])
);
*/
reg   [15:0] sawOutputsInterp0[8];
reg   [15:0] sawOutputsAntiInterp0[8];
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
	.dataOut(waveSampsInterp[1][0])
);
								
mux_oneHot sawMuxAntiInterp 
(
	.oneHot(octave),
	.dataIn(sawOutputsAntiInterp0),
	.dataOut(waveSampsAntiInterp[1][0])
);

mux_oneHot sawMuxInterp1 
(
	.oneHot((octave >> 1)),
	.dataIn(sawOutputsInterp0),
	.dataOut(waveSampsInterp[1][1])
);
	
mux_oneHot sawMuxAntiInterp1 
(
	.oneHot((octave >> 1)),
	.dataIn(sawOutputsAntiInterp0),
	.dataOut(waveSampsAntiInterp[1][1])
);

//=======================================================
// Square-wave ROM: identical in structure to sawtooth-wave ROM
reg   [15:0] sqrOutputsInterp0[8];
reg   [15:0] sqrOutputsAntiInterp0[8];

sqrRom4096_0	sqrRom4096_0inst (
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(sqrOutputsInterp0[0]),
	.q_b (sqrOutputsAntiInterp0[0]));
							 
sqrRom4096_1	sqrRom4096_1inst (
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(sqrOutputsInterp0[1]),
	.q_b (sqrOutputsAntiInterp0[1]));
											
sqrRom4096_2	sqrRom4096_2inst (
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(sqrOutputsInterp0[2]),
	.q_b (sqrOutputsAntiInterp0[2]));
											
sqrRom4096_3	sqrRom4096_3inst (
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(sqrOutputsInterp0[3]),
	.q_b (sqrOutputsAntiInterp0[3]));
											
sqrRom4096_4	sqrRom4096_4inst (
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(sqrOutputsInterp0[4]),
	.q_b (sqrOutputsAntiInterp0[4]));
							 
sqrRom4096_5	sqrRom4096_5inst (
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(sqrOutputsInterp0[5]),
	.q_b (sqrOutputsAntiInterp0[5]));
											
sqrRom4096_6	sqrRom4096_6inst (
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(sqrOutputsInterp0[6]),
	.q_b (sqrOutputsAntiInterp0[6]));
											
sqrRom4096_7	sqrRom4096_7inst (
	.address_a(sampAddrA),
	.address_b(sampAddrB),
	.clock(MAX10_CLK2_50),
	.rden_a(readEn),
	.rden_b(readEn),
	.q_a(sqrOutputsInterp0[7]),
	.q_b (sqrOutputsAntiInterp0[7]));


mux_oneHot sqrMuxInterp (
	.oneHot(octave),
	.dataIn(sqrOutputsInterp0),
	.dataOut(waveSampsInterp[2][0]));
								
mux_oneHot sqrMuxAntiInterp (
	.oneHot(octave),
	.dataIn(sqrOutputsAntiInterp0),
	.dataOut(waveSampsAntiInterp[2][0]));

mux_oneHot sqrMuxInterp1 (
	.oneHot((octave >> 1)),
	.dataIn(sqrOutputsInterp0),
	.dataOut(waveSampsInterp[2][1]));
	
mux_oneHot sqrMuxAntiInterp1 (
	.oneHot((octave >> 1)),
	.dataIn(sqrOutputsAntiInterp0),
	.dataOut(waveSampsAntiInterp[2][1]));


//=======================================================
//   Instantiate On-Chip Memory FIFO
//=======================================================

// On-chip memory FIFO is dual-clocked such that samples can be fed in and fed out at
// different rates, allowing for samples to be generated using the 50 MHz Clock while they
// are read out at the sample rate for the audio codec (44.1 kHz)

logic [31:0]	fifoDout = 32'b0; 
logic [31:0]	fifoDin = 32'b0;
logic 			i2sReq = 1'b0;
logic				sampReq = 1'b0;
logic 			i2sEmpty = 1'b1;
logic				i2sFull = 1'b0;
logic				sampEmpty = 1'b1;
logic				sampFull = 1'b0;
logic [7:0] 	i2sUsedw = 8'b0;
logic [7:0]		sampUsedw = 8'b0; // depth of FIFO is 256;
logic 			i2sHalfEmpty, sampHalfFull;

assign sampHalfFull = ~sampUsedw[7];
assign i2sHalfEmpty = ~i2sUsedw[7];


onChipFIFO onChipFIFO_inst(
		.aclr(Reset_h),
		.data(fifoDin),
		.rdclk(LRCLK),
		.rdreq(i2sReq),
		.wrclk(MAX10_CLK2_50),
		.wrreq(sampReq),
		.q(fifoDout),
		.rdempty(i2sEmpty),
		.rdfull(i2sFull),
		.rdusedw(i2sUsedw),
		.wrempty(sampEmpty),
		.wrfull(sampFull),
		.wrusedw(sampUsedw) );
										
										
//=======================================================
//  Handle FM states/signals
//=======================================================				
	
logic phasorRun, loadWaves, loadWeights, loadEnables;

reg   [7:0] fmWeights0[4] = '{8'h0,8'h0,8'h0,8'h0};
reg   [7:0] fmWeights1[4] = '{8'h0,8'h0,8'h0,8'h0};
reg   [7:0] fmWeights2[4] = '{8'h0,8'h0,8'h0,8'h0};
reg   [7:0] fmWeights3[4] = '{8'h0,8'h0,8'h0,8'h0};

reg   [0:3] fmEnable0 = 4'h0;
reg   [0:3] fmEnable1 = 4'h0;
reg   [0:3] fmEnable2 = 4'h0;
reg   [0:3] fmEnable3 = 4'h0;

logic [31:0] fmInputs[0:3] = '{32'b0,32'b0,32'b0,32'b0};
logic [31:0] mult0Out[4] = '{32'b0,32'b0,32'b0,32'b0};
logic [31:0] mult1Out[4] = '{32'b0,32'b0,32'b0,32'b0};
logic [31:0] mult2Out[4] = '{32'b0,32'b0,32'b0,32'b0};
logic [31:0] mult3Out[4] = '{32'b0,32'b0,32'b0,32'b0};
logic [33:0] fmAddOut[4] = '{34'b0, 34'b0, 34'b0, 34'b0};	

// calculate FM inputs for all voices
mult8x16_ip	fmMult0[0:3] (
		.aclr(Reset_h),
		.clken(En),
		.clock(MAX10_CLK2_50),
		.dataa(fmWeights0),
		.datab(sigs16bit[0]),
		.result(mult0Out));
								 
mult8x16_ip	fmMult1[0:3] (
		.aclr(Reset_h),
		.clken(En),
		.clock(MAX10_CLK2_50),
		.dataa(fmWeights1),
		.datab(sigs16bit[1]),
		.result(mult1Out));
								 
mult8x16_ip	fmMult2[0:3] (
		.aclr(Reset_h),
		.clken(En),
		.clock(MAX10_CLK2_50),
		.dataa(fmWeights2),
		.datab(sigs16bit[2]),
		.result(mult2Out));
								 
mult8x16_ip	fmMult3[0:3] (
		.aclr(Reset_h),
		.clken(En),
		.clock(MAX10_CLK2_50),
		.dataa(fmWeights3),
		.datab(sigs16bit[3]),
		.result(mult3Out));
								 
// add FM signals to produce final FM signal								 
parallelAdder fmAdd[0:3] (
		.data0x(mult0Out),
		.data1x(mult1Out),
		.data2x(mult2Out),
		.data3x(mult3Out),
		.result(fmAddOut));

logic [15:0] sigs16bit[4];

// FM state machine handles states associated with frequency modulation
FMSM	fm_stateMachine  (
		.Clk(MAX10_CLK2_50),
		.Reset(Reset_h),
		.Continue(Continue_h),
		.run(phasorRun),
		.load_waves(loadWaves),
		.load_enables(loadEnables),
		.load_weights(loadWeights) );


always_ff @(posedge MAX10_CLK2_50)
begin
	if (phasorRun == 1'b1)
	begin
		sigs16bit[0] <= tableInterpedSigs[0][63:48];
		sigs16bit[1] <= tableInterpedSigs[1][63:48];
		sigs16bit[2] <= tableInterpedSigs[2][63:48];
		sigs16bit[3] <= tableInterpedSigs[3][63:48];
		
		fmInputs[0][15:0] <= fmAddOut[0][33:18];
		fmInputs[1][15:0] <= fmAddOut[1][33:18];
		fmInputs[2][15:0] <= fmAddOut[2][33:18];
		fmInputs[3][15:0] <= fmAddOut[3][33:18];
		if (loadWaves == 1'b1)
		begin
			LEDR[9:6] <= SW[9:6];
			LEDR[5:2] <= 4'h0;
			LEDR[1:0] <= SW[1:0];
			
			if (SW[9] == 1'b1)
				waveforms[0] <= SW[1:0];
			if (SW[8] == 1'b1)
				waveforms[1] <= SW[1:0];
			if (SW[7] == 1'b1)
				waveforms[2] <= SW[1:0];
			if (SW[6] == 1'b1)
				waveforms[3] <= SW[1:0];
		end
		else if (loadEnables == 1'b1)
		begin
			LEDR[9:2] <= SW[9:2];
			LEDR[1:0] <= 2'b00;
			if (SW[9] == 1'b1)
				fmEnable0 <= SW[5:2];
			if (SW[8] == 1'b1)
				fmEnable1 <= SW[5:2];
			if (SW[7] == 1'b1)
				fmEnable2 <= SW[5:2];
			if (SW[6] == 1'b1)
				fmEnable3 <= SW[5:2];
		end
		else if (loadWeights == 1'b1)
		begin
			LEDR[7:0] <= SW[7:0];
			LEDR[9:8] <= 2'b00;
			for (int i = 0; i < 4; i++)
			begin
				if (fmEnable0[i] == 1'b1)
					fmWeights0[i] <= SW[7:0];
				if (fmEnable1[i] == 1'b1)
					fmWeights1[i] <= SW[7:0];
				if (fmEnable2[i] == 1'b1)
					fmWeights2[i] <= SW[7:0];
				if (fmEnable3[i] == 1'b1)
					fmWeights3[i] <= SW[7:0];
			end
		end
	end
end
	
//=======================================================
//  Handle sample generation
//=======================================================	

// General Declarations
reg   [31:0] freq32bit[31] = '{32'b0,32'b0,32'b0,32'b0,
										 32'b0,32'b0,32'b0,32'b0,
										 32'b0,32'b0,32'b0,32'b0,
										 32'b0,32'b0,32'b0,32'b0,
										 32'b0,32'b0,32'b0,32'b0,
										 32'b0,32'b0,32'b0,32'b0,
										 32'b0,32'b0,32'b0,32'b0,
										 32'b0,32'b0,32'b0};
reg   [1:0]  waveforms[4] = '{2'b00, 2'b00, 2'b00, 2'b00};
reg   [7:0]  octaveBase = 8'h80;
logic [7:0]  octave;
int			 octaveOffset = 0;

logic [31:0] sigs[4] = '{32'b0,32'b0,32'b0,32'b0}; 
reg   newNote[4] = '{1'b1,1'b1,1'b1,1'b1};

//===================================================
// voiceCounter
// Cycles through the voices: voiceIdx <-currentVoice
reg   [1:0] voiceIdx;
logic En, voiceCycleEn;
assign En = (sampHalfFull|sampEmpty|i2sEmpty|i2sHalfEmpty)&(~i2sFull)&(sampReq);
assign voiceCycleEn = En;

cntr_modulus voiceCntr
(
		.Clk(MAX10_CLK2_50),
		.Reset(Reset_h),
		.Enable(voiceCycleEn),
		.sClear(),
		.q(voiceIdx) 
);
//====================================================



//====================================================
// Note and Amplitude Parsers
// Determines if a given keycode represents a note being played or
// an amplitude being changed; changes the corresponding signals on the basis of the
// keycode
logic noteOff[4] = '{1'b0,1'b0,1'b0,1'b0};
logic noteTrig[4] = '{1'b1,1'b0,1'b0,1'b0};
int   noteIdx[4] = '{-1,-1,-1,-1};
reg   [7:0] keycodes_new[4] = '{8'h00, 8'h00, 8'h00, 8'h00};
reg   [7:0] keycodes_old[4] = '{8'h00, 8'h00, 8'h00, 8'h00};
noteParser noteParsers [0:3]
(
		.Clk(MAX10_CLK2_50),
		.Reset(Reset_h),
		.keycode_new(keycodes_new),
		.keycode_old(keycodes_old),
		.noteOff(noteOff),
		.noteTrig(noteTrig),
		.noteIdx(noteIdx)
);

reg   [15:0] amplitude = 16'h2000;
amplitudeParser amplitudeParser_inst
(
		.Clk(MAX10_CLK2_50),
		.Reset(Reset_h),
		.keycode(keycodes_new[voiceIdx]),
		.amplitude(amplitude)
);
//=====================================================



//=====================================================
// Phasors
// Cycle from 32'h0 to 32'hffff_ffff and wrap back around to zero at a rate determined
// by the phase increment (phIncrs), which is itself set based on the desired note frequency
reg   [31:0] phIncrs[4] = '{32'b0, 32'b0, 32'b0, 32'b0};
reg   [11:0] tblAddrs[4] = '{12'b0,12'b0,12'b0,12'b0};
// Update phase registers, produces 12-bit addresses tblAddrs[0:3] -> sampAddrA
phasor phaseRegs[0:3]  
(
		.Clk(MAX10_CLK2_50),
		.Reset(Reset_h),
		.Enable(En),
		.phaseIncrement(phIncrs),
		.fmInput(fmInputs),
		.interp(interp),
		.wavetableAddr(tblAddrs)
);
//=====================================================

		
//=====================================================





//=====================================================


		
//=====================================================
// Bilinear Interpolation
// Interpolate between adjacent samples in a given frequency table using lowest 20 bits of
// phasor value (top 12 are used to index into table), do the same for adjacent samples in
// the adjacent frequency table then interpolate the two results
logic [19:0] interp[4] = '{20'h0, 20'h0, 20'h0, 20'h0};
logic [15:0] interpSamples[4][2];
logic [15:0] antiInterpSamples[4][2];
logic [31:0] tableInterpCoef[4];
logic [63:0] tableInterpedSigs[4] = '{64'h0, 64'h0, 64'h0, 64'h0};
bilinearInterpolator interpolators[0:3]
(
		.Clk(MAX10_CLK2_50),
		.En(voiceCycleEn),
		.interpSamples(interpSamples),
		.antiInterpSamples(antiInterpSamples),
		.sampleInterp(interp),
		.tableInterp(tableInterpCoef),
		.interpedOut(tableInterpedSigs)
);
//====================================================
logic [31:0] aStep[4] = '{32'h020f_ffff,32'h0200_ffff,32'h0200_ffff,32'h0200_ffff};
logic [31:0] dStep[4] = '{32'h040f_ffff,32'h0400_ffff,32'h0400_ffff,32'h0400_ffff};
logic [31:0] sLevel[4] = '{32'h7fff_ffff,32'h7fff_ffff,32'h7fff_ffff,32'h7fff_ffff};
logic [31:0] sTime[4] = '{32'h0400_ffff,32'h0000_ffff,32'h0400_ffff,32'h0000_ffff};
logic [31:0] rStep[4] = '{32'h0800_0000,32'h0800_ffff,32'h0800_ffff,32'h0800_ffff};
logic [15:0] envs[4];

ADSRenv ADSRenvelopes [0:3]
(
		.Clk(MAX10_CLK2_50),
		.Reset(Reset_h),
		.Trig(noteTrig),
		.noteOff(noteOff),
		.aStep(aStep),
		.dStep(dStep),
		.sLevel(sLevel),
		.sTime(sTime),
		.env(envs)
);
					
logic [81:0] finalSig = 82'b0;
logic [79:0] finalOutput = 80'b0;
mult16x64Add4_ip ADSRMultAdd 
(
		.dataa_0(tableInterpedSigs[0]),
		.datab_0(envs[0]),
		.dataa_1(tableInterpedSigs[1]),
		.datab_1(envs[1]),
		.dataa_2(tableInterpedSigs[2]),
		.datab_2(envs[2]),
		.dataa_3(tableInterpedSigs[3]),
		.datab_3(envs[3]),
		.clock0(MAX10_CLK2_50),
		.ena0(voiceCycleEn),
		.result(finalSig)
);

mult16x64 finalAmplitude
(
		.clken(voiceCycleEn),
		.clock(MAX10_CLK2_50),
		.dataa(amplitude),
		.datab(finalSig[81:17]),
		.result(finalOutput)
);
		
// send sample from appropriate table of selected waveform to interpolator
always_ff @ (negedge MAX10_CLK2_50) begin
	interpSamples[voiceIdx][0:1] <= waveSampsInterp[waveforms[voiceIdx]][0:1];
	antiInterpSamples[voiceIdx][0:1] <= waveSampsAntiInterp[waveforms[voiceIdx]][0:1];
	
	fifoDin <= {finalOutput[77:62],16'b0};
end
//======================================================



// determine appropriate sample on positive clock edge
// (Should probably have a module for this)
always_ff @ (posedge MAX10_CLK2_50) begin
	if (Reset_h) 
		sampReq <= 1'b0;
	else begin
		if ((sampHalfFull | sampEmpty | i2sEmpty | i2sHalfEmpty) & (~i2sFull)) begin
			if (sampReq == 1'b1) begin
				sampReq <= 1'b0;
				readEn <= 1'b0;
				if (noteTrig[voiceIdx] == 1'b1) begin
					keycodes_old[voiceIdx] <= keycodes_new[voiceIdx];
				end
			end
			else begin
				sampReq <= 1'b1;
				phIncrs[voiceIdx] <= freq32bit[noteIdx[voiceIdx]];
				tableInterpCoef[voiceIdx] <= tableInterpCoefs[noteIdx[voiceIdx]];
				if (noteIdx[voiceIdx] < 12)
					octave <= octaveBase;
				else begin
					if (noteIdx[voiceIdx] >= 12) begin
						if (noteIdx[voiceIdx] < 24)
							octave <= (octaveBase >> 1);
						else
							octave <= (octaveBase >> 2);
					end
				end
				readEn <= 1'b1;
				sampAddrA <= tblAddrs[voiceIdx];
				sampAddrB <= tblAddrs[voiceIdx]+12'h001;
				
			end
		end
	
		else if (sampFull) begin
			sampReq <= 1'b0;
			readEn <= 1'b0;
		end
	end
end


logic [31:0] sampleInR, sampleInL;
always @ (posedge LRCLK) begin
	if (i2sEmpty == 1'b0)  begin
		if (i2sReq == 1'b0)  begin
			i2sReq <= 1'b1;
			sampleInR <= fifoDout;
			sampleInL <= fifoDout;
		end
		else
			i2sReq <= 1'b0;
	end
end





//=======================================================
//   I2S assignments
//=======================================================

// Divide master clock by 4 to derive 12.5MHz SGTL5000 master clock
logic [1:0] aud_mclk_ctr;
always_ff @ (posedge MAX10_CLK2_50) begin
	if (Reset_h) begin
		aud_mclk_ctr = 2'b00;
	end
	else begin
		aud_mclk_ctr <= aud_mclk_ctr+1;
	end
end


assign ARDUINO_IO[3] = aud_mclk_ctr[1]; //12.5 MHz master clock to SGTL5000

logic SCLK, LRCLK;
assign SCLK = ARDUINO_IO[5];
assign LRCLK = ARDUINO_IO[4];

logic prevLRCLK = 1'b0;
logic shiftLChannel, loadR, loadL, shiftRChannel;
logic shiftOutL, shiftOutR;
logic [1:0] actionState; 

assign ARDUINO_IO[1] = 1'bZ;
//assign ARDUINO_IO[2] = ARDUINO_IO[1]; //Loopback from I2S_DIN to I2S_DOUT for testing
assign ARDUINO_IO[2] = LRCLK? shiftOutR : shiftOutL;

// Shift registers to shift out individual bits of each sample at the rate of SCLK = 32*LRCLK
shiftreg_N  shiftregL(
		.Clk(SCLK),
		.Reset(Reset_h),
		.Enable(~i2sEmpty),
		.Shift_In(1'b0),
		.Load(loadL),
		.Shift_En(shiftLChannel),
		.D(sampleInL),
		.Shift_Out(shiftOutL),
		.Data_Out());
												  
shiftreg_N  shiftregR(
		.Clk(SCLK),
		.Reset(Reset_h),
		.Enable(~i2sEmpty),
		.Shift_In(1'b0),
		.Load(loadR),
		.Shift_En(shiftRChannel),
		.D(sampleInR),
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
		2'b00 :
		begin
			shiftLChannel = 1'b1;
			loadL = 1'b0;
			loadR = 1'b0;
			shiftRChannel = 1'b0;
		end
		2'b01 :
		begin
			shiftLChannel = 1'b0;
			loadL = 1'b0;
			loadR = 1'b1;
			shiftRChannel = 1'b0;
		end
		2'b10 :
		begin
			shiftLChannel = 1'b0;
			loadL = 1'b1;
			loadR = 1'b0;
			shiftRChannel = 1'b0;
		end
		2'b11 :
		begin
			shiftLChannel = 1'b0;
			loadL = 1'b0;
			loadR = 1'b0;
			shiftRChannel = 1'b1;
		end
		default :
			begin
			shiftLChannel = 1'b0;
			loadL = 1'b0;
			loadR = 1'b0;
			shiftRChannel = 1'b0;
			end
	endcase
end


//=======================================================
//  Structural coding
//=======================================================
logic SPI0_CS_N, SPI0_SCLK, SPI0_MISO, SPI0_MOSI, USB_GPX, USB_IRQ, USB_RST;
logic [3:0] hex_num_4, hex_num_3, hex_num_1, hex_num_0; //4 bit input hex digits
logic [9:0] LEDDummy;
logic [1:0] signs;
logic [1:0] hundreds;

assign ARDUINO_IO[10] = SPI0_CS_N;
assign ARDUINO_IO[13] = SPI0_SCLK;
assign ARDUINO_IO[11] = SPI0_MOSI;
assign ARDUINO_IO[12] = 1'bZ;
assign SPI0_MISO = ARDUINO_IO[12];

assign ARDUINO_IO[9] = 1'bZ; 
assign USB_IRQ = ARDUINO_IO[9];
	
//Assignments specific to Circuits At Home UHS_20
assign ARDUINO_RESET_N = USB_RST;
assign ARDUINO_IO[7] = USB_RST;//USB reset 
assign ARDUINO_IO[8] = USB_GPX;
assign USB_GPX = 1'b0;//GPX is not needed for standard USB host - set to 0 to prevent interrupt

//Assign uSD CS to '1' to prevent uSD card from interfering with USB Host (if uSD card is plugged in)
assign ARDUINO_IO[6] = 1'b1;

//HEX drivers to convert numbers to HEX output
HexDriver hex_driver4 (hex_num_4, HEX3[6:0]);
assign HEX3[7] = 1'b1;

HexDriver hex_driver3 (hex_num_3, HEX2[6:0]);
assign HEX2[7] = 1'b1;

HexDriver hex_driver1 (hex_num_1, HEX1[6:0]);
assign HEX1[7] = 1'b1;

HexDriver hex_driver0 (hex_num_0, HEX0[6:0]);
assign HEX0[7] = 1'b1;



finalProject u0 (
	.clk_clk                           (MAX10_CLK1_50),  //clk.clk
	.reset_reset_n                     (1'b1),           //reset.reset_n
	.altpll_0_locked_conduit_export    (),               //altpll_0_locked_conduit.export
	.altpll_0_phasedone_conduit_export (),               //altpll_0_phasedone_conduit.export
	.altpll_0_areset_conduit_export    (),               //altpll_0_areset_conduit.export
	.key_external_connection_export    (KEY),            //key_external_connection.export

	//SDRAM
	.sdram_clk_clk(DRAM_CLK),                            //clk_sdram.clk
	.sdram_wire_addr(DRAM_ADDR),                         //sdram_wire.addr
	.sdram_wire_ba(DRAM_BA),                             //.ba
	.sdram_wire_cas_n(DRAM_CAS_N),                       //.cas_n
	.sdram_wire_cke(DRAM_CKE),                           //.cke
	.sdram_wire_cs_n(DRAM_CS_N),                         //.cs_n
	.sdram_wire_dq(DRAM_DQ),                             //.dq
	.sdram_wire_dqm({DRAM_UDQM,DRAM_LDQM}),              //.dqm
	.sdram_wire_ras_n(DRAM_RAS_N),                       //.ras_n
	.sdram_wire_we_n(DRAM_WE_N),                         //.we_n
	
	//I2C
	.i2c_serial_sda_in(I2C_SDA_IN),
	.i2c_serial_sda_oe(I2C_SDA_OE),
	.i2c_serial_scl_in(I2C_SCL_IN),
	.i2c_serial_scl_oe(I2C_SCL_OE),

	//USB SPI	
	.spi0_SS_n(SPI0_CS_N),
	.spi0_MOSI(SPI0_MOSI),
	.spi0_MISO(SPI0_MISO),
	.spi0_SCLK(SPI0_SCLK),
	
	//USB GPIO
	.usb_rst_export(USB_RST),
	.usb_irq_export(USB_IRQ),
	.usb_gpx_export(USB_GPX),
	
	//PHASE INCREMENTS
	.phase_incr0_external_connection_export(freq32bit[0][31:0]),
	.phase_incr1_external_connection_export(freq32bit[1][31:0]),
	.phase_incr2_external_connection_export(freq32bit[2][31:0]),
	.phase_incr3_external_connection_export(freq32bit[3][31:0]),
	.phase_incr4_external_connection_export(freq32bit[4][31:0]),
	.phase_incr5_external_connection_export(freq32bit[5][31:0]),
	.phase_incr6_external_connection_export(freq32bit[6][31:0]),
	.phase_incr7_external_connection_export(freq32bit[7][31:0]),
	.phase_incr8_external_connection_export(freq32bit[8][31:0]),
	.phase_incr9_external_connection_export(freq32bit[9][31:0]),
	.phase_incr10_external_connection_export(freq32bit[10][31:0]),
	.phase_incr11_external_connection_export(freq32bit[11][31:0]),
	.phase_incr12_external_connection_export(freq32bit[12][31:0]),
	.phase_incr13_external_connection_export(freq32bit[13][31:0]),
	.phase_incr14_external_connection_export(freq32bit[14][31:0]),
	.phase_incr15_external_connection_export(freq32bit[15][31:0]),
	.phase_incr16_external_connection_export(freq32bit[16][31:0]),
	.phase_incr17_external_connection_export(freq32bit[17][31:0]),
	.phase_incr18_external_connection_export(freq32bit[18][31:0]),
	.phase_incr19_external_connection_export(freq32bit[19][31:0]),
	.phase_incr20_external_connection_export(freq32bit[20][31:0]),
	.phase_incr21_external_connection_export(freq32bit[21][31:0]),
	.phase_incr22_external_connection_export(freq32bit[22][31:0]),
	.phase_incr23_external_connection_export(freq32bit[23][31:0]),
	.phase_incr24_external_connection_export(freq32bit[24][31:0]),
	.phase_incr25_external_connection_export(freq32bit[25][31:0]),
	.phase_incr26_external_connection_export(freq32bit[26][31:0]),
	.phase_incr27_external_connection_export(freq32bit[27][31:0]),
	.phase_incr28_external_connection_export(freq32bit[28][31:0]),
	.phase_incr29_external_connection_export(freq32bit[29][31:0]),
	.phase_incr30_external_connection_export(freq32bit[30][31:0]),
	
	//KEYCODES
	//.keycode_export(keycode_new),
	.keycode_export(keycodes_new[0]),
	.keycode1_export(keycodes_new[1]),
	.keycode2_export(keycodes_new[2]),
	.keycode3_export(keycodes_new[3]),
	
	//LEDs and HEX
	.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
	.leds_export({hundreds, signs, LEDDummy}),
	
	//Table Index and interpolation coeficient
	//.tablecoef0_external_connection_export_export(tableInterpCoef[0]),
	//.tablecoef1_external_connection_export_export(tableInterpCoef[1]),
	//.tablecoef2_external_connection_export_export(tableInterpCoef[2]),
	//.tablecoef3_external_connection_export_export(tableInterpCoef[3]),
	
	//OCTAVE
	.oct_external_connection_export(octaveBase),
	
	//SWITCHES
	//.switches_external_connection_export(SW)
	
	//ADSR (tragically unfinished)
	/*
	.a0_external_connection_export(attack[0]), 
	.a1_external_connection_export(attack[1]),
	.a2_external_connection_export(attack[2]),
	.a3_external_connection_export(attack[3]),
	
	.d0_external_connection_export(decay[0]),
	.d1_external_connection_export(decay[1]),
	.d2_external_connection_export(decay[2]),
	.d3_external_connection_export(decay[3]),
	
	.s0_external_connection_export(sustain[0]),
	.s1_external_connection_export(sustain[1]),
	.s2_external_connection_export(sustain[2]),
	.s3_external_connection_export(sustain[3]),
	
	.r0_external_connection_export(rel[0]),
	.r1_external_connection_export(rel[1]),
	.r2_external_connection_export(rel[2]),
	.r3_external_connection_export(rel[3])
	*/
 );


endmodule
