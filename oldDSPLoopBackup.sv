always_ff @ (posedge MAX10_CLK2_50)
	begin
		if (Reset_h) 
		begin
			sampReq <= 1'b0;
			//fmInputs <= '{32'b0, 32'b0, 32'b0, 32'b0};
		end

		else
		begin
			if ((sampHalfFull | sampEmpty | i2sEmpty | i2sHalfEmpty) & (~i2sFull)) 
			begin
				if (sampReq == 1'b1)
				begin
					sampReq <= 1'b0;
					for (int i = 0; i < 4; i++)
					begin
						if (newNote[i] == 1'b1)
							keycodes_old[i] <= keycodes_new[i];
					end
					sigs[voiceIdx] <= waveSamples[waveforms[voiceIdx]];
				end
				else
				begin
					sampReq <= 1'b1;
					for (int i = 0; i < 4; i++) 
					begin
						if (keycodes_old[i] == 8'h00)
						begin
							envTrigs[i] = (keycodes_new[i] == 8'h00)? 1'b0 : 1'b1;
						end
						case (keycodes_new[i])
						//case(keycode_new)
								8'h04 :
									begin
									phIncrs[i][31:0] <= freq32bit[0][31:0];
									newNote[i] <= 1'b1;
									end
								8'h1A :
									begin
									phIncrs[i][31:0] <= freq32bit[1][31:0];
									newNote[i] <= 1'b1;
									end
								8'h16 :
									begin
									phIncrs[i][31:0] <= freq32bit[2][31:0];
									newNote[i] <= 1'b1;
									end
								8'h08 :
									begin
									phIncrs[i][31:0] <= freq32bit[3][31:0];
									newNote[i] <= 1'b1;
									end
								8'h07 :
									begin
									phIncrs[i][31:0] <= freq32bit[4][31:0];
									newNote[i] <= 1'b1;
									end
								8'h09 :
									begin
									phIncrs[i][31:0] <= freq32bit[5][31:0];
									newNote[i] <= 1'b1;
									end
								8'h17 :
									begin
									phIncrs[i][31:0] <= freq32bit[6][31:0];
									newNote[i] <= 1'b1;
									end
								8'h0A :
									begin
									phIncrs[i][31:0] <= freq32bit[7][31:0];
									newNote[i] <= 1'b1;	
									end
								8'h1C :
									begin
									phIncrs[i][31:0] <= freq32bit[8][31:0];
									newNote[i] <= 1'b1;
									end
								8'h0B :
									begin
									phIncrs[i][31:0] <= freq32bit[9][31:0];
									newNote[i] <= 1'b1;
									end
								8'h18 :
									begin
									phIncrs[i][31:0] <= freq32bit[10][31:0];
									newNote[i] <= 1'b1;
									end
								8'h0D :
									begin
									phIncrs[i][31:0] <= freq32bit[11][31:0];
									newNote[i] <= 1'b1;
									end
								8'h0E :
									begin
									phIncrs[i][31:0] <= freq32bit[12][31:0];
									newNote[i] <= 1'b1;
									end
								8'h12 :
									begin
									phIncrs[i][31:0] <= freq32bit[13][31:0];
									newNote[i] <= 1'b1;
									end
								8'h0F :
									begin
									phIncrs[i][31:0] <= freq32bit[14][31:0];
									newNote[i] <= 1'b1;	
									end
								8'h13 :
									begin
									phIncrs[i][31:0] <= freq32bit[15][31:0];
									newNote[i] <= 1'b1;
									end
								8'h33 :
									begin
									phIncrs[i][31:0] <= freq32bit[16][31:0];
									newNote[i] <= 1'b1;
									end
								8'h34 :
									begin
									phIncrs[i][31:0] <= freq32bit[17][31:0];
									newNote[i] <= 1'b1;
									end
								8'h1D :
									begin
										amplitudes[i] <= 16'h0000;
									end
								8'h1B :
									begin
										amplitudes[i] <= 16'h2000;
									end
								8'h06 :
									begin
										amplitudes[i] <= 16'h4000;
									end
								8'h19 :
									begin
										amplitudes[i] <= 16'h6000;
									end
								8'h05 :
									begin
										amplitudes[i] <= 16'h8000;
									end
								8'h11 :
									begin
										amplitudes[i] <= 16'hA000;
									end
								8'h10 :
									begin
										amplitudes[i] <= 16'hC000;
									end
								8'h36 :
									begin
										amplitudes[i] <= 16'hE000;
									end
								8'h38 :
									begin
										amplitudes[i] <= 16'hFFFF;
									end
								8'h00 :
									begin
										noteOffs[i] = (keycodes_old[i] == 8'h00)? 1'b0: 1'b1;
										newNote[i] <= 1'b1;
									end
								default :
									begin
									phIncrs[i][31:0] <= phIncrs[i][31:0];
									end
							endcase
							
						//antiInterp[i] <= ~interp[i];
						//interpSamples[i] <= sineTable[tblAddrs[i][12:0]];
						case (waveforms[i])
							2'b00:
								begin
									interpSamples[i] <= sineTable[tblAddrs[i][11:0]];
									//antiInterpSamples[i] <= sineTable[tblAddrs[i][11:0]+1];
								end
							2'b01:
								begin
									
									readAddr <= sawSqAddr[i];
									interpSamples[i] <= sawOutputs[i];
								end
							2'b10:
								begin
									
									readAddr <= sawSqAddr[i];
									interpSamples[i] <= sqrOutputs[i];
								end
							/*
							2'b11:
								begin
									readAddr <= sawSqAddr[i];
									interpSamples[i] <= triSamps;
								end
							*/
							default:
								begin
									interpSamples[i] <= sineTable[tblAddrs[i][11:0]];
									//antiInterpSamples[i] <= sineTable[tblAddrs[i][11:0]+1];
								end
						endcase
						//sigs[i] <= (interpOutputs[i]+antiInterpOutputs[i]) >> 1;
						//sampSums[i] <= sigs[i][15:0];
						
					end
					//sigSum <= (outputs[0]+outputs[1]+outputs[2]+outputs[3]) >> 2;
					
					sigSum <= (sigs[0]+sigs[1]+sigs[2]+sigs[3]) >> 2;
					
					//=======================================================
					//   FM assignments can be uncommented/written here
					//=======================================================
					
					//fmInputs[2] <= sigs[2];
					//fmInputs[3] <= sigs[1];
					//fmInputs[1] <= sigSum;
					
					//=======================================================
					//=======================================================
					
					fifoDin <= {sigSum[15:0],16'b0};
					//keycodes_old[i] = keycode_new;
				end
				
			end
		
			else if (sampFull) 
			begin
				sampReq <= 1'b0;
			end
		end
	end
	
	
	
	logic [31:0] sampleInR, sampleInL;
	always @ (posedge LRCLK)
	begin
		if (i2sEmpty == 1'b0) 
		begin
			if (i2sReq == 1'b0) 
			begin
				i2sReq <= 1'b1;
				sampleInR <= fifoDout;
				sampleInL <= fifoDout;
			end
			else
				i2sReq <= 1'b0;
		end
	end