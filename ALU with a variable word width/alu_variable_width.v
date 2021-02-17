
// an ALU with a variable word width.

`define Width 8
module alu_variable_width
	
	 (input signed[`Width-1:0]a, b, 
	  input [1:0]control, 
	  output reg signed [`Width-1:0]c);
	
	always @(*) begin
		case (control)
			 2'b00: c = a + b;
			 2'b01: c = a - b;
			 2'b10: c = a * b;
			 2'b11: c = a / b;
			 default: ; 
		endcase 
	end
	
endmodule