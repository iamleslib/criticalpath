`timescale 1ns / 1ps

//Logical shift right module.

module shiftRight #(parameter DATAWIDTH = 8)(sh_amt, a, d);
    input [DATAWIDTH-1 : 0] sh_amt;
    input [DATAWIDTH-1 : 0] a;
    output reg [DATAWIDTH-1 : 0] d;
    
    always@(sh_amt, a)begin
        d <= a >> sh_amt;
    end
endmodule
