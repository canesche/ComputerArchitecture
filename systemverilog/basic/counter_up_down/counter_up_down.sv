
/*
    Counter up and down
    clk == clock
    rst == reset
    ld  == load
    ud  == up (1) or down (0)
*/

module counterUpDown(
    input logic clk, rst, ld, ud,
    input logic [3:0] data,
    output logic [3:0] count
);

    always_ff @(posedge clk or posedge rst) begin
        if (rst) 
            count <= 0;
        else if (ld)
            count <= data;
        else if (ud)
            count <= count + 1;
        else
            count <= count - 1;
        
        $display("Counter = %4b", count);
    end
    
endmodule