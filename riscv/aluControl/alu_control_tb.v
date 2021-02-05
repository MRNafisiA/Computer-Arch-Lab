`timescale 1ns / 1ns
`include "alu_control.v"

module alu_control_tb;
    reg [1:0] aluOp;
    reg [6:0] Funct7;
    reg [2:0] Funct3;
    wire [3:0] aluControl;

    alu_control aluControlTest(aluOp, Funct7, Funct3, aluControl);
    initial begin
        $dumpfile("alu_control_tb.vcd");
        $dumpvars(0, alu_control_tb);

// expected result is 0010
        aluOp = 2'b10;
        Funct7 = 7'b0000000;
        Funct3 = 3'b000;
        #20;

// expected result is 0110
        aluOp = 2'b10;
        Funct7 = 7'b0100000;
        Funct3 = 3'b000;
        #20;
    end
endmodule