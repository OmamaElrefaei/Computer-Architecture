
module register
	#(parameter Width = 32)
	(input clk, 
	 input [Width-1:0] d,
	 output reg [Width-1:0] q);
	 
	 
	always@(posedge clk) begin
		q <= d;
	end
endmodule