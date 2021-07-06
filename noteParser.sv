module noteParser(
		input  logic        Clk, Reset,
		input  logic [7:0]  keycode_new, keycode_old,
		output logic        noteOff, noteTrig,
		output int          noteIdx
);

	
	always_ff @ (posedge Clk) begin
		if (Reset)
			noteIdx <= -1;
		else begin
			case (keycode_new)
				8'h1D :
				begin
					noteIdx <= 0;
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
					noteIdx <= 2;
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
					noteIdx <= 4;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
				end
				8'h19 :
				begin
					noteIdx <= 6;
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
					noteIdx <= 8;
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
					noteIdx <= 10;
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
					noteIdx <= 12;
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
					noteIdx <= 14;
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
					noteIdx <= 16;
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
					noteIdx <= 18;
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
					noteIdx <= 5;
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
					noteIdx <= 7;
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
					noteIdx <= 9;
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
					noteIdx <= 11;
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
					noteIdx <= 13;
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
					noteIdx <= 15;
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
					noteIdx <= 17;
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
					noteIdx <= 19;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
				end
				8'h0F :
				begin
					noteIdx <= 21;
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
					noteIdx <= 23;
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
					noteIdx <= 25;
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
					noteIdx <= 10;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
				end
				8'h1A :
				begin
					noteIdx <= 12;
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
					noteIdx <= 14;
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
					noteIdx <= 16;
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
					noteIdx <= 18;
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
					noteIdx <= 20;
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
					noteIdx <= 22;
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
					noteIdx <= 24;
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
					noteIdx <= 26;
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
					noteIdx <= 28;
					if (keycode_old != keycode_new)
					begin
						noteOff <= 1'b0;
						noteTrig <= 1'b1;
					end
					else
						noteTrig <= 1'b0;
				end
				8'h2F :
				begin
					noteIdx <= 30;
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
					noteIdx <= noteIdx;
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
					