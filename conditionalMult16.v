module conditionalMult16 (
		input  logic        Clk, condition,
		input  logic [15:0] dataa,
		input  logic [15:0] datab,
		output logic [31:0] result);
		
	logic [31:0] mult16Result;
	mult16_ip mult16_inst (
			.clock(Clk),
			.dataa(dataa),
			.datab(datab),
			.result(mult16result));
			
	always_ff @ (posedge Clk) begin
		if (condition == 1'b1)
			result <= mult16Result;
		else
			result <= {16'b0,dataa};
	end
endmodule
		