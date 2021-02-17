
module mux_2
	#(parameter Width = 32)
	(input [Width-1:0] d0, d1,
	 input sel,
         output [Width-1:0] y);
  
	assign y = sel ? d1 : d0;

endmodule

