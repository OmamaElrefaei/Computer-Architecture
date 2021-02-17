
`define NULL 0 
`define Width 8
`timescale 1ns/1ns
module alu_variable_width_tb; 

	integer input_file, scan_file, output_file; // file handler
	
	reg   [1:0]  control; 
	reg  signed [`Width-1:0]a, b, c_expected;
	wire signed [`Width-1:0]c; 

	// instantiate device under test	
 	alu_variable_width DUT(a, b, control, c); 
	
	realtime delay;
	reg [15:0] scale;	
	reg [7:0] op;	
	reg [1000:0]comment;
	reg clk_t;

	initial begin
		clk_t = 0;
		//Opening text file
		input_file  = $fopen("E:---/input_file.txt", "r"); 
		output_file = $fopen("E:--/output_file.txt", "w");
		if (input_file == `NULL) begin // If error opening file 
         		$display("input_file handle was NULL");
			$finish;
		end
		
		while (!$feof(input_file)) begin
			//read stimulus on rising edge of clk
			@(posedge clk_t)
				#1; 
				scan_file = $fscanf(input_file, "%b %b %b %t %s %b %s\n", control, a, b, delay, scale, c_expected, comment);
				$timeformat(-9, 0, scale);
				
			// check result on falling edge of clk
			@(negedge clk_t)
		
				case(control)
					2'b00: op = "+";
					2'b01: op = "-";
					2'b10: op = "*";
					2'b11: op = "/";
					default:;
				endcase 
				
				if (c === c_expected)
					$fdisplay(output_file,"Time is now%t, (a = %d) %s (b = %d), the expected output: c = %d, while the actual output: c = %d. Test passed.",$realtime, a, op, b, c_expected, c);
					
				else
					$fdisplay(output_file,"Time is now%t, (a = %d) %s (b = %d), the expected output: c = %d, while the actual output: c = %d. Test failed! Error message: Problem with %s",$realtime, a, op, b, c_expected, c, comment);
				
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
