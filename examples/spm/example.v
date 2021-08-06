module example(input clk, a, b, c,
               output reg [1:0] y);
    always @(posedge clk)
        if (c)
            y <= c ? a + b : 2’d0;
endmodule