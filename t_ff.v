
// A positive edge-triggered T-FF with an asynchronous clear.

module t_ff
	(input  t, clk, clr,
	 output reg q);
	 
	always@(posedge clk or posedge clr) begin
		if (clr)    q <= 0;
		else if (t) q <= ~ q;
		
	end
endmodule
