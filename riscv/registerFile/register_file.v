module register_file(clk, rst, rgWrtEn, rgWrtDest, rgRdAddr1, rgRdAddr2, rgWrtData, rgRdData1, rgRdData2);
   input  clk;
   input  rg_wrt_en;
   input  [4:0] rgWrtDest;
   input  [4:0] rgRdAddr1;
   input  [4:0] rgRdAddr2;
   input  [31:0] rgWrtData;
   output [31:0] rgRdData1;
   output [31:0] rgRdData2;

    reg [31:0] registerFile [31:0];

    always @(posedge clk)
    begin
       if ( rg_wrt_en == 1'b1 )
          registerFile[rgWrtDest] <= rgWrtData;
    end

    assign rgRdData1 = registerFile[rgRdAddr1];
    assign rgRdData2 = registerFile[rgRdAddr2];

endmodule
