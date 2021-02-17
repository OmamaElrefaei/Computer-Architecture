
`define NULL 0 
`timescale 1ns/1ns

module inc_fsm_tb; 
	integer input_file, scan_file, output_file; // file handler
	
	parameter S1 = 1;
	parameter S0 = 0;  
	reg u, d, reset, clk, clk_t, c_expected, inc_expected, dec_expected; 
	wire inc, dec, c; 
	
	// instantiate device under test	
	inc_fsm #(S1 , S0)
	DUT  (u, d, reset, clk, inc, dec, c);

	realtime delay;
	reg [15:0] scale;		
	reg [1000:0]comment;


	initial begin
		clk_t = 0;
		//Opening text file
		input_file  =  $fopen ("E:--/input_file.txt", "r"); 
		output_file =  $fopen ("E:-/output_file.txt", "w");
		
		if (input_file == `NULL) begin  // If error opening file 
         		$display("input_file handle was NULL");
			$finish;
		end	
	
		while (!$feof(input_file)) begin
			//read stimulus on rising edge of clk
			@(posedge clk_t)
				#1;
				scan_file = $fscanf(input_file, "%b %b %b %b %d %s %b %b %b %s\n", u, d, reset, clk, delay, scale, inc_expected, dec_expected, c_expected, comment);
				
				$timeformat(-9, 0, scale);
			// check result on falling edge of clk
			@(negedge clk_t)
		 
				if ((c === c_expected) && (inc === inc_expected) && (dec === dec_expected))
					$fdisplay(output_file,"Time is now%t, u = %b, d = %b, reset = %b, clk = %b, the expected output: c = %b, inc = %b, dec = %b, while the actual output: c = %b, inc = %b, dec = %b. Test passed.", $realtime , u, d, reset, clk, c_expected, inc_expected, dec_expected, c, inc, dec);
						
				else 
					$fdisplay(output_file,"Time is now%t, u = %b, d = %b, reset = %b, clk = %b, the expected output: c = %b, inc = %b, dec = %b, while the actual output: c = %b, inc = %b, dec = %b. Test failed! Error message: Problem with %s", $realtime,u, d, reset, clk, c_expected, inc_expected, dec_expected, c, inc, dec, comment);
							
			
		end
		input_file  = $fcloser(input_file); 
		output_file = $fcloser(output_file);
		$stop;
	end
	
	// generate clock
	always begin
		#5;  clk_t = !clk_t;
	end 
	
endmodule
