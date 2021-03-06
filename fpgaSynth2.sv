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
// Invert active-low reset and continue buttons (personal preference)
assign {Continue_h} =~ (KEY[1]);
assign {Reset_h}=~ (KEY[0]);	
logic [9:0] LEDDummy;

			
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
	reg   [15:0] sawOutputs[8];
	reg   [15:0] sqrOutputs[8];
	reg   [12:0] sampAddrA;
	reg   [12:0] sampAddrB;
	reg   [15:0] waveSamps[3];
	
	// Sinewave ROM: 4192 Samples of a sinewave which can be read through
	// at varying rates to produce corresponding frequencies
	sineRom	sineRom_inst (
							.address(sampAddrA),
							.clock(MAX10_CLK2_50),
							.rden(readEn),
							.q(waveSamps[0])
	);

//=======================================================							 
	// Sawtooth-wave ROM: 8 banks (corresponding to 8 playable octaves) with
	// 4192 samples each. 0th bank (corresponding to the highest playable octave) is
	// simply a sinewave, while the 1st bank contains 2 sinewaves whose amplitudes
	// correspond to the fourier series decomposition of the sawtooth wave; 2nd bank
	// contains 4 sinewaves, 3rd bank 8...
	sawRom0	sawRom0_inst (
							.address_a(sampAddrA),
							.address_b(sampAddrB),
							.clock(MAX10_CLK2_50),
							.q_a(sawOutputs[0]),
							.q_b(sawOutputs[1])
								 );
								 
	sawRom1	sawRom1_inst (
							.address_a(sampAddrA),
							.address_b(sampAddrB),
							.clock(MAX10_CLK2_50),
							.q_a(sawOutputs[2]),
							.q_b(sawOutputs[3])
								 );
								 
	sawRom2	sawRom2_inst (
							.address_a(sampAddrA),
							.address_b(sampAddrB),
							.clock(MAX10_CLK2_50),
							.q_a(sawOutputs[4]),
							.q_b(sawOutputs[5])
								 );
								 
	sawRom3	sawRom3_inst (
							.address_a(sampAddrA),
							.address_b(sampAddrB),
							.clock(MAX10_CLK2_50),
							.q_a(sawOutputs[6]),
							.q_b(sawOutputs[7])
								 );
								 
	mux_oneHot sawMux (
							.oneHot(octave),
							.dataIn(sawOutputs),
							.dataOut(waveSamps[1])
							);
							
	
