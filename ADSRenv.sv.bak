module ADSREnv(input  logic			Clk, Reset, trig, noteOff,
					input  logic [15:0]  A_inv, D_inv, R_inv,
					input  logic [8:0]	A,D,R,
					input  logic [15:0]  S,
					output logic [15:0]  env);
					
					    enum logic [2:0] {attack, decay, sustain, rel, off}   curr_state, next_state; 
						 
	logic [17:0] count;
	logic [15:0] aVal;
	logic [15:0] dVal_intermed;
	logic [15:0] dVal;
	logic [15:0] rVal;
	logic [15:0] rSub;
	logic [31:0] calc_intermed;
	
	unsigned_mult16 m0(.Clk(Clk),
						 .Reset(Reset),
						 .A(count[15:0]),
						 .B(A_inv),
						 .OUT(aVal));
						 
	unsigned_mult16 m1(.Clk(Clk),
						 .Reset(Reset),
						 .A(S),
						 .B(D_inv),
						 .OUT(dVal_intermed));
						 
	unsigned_mult16 m2(.Clk(Clk),
							 .Reset(Reset),
							 .A(dval_intermed),
							 .B(count[15:0]),
							 .OUT(dVal));
	/*
	unsigned_mult16(.Clk(Clk),
						 .Reset(Reset),
						 .A(count[15:0]),
						 .B(inv_mults[A]),
						 .OUT(aVal));
	*/
						 
	unsigned_mult16 m3(.Clk(Clk),
							 .Reset(Reset),
							 .A(R_inv),
							 .B(count[15:0]),
							 .OUT(rSub));

	//updates flip flop, current state is the only one
    always_ff @ (posedge Clk)  
    begin
        if (Reset)
		  begin
            curr_state <= off;
				//count <= 0;
				count <= 18'b0;
		  end
		  else
		  begin
				case (curr_state) 
				attack :
				begin
					if (count > (A << 6))
					begin
						next_state <= decay;
						count <= 18'b0;
					end
					else
					begin
						next_state <= attack;
						count <= count+1'b1;
					end
				end
				
				decay :
				begin
					if (count > (D << 6))
					begin
						next_state <= sustain;
						count <= 18'b0;
						
					end
					else
					begin
						next_state <= decay;
						count <= count+1'b1;
					end
				end
				
				sustain :
				begin
					if ((count > 44100) | (noteOff == 1'b1))
					begin
						next_state <= rel;
						count <= 18'b0;
						rVal <= env;
					end
					else
					begin
						next_state <= sustain;
						count <= count+1'b1;
					end
				end
				
				rel :
				begin
					if ((count > (R << 6)) | (env < 16'h0005))
					begin
						next_state <= off;
						count <= 18'b0;
					end
					else
					begin
						next_state <= rel;
						count <= count+1'b1;
					end
				end
				
				off :
				begin
					if (trig)
					begin
						next_state <= attack;
						count <= count+1'b1;
					end
					else
					begin
						next_state <= off;
						count <= 18'b0;
					end
				end
				
				default : ;
        endcase
		end
    end

    // Assign outputs based on state
	always_comb
    begin
        
		  //next_state  = curr_state;	//required because I haven't enumerated all possibilities below
        
   
		  // Assign outputs based on ‘state’
        case (curr_state) 
	   	   attack : 
	         begin
                env = aVal;
		      end
	   	   decay : 
		      begin
					 calc_intermed = 32'h0000FFFF - {16'h0000,dVal_intermed};
					 env = calc_intermed[15:0];
		      end
	   	   sustain :
		      begin 
                env = S;
		      end
				rel :
					
				begin
					calc_intermed = {16'h0000,rVal} - {16'h0000,rSub};
					env = calc_intermed[15:0];
				end
				default : 
					env = 16'h0000;
        endcase
    end
endmodule
