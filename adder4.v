module adderVerilog(S, A, B, Cin, Cout);

    input Cin;
    input [3:0] A;
    input [3:0] B;
    output [3:0] S;
    output Cout;

    wire P3, P2, P1, P0, G3, G2, G1, G0, Cin, C1, C2, C3, Cout, P0C0, P1G0, P0P1C0, P2G1, P2P1G0, P2P1P0C0, P3G2, P3P2G1, P3P2P1G0, P3P2P1P0C0;

    //Making layer 1

    xor G1(P1,A[1],B[1]);
    and G2(G1,A[1],B[1]);
    xor G11(P2,A[2],B[2]);
    and G21(G2,A[2],B[2]);
    xor G12(P3,A[3],B[3]);
    and G22(G3,A[3],B[3]);
    xor G13(P0,A[0],B[0]);
    and G23(G0,A[0],B[0]);

    // Making layer 2

    and l2(P0C0, P0, Cin);
    or l21(C1, P0C0, G0);
    and l23(P1G0, P1, G0);
    and l24(P0P1C0, P0, P1, Cin);
    or l25(C2, P0P1C0, P1G0, G1);
    and l26(P2G1, P2, G1);
    and l27(P2P1G0, P2, P1, G0);
    and l28(P2P1P0C0, P2, P1, P0, Cin);
    or l29(C3, G2, P2G1, P2P1G0, P2P1P0C0);
    and l30(P3G2, P3, G2);
    and l31(P3P2G1, P3, P2, G1);
    and l32(P3P2P1G0, P3, P2, P1, G0);
    and l33(P3P2P1P0C0, P3, P2, P1, P0, Cin);
    or l34(Cout, P3G2, P3P2G1, P3P2P1G0, P3P2P1P0C0, G3);


    // final

    xor f3(S[3], P3, C3);
    xor f2(S[2], P2, C2);
    xor f1(S[1], P1, C1);
    xor f0(S[0], P0, Cin);


endmodule

module finaladder(S, A, B, Cin, overflow);
    input Cin;
    input [3:0] A;
    input [3:0] B;
    output [3:0] S;
    output overflow;

    wire Cout, P2, G2, P1, G1, P0, G0, P2G1, P2P1G0, P2P1P0C0, C3;
    adderVerilog x(S, A, B, Cin, Cout);

    xor G11(P2,A[2],B[2]);
    and G21(G2,A[2],B[2]);
    xor G1(P1,A[1],B[1]);
    and G2(G1,A[1],B[1]);
    xor G13(P0,A[0],B[0]);
    and G23(G0,A[0],B[0]);

    and l26(P2G1, P2, G1);
    and l27(P2P1G0, P2, P1, G0);
    and l28(P2P1P0C0, P2, P1, P0, Cin);
    or l29(C3, G2, P2G1, P2P1G0, P2P1P0C0);

    xor over(overflow, C3, Cout);
    
endmodule
