`default_nettype none     // Disable implicit nets. Reduces some types of bugs.
module top_module(           // implicit nets - which creates a one bit wire if one will use it without declaring 
    input wire [15:0] in,     //Implicit nets are always one-bit wires and causes bugs if you had intended to use a vector.
    output wire [7:0] out_hi,
    output wire [7:0] out_lo );
    
            assign out_hi = in[15:8];
            assign out_lo = in[7:0];
                     /* or concatenation operator will also work:
                                  assign {out_hi, out_lo} = in;
                      */            

endmodule
