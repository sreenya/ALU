module adder_testbench;

wire [63:0] sum;
wire overflow;

reg [63:0] test=0;
integer flagright = 0, flagwrong = 0;

reg [63:0] a=0, b=0;

adder DUT(a,b,sum,overflow);

integer k,l;

initial begin
    $dumpfile("adder.vcd");
    $dumpvars(0,adder_testbench);
    $monitor($time," %b %b",sum, test);

    for(k = 0; k < 350; k = k + 1)
    begin
        a = a + 1;
        b = 0;
        for(l = 0; l < 350; l = l + 1) begin
            b = b + 1;
            test = a + b;
            #5;
            if (test == sum) begin
                flagright = flagright + 1;
            end else begin
                flagwrong = flagwrong + 1;
            end
        end
    end
    $display("Correct answers = %d, Wrong answers = %d",flagright,flagwrong);


end

endmodule
