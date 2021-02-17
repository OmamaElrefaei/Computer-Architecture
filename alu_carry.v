
`define width 8
module alu_carry 

	(input signed [`width-1:0] a, b, 
  	 input cin,
	 input [1:0] control, 
	 output reg signed [`width-1:0]d,
	 output reg cout);

	reg  signed [`width:0] temp; 
	wire signed [`width:0] temp_cin;
	
	assign temp_cin[0] = cin;
	
	always@(*) begin 
		
		case(control) 
			2'b00:	d = a & b;
			2'b01:	d = a | b;
			2'b10:	d = a ^ b;
			2'b11: begin
						temp = {"0", a} + {"0", b} + temp_cin;
						d 	  = temp[`width-1: 0];
						cout = temp[`width];
					 end
			default: ;
		endcase
	end

endmodule