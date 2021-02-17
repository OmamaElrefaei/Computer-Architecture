
module mux_32
	#(parameter Bits = 5, Width = 32)
	(input [Width-1:0] d0, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10, d11, d12, d13, d14, d15, d16, 
				 d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31,
	 input [Bits-1:0] sel,
    	 output reg  [Width-1:0] y);
  
	always @(*) begin
		case (sel)
			 0: 		y = d0;
			 1: 		y = d1;
			 2: 		y = d2;
			 3: 		y = d3;
			 4: 		y = d4;
			 5: 		y = d5;
			 6: 		y = d6;
			 7: 		y = d7;
			 8: 		y = d8;
			 9: 		y = d9;
			10: 		y = d10;
			11: 		y = d11;
			12: 		y = d12;
			13: 		y = d13;
			14: 		y = d14;
			15: 		y = d15;
			16: 		y = d16;
			17: 		y = d17;
			18: 		y = d18;
			19: 		y = d19;
			20: 		y = d20;
			21: 		y = d21;
			22: 		y = d22;
			23: 		y = d23;
			24: 		y = d24;
			25: 		y = d25;
			26:	 	y = d26;
			27: 		y = d27;
			28: 		y = d28;
			29: 		y = d29;
			30: 		y = d30;
			31: 		y = d31;
			default: y = 32'b0;
		endcase 
	end

endmodule
