module memory_le(
    address,
    clock,
    data,
    we,
    q
);

    input [4:0] address;
    input clock;
    input [3:0] data;
    input we;
    output [3:0] q;

    logic [3:0] Mem [4:0];

    assign q = Mem[address];

    always_ff @(posedge clock) begin
        if (we)
            Mem[address] = data;
    end

endmodule