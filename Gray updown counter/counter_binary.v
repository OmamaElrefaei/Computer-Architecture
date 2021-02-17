
// An n-bit binary up/down counter with synchronous 
// preset and clear.


module counter_binary 
	#(parameter n = 4)
	(input clk, clear, up_down, preset, 
	 input  [n-1:0]d_in, 
	 output [n-1:0]d_out);
	
	reg [n-1:0]counter;

	
	always @(posedge clk) begin
		
			if (clear) counter <= 0;
			else if (preset) counter <= d_in;
			else if (up_down) counter <= counter + 1;
			else counter <= counter - 1;
	end
			
	assign d_out = counter;
		
endmodule