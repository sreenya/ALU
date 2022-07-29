module and_testbench;

wire [63:0] result;

reg [63:0] test=0;
integer flagright = 0, flagwrong = 0;

reg [63:0] a=0, b=0;

and_op DUT(a,b,result);

integer k,l;

initial begin
    $dumpfile("and_op.vcd");
    $dumpvars(0,and_testbench);
    $monitor($time," %b %b",result, test);

    for(k = 0; k < 256; k = k + 1)
    begin
        a = a + 1;
        b = 0;
        for(l = 0; l<256; l = l + 1) begin
            b = b + 1;
            test = a & b;
            #5;
            if (test == result) begin
                flagright = flagright + 1;
            end else begin
                flagwrong = flagwrong + 1;
            end
        end
    end
    $display("Correct answers = %d, Wrong answers = %d",flagright,flagwrong);


end

endmodule
