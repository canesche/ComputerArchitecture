module and_testbench();

    reg a, b;
    wire c;

    AND port(.in1(a), .in2(b), .out(c));

    // apply inputs one at a time
    initial begin
      $display("---Port logic AND---"); #10;
      $display("a b | c");
      $display("-------");
      a = 0; b = 0; #10; $display("%b %b | %b", a, b, c); // apply inputs and waits 10 ns
      a = 0; b = 1; $display("%b %b | %b", a, b, c); #10; 
      a = 1; b = 0; $display("%b %b | %b", a, b, c); #10;
      a = 1; b = 1; $display("%b %b | %b", a, b, c); #10;
    end 


endmodule // and_testbench