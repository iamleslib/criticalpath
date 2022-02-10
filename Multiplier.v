`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leslie Ibarra
// 
// Create Date: 09/18/2019 11:59:25 PM
// Design Name: 
// Module Name: Multiplier
// Project Name: Assignment 1
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


module Multiplier #(parameter DATAWIDTH = 2)(a, b, prod);

    input [DATAWIDTH-1:0] a, b;
    output reg [(2*DATAWIDTH)-1:0] prod;
    
    always @(a, b) begin
    
        prod <= a * b;
    
    end
endmodule
