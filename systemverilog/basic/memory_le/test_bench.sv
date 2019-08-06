module top();

    logic [6:0] sw;
    logic [3:0] KEY, LEDR;

    mem_LE memory_le(
        .address(sw[6:2]),
        .clock(sw[1]),
        .data(KEY[3:0]),
        .wren(sw[0]),
        .q(LEDR[3:0])
    );

    initial begin
        $dumpfile("top.vcd");
        $dumpvars();
        sw[1] = 0;
        #2 sw[6:2] = 5'h01; KEY[3:0] = 4'ha;
        #3 sw[0] = 1;
        #10 sw[6:2] = 5'h02; KEY[3:0] = 4'hb;
        #10 sw[6:2] = 5'h03; KEY[3:0] = 4'hc;
        #10 sw[0] = 0;
        #10 sw[6:2] = 5'h01;
        #10 sw[6:2] = 5'h02;
        #10 sw[6:2] = 5'h03;

        #100 $finish();
    end

endmodule