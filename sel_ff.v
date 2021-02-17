
// D flip-flop with a 2-bit input selector

module sel_ff
	(input d3, d2, d1, d0, clk, clear,
	 input [1:0] sel,
	 output reg q);
	 
	 
	always@(posedge clk or posedge clear) begin
		if(clear) q <= 0;
		else begin
			case(sel) 
				2'b00:	q <= d0;
				2'b01:	q <= d1;
				2'b10:	q <= d2;
				2'b11:	q <= d3;
			endcase
		end
	end
	
endmodule