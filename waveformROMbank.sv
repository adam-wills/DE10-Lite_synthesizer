module waveformROMbank
#(
	parameter D_WIDTH = 16,
	          A_WIDTH = 12
)
(
	input  logic               Clk, En,
	input  logic [1:0]         wave,
	input  logic [7:0]         octave,
	input  logic [A_WIDTH-1:0] addr,
	output logic [D_WIDTH-1:0] dOutInterp[0:1],
	output logic [D_WIDTH-1:0] dOutAnti[0:1]
);
	logic readEn;
	
	logic [D_WIDTH-1:0] sineSamps[0:1];
	logic [D_WIDTH-1:0] sawSamps[0:1][0:7];
	logic [D_WIDTH-1:0] sqrSamps[0:1][0:7];
	logic [D_WIDTH-1:0] triSamps[0:1][0:7];
	
	assign sawSamps[0][0] = sineSamps[0];
	assign sawSamps[1][0] = sineSamps[1];
	assign sqrSamps[0][0] = sineSamps[0];
	assign sqrSamps[1][0] = sineSamps[1];

	logic [D_WIDTH-1:0] sawOutsInterp[0:1];
	logic [D_WIDTH-1:0] sawOutsAnti[0:1];
	logic [D_WIDTH-1:0] sqrOutsInterp[0:1];
	logic [D_WIDTH-1:0] sqrOutsAnti[0:1];
	logic [D_WIDTH-1:0] triOutsInterp[0:1];
	logic [D_WIDTH-1:0] triOutsAnti[0:1];

	logic [D_WIDTH-1:0] outRegInterp[0:1];
	logic [D_WIDTH-1:0] outRegAnti[0:1];

	logic [A_WIDTH-1:0] addr_a;
	logic [A_WIDTH-1:0] addr_b;

	always_ff @ (posedge Clk) begin
		addr_a <= addr;
		addr_b <= addr + 1;
		readEn <= En;
	end

	always_comb begin
		case (wave)
			2'b00 : begin
				outRegInterp = sineSamps;
				outRegAnti = sineSamps;
			end
			2'b01 : begin
				outRegInterp = sawOutsInterp;
				outRegAnti = sawOutsAnti;
			end
			2'b10 : begin
				outRegInterp = '{16'h0, 16'h0};
				outRegAnti = '{16'h0, 16'h0};
			end
			2'b11 : begin
				outRegInterp = sqrOutsInterp;
				outRegAnti = sqrOutsAnti;
			end
		endcase
	end
	always_ff @ (negedge Clk) begin
	
		dOutInterp <= outRegInterp;
		dOutAnti <= outRegAnti;
	end
	
	sineRom4096	sineRom4096_inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sineSamps[0]),
		.q_b (sineSamps[1])
	);
	/*
	sawRom4096_0	sawRom4096_0inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawSamps[0][0]),
		.q_b (sawSamps[1][0])
	);
	*/					 
	sawRom4096_1	sawRom4096_1inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawSamps[0][1]),
		.q_b (sawSamps[1][1])
	);
												
	sawRom4096_2	sawRom4096_2inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawSamps[0][2]),
		.q_b (sawSamps[1][2])
	);
												
	sawRom4096_3	sawRom4096_3inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawSamps[0][3]),
		.q_b (sawSamps[1][3])
	);
												
	sawRom4096_4	sawRom4096_4inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawSamps[0][4]),
		.q_b (sawSamps[1][4])
	);
								 
	sawRom4096_5	sawRom4096_5inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawSamps[0][5]),
		.q_b (sawSamps[1][5])
	);
												
	sawRom4096_6	sawRom4096_6inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawSamps[0][6]),
		.q_b (sawSamps[1][6])
	);
												
	sawRom4096_7	sawRom4096_7inst 
	(
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sawSamps[0][7]),
		.q_b (sawSamps[1][7])
	);



	mux_oneHot sawMuxInterp [0:1]
	(
		.oneHot(octave),
		.dataIn(sawSamps),
		.dataOut(sawOutsInterp)
	);

	mux_oneHot sawMuxAnti [0:1]
	(
		.oneHot((octave >> 1)),
		.dataIn(sawSamps),
		.dataOut(sawOutsAnti)
	);


	/*
	sqrRom4096_0	sqrRom4096_0inst (
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrSamps[0][0]),
		.q_b (sqrSamps[1][0]));
	*/	 
	sqrRom4096_1	sqrRom4096_1inst (
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrSamps[0][1]),
		.q_b (sqrSamps[1][1]));
												
	sqrRom4096_2	sqrRom4096_2inst (
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrSamps[0][2]),
		.q_b (sqrSamps[1][2]));
												
	sqrRom4096_3	sqrRom4096_3inst (
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrSamps[0][3]),
		.q_b (sqrSamps[1][3]));
												
	sqrRom4096_4	sqrRom4096_4inst (
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrSamps[0][4]),
		.q_b (sqrSamps[1][4]));
								 
	sqrRom4096_5	sqrRom4096_5inst (
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrSamps[0][5]),
		.q_b (sqrSamps[1][5]));
												
	sqrRom4096_6	sqrRom4096_6inst (
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrSamps[0][6]),
		.q_b (sqrSamps[1][6]));
												
	sqrRom4096_7	sqrRom4096_7inst (
		.address_a(addr_a),
		.address_b(addr_b),
		.clock(Clk),
		.rden_a(readEn),
		.rden_b(readEn),
		.q_a(sqrSamps[0][7]),
		.q_b (sqrSamps[1][7]));



	mux_oneHot sqrMuxInterp [0:1]
	(
		.oneHot(octave),
		.dataIn(sqrSamps),
		.dataOut(sqrOutsInterp)
	);

	mux_oneHot sqrMuxAnti [0:1]
	(
		.oneHot((octave >> 1)),
		.dataIn(sqrSamps),
		.dataOut(sqrOutsAnti)
	);
	
	

endmodule


