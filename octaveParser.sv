module octaveParser
(
	input  logic       Clk, Reset,
	input  logic [7:0] keycode,
	inout  logic [7:0] octaveBase,
	output logic [7:0] octave,
	output int         noteBase
);
	int noteNumber;
	int note;
	assign noteBase = noteNumber;
	
	always_ff @ (posedge Clk) begin
		if (Reset) begin
			octaveBase <= 8'h40;
			noteNumber <= 6;
		end
		else begin
			case (keycode)
				8'h2C : begin
					if (octaveBase == 8'h40)
						octaveBase <= 8'h40;
					else
						octaveBase <= (octaveBase << 1);
				end
				8'h2D : begin
					if (octaveBase == 8'h01)
						octaveBase <= 8'h01;
					else
						octaveBase <= (octaveBase >> 1);
				end
			endcase
			noteNumber <= note;
		end
	end
	
	always_comb begin
		case (octaveBase)
			8'h40 :
				note = 6;
			8'h20 :
				note = 18;
			8'h10 :
				note = 30;
			8'h08 :
				note = 42;
			8'h04 :
				note = 54;
			8'h02 :
				note = 66;
			8'h01 :
				note = 78;
			default :
				note = 78;
		endcase
	end
endmodule
