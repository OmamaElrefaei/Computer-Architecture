
`define NULL 0 
`define n 4
`define m 4
`timescale 1ns/1ns
module dual_port_tb; 
	  integer input_file, scan_file, output_file; // file handler	
	  reg  r, w, clk_t;
	  reg  [`n-1:0]address_in; 
	  reg  [`n-1:0]address_out; 
	  reg  [`m-1:0]d_in, d_out_expected;  
	  wire [`m-1:0]d_out; 

	  // instantiate device under test	
	  dual_port DUT (r, w, address_in, address_out, d_in, d_out); 

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
					scan_file = $fscanf(input_file, "%b %b %b %b %b %d %s %b %s\n", r, w, address_in, address_out, d_in, delay, scale, d_out_expected, comment);
					
					$timeformat(-9, 0, scale);
				// check result on falling edge of clk
				@(negedge clk_t)
			 
					if (d_out === d_out_expected)
						$fdisplay(output_file,"Time is now%t, d_in = %b, r = %b, w = %b, address_in = %b, address_out = %b, the expected output: d_out = %b, while the actual output: d_out = %b. Test passed.", $realtime , d_in, r, w, address_in, address_out, d_out_expected, d_out);
							
					else
						$fdisplay(output_file,"Time is now%t, d_in = %b, r = %b, w = %b, address_in = %b, address_out = %b, the expected output: d_out = %b, while the actual output: d_out = %b. Test failed! Error message: Problem with %s", $realtime , d_in, r, w, address_in, address_out, d_out_expected, d_out, comment);
								
				
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
