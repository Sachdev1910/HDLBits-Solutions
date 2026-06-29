module top_module( 
    input in,
    output out
    );
    assign out = in; //as wires are bi directional so assign in = out is not equivalent.

endmodule
