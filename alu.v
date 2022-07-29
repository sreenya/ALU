`include "subtract.v"
`include "and_op.v"
`include "xor_op.v"

module ALU(C,Overflow,A,B,Control);

    input [63:0] A;
    input [63:0] B;
    input [1:0] Control;

    output [63:0] C;
    output Overflow;

    reg [63:0] temp;
    reg overflow = 0;

    wire [63:0] C_Sum;
    wire [63:0] C_Diff;
    wire [63:0] C_And;
    wire [63:0] C_Xor;

    wire Overflow1,Overflow2;

    adder x1(A,B,C_Sum,Overflow1);
    subtract x2(C_Diff,Overflow2,A,B);
    and_op x3(A,B,C_And);
    xor_op x4(A,B,C_Xor);

    always@(*) begin
        if (Control==0) begin
            temp = C_Sum;
            overflow = Overflow1;
        end
        else if (Control==1) begin
            temp = C_Diff;
            overflow = Overflow2;
        end
        else if (Control==2) begin
            temp = C_And;
            overflow = 0;
        end
        else begin
           temp = C_Xor;
           overflow = 0;
        end
    end

    assign C = temp;
    assign Overflow = overflow;

endmodule
