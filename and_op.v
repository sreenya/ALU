module and_op(a,b,result);
    input [63:0] a,b;
    output [63:0] result;

    genvar i;
    for(i=0;i<64;i=i+1) begin
        and(result[i], a[i], b[i]);
    end
    
endmodule