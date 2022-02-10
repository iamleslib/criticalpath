`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/19/2019 09:42:48 AM
// Design Name: 
// Module Name: Register
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


module Register #(parameter DATAWIDTH = 32)(d,clk, Rst, q

    );
    
    input [DATAWIDTH:0] d;
    input clk;
    input Rst;
    output reg [DATAWIDTH:0] q;
    
    always @(posedge clk)
       if (Rst)
         begin
           q <= 0;
       end else
         begin
           q <= d;
         end
    
    
endmodule




