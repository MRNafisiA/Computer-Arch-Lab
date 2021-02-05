module mux3 (A, B, C, selection, out);
    input [31:0] A, B;
    input [1:0] selection;
    output [31:0] out;

    assign out = (selection[1] == 1 && selection[0] == 0) ? A : ((selection[1] == 0 && selection[0] == 1) ? B : C);
endmodule