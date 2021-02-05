module data_memory(clk, memWrite, memRead, address, writeData, readData);
    input clk, memWrite, memRead;
    input [47:0] address;
    input [63:0] writeData;
    output [63:0] readData;
    reg [63:0] RAM[0:63];

    always @(posedge clk)
    begin
        if(memWrite) RAM[address[5:0]] <= writeData;
        if(memRead) readData = RAM[address[5:0]];
    end
        
endmodule