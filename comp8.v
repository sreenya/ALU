module comp8(B, A);

    input [7:0]A;
    output [7:0]B;

    not x0(B[0],A[0]);
    not x1(B[1],A[1]);
    not x2(B[2],A[2]);
    not x3(B[3],A[3]);
    not x4(B[4],A[4]);
    not x5(B[5],A[5]);
    not x6(B[6],A[6]);
    not x7(B[7],A[7]);

endmodule