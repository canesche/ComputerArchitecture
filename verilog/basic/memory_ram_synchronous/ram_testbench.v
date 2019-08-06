// Test Bench for memory modeling
module memory_tb ();
reg clk, rst; 
reg      read_rq;
reg      write_rq;
reg[5:0] rw_address;
reg[7:0] write_data;
wire[7:0] read_data;
reg [5:0] q_cnt;
integer seed;
integer out, rout;

initial 
begin
    clk = 0;
   forever #10 clk = ~clk;
end

initial begin 
    rst = 0;
    # 50 rst = 1;
end

always @(posedge clk or
    negedge rst)
begin
    if (!rst)
    begin 
     q_cnt <= 0;
     write_data <= 'b0;
     out = $fopen("mem_ram.vec","w");
     rout = $fopen("mem_ram_read.vec","w");
    end
    else
    begin
        if (q_cnt < 63)
        begin
            q_cnt <= q_cnt+1;
            write_data <= $random(seed) & 'hFF;
            read_rq <= 0;
            write_rq <= 1;
            rw_address <= q_cnt;
            $fdisplay(out, "Address::%d:: %b :: -- contents in hex %h", rw_address, write_data, write_data);
        end
        else
        begin
            q_cnt <= q_cnt;
            write_data <= write_data;
            rw_address <= $random(seed) & 'h3F;
            read_rq <= 1;
            write_rq <= 0;
            $fdisplay(rout,"Address::%d:: %b :: -- read contents in hex %h", rw_address, read_data, read_data);
        end
    end
end

mem_ram_sync u_dut_ram (
    .clk(clk),
    .rst(rst),
    .read_rq(read_rq),
    .write_rq(write_rq),
    .rw_address(rw_address),
    .write_data(write_data),
    .read_data(read_data)
);
