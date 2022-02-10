`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Leslie Ibarra
// 
// Create Date: 09/24/2019 03:44:25 PM
// Design Name: 
// Module Name: Circuit3
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

module Circuit3(a, b, c, d, e, f, g, h, sh_amt, Clk, Rst, avg);
    input [15:0]a, b, c, d, e, f, g, h;
    input Clk, Rst;
    input [7:0]sh_amt;
    
   
    output [15:0]avg;

    
    wire [31:0]l00, l01, l02, l03, l10, l11, l2, l2div2, l2div4, l2div8;

   
   Adder #(.DATAWIDTH(32)) Adder_1({0, a}, {0, b}, l00);      // l00 = a + b
   Adder #(.DATAWIDTH(32)) Adder_2({0, c}, {0, d}, l01);      // l01 = c + d
   Adder #(.DATAWIDTH(32)) Adder_3({0, e}, {0, f}, l02);      // l02 = e + f
   Adder #(.DATAWIDTH(32)) Adder_4({0, g}, {0, h}, l03);      // l03 = g + h
   
   
   Adder #(.DATAWIDTH(32)) Adder_5(l00, l01, l10);      // l10 = l00 + l01 
   Adder #(.DATAWIDTH(32)) Adder_6(l02, l03, l11);      // l11 = l02 + l03
   Adder #(.DATAWIDTH(32)) Adder_7(l10, l11, l2);       // l2 = l10 + l11
   
   shiftRight #(.DATAWIDTH(32)) shiftRight_1(l2, {0, sh_amt}, l2div2);       // l2div2 = l2 >> sa
   shiftRight #(.DATAWIDTH(32)) shiftRight_2(l2div2, {0, sh_amt}, l2div4);   // l2div4 = l2div2 >> sa 
   shiftRight #(.DATAWIDTH(32)) shiftRight_3(l2div4, {0, sh_amt}, l2div8);   // l2div8 = l2div4 >> sa
   Register #(.DATAWIDTH(16)) Register_1(l2div8[15:0], Clk, Rst, avg);      // avg = l2div8
   
    

endmodule