`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leslie Ibarra
// 
// Create Date: 09/19/2019 12:05:04 AM
// Design Name: 
// Module Name: Mux2To1
// Project Name: Assignment 1
// Target Devices: 
// Tool Versions: 
// Description: Multiplexor(2To1)
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Mux2To1 #(parameter DATAWIDTH = 2)(a, b, sel, d);
    input [DATAWIDTH-1:0] a, b;
    input sel;
    
    output reg [DATAWIDTH-1:0] d;
    
    always @(a, b, sel) begin
        if(sel == 1'b0) begin
            d <= a;
        end
        else begin
            d <= b;
        end
    end
endmodule
