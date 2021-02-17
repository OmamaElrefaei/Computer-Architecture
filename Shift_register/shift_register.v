
// A shift register to perform shift right, shift left, and load. 
// A zero clr signal resets all output bits.

`define Width 4

module shift_register   
		(input clk, clr, l_in, r_in, s0, s1, 
		 input [`Width-1:0]d, 
		 inout [`Width-1:0]q);
		  
		reg [1:0]sel;
		reg [`Width-1:0]o;
		  
		always@(posedge clk, negedge clr) begin
			if (~ clr) o <= 0;
			else begin
				sel = {s1, s0};
				case (sel)
					2'b00:   ;
					2'b01:   o <= {o[`Width-2:0], r_in};
					2'b10:   o <= {l_in, o[`Width-1:1]};
					2'b11:   o <= d;
					default: ;
				endcase
			end
		end
		assign q = o; //module ports defined as direction "inout" must be driven by the "assign" statement.
endmodule
