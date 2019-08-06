// FUNCTION: y = !a!b!c + a!b!c + a!bc

module sillyfunction(
	input logic a, b, c,
	output logic y 
);

	assign y = ~a & ~b & ~c |
		    a & ~b & ~c |
		    a & ~b &  c; 

endmodule
