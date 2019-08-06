module single_port_ram(
    data,
    addr,
    we,
    clk,
    q
);

    input [7:0] data;
    input [5:0] addr; // 2^6 = 64 bytes
    input we;         // we == 1 => write and we == 0 => read
    input clk;
    output [7:0] q;

    // Declare the RAM variable
    reg [7:0] RAM [63:0];

    // address register
    reg [5:0] addr_reg;

    always @ (posedge clk) begin
        if (we) // high is to write data into RAM
            RAM[addr] <= data;
        else    // low is to read data out
            addr_reg <= addr;   // get the address value which from the outside of the module
    end

    assign q = RAM[addr_reg];   // out the data to q

endmodule