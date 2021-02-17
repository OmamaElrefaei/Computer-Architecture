
// An n-bit address, m-bit word size, single-port RAM.

`define n 4
`define m 4

module single_port_ram
	(input rw, enable, 
	 input  [`n-1:0]address, 
	 inout  [`m-1:0]data);

	reg [`m-1:0]word[0:2**`n-1];
	reg [`m-1:0]d;
	
	always@(*) begin
		if(enable) begin
			if(rw)	word[address] = data;
			else 		d = word[address];
		end
	end
	
	assign data = d;
		
endmodule
