`timescale 1ns / 1ns
`include "../clockGenerator/clock_generator.v"
`include "imm_gen.v"

module imm_gen_tb;
    wire clk;
    reg [31:0] instruction;
    wire [63:0] immOut;

    clock_generator clock (clk);
    imm_gen imm_gen_instance (instruction, immOut);

    initial begin
        $dumpfile("imm_gen_tb.vcd");
        $dumpvars(0, imm_gen_tb);

//      expected result is addi x11, x10, 2
//      000000000010 01010 000 01011 0010011
        @(posedge clk); instruction = 32'b00000000001001010000010110010011;

        #20;
    end
endmodule