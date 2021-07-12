module shiftreg_N (input  logic 						 Clk, Reset, Enable, Shift_In, Load, Shift_En,
						 input  logic [DATAWIDTH-1:0]  D,
						 output logic 						 Shift_Out,
						 output logic [DATAWIDTH-1:0]  Data_Out);
				  
	 parameter DATAWIDTH = 32;

    always_ff @ (posedge Clk)
    begin
	 	 if (Reset) //notice, this is a sycnrhonous reset, which is recommended on the FPGA
			  Data_Out <= {DATAWIDTH{1'b0}};
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
				   Data_Out <= { Data_Out[DATAWIDTH-2:0], Shift_In };
			  else
				   Data_Out <= Data_Out;
	    end
    end
	 // when shiftregs are disabled, continuously reading Shift_Out will stream 0's;
	 // ensures I2S always receives information
    assign Shift_Out = Enable? Data_Out[DATAWIDTH-1] : 1'b0;

endmodule
