`timescale 1ns / 1ns
`include "adder.v"

module fulladd_tb;
    reg carryIn, a, b;
    wire sum, carryOut;

    fulladd fulladdTest(carryIn, a, b, sum, carryOut);
    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars(0, fulladd_tb);

        a = 0;
        b = 1;
        carryIn = 0;
        #20;
    end
endmodule

module adder4_tb;
    reg carryIn;
    reg [3:0]a;
    reg [3:0]b;
    wire [3:0]sum;
    wire carryOut;

    adder4 adder4Test(carryIn, a, b, sum, carryOut);
    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars(0, adder4_tb);

        a = 4'b0011;
        b = 4'b0110;
        carryIn = 0;
        #20;
    end
endmodule

module adder16_tb;
    reg carryIn;
    reg [15:0]a;
    reg [15:0]b;
    wire [15:0]sum;
    wire carryOut;

    adder16 adder16Test(carryIn, a, b, sum, carryOut);
    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars(0, adder16_tb);

        a = 15'b0001100101000100;
        b = 15'b0010001001000110;
        carryIn = 0;
        #20;
    end
endmodule

module adder64_tb;
    reg carryIn;
    reg [63:0]a;
    reg [63:0]b;
    wire [63:0]sum;
    wire carryOut;

    adder64 adder64Test(carryIn, a, b, sum, carryOut);
    initial begin
        $dumpfile("adder_tb.vcd");
        $dumpvars(0, adder64_tb);

        a = 64'b0001100101000100001000100100011000100010010001100010001001000110;
        b = 64'b0001100101010000000100010000001100011000010001001010011100010001;
        carryIn = 0;
        #20;
    end
endmodule