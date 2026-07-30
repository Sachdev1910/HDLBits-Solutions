module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);
    wire w1; // for connecting 1st add16 to the next add16 ( cout to cin)
   
    add16 inst1(a[15:0], b[15:0], 0, sum[15:0], w1); // Lower Half 16 bit adder
    add16 inst0(a[31:16], b[31:16], w1, sum[31:16], 0);  // Upper Half 16 bit adder

endmodule
