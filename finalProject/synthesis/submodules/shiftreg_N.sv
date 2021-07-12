module shiftreg_N 
#(
		parameter D_WIDTH = 32
)
(
		input  logic                Clk, Reset, Enable, Shift_In, Load, Shift_En,
		input  logic [D_WIDTH-1:0]  D,
		output logic                Shift_Out,
		output logic [D_WIDTH-1:0]  Data_Out
);
				  
		
    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= {D_WIDTH{1'b0}};
		 else if (Load)
		 begin
			  if (Enable)
				   Data_Out <= D;
			  else
				   Data_Out <= Data_Out;
		 end
		 else if (Shift_En)
		 begin
			  if (Enable)
				   Data_Out <= { Data_Out[D_WIDTH-2:0], Shift_In };
			  else
				   Data_Out <= Data_Out;
	    end
    end
	 // when shiftregs are disabled, continuously reading Shift_Out will stream 0's;
	 // ensures I2S always receives information
    assign Shift_Out = Enable? Data_Out[D_WIDTH-1] : 1'b0;

endmodule
