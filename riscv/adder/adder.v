module fulladd (carryIn, a, b, sum, carryOut);
	input carryIn, a, b;
	output sum, carryOut;

	assign sum = a ^ b ^ carryIn;
	assign carryOut = ( a & b ) | ( a & carryIn ) | ( b & carryIn );
endmodule

module adder4 (carryIn, a, b, sum, carryOut);
	input carryIn;
	input [3:0] a, b;
	output [3:0] sum;
	output carryOut;
	wire [2:0] tmp;

	fulladd q0 (carryIn, a[0], b[0], sum[0], tmp[0]);
	fulladd q1 (tmp[0], a[1], b[1], sum[1], tmp[1]);
	fulladd q2 (tmp[1], a[2], b[2], sum[2], tmp[2]);
	fulladd q3 (tmp[2], a[3], b[3], sum[3], carryOut);
endmodule

module adder16 (carryIn, a, b, sum, carryOut);
	input carryIn;
	input [15:0] a, b;
	output [15:0] sum;
	output carryOut;
	wire [2:0] tmp;

	adder4 q0 (carryIn, a[3:0], b[3:0], sum[3:0], tmp[0]);
	adder4 q1 (tmp[0], a[7:4], b[7:4], sum[7:4], tmp[1]);
	adder4 q2 (tmp[1], a[11:8], b[11:8], sum[11:8], tmp[2]);
	adder4 q3 (tmp[2], a[15:12], b[15:12], sum[15:12], carryOut);
endmodule

module adder64 (carryIn, a, b, sum, carryOut);
	input carryIn;
	input [63:0] a, b;
	output [63:0] sum;
	output carryOut;
	wire [2:0] tmp;

	adder16 q0 (carryIn, a[15:0], b[15:0], sum[15:0], tmp[0]);
	adder16 q1 (tmp[0], a[31:16], b[31:16], sum[31:16], tmp[1]);
	adder16 q2 (tmp[1], a[47:32], b[47:32], sum[47:32], tmp[2]);
	adder16 q3 (tmp[2], a[63:48], b[63:48], sum[63:48], carryOut);
endmodule