//=======================================================
// Square-wave ROM: identical in structure to sawtooth-wave ROM
	
	sqrRom0	sqrRom0_inst (
							.address_a(sampAddrA),
							.address_b(sampAddrB),
							.clock(MAX10_CLK2_50),
							.q_a(sqrOutputs[0]),
							.q_b(sqrOutputs[1])
								 );
								 
	sqrRom1	sqrRom1_inst (
							.address_a(sampAddrA),
							.address_b(sampAddrB),
							.clock(MAX10_CLK2_50),
							.q_a(sqrOutputs[2]),
							.q_b(sqrOutputs[3])
								 );
								 
	sqrRom2	sqrRom2_inst (
							.address_a(sampAddrA),
							.address_b(sampAddrB),
							.clock(MAX10_CLK2_50),
							.q_a(sqrOutputs[4]),
							.q_b(sqrOutputs[5])
								 );
								 
	sqrRom3	sqrRom3_inst (
							.address_a(sampAddrA),
							.address_b(sampAddrB),
							.clock(MAX10_CLK2_50),
							.q_a(sqrOutputs[6]),
							.q_b(sqrOutputs[7])
								 );
	
	
	mux_oneHot sqrMux (
							.oneHot(octave),
							.dataIn(sqrOutputs),
							.dataOut(waveSamps[2])
							);
	

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
										.wrusedw(sampUsedw)
										);
										
										
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
	
	logic [15:0] sigs16bit[4];
	
	// FM state machine handles states associated with frequency modulation
	FMSM	fm_stateMachine  (
									.Clk(MAX10_CLK2_50),
									.Reset(Reset_h),
									.Continue(Continue_h),
									.run(phasorRun),
									.load_waves(loadWaves),
									.load_enables(loadEnables),
									.load_weights(loadWeights)
									);
	
	
	always_ff @(posedge MAX10_CLK2_50)
	begin
		if (phasorRun == 1'b1)
		begin
			sigs16bit[0] <= sigs[0][31:16];
			sigs16bit[1] <= sigs[1][31:16];
			sigs16bit[2] <= sigs[2][31:16];
			sigs16bit[3] <= sigs[3][31:16];
			
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
	

	logic [7:0] keycodes_new[4] = '{8'hFF, 8'hFF, 8'hFF, 8'hFF};
	logic [7:0] keycodes_old[4] = '{8'hFF, 8'hFF, 8'hFF, 8'hFF};
	
	//logic [7:0]	keycode_new = 8'h00;
	
	logic [31:0] phIncrs[4] = '{32'b0, 32'b0, 32'b0, 32'b0};
	logic [12:0] tblAddrs[4] = '{13'b0,13'b0,13'b0,13'b0};
	logic [31:0] sigs[4] = '{32'b0,32'b0,32'b0,32'b0};

	logic [31:0] fmInputs[0:3] = '{32'b0,32'b0,32'b0,32'b0};
	logic [31:0] freq32bit[18] = '{32'b0,32'b0,32'b0,32'b0, //32bit kbd frequency
											 32'b0,32'b0,32'b0,32'b0,
											 32'b0,32'b0,32'b0,32'b0,
											 32'b0,32'b0,32'b0,32'b0,
											 32'b0,32'b0};
	logic [15:0] amplitude = 16'hFFFF;
	logic [15:0] interpSamples[4];
	
	// ADSR signals; still in progress
	/*
	logic [15:0] envs[4];
	logic			 envTrigs[4];
	logic			 noteOffs[4];
	logic [8:0]	 attack[4] = '{9'b001111111,
										9'b001111111,
										9'b001111111,
										9'b001111111};
	logic [8:0]  decay[4] = '{9'b111111000,
									  9'b111111000,
									  9'b111111000,
									  9'b111111000};
	logic [15:0]  sustain[4] = '{16'h4000,
										  16'h4000,
										  16'h4000,
										  16'h4000};
	logic [8:0]  rel[4] = '{9'b111111100,
									9'b111111100,
									9'b111111100,
									9'b111111100};
	*/
	logic [33:0] finalOutput = 34'b0;
	logic [15:0] interp[4] = '{16'h0, 16'h0, 16'h0, 16'h0};
	logic [15:0] antiInterp[4] = '{16'h0, 16'h0, 16'h0, 16'h0};
	
	logic [7:0]  octave = 8'h80;
	logic [1:0]  waveforms[4] = '{2'b00, 2'b00, 2'b00, 2'b00};
	
	reg   [1:0] voiceIdx;
	logic [31:0] mult0Out[4] = '{32'b0,32'b0,32'b0,32'b0};
	logic [31:0] mult1Out[4] = '{32'b0,32'b0,32'b0,32'b0};
	logic [31:0] mult2Out[4] = '{32'b0,32'b0,32'b0,32'b0};
	logic [31:0] mult3Out[4] = '{32'b0,32'b0,32'b0,32'b0};
	
	logic [33:0] fmAddOut[4] = '{34'b0, 34'b0, 34'b0, 34'b0};
	
	logic En, voiceCycleEn;
	
	// generate samples when there are no samples in the FIFO input or when the FIFO input is half
	// full or when the FIFO output is empty or when the FIFO output is half empty
	assign En = (sampHalfFull|sampEmpty|i2sEmpty|i2sHalfEmpty)&(~i2sFull)&(sampReq)&phasorRun;
	assign voiceCycleEn = En & newNote;

	// Cycles through the voices: voiceIdx <-currentVoice
	cntr_modulus voiceCntr(
								.Clk(MAX10_CLK2_50),
								.Reset(Reset_h),
								.Enable(voiceCycleEn),
								.sClear(),
								.q(voiceIdx)
								  );
	
	// Update phase registers, produces 12-bit addresses tblAddrs[0:3] -> sampAddrA
	phasor phaseRegs[0:3]  (
									.Clk(MAX10_CLK2_50),
									.Reset(Reset_h),
									.Enable(En),
									.phaseIncrement(phIncrs),
									.fmInput(fmInputs),
									.interp(interp),
									.wavetableAddr(tblAddrs)
									);

	// multiply samples by overall volume envelope
	mult16_ip	amps[0:3]	(
									.clock(MAX10_CLK2_50),
									.dataa(interpSamples),
									.datab(amplitude),
									.result(sigs)
									 );
									 
	parallelAdder	parallelOutputAdd (
									.data0x(sigs[0]),
									.data1x(sigs[1]),
									.data2x(sigs[2]),
									.data3x(sigs[3]),
									.result(finalOutput)
												 );	
	
	// calculate FM inputs for all voices
	mult8x16_ip	fmMult0[0:3] (
									.aclr(Reset_h),
									.clken(En),
									.clock(MAX10_CLK2_50),
									.dataa(fmWeights0),
									.datab(sigs16bit[0]),
									.result(mult0Out)
									 );
									 
	mult8x16_ip	fmMult1[0:3] (
									.aclr(Reset_h),
									.clken(En),
									.clock(MAX10_CLK2_50),
									.dataa(fmWeights1),
									.datab(sigs16bit[1]),
									.result(mult1Out)
									 );
									 
	mult8x16_ip	fmMult2[0:3] (
									.aclr(Reset_h),
									.clken(En),
									//.clock(voiceClk2),
									.clock(MAX10_CLK2_50),
									.dataa(fmWeights2),
									.datab(sigs16bit[2]),
									.result(mult2Out)
									 );
									 
	mult8x16_ip	fmMult3[0:3] (
									.aclr(Reset_h),
									.clken(En),
									.clock(MAX10_CLK2_50),
									.dataa(fmWeights3),
									.datab(sigs16bit[3]),
									.result(mult3Out)
									 );
									 
	// add voice signals to produce final output								 
	parallelAdder fmAdd[0:3] (
									.data0x(mult0Out),
									.data1x(mult1Out),
									.data2x(mult2Out),
									.data3x(mult3Out),
									.result(fmAddOut)
									 );

		
							  
	/*
	logic [7:0] noteKeycodes[0:17] = '{8'h04, 8'h1A, 8h16,
												  8'h08, 8'h07, 8'h09,
												  8'h17, 8'h0A, 8'h1C,
												  8'h08, 8'h18, 8'h0D,
												  8'h0E, 8'h12, 8'h0F,
												  8'h13, 8'h33, 8'h34};
											  
	*/
	
								
	logic newNote = 1'b1;
	
	// send sample from appropriate table of selected waveform to FIFO input on the negative clock-edge
	always_ff @ (negedge MAX10_CLK2_50)
	begin
		interpSamples[voiceIdx] <= waveSamps[waveforms[voiceIdx]];
		fifoDin <= {2'b0,finalOutput[33:20],16'b0};
	end
	
	// determine appropriate sample on positive clock edge
	always_ff @ (posedge MAX10_CLK2_50)
	begin
		if (Reset_h) 
		begin
			sampReq <= 1'b0;
		end

		else
		begin
			if ((sampHalfFull | sampEmpty | i2sEmpty | i2sHalfEmpty) & (~i2sFull)) 
			begin
				if (sampReq == 1'b1)
				begin
					sampReq <= 1'b0;
					readEn <= 1'b0;
					if (newNote == 1'b1) begin
						keycodes_old[voiceIdx] <= keycodes_new[voiceIdx];
					end
				end
				else
				begin
					sampReq <= 1'b1;
						case (keycodes_new[voiceIdx])
								8'h04 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[0][31:0];
									newNote <= 1'b1;
									end
								8'h1A :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[1][31:0];
									newNote <= 1'b1;
									end
								8'h16 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[2][31:0];
									newNote <= 1'b1;
									end
								8'h08 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[3][31:0];
									newNote <= 1'b1;
									end
								8'h07 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[4][31:0];
									newNote <= 1'b1;
									end
								8'h09 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[5][31:0];
									newNote <= 1'b1;
									end
								8'h17 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[6][31:0];
									newNote <= 1'b1;
									end
								8'h0A :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[7][31:0];
									newNote <= 1'b1;	
									end
								8'h1C :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[8][31:0];
									newNote <= 1'b1;
									end
								8'h0B :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[9][31:0];
									newNote <= 1'b1;
									end
								8'h18 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[10][31:0];
									newNote <= 1'b1;
									end
								8'h0D :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[11][31:0];
									newNote <= 1'b1;
									end
								8'h0E :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[12][31:0];
									newNote <= 1'b1;
									end
								8'h12 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[13][31:0];
									newNote <= 1'b1;
									end
								8'h0F :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[14][31:0];
									newNote <= 1'b1;	
									end
								8'h13 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[15][31:0];
									newNote <= 1'b1;
									end
								8'h33 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[16][31:0];
									newNote <= 1'b1;
									end
								8'h34 :
									begin
									phIncrs[voiceIdx][31:0] <= freq32bit[17][31:0];
									newNote <= 1'b1;
									end
								8'h1D :
									begin
										amplitude <= 16'h0000;
										newNote <= 1'b0;
									end
								8'h1B :
									begin
										amplitude <= 16'h2000;
										newNote <= 1'b0;
									end
								8'h06 :
									begin
										amplitude <= 16'h4000;
										newNote <= 1'b0;
									end
								8'h19 :
									begin
										amplitude <= 16'h6000;
										newNote <= 1'b0;
									end
								8'h05 :
									begin
										amplitude <= 16'h8000;
										newNote <= 1'b0;
									end
								8'h11 :
									begin
										amplitude <= 16'hA000;
										newNote <= 1'b0;
									end
								8'h10 :
									begin
										amplitude <= 16'hC000;
										newNote <= 1'b0;
									end
								8'h36 :
									begin
										amplitude <= 16'hE000;
										newNote <= 1'b0;
									end
								8'h38 :
									begin
										amplitude <= 16'hFFFF;
										newNote <= 1'b0;
									end
								8'h00 :
									begin
										phIncrs[voiceIdx] <= phIncrs[voiceIdx];
										newNote <= 1'b1;
									end
								default : 
									begin
										newNote <= 1'b0;
										phIncrs[voiceIdx] <= phIncrs[voiceIdx];
									end
							endcase
						readEn <= 1'b1;
						
						sampAddrA <= tblAddrs[voiceIdx];
						sampAddrB <= {1'b1,sampAddrA[11:0]};
				end
			end
		
			else if (sampFull) 
			begin
				sampReq <= 1'b0;
				readEn <= 1'b0;
			end
		end
	end
	
	
	
	logic [31:0] sampleInR, sampleInL;
	always @ (posedge LRCLK)
	begin
		if (i2sEmpty == 1'b0) 
		begin
			if (i2sReq == 1'b0) 
			begin
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
	
	shiftreg_N  shiftregL	 	 (.Clk(SCLK),
										  .Reset(Reset_h),
										  .Enable(~i2sEmpty),
										  .Shift_In(1'b0),
										  .Load(loadL),
										  .Shift_En(shiftLChannel),
										  .D(sampleInL),
										  .Shift_Out(shiftOutL),
										  .Data_Out());
													  
	shiftreg_N  shiftregR	 	 (.Clk(SCLK),
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
	//Assign one button to reset
	
	
	
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
		
		//KEYCODES
		//.keycode_export(keycode_new),
		.keycode_export(keycodes_new[0]),
		.keycode1_export(keycodes_new[1]),
		.keycode2_export(keycodes_new[2]),
		.keycode3_export(keycodes_new[3]),
		
		//LEDs and HEX
		.hex_digits_export({hex_num_4, hex_num_3, hex_num_1, hex_num_0}),
		.leds_export({hundreds, signs, LEDDummy}),
		
		//AMPLITUDE
		//.amp_export(amplitude),
		
		//OCTAVE
		.oct_external_connection_export(octave),
		
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
