
module mux_2
	(input d0, d1,
	 input sel,
    output y);
  
	assign y = sel ? d1 : d0;

endmodule