
`define n 4

module gray_counter
	(input clk, clear, up_down,
	 output reg [`n-1:0] d_out);
	
	reg  [`n-1:0] d_bin;
	integer j;

	counter_binary  #(`n) bin_counter(clk, clear, up_down, 1'b0, , d_bin);
	
	
	always@(d_bin)begin
	
		d_out[`n-1] = d_bin[`n-1];
		
		for (j = `n -2;  j > 0; j = j-1) begin
			d_out[j] = d_bin [j+1] ^ d_bin [j]; 
		end
		
	end

	
endmodule 