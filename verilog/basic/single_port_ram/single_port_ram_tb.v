`timescale 1ns / 1ps

module single_port_ram_tb();

    reg [7:0] data;
    reg [5:0] addr; // 2^6 = 64 bytes
    reg we;         // we == 1 => write and we == 0 => read
    reg clk;
    wire [7:0] q;

    single_port_ram(
        .data(data),
        .addr(addr),
        .we(we),
        .clk(clk),
        .q(q)
    );

    // testbench
    initial begin
        clk = 1'b1;
        forever #10 clk = ~clk;
    end

    // now we have write 3 data into the address 0,1,2, then read it
    initial begin
        data = 8'h01;
        addr = 5'd0;
        we   = 1'b1; // write 
        #10;

        data = 8'h02;
        addr = 5'd01;
        #10;

        data = 8'h03;
        addr = 5'd02;
        #10;

        // now begin to read it
        addr = 5'd0;
        we = 1'b0; // read
        #10;

        addr = 5'd01;
        we = 1'b0; // read
        #10;

        addr = 5'd02;
        we = 1'b0; // read
        #10;
    end

endmodule