
// A register file has two read port and two write ports

`define Bits 5 
`define Width 32


module register_file
	
	(input  [`Bits -1:0] ra1, ra2, wa1, wa2, 
	 input  [`Width-1:0] wd1, wd2,
	 output [`Width-1:0] rd1, rd2, 
	 input  w1_en, w2_en);
	 
	wire a0 , a1 , a2 , a3 , a4 , a5 , a6 , a7 , a8 , a9 , a10, a11, a12, a13, a14, a15, 
	     a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31;
		  
	wire b0 , b1 , b2 , b3 , b4 , b5 , b6 , b7 , b8 , b9 , b10, b11, b12, b13, b14, b15, 
	     b16, b17, b18, b19, b20, b21, b22, b23, b24, b25, b26, b27, b28, b29, b30, b31;
		  
	
	wire clk0 , clk1 , clk2 , clk3 , clk4 , clk5 , clk6 , clk7 , clk8 , clk9 , clk10, clk11, clk12, clk13, clk14, clk15, 
    	     clk16, clk17, clk18, clk19, clk20, clk21, clk22, clk23, clk24, clk25, clk26, clk27, clk28, clk29, clk30, clk31;
		  
	wire [`Width-1:0] d0 , d1 , d2 , d3 , d4 , d5 , d6 , d7 , d8 , d9 , d10, d11, d12, d13, d14, d15, 
			  d16, d17, d18, d19, d20, d21, d22, d23, d24, d25, d26, d27, d28, d29, d30, d31;
							
	wire [`Width-1:0] q0 , q1 , q2 , q3 , q4 , q5 , q6 , q7 , q8 , q9 , q10, q11, q12, q13, q14, q15, 
			  q16, q17, q18, q19, q20, q21, q22, q23, q24, q25, q26, q27, q28, q29, q30, q31;
	
	decoder #(`Bits) dec_wa1(w1_en, wa1, 
					a0 , a1 , a2 , a3 , a4 , a5 , a6 , a7 , a8 , a9 , a10, a11, a12, a13, a14, a15, 
					a16, a17, a18, a19, a20, a21, a22, a23, a24, a25, a26, a27, a28, a29, a30, a31);
					
	decoder #(`Bits) dec_wa2(w2_en, wa2, 
					b0 , b1 , b2 , b3 , b4 , b5 , b6 , b7 , b8 , b9 , b10, b11, b12, b13, b14, b15, 
					b16, b17, b18, b19, b20, b21, b22, b23, b24, b25, b26, b27, b28, b29, b30, b31);
	
	or or1 (clk0 , a0 , b0 );
	or or2 (clk1 , a1 , b1 );
	or or3 (clk2 , a2 , b2 );
	or or4 (clk3 , a3 , b3 );
	or or5 (clk4 , a4 , b4 );
	or or6 (clk5 , a5 , b5 );
	or or7 (clk6 , a6 , b6 );
	or or8 (clk7 , a7 , b7 );
	or or9 (clk8 , a8 , b8 );
	or or10(clk9 , a9 , b9 );
	or or11(clk10, a10, b10);
	or or12(clk11, a11, b11);
	or or13(clk12, a12, b12);
	or or14(clk13, a13, b13);
	or or15(clk14, a14, b14);
	or or16(clk15, a15, b15);
	or or17(clk16, a16, b16);
	or or18(clk17, a17, b17);
	or or19(clk18, a18, b18);
	or or20(clk19, a19, b19);
	or or21(clk20, a20, b20);
	or or22(clk21, a21, b21);
	or or23(clk22, a22, b22);
	or or24(clk23, a23, b23);
	or or25(clk24, a24, b24);
	or or26(clk25, a25, b25);
	or or27(clk26, a26, b26);
	or or28(clk27, a27, b27);
	or or29(clk28, a28, b28);
	or or30(clk29, a29, b29);
	or or31(clk30, a30, b30);
	or or32(clk31, a31, b31);
	
	mux_2 #(`Width) mux_1 (wd2, wd1, a0 , d0 );
	mux_2 #(`Width) mux_2 (wd2, wd1, a1 , d1 );
	mux_2 #(`Width) mux_3 (wd2, wd1, a2 , d2 );
	mux_2 #(`Width) mux_4 (wd2, wd1, a3 , d3 );
	mux_2 #(`Width) mux_5 (wd2, wd1, a4 , d4 );
	mux_2 #(`Width) mux_6 (wd2, wd1, a5 , d5 );
	mux_2 #(`Width) mux_7 (wd2, wd1, a6 , d6 );
	mux_2 #(`Width) mux_8 (wd2, wd1, a7 , d7 );
	mux_2 #(`Width) mux_9 (wd2, wd1, a8 , d8 );
	mux_2 #(`Width) mux_10(wd2, wd1, a9 , d9 );
	mux_2 #(`Width) mux_11(wd2, wd1, a10, d10);
	mux_2 #(`Width) mux_12(wd2, wd1, a11, d11);
	mux_2 #(`Width) mux_13(wd2, wd1, a12, d12);
	mux_2 #(`Width) mux_14(wd2, wd1, a13, d13);
	mux_2 #(`Width) mux_15(wd2, wd1, a14, d14);
	mux_2 #(`Width) mux_16(wd2, wd1, a15, d15);
	mux_2 #(`Width) mux_17(wd2, wd1, a16, d16);
	mux_2 #(`Width) mux_18(wd2, wd1, a17, d17);
	mux_2 #(`Width) mux_19(wd2, wd1, a18, d18);
	mux_2 #(`Width) mux_20(wd2, wd1, a19, d19);
	mux_2 #(`Width) mux_21(wd2, wd1, a20, d20);
	mux_2 #(`Width) mux_22(wd2, wd1, a21, d21);
	mux_2 #(`Width) mux_23(wd2, wd1, a22, d22);
	mux_2 #(`Width) mux_24(wd2, wd1, a23, d23);
	mux_2 #(`Width) mux_25(wd2, wd1, a24, d24);
	mux_2 #(`Width) mux_26(wd2, wd1, a25, d25);
	mux_2 #(`Width) mux_27(wd2, wd1, a26, d26);
	mux_2 #(`Width) mux_28(wd2, wd1, a27, d27);
	mux_2 #(`Width) mux_29(wd2, wd1, a28, d28);
	mux_2 #(`Width) mux_30(wd2, wd1, a29, d29);
	mux_2 #(`Width) mux_31(wd2, wd1, a30, d30);
	mux_2 #(`Width) mux_32(wd2, wd1, a31, d31);
	
	register #(`Width) reg1 (clk0 , d0 , q0 );
	register #(`Width) reg2 (clk1 , d1 , q1 );
	register #(`Width) reg3 (clk2 , d2 , q2 );
	register #(`Width) reg4 (clk3 , d3 , q3 );
	register #(`Width) reg5 (clk4 , d4 , q4 );
	register #(`Width) reg6 (clk5 , d5 , q5 );
	register #(`Width) reg7 (clk6 , d6 , q6 );
	register #(`Width) reg8 (clk7 , d7 , q7 );
	register #(`Width) reg9 (clk8 , d8 , q8 );
	register #(`Width) reg10(clk9 , d9 , q9 );
	register #(`Width) reg11(clk10, d10, q10);
	register #(`Width) reg12(clk11, d11, q11);
	register #(`Width) reg13(clk12, d12, q12);
	register #(`Width) reg14(clk13, d13, q13);
	register #(`Width) reg15(clk14, d14, q14);
	register #(`Width) reg16(clk15, d15, q15);
	register #(`Width) reg17(clk16, d16, q16);
	register #(`Width) reg18(clk17, d17, q17);
	register #(`Width) reg19(clk18, d18, q18);
	register #(`Width) reg20(clk19, d19, q19);
	register #(`Width) reg21(clk20, d20, q20);
	register #(`Width) reg22(clk21, d21, q21);
	register #(`Width) reg23(clk22, d22, q22);
	register #(`Width) reg24(clk23, d23, q23);
	register #(`Width) reg25(clk24, d24, q24);
	register #(`Width) reg26(clk25, d25, q25);
	register #(`Width) reg27(clk26, d26, q26);
	register #(`Width) reg28(clk27, d27, q27);
	register #(`Width) reg29(clk28, d28, q28);
	register #(`Width) reg30(clk29, d29, q29);
	register #(`Width) reg31(clk30, d30, q30);
	register #(`Width) reg32(clk31, d31, q31);
	
	mux_32 #(`Bits, `Width) mux_ra1( q0 , q1 , q2 , q3 , q4 , q5 , q6 , q7 , 
					q8 , q9 , q10, q11, q12, q13, q14, q15, 
					q16, q17, q18, q19, q20, q21, q22, q23, 
					q24, q25, q26, q27, q28, q29, q30, q31, 
					ra1, rd1);
						
   	mux_32 #(`Bits, `Width) mux_ra2(q0 , q1 , q2 , q3 , q4 , q5 , q6 , q7 , 
				   	q8 , q9 , q10, q11, q12, q13, q14, q15, 
				   	q16, q17, q18, q19, q20, q21, q22, q23, 
				   	q24, q25, q26, q27, q28, q29, q30, q31, 
				   	ra2, rd2);
	
endmodule