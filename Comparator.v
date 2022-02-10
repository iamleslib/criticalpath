`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leslie Ibarra
// 
// Create Date: 09/18/2019 11:59:25 PM
// Design Name: 
// Module Name: Comparator
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


module Comparator #(parameter DATAWIDTH = 32)(a, b, gt, lt, eq);

    input [DATAWIDTH-1:0] a, b;
    output reg gt, lt, eq;
    
    always @(a, b) begin
        if(a > b) begin
            gt <= 1;
            lt <= 0;
            eq <= 0;
        end
        else if(a == b) begin
            gt <= 0;
            lt <= 0;
            eq <= 1;
        end
        else begin
            gt <= 0;
            lt <= 1;
            eq <= 0;
        end
    end
endmodule