module clock_divider (
    input key,
    input clk,
    output reg led
);

    // we will need one register to keep the clock count number
    reg [22:0] count;
    always @(posedge clk) begin
        if (key) begin
            if (count == 0) begin
                led <= ~led;
            end
            count <= count + 1;  
        end else begin
            led <= 0;
            count <= 1;
        end
    end

endmodule