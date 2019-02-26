module pc_counter (
	input clock,
	output [31:0] address
);

reg [31:0] counter;

initial 
	begin
		counter = 32'b00000000000000000000000000000000;
	end

always @(negedge clock) begin
	counter = counter + 32'b0000000000000000000000000000001;
end

assign address = counter;

endmodule
