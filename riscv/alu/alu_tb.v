`timescale 1ns / 1ns
`include "alu.v"

module alu_tb;
    reg [63:0] x;
    reg [63:0] y;
    reg [3:0] aluControl;
    wire [63:0] result;
    wire zero;

    alu aluTest(x, y, aluControl, result, zero);
    initial begin
        $dumpfile("alu_tb.vcd");
        $dumpvars(0, alu_tb);

// expected result is x + y
        x = 64'b0001100101000100001000100100011000100010010001100010001001000110;
        y = 64'b0001110101101000100010100101100100011000100010101000111010010001;
        aluControl = 4'b0010;
        #20;

// expected result is x - y
        x = 64'b0001100101000100001000100100011000100010010001100010001001000110;
        y = 64'b0001110101101000100010100101100100011000100010101000111010010001;
        aluControl = 4'b0110;
        #20;
    end
endmodule