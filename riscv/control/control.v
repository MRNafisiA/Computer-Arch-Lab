module control(
    input [6:0] Opcode,
    output ALUSrc,
    output MemtoReg,
    output RegWrite,
    output MemRead,
    output MemWrite,
    output Branch,
    output [1:0] ALUOp,
);
    // this controller works only for provided table in the link: https://lms.khu.ac.ir/mod/resource/view.php?id=50107

    assign ALUSrc = !Opcode[5] && !Opcode[6];
    assign MemtoReg = !Opcode[5];
    assign RegWrite = (!Opcode[6] && !Opcode[4] && !Opcode[5]) || (!Opcode[6] && Opcode[4] && Opcode[5]);
    assign MemRead = !Opcode[5];
    assign MemWrite = !Opcode[4] && Opcode[5] && !Opcode[6];
    assign Branch = Opcode[6];
    assign ALUOp[1] = Opcode[4];
    assign ALUOp[0] = Opcode[6];

endmodule
