
`define NULL 0 
`define n 4
`timescale 1ns/1ns
module counter_binary_tb; 
	integer input_file, scan_file, output_file; // file handler	
	reg   clk, clk_t, clear, up_down, preset; 
	reg  [`n-1:0]d_in, d_out_expected;
	wire [`n-1:0]d_out;
	
	// instantiate device under test	
  	counter_binary DUT(clk, clear, up_down, preset, d_in, d_out); 
	
	realtime delay;
	reg [15:0] scale;		
	reg [1000:0]comment;
	
 	initial begin
		clk_t = 0;
		//Opening text file
		input_file  =  $fopen ("E:---/input_file.txt", "r"); 
		output_file =  $fopen ("E:--/output_file.txt", "w");
		if (input_file == `NULL) begin  // If error opening file 
         		$display("input_file handle was NULL");
			$finish;
		end
			
		while (!$feof(input_file)) begin
			//read stimulus on rising edge of clk
			@(posedge clk_t)
				#1;
				scan_file = $fscanf(input_file, "%b %b %b %b %b %d %s %b %s\n", d_in, clk, clear, up_down, preset, delay, scale, d_out_expected, comment);
				$timeformat(-9, 0, scale);
				
			// check result on falling edge of clk
			@(negedge clk_t)
				if (d_out === d_out_expected)
					$fdisplay(output_file,"Time is now%t, d_in = %d, clk = %b, clear = %b, up_down = %b, preset = %b, the expected output: d_out = %d, while the actual output: d_out = %d. Test passed.", $realtime , d_in, clk, clear, up_down, preset, d_out_expected, d_out);
				else
					$fdisplay(output_file,"Time is now%t, d_in = %d, clk = %b, clear = %b, up_down = %b, preset = %b, the expected output: d_out = %d, while the actual output: d_out = %d. Test failed! Error message: Problem with %s" ,$realtime , d_in, clk, clear, up_down, preset, d_out_expected, d_out, comment);		
		end
		
		input_file  = $fcloser(input_file); 
		output_file = $fcloser(output_file);
		$stop;
	end
	
	// generate clock
	always begin
		#15;  clk_t = !clk_t;
	end

endmodule
