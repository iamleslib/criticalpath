`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2019 10:06:22 AM
// Design Name: 
// Module Name: Subtractor
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


module Subtractor #(parameter DATAWIDTH = 32)(a, b, diff

    );
    
    
    input [DATAWIDTH:0] a;
    input [DATAWIDTH:0] b;
    output reg [DATAWIDTH:0] diff;
    always @(a, b) begin
    diff <= a - b;
    end
    
endmodule
