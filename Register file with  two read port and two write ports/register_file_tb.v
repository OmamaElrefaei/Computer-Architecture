
`define NULL 0 
`define Bits 5 
`define Width 32
`timescale 1ns/1ns

module register_file_tb; 

	integer input_file, scan_file, output_file; // file handler
	
	reg w1_en, w2_en;
	reg [`Bits-1:0] ra1, ra2, wa1, wa2; 
	reg [`Width-1:0] wd2, wd1, rd1_expected, rd2_expected;   
	wire[`Width-1:0] rd1, rd2; 
	
	register_file DUT(ra1, ra2, wa1, wa2, wd1, wd2, rd1, rd2, w1_en, w2_en); 

	realtime delay;
	reg [15:0] scale;		
	reg [1000:0]comment;
	reg clk_t;
	
	initial begin
		clk_t = 0;
		//Opening text file
		input_file  = $fopen("E:--/input_file.txt", "r"); 
		output_file = $fopen("E:-/output_file.txt", "w");
		if (input_file == `NULL) begin // If error opening file 
         		$display("input_file handle was NULL");
			$finish;
		end
		
		while (!$feof(input_file)) begin
			//read stimulus on rising edge of clk
			@(posedge clk_t)
				#1; 
				scan_file = $fscanf(input_file, "%b %b %b %b %b %b %b %b %t %s %b %b %s\n", ra1, ra2, wa1, wa2, wd1, wd2, w1_en, w2_en, delay, scale, rd1_expected, rd2_expected, comment);
				$timeformat(-9, 0, scale);
				
			// check result on falling edge of clk
			@(negedge clk_t)
				
				if (rd1 === rd1_expected && rd2 === rd2_expected)
					$fdisplay(output_file,"Time is now%t, Read Register_1 = %b, Read Register_2 = %b, Write Register_1 = %b, Write Register_2 = %b, Write Data_1 = %b, Write Data_2 = %b, Write_1 = %b, Write_2 = %b, the expected output: Read Data_1 = %b, Read Data_2 = %b, while the actual output: Read Data_1 = %b, Read Data_2 = %b. Test passed.",$realtime, ra1, ra2, wa1, wa2, wd1, wd2, w1_en, w2_en, rd1_expected, rd2_expected, rd1, rd2);
					
				else
					$fdisplay(output_file,"Time is now%t, Read Register_1 = %b, Read Register_2 = %b, Write Register_1 = %b, Write Register_2 = %b, Write Data_1 = %b, Write Data_2 = %b, Write_1 = %b, Write_2 = %b, the expected output: Read Data_1 = %b, Read Data_2 = %b, while the actual output: Read Data_1 = %b, Read Data_2 = %b. Test failed! Error message: Problem with %s",$realtime, ra1, ra2, wa1, wa2, wd1, wd2, w1_en, w2_en, rd1_expected, rd2_expected, rd1, rd2, comment);
				
		end
		input_file  = $fcloser(input_file); 
		output_file = $fcloser(output_file);
		$stop;
	end
	
	// generate clock
	always begin
		#25  clk_t = !clk_t;
	end 

	
endmodule
