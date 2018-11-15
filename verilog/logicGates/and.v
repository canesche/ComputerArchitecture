/* Verilog Code AND
 * Programmer: M. Canesche
 */

module AND( in1, in2, out );

    input in1;
    input in2;
    output out;

    assign out = in1 & in2;

endmodule // and