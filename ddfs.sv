module directDigital
#(
		parameter P_WIDTH = 32,
		          A_WIDTH = 12
)
(
		input  logic               Clk, Reset
		input  logic [P_WIDTH-1:0] fCarrier, fOffset,
		input  logic [P_WIDTH-1:0] phase,
		input  logic [15:0]        env,
		output logic [A_WIDTH-1:0] addrOut,
		output logic [31:0]        sigOut,
		output logic               pulseOut	
);

	logic [P_WIDTH-1:0] fc, p_next, pc;
	