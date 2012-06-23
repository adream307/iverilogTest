`timescale 1ns/1ps
module TEST(
    iCLK,
    iRST_N,
    iD,
    oD
);

input iCLK;
input iRST_N;
input iD;
output oD;

reg oD;

always@(posedge iCLK or negedge iRST_N) begin
    if(!iRST_N) oD<=1'b0;
    else oD<=iD;
end

endmodule
