module and_testbench();

    reg a, b;
    wire c;

    AND port(.in1(a), .in2(b), .out(c));

    // apply inputs one at a time
    initial begin
      $display("---Port logic AND---"); #10;
      $display(" a b | c");
      $display(" -------");
      a = 0; b = 0; #10; $display(" %b %b | %b", a, b, c); // apply inputs and waits 10 ns
      a = 0; b = 1; #10; $display(" %b %b | %b", a, b, c);
      a = 1; b = 0; #10; $display(" %b %b | %b", a, b, c); 
      a = 1; b = 1; #10 $display(" %b %b | %b", a, b, c);
      $display(" -------");
      $display("--------------------"); #10;
    end 

endmodule // and_testbench