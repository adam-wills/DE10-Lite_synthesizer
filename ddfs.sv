module directDigitalOscillator
#(
		parameter P_WIDTH = 32, // phasor precision
		          D_WIDTH = 16, // width of sample data
		          A_WIDTH = 12  // width of sample address
)
(
		input  logic                   Clk, Reset, En, Load,            
		input  logic [P_WIDTH-1:0]     fCarrier, fOffset,
		input  logic [P_WIDTH-1:0]     phaseOffset,
		input  logic [D_WIDTH-1:0]     env,
		input  logic [D_WIDTH-1:0]     sampIn,
		output logic                   readEn,
		output logic [A_WIDTH-1:0]     addrOut,
		output logic [(2*D_WIDTH)-1:0] sigOut,
		output logic [P_WIDTH-A_WIDTH-1:0] sampInterp,
);
	
	localparam I_WIDTH = P_WIDTH-A_WIDTH; // interpolation width
	//localparam OUT_IDX = 80-(2*D_WIDTH);
	
	logic                   readEn_reg;
	logic [I_WIDTH-1:0]     interp_reg;
	logic [D_WIDTH-1:0]     samp_reg;
	logic [A_WIDTH-1:0]     addr_reg, addr_next;
	logic [(2*D_WIDTH)-1:0] sig_reg, sig_next;
	
	
			
	phasor #(.DW(P_WIDTH), .AW(A_WIDTH)) phaseOsc
	(
		.Clk(Clk),
		.Reset(Reset),
		.Enable(En),
		.phaseIncrement(fCarrier),
		.fmInput(fOffset),
		.phaseOffset(phaseOffset),
		.interp(interp_reg),
		.wavetableAddr(addr_next)
	);
	
	
	
	always_ff @ (posedge Clk) begin
		if (Reset) begin
			sig_reg <= {(2*D_WIDTH){1'b0}};
			addr_reg <= {(A_WIDTH){1'b0}};
			readEn_reg <= 1'b0;
			samp_reg <= {(D_WIDTH){1'b0}};
		end
		else begin
			if (En) begin
				sig_reg <= sig_next;
				addr_reg <= addr_next;
				readEn_reg <= 1'b1;
			end
			else begin
				sig_reg <= {(2*D_WIDTH){1'b0}};
				addr_reg <= addr_reg;
				readEn_reg <= 1'b0;
			end
		end
	end
	
	always_ff @ (negedge Clk) begin
		readEn_reg <= 1'b0;
		if (Load) begin
			samp_reg <= sampIn;
		end
		else begin
			samp_reg <= samp_reg;
		end
	end
	
	assign sigOut = sig_reg;
	assign addrOut = addr_reg;
	assign readEn = readEn_reg;
	assign sig_next = env*samp_reg;
	assign sampInterp = interp_reg;

endmodule	