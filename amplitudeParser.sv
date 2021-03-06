module amplitudeParser
(
	input  logic        Clk, Reset,
	input  logic [7:0]  keycode,
	output logic [15:0] amplitude
);

	always_ff @(posedge Clk) begin
		if (Reset)
			amplitude <= 16'hFFFF;
		else begin
		case (keycode)
			8'h35 :
				begin
					amplitude <= 16'h0000;
				end
			8'h1E :
				begin
					amplitude <= 16'h2000;
				end
			8'h1F :
				begin
					amplitude <= 16'h4000;
				end
			8'h20 :
				begin
					amplitude <= 16'h6000;
				end
			8'h21 :
				begin
					amplitude <= 16'h8000;
				end
			8'h22 :
				begin
					amplitude <= 16'hA000;
				end
			8'h23 :
				begin
					amplitude <= 16'hC000;
				end
			8'h24 :
				begin
					amplitude <= 16'hE000;
				end
			8'h25 :
				begin
					amplitude <= 16'hFFFF;
				end
		endcase
		end
	end
endmodule