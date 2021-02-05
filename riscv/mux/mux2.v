module mux (A, B, selection, out);
    input [31:0] A, B;
    input selection;
    output [31:0] out;

    assign out = (selection == 1) ? B : A;
endmodule