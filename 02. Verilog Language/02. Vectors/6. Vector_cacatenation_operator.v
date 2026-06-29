module top_module (
    input [4:0] a, b, c, d, e, f,
    output [7:0] w, x, y, z );//

    assign { w, x, y, z } = { a, b, c, d, e, f, 2'b11 };

endmodule



/*
Part selection was used to select portions of a vector.
The concatenation operator {a,b,c} is used to create larger vectors by concatenating smaller portions of a vector together.

{3'b111, 3'b000} => 6'b111000
{1'b1, 1'b0, 3'b101} => 5'b10101
{4'ha, 4'd10} => 8'b10101010     // 4'ha and 4'd10 are both 4'b1010 in binary

Concatenation needs to know the width of every component (or how would you know the length of the result?). 
Thus, {1, 2, 3} is illegal and results in the error message: unsized constants are not allowed in concatenations.

The concatenation operator can be used on both the left and right sides of assignments. 
*/
