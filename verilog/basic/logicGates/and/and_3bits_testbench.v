module and_testbench();

    reg a, b, c;
    wire d;

    AND port(.in1(a), .in2(b), .in3(c), .out(d));

    // apply inputs one at a time
    initial begin
      $display("---Port logic AND---"); #10;
      $display(" a b c | d");
      $display(" ---------");
      // apply inputs and waits 10 ns
      a = 0; b = 0; c = 0; #10; $display(" %b %b %b | %b", a, b, c, d); 
      a = 0; b = 0; c = 1; #10; $display(" %b %b %b | %b", a, b, c, d);
      a = 0; b = 1; c = 0; #10; $display(" %b %b %b | %b", a, b, c, d);
      a = 0; b = 1; c = 1; #10; $display(" %b %b %b | %b", a, b, c, d);
      a = 1; b = 0; c = 0; #10; $display(" %b %b %b | %b", a, b, c, d); 
      a = 1; b = 0; c = 1; #10; $display(" %b %b %b | %b", a, b, c, d);
      a = 1; b = 1; c = 0; #10; $display(" %b %b %b | %b", a, b, c, d);
      a = 1; b = 1; c = 1; #10; $display(" %b %b %b | %b", a, b, c, d);
 
      $display(" ---------");
      $display("--------------------"); #10;
    end 

endmodule // and_testbench
