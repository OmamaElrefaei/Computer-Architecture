
`define NULL 0 
`timescale 1ns/1ns
module edge_triggered_tff_tb; 

	integer input_file, scan_file, output_file; // file handler
 
	reg  x, y, clk, clk_t; 
	reg  q_expected; 
	wire q; 
	
	// instantiate device under test
	edge_triggered_tff DUT(x, y, clk, q);
	
	realtime delay;
	reg [15:0] scale;		
	reg [1000:0]comment;

	initial begin
		clk_t = 0;
		//Opening text file
		input_file  = $fopen("E:---/input_file.txt", "r"); 
		output_file = $fopen("E:---/output_file.txt","w");
		if (input_file == `NULL) begin // If error opening file 
         		$display("input_file handle was NULL");
			$finish;
		end

		while (!$feof(input_file)) begin
			//read stimulus on rising edge of clk
			@(posedge clk_t)
				#1; 
				scan_file = $fscanf(input_file, "%b %b %b %t %s %b %s\n", x, y, clk, delay, scale, q_expected, comment);
				$timeformat(-9, 0, scale);
				
			// check result on falling edge of clk
			@(negedge clk_t)
				
				if (q === q_expected)
					$fdisplay(output_file,"Time is now%t, x = %b, y = %b, clk = %b, the expected output: q = %b, while the actual output: q = %b. Test passed.",$realtime, x, y, clk, q_expected, q);
					
				else
					$fdisplay(output_file,"Time is now%t, x = %b, y = %b, clk = %b, the expected output: q = %b, while the actual output: q = %b. Test failed! Error message: Problem with %s",$realtime, x, y, clk, q_expected, q, comment);
				
		end
		input_file  = $fcloser(input_file); 
		output_file = $fcloser(output_file);
		$stop;
	end
	
	// generate clock
	always begin
		#10  clk_t = !clk_t;
	end 

	
endmodule
