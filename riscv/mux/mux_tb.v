`timescale 1ns / 1ns
`include "mux.v"

module mux_tb;
    wire clk;
    reg[ 31:0] A, B;
    wire [31:0] out;
    reg selection;

    mux2 mux_instance (A, B, selection , out);

    initial begin
      $dumpfile("mux_tb.vcd");
      $dumpvars(0, mux_tb);

//      expected result is A
      A = 32'b00001111000011110000111100001111;
      B = 32'b11110000111100001111000011110000;
      selection = 0;
      #20;
    end
endmodule