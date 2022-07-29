`include "comp8.v"
`include "adder.v"

module complement(B,A);

    input [63:0] A;
    output [63:0] B;

    wire [63:0]C;
    wire overflow;

    comp8 x0(C[7:0],A[7:0]);
    comp8 x1(C[15:8],A[15:8]);
    comp8 x2(C[23:16],A[23:16]);
    comp8 x3(C[31:24],A[31:24]);
    comp8 x4(C[39:32],A[39:32]);
    comp8 x5(C[47:40],A[47:40]);
    comp8 x6(C[55:48],A[55:48]);
    comp8 x7(C[63:56],A[63:56]);

    wire [63:0]add2 = 1;
    adder x8(C,add2,B,overflow);

endmodule