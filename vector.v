
module vector ();
	parameter WIDTH = 4;

	// Count the ones in the given vector
	function reg [$clog2(WIDTH+1)-1:0] count_ones (input reg [WIDTH-1:0]a);
		integer idx;
		
		count_ones = {WIDTH{1'b0}};  
		for( idx = 0; idx<WIDTH; idx = idx + 1) begin
			count_ones = count_ones + a[idx];
		end
		
	endfunction 

	// Find the parity of the vector
	function reg  parity (input reg [WIDTH-1:0]a);
		integer idx;
		
		parity = 1'b0;  
		for( idx = 0; idx<WIDTH; idx = idx + 1) begin
			parity = parity ^ a[idx];
		end
		
	endfunction 
	
	// Locate the index of the first one on the right in the vector.
	function integer Locate_one (input reg [WIDTH-1:0] a); 
		integer idx;
		
		Locate_one = WIDTH;
			for ( idx = WIDTH-1; idx>=0; idx= idx-1) begin
				if(a[idx] == 1'b1) Locate_one = idx;

			end 
			
	endfunction
	
endmodule