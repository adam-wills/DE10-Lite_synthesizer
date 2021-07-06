module mux_oneHot (
							//input  logic [W-1:0]	 oneHot,
							//input  logic [DW-1:0] dataIn[W],
							//output logic [DW-1:0] dataOut
							input  logic [7:0]	 oneHot,
							input  logic [15:0] dataIn[8],
							output logic [15:0] dataOut
						 );
						 
	//parameter W = 8;
	//parameter DW = 16;
	always_comb
	begin
		//for (genvar i = 0; i < W; i++)
		//for (int i = 0; i < 8; i++)
		//begin
			//assign dataOut = oneHot[i] ? dataIn[i] : 'z;
			//dataOut = oneHot[i] ? dataIn[i] : 'z;
		//end
		case (oneHot)
			8'h80 :
				dataOut = dataIn[7];
			8'h40 :
				dataOut = dataIn[6];
			8'h20 :
				dataOut = dataIn[5];
			8'h10 :
				dataOut = dataIn[4];
			8'h08 :
				dataOut = dataIn[3];
			8'h04 :
				dataOut = dataIn[2];
			8'h02 :
				dataOut = dataIn[1];
			8'h01 :
				dataOut = dataIn[0];
			default :
				dataOut = dataIn[0];
		endcase
	end
	
endmodule
	
	
	
module mux4 
(
		input  logic [1:0]  sel,
		input  logic [15:0] dataIn[4],
		output logic [15:0] dataOut
);
				 
	always_comb
	begin
		case (sel)
			2'b00 :
				dataOut = dataIn[0];
			2'b01 :
				dataOut = dataIn[1];
			2'b10 :
				dataOut = dataIn[2];
			2'b11 :
				dataOut = dataIn[3];
			default :
				dataOut = dataIn[0];
		endcase
	end
endmodule

