module pc(clk, nextPc, nowPc);
    input clk;
    input [47:0] nextPc;
    output reg [47:0] nowPc;

    always @(posedge clk) begin
            nowPc <= nextPc;
    end
endmodule