
module mux_oneHot 
(
		input  logic [7:0]  oneHot,
		input  logic [15:0] dataIn[8],
		output logic [15:0] dataOut
);
						 
	
	always_comb
	begin
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

/*
module mux_oneHot
#(
		parameter N_DATA = 6,
		          S_WIDTH = 8,
		          D_WIDTH = 16
)
(
		input  logic [S_WIDTH-1:0] oneHot,
		input  logic [D_WIDTH-1:0] dataIn[N_DATA],
		output logic [D_WIDTH-1:0] dataOut
);
	logic [D_WIDTH-1:0] dataReg;
	
	generate
		genvar i;
		for (i = 0; i < N_DATA; i = i+1)
			assign dataReg = (oneHot[i] == 1'b1) ? dataIn[i] : 'z;
	endgenerate
	
	assign dataOut = dataReg;
		
endmodule
*/	

	
	
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

