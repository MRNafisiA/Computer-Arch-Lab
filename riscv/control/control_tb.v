`timescale 1ns / 1ns
`include "control.v"

module control_tb;
    reg [6:0] Opcode;
    wire ALUSrc;
    wire MemtoReg;
    wire RegWrite;
    wire MemRead;
    wire MemWrite;
    wire Branch;
    wire [1:0] ALUOp;

    control controlTest(Opcode, ALUSrc, MemtoReg, RegWrite, MemRead, MemWrite, Branch, ALUOp);
    initial begin
        $dumpfile("control_tb.vcd");
        $dumpvars(0, control_tb);

// expected result is ALUSrc=0, MemtoReg=0, RegWrite=1, MemRead=0, MemWrite=0, Branch=0, ALUOp=10
        Opcode = 7'b1100110;
        #20;
    end
endmodule