`timescale 1ns/1ps
module tb();

reg clk;
reg rst_n;

initial begin
    $dumpfile("tb.lxt");
    $dumpvars(1,test);
end

initial begin
    clk=0;
    forever begin
        #10;
        clk=~clk;
    end
end


initial begin
    rst_n=0;
    repeat(4)@(negedge clk);
    rst_n=1;
end

reg d;
initial begin
    d=0;
    @(posedge rst_n);
    repeat(64)begin
        @(negedge clk);
        d=$random;
    end
    $dumpflush;
    $stop;
end

wire wd;


TEST test(
    .iCLK(clk),
    .iRST_N(rst_n),
    .iD(d),
    .oD(wd)
);

endmodule
