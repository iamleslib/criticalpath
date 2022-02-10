`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2019 09:57:19 AM
// Design Name: 
// Module Name: Adder
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Adder #(parameter DATAWIDTH = 2)(a, b, sum

    );
    

    
    input [DATAWIDTH:0] a;
    input [DATAWIDTH:0] b;
    output reg [DATAWIDTH:0] sum;
    always @(a, b) begin
    sum <= a + b;
    end
endmodule





