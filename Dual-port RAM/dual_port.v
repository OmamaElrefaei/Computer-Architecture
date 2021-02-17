
// An n-bit address, m-bit word size, dual-port RAM.

`define n 4
`define m 4

module dual_port 
	(input r, w, 
	 input  [`n-1:0]address_in, address_out, 
	 input  [`m-1:0]d_in, 
	 output reg [`m-1:0]d_out);

	reg[`m-1:0]word[0:2**`n-1];
	
	always@(*) begin
		if(w) word[address_in] = d_in;
		if(r) d_out = word[address_out];
	end
		
endmodule
