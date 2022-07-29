module sub_testbench;

wire [63:0] D;

reg [63:0] test = 0;
reg flag;

integer flag_r = 0, flag_w = 0;

reg [63:0] A=0, B=0;

subtract DUT(D,Overflow,A,B);

integer k,l;

initial begin
    $dumpfile("subtract.vcd");
    $dumpvars(0,sub_testbench);

    $monitor($time," %d %d %b %b",A, B,D, test);


    for(k = 0; k < 500 ; k = k + 1)
    begin
        A = A + 1;
        B = 0;
        for (l = 0; l < 500; l = l + 1)
        begin
            B = B + 1;
            test = A-B;
            #5;
            if (test == D) begin
                flag_r = flag_r + 1;
            end else begin
                flag_w = flag_w + 1;
        end
        end
    end
    $display("Correct answers = %d, Wrong answers = %d",flag_r,flag_w);

end

endmodule
