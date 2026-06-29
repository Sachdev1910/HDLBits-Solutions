module top_module( 
    input [2:0] a,
    input [2:0] b,
    output [2:0] out_or_bitwise,
    output out_or_logical,
    output [5:0] out_not
    );
        
         assign out_or_bitwise = a|b;
         assign out_or_logical = a||b;
         assign {out_not[5:3], out_not[2:0]} = {~b , ~a};
                        /* OR...
                           assign out_not[2:0] = ~a;	// Part-select on left side is o.
	                       assign out_not[5:3] = ~b;	//Assigning to [5:3] does not conflict with [2:0]
                         */
endmodule

                         /*  A bitwise operation between two N-bit vectors replicates the operation 
                              for each bit of the vector and produces a N-bit output, 
                              while a logical operation treats the entire vector 
                              as a boolean value (true = non-zero, false = zero) and produces a 1-bit output.  
                          */
