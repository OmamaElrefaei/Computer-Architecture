
module edge_triggered_tff
	
	(input x, y, clk, 
	 output q);
	 
	wire a, b, ny, nqtemp, qtemp;
	
	inv inv1(y, ny);
	inv inv2(qtemp, nqtemp);
	
	mux_2 mux_2(qtemp, nqtemp, x, a);
	
	and_2 and_2(a, ny, b);
	
	d_ff d_ff(b, clk, qtemp);

	
	assign q = qtemp; 

endmodule