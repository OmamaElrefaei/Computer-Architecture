
`define NULL 0 
`define Width 4
`timescale 1ns/1ns
module shift_register_tb; 

	integer input_file, scan_file, output_file; // file handler
 
	reg s1, s0, r_in, l_in, clr,clk, clk_t; 
	reg [`Width-1:0] d, q_expected; 
	wire[`Width-1:0] q; 
 
	// instantiate device under test
	shift_register DUT(clk, clr, l_in, r_in, s0, s1, d, q);
	
	realtime delay;
	reg [15:0] scale;	
	reg [105:0] op;	
	reg [1000:0]comment;

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
				scan_file = $fscanf(input_file, "%b %b %b %b %b %b %b %t %s %b %s\n", d, l_in, r_in, s1, s0, clr, clk, delay, scale, q_expected, comment);
				$timeformat(-9, 0, scale);
				
			// check result on falling edge of clk
			@(negedge clk_t)
		
				case({s1, s0})
					2'b00: begin
						if(!clr) op = "clear";
						else op = "no action";
					       end
					2'b01: op = "shift right";
					2'b10: op = "shift left";
					2'b11: op = "load";
					default:;
				endcase 
				
				if (q === q_expected)
					$fdisplay(output_file,"Time is now%t, d = %b, l_in = %b, r_in = %b, clr = %b, clk = %b, the expected output: q = %b, while the actual output: q = %b. The shift register performs%s",$realtime, d, l_in, r_in, clr, clk, q_expected, q, op);
					
				else
					$fdisplay(output_file,"Time is now%t, d = %b, l_in = %b, r_in = %b, clr = %b, clk = %b, the expected output: q = %b, while the actual output: q = %b. Test failed! Error message: Problem with %s",$realtime, d, l_in, r_in, clr, clk, q_expected, q, comment);
				
		end
		input_file  = $fcloser(input_file); 
		output_file = $fcloser(output_file);
		$stop;
	end
	
	// generate clock
	always begin
		#5  clk_t = !clk_t;
	end 

	
endmodule