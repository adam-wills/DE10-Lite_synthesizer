module phasor(input  logic 		 Clk, Reset, Enable,
				  input  logic [31:0] phaseIncrement,
				  input  logic [31:0] fmInput,
				  output logic [19:0] interp,
				  output logic [11:0] wavetableAddr);
				  
	
	logic [31:0] phase;
	
	always_ff @ (posedge Clk)
	begin
		if (Reset) 
		begin
			phase <= 32'h0;
			wavetableAddr <= 12'h0;
			interp <= 20'b0;
		end
		else
		begin
			if (Enable)
			begin
				phase <= phase + phaseIncrement + fmInput;
				wavetableAddr <= phase[31:20];
				interp <= phase[19:0];
			end
			else
			begin
				phase <= phase;
				wavetableAddr <= wavetableAddr;
				interp <= interp;
			end
		end
	end
	
endmodule

	