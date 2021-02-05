module alu(
    input [63:0] x,
    input [63:0] y,
    input [3:0] aluControl,
    output [63:0] result,
    output zero,
);

    // this ALU controller works only for provided table in the link: https://lms.khu.ac.ir/mod/resource/view.php?id=50107

    always @(x, y, aluControl)
        begin
            case (aluControl)
                4'b0010: result <= (x+y);
                4'b0000: result <= (x & y);
                4'b0001: result <= (x | y);
                4'b0110: result <= (x-y);
            endcase
        end

    assign zero = ~(result == 0);
endmodule