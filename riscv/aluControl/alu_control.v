module alu_control(
    input [1:0] aluOp,
    input [6:0] Funct7,
    input [2:0] Funct3,
    output reg [3:0] aluControl
);

    // this ALU controller works only for provided table in the link: https://lms.khu.ac.ir/mod/resource/view.php?id=50107

    always @(aluOp, Funct7, Funct3)
        begin
            case (aluOp)
                2'b00: aluControl <= 4'b0010;
                2'b01: aluControl <= 4'b0010;
                2'b10:
                    begin
                        case (Funct7)
                            7'b0000000: begin
                                case (Funct3)
                                    3'b000: aluControl <= 4'b0010;
                                    3'b111: aluControl <= 4'b0000;
                                    3'b110: aluControl <= 4'b0001;
                                endcase
                            end
                            7'b0100000: begin
                                case (Funct3)
                                    3'b000: aluControl <= 4'b0110;
                                endcase
                            end
                        endcase
                    end
            endcase
        end
endmodule