module imm_gen(
    input [31:0] instruction,
    output reg [31:0] immOut);

    wire [4:0] a;
    assign a = instruction[24:20];

    always @(instruction[6:0])
        case (immOut[6:0])
            7'b0000011 /*I-type load*/:
                immOut = {instruction[31]? {20{1'b1}}:20'b0, instruction[31:20]};
            7'b0010011 /*I-type addi*/:
                begin
                    if ((instruction[31:25] == 7'b0100000 && instruction[14:12] == 3'b101) || (instruction[14:12] == 3'b001) || instruction[14:12] == 3'b101)
                        immOut = {a[4]? {27{1'b1}}:27'b0, a};
                    else
                        immOut = {instruction[31]? 20'b1:20'b0, instruction[31:20]};
                end
            7'b0100011 /*S-type*/:
                immOut = {instruction[31]? 20'b1:20'b0, instruction[31:25], instruction[11:7]};
        endcase
endmodule