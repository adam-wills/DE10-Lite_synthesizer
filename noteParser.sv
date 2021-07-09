//keycode_old could be inout

module noteParser(
		input  logic        Clk, Reset,
		input  logic [7:0]  keycode_new, keycode_old, 
		input  logic [7:0]  octaveBase,
		output logic        noteOff, noteTrig,
		output int          noteIdx
);
	int noteNum, noteBase;
	assign noteIdx = noteBase + noteNum;
	
	
	always_comb begin
		case (octaveBase)
			8'h80 :
				noteBase = 6;
			8'h40 :
				noteBase = 18;
			8'h20 :
				noteBase = 30;
			8'h10 :
				noteBase = 42;
			8'h08 :
				noteBase = 54;
			8'h04 :
				noteBase = 66;
			8'h02 :
				noteBase = 78;
			8'h01 :
				noteBase = 90;
			default :
				noteBase = 90;
		endcase
	end
	
	always_ff @ (posedge Clk) begin
		if (Reset) begin
			noteNum <= 0;
			noteOff <= 0;
			noteTrig <= 0;
		end
		else begin
			case (keycode_new)
				8'h1D :
				begin
					noteNum <= 0;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h1B :
				begin
					noteNum <= 2;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h06 :
				begin
					noteNum <= 4;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
				end
				8'h19 :
				begin
					noteNum <= 6;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h05 :
				begin
					noteNum <= 8;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h11 :
				begin
					noteNum <= 10;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h10 :
				begin
					noteNum <= 12;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h36 : 
				begin
					noteNum <= 14;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h37 :
				begin
					noteNum <= 16;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h38 :
				begin
					noteNum <= 18;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h04 :
				begin
					noteNum <= 1;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h16 :
				begin
					noteNum <= 3;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h07 :
				begin
					noteNum <= 5;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h09 :
				begin
					noteNum <= 7;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h0A :
				begin
					noteNum <= 9;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h0B :
				begin
					noteNum <= 11;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h0D :
				begin
					noteNum <= 13;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h0E :
				begin
					noteNum <= 15;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
				end
				8'h0F :
				begin
					noteNum <= 17;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h33 :
				begin
					noteNum <= 19;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h34 :
				begin
					noteNum <= 21;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h14 :
				begin
					noteNum <= 10;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
				end
				8'h1A :
				begin
					noteNum <= 12;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h08 :
				begin
					noteNum <= 14;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h15 :
				begin
					noteNum <= 16;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h17 :
				begin
					noteNum <= 18;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h1C :
				begin
					noteNum <= 20;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h18 :
				begin
					noteNum <= 22;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h0C :
				begin
					noteNum <= 24;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h12 :
				begin
					noteNum <= 26;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h13 :
				begin
					noteNum <= 28;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				default :
				begin
					noteNum <= noteNum;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b1;
						noteTrig <= 1'b0;
					end
					else
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b0;
					end
				end
			endcase
		end
	end
endmodule
					