module ALU_testbench;

wire [63:0] C;

reg [63:0] test = 0;
reg flag;

integer flag_r = 0, flag_w = 0;

reg [63:0] A=0, B=0;

reg [1:0] Control;

ALU DUT(C,Overflow,A,B,Control);

integer j,k,l;

initial begin
    $dumpfile("ALU.vcd");
    $dumpvars(0,ALU_testbench);

    $monitor($time," %b %b",C,test);

    for (j = 0; j < 4; j = j + 1)
    begin
        Control = j;
        for(k = 0; k < 100; k = k + 1)
        begin
            A = A + 1;
            B = 0;
            for (l = 0; l < 100; l = l + 1)
            begin
                B = B + 1;
                if (j==0) begin
                    test = A + B;
                end
                else if (j==1) begin
                    test = A - B;
                end
                else if (j==2) begin
                    test = A&B;
                end
                else begin
                    test = A^B;
                end
                #5;
                if (test == C)
                begin
                    flag_r = flag_r + 1;
                end
                else begin
                    flag_w = flag_w + 1;
                end
            end
        end
    end
    $display("Correct answers = %d, Wrong answers = %d",flag_r,flag_w);

end

endmodule
