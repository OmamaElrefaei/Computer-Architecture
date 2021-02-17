
// An FSM has Moore and Mealy outputs. 

module inc_fsm  
	#(parameter S0 = 1'b0, S1 = 1'b1)
	(input u, d, reset, clk, 
	 output reg inc, dec, c);

	reg  [1:0] current_state;
	reg  [1:0] nextstate;
	
	always @(posedge clk, posedge reset)
		if (reset) current_state <= S0;
		else       current_state <= nextstate;
		
	always @(*)
		case (current_state)
			S0:begin
					c = 0;	
					if (u) begin
								inc = 1; 
								dec = 0;
								nextstate = S1;
							 end
					else   begin
								inc = 0; 
								dec = 0;
								nextstate = S0;
							 end
				end
					
			S1:begin
					c = 1;	
					if (d) begin
								inc = 0; 
								dec = 1;
								nextstate = S0;
							 end
					else   begin
								inc = 0; 
								dec = 0;
								nextstate = S1;
							 end
				end
			default: nextstate = S0;
		endcase
endmodule
