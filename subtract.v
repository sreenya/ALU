`include "complement.v"

module subtract(D,Overflow,A,B);

    input [63:0] A;
    input [63:0] B;

    output [63:0] D;
    output Overflow;

    wire [63:0] C;

    complement x1(C,B);
    adder x2(A,C,D,Overflow);

endmodule
