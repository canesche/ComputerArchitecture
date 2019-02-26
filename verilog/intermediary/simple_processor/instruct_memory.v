module instruct_memory(
	input clock,
	input [31:0] counter,
	output [31:0] output_instruction
);

reg [31:0] instruct_memory [99:0];

always @(posedge clock)
	begin
		instruct_memory[0] <= 32'b00001000100000000001000000000000;
	end

assign output_instruction = instruct_memory[counter];

endmodule
