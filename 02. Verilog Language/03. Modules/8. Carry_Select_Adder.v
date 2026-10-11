module top_module(
    input [31:0] a,
    input [31:0] b,
    output [31:0] sum
);

    // w1 = carry-out from the lower 16-bit adder
    wire w1;

    // w2 = upper sum assuming carry-in is 0
    // w3 = upper sum assuming carry-in is 1
    wire [15:0] w2, w3;

    // These wires store the unused carry-outs
    wire c2, c3;

    // STEP 1: Add the lower 16 bits of a and b.
    // Carry-in is 0.
    // Store the lower sum in sum[15:0].
    // Store the carry-out in w1.
    add16 inst0(
        a[15:0],
        b[15:0],
        1'b0,
        sum[15:0],
        w1
    );

    // STEP 2: Add the upper 16 bits assuming carry-in = 0.
    // Store the result in w2.
    add16 inst1(
        a[31:16],
        b[31:16],
        1'b0,
        w2,
        c2
    );

    // STEP 3: Add the upper 16 bits assuming carry-in = 1.
    // Store the result in w3.
    add16 inst2(
        a[31:16],
        b[31:16],
        1'b1,
        w3,
        c3
    );

    // STEP 4: Use a multiplexer to select the correct upper sum.
    // If w1 = 1, select w3.
    // If w1 = 0, select w2.
    assign sum[31:16] = w1 ? w3 : w2;

endmodule
