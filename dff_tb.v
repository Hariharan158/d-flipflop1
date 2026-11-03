`timescale 1ns/1ps

module dff_tb;

reg clk, rst, d;
wire q;

// DUT instantiation
dff uut (
    .clk(clk),
    .rst(rst),
    .d(d),
    .q(q)
);

// Clock generation
always #5 clk = ~clk;

// Test stimulus
initial
begin
    $dumpfile("dff.vcd");
    $dumpvars(0, dff_tb);

    clk = 0;
    rst = 1;
    d = 0;

    #10 rst = 0;
    #10 d = 1;
    #10 d = 0;
    #10 d = 1;
    #10 d = 0;

    #20 $finish;
end

initial
begin
    $monitor("Time=%0t clk=%b rst=%b d=%b q=%b",
              $time, clk, rst, d, q);
end

endmodule
