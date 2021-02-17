
module decoder
	#(parameter Bits = 5)
	(input enable,
	 input [Bits -1:0] address, 
	 output reg  out0 , out1 , out2 , out3 , out4 , out5 , out6 , out7 , 
		     out8 , out9 , out10, out11, out12, out13, out14, out15, 
		     out16, out17, out18, out19, out20, out21, out22, out23, 
         	     out24, out25, out26, out27, out28, out29, out30, out31);
	
	always @(*) begin
		if (enable) begin
			case (address)
				 0: 		out0  = 1'b1;
				 1: 		out1  = 1'b1;
				 2: 		out2  = 1'b1;
				 3: 		out3  = 1'b1;
				 4: 		out4  = 1'b1;
				 5: 		out5  = 1'b1;
				 6: 		out6  = 1'b1;
				 7: 		out7  = 1'b1;
				 8: 		out8  = 1'b1;
				 9: 		out9  = 1'b1;
				10: 		out10 = 1'b1;
				11: 		out11 = 1'b1;
				12: 		out12 = 1'b1;
				13: 		out13 = 1'b1;
				14: 		out14 = 1'b1;
				15: 		out15 = 1'b1;
				16: 		out16 = 1'b1;
				17: 		out17 = 1'b1;
				18: 		out18 = 1'b1;
				19: 		out19 = 1'b1;
				20: 		out20 = 1'b1;
				21: 		out21 = 1'b1;
				22: 		out22 = 1'b1;
				23: 		out23 = 1'b1;
				24: 		out24 = 1'b1;
				25: 		out25 = 1'b1;
				26:	 	out26 = 1'b1;
				27: 		out27 = 1'b1;
				28: 		out28 = 1'b1;
				29: 		out29 = 1'b1;
				30: 		out30 = 1'b1;
				31: 		out31 = 1'b1;
				default: begin 
					out0  = 1'b0; out1  = 1'b0; out2  = 1'b0; out3  = 1'b0; out4  = 1'b0; out5  = 1'b0; out6  = 1'b0; 
					out7  = 1'b0; out8  = 1'b0; out9  = 1'b0; out10 = 1'b0; out11 = 1'b0; out12 = 1'b0; out13 = 1'b0; 
					out14 = 1'b0; out15 = 1'b0; out16 = 1'b0; out17 = 1'b0; out18 = 1'b0; out19 = 1'b0; out20 = 1'b0; 
					out21 = 1'b0; out22 = 1'b0; out23 = 1'b0; out24 = 1'b0; out25 = 1'b0; out26 = 1'b0; out27 = 1'b0; 
					out28 = 1'b0; out29 = 1'b0; out30 = 1'b0; out31 = 1'b0;
				end
			endcase 
		end
		
		else begin 
				out0  = 1'b0; out1  = 1'b0; out2  = 1'b0; out3  = 1'b0; out4  = 1'b0; out5  = 1'b0; out6  = 1'b0; 
				out7  = 1'b0; out8  = 1'b0; out9  = 1'b0; out10 = 1'b0; out11 = 1'b0; out12 = 1'b0; out13 = 1'b0; 
				out14 = 1'b0; out15 = 1'b0; out16 = 1'b0; out17 = 1'b0; out18 = 1'b0; out19 = 1'b0; out20 = 1'b0; 
				out21 = 1'b0; out22 = 1'b0; out23 = 1'b0; out24 = 1'b0; out25 = 1'b0; out26 = 1'b0; out27 = 1'b0; 
				out28 = 1'b0; out29 = 1'b0; out30 = 1'b0; out31 = 1'b0;
		end
	end

endmodule

