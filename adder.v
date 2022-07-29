`include "adder4.v"

module adder(a,b,sum,overflow);
    
    input [63:0] a;
    input [63:0] b;
    output [63:0] sum;
    output overflow;
    wire x = 0;
    wire [14:0] temp;

    adderVerilog add1(sum[3:0], a[3:0], b[3:0], x, temp[0]);
    adderVerilog add2(sum[7:4], a[7:4], b[7:4], temp[0], temp[1]);
    adderVerilog add3(sum[11:8], a[11:8], b[11:8], temp[1], temp[2]);
    adderVerilog add4(sum[15:12], a[15:12], b[15:12], temp[2], temp[3]);
    adderVerilog add5(sum[19:16], a[19:16], b[19:16], temp[3], temp[4]);
    adderVerilog add6(sum[23:20], a[23:20], b[23:20], temp[4], temp[5]);
    adderVerilog add7(sum[27:24], a[27:24], b[27:24], temp[5], temp[6]);
    adderVerilog add8(sum[31:28], a[31:28], b[31:28], temp[6], temp[7]);
    adderVerilog add9(sum[35:32], a[35:32], b[35:32], temp[7], temp[8]);
    adderVerilog add10(sum[39:36], a[39:36], b[39:36], temp[8], temp[9]);
    adderVerilog add11(sum[43:40], a[43:40], b[43:40], temp[9], temp[10]);
    adderVerilog add12(sum[47:44], a[47:44], b[47:44], temp[10], temp[11]);
    adderVerilog add13(sum[51:48], a[51:48], b[51:48], temp[11], temp[12]);
    adderVerilog add14(sum[55:52], a[55:52], b[55:52], temp[12], temp[13]);
    adderVerilog add15(sum[59:56], a[59:56], b[59:56], temp[13], temp[14]);
    finaladder add16(sum[63:60], a[63:60], b[63:60], temp[14], overflow);


endmodule
