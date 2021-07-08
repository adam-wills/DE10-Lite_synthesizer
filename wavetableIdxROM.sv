// currently only a lookup table for indexing MIDI notes, could be made to suit a
// musical spectrum by discretizing frequencies logarithmically but probs best to
// just use a function somehow
module tableIdxROM
#(
		parameter T_WIDTH = 8,
		          I_WIDTH = 32,
		          A_WIDTH = 7
)
(
		input  logic               Clk,
		input  logic [A_WIDTH-1:0] noteIdx,
		output logic [T_WIDTH-1:0] tableIdx,
		output logic [I_WIDTH-1:0] tableInterp
);

	reg   [I_WIDTH-1:0] idxROM [0:2**A_WIDTH];
	reg   [I_WIDTH-1:0] idxReg;
	reg   [T_WIDTH-1:0] interpROM[0:2**A_WIDTH];
	reg   [T_WIDTH-1:0] interpReg;
	
	initial begin
		$readmemh("./interpMem/tableIndices.txt", idxROM);
	end
	initial begin
		$readmemh("./interpMem/tableInterps.txt", interpROM);
	end
	
	always_ff @ (posedge Clk) begin
		idxReg <= idxROM[noteIdx];
		interpReg <= interpROM[noteIdx];
	end
	
	assign tableIdx = idxReg;
	assign tableInterp = interpReg;
	
endmodule
