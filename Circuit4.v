`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/29/2019 04:10:29 PM
// Design Name: 
// Module Name: Circuit4
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


module Circuit4(  Rst, clk, a, b, c, z, x

    );
input clk, Rst;
input [63:0] a, b, c;
output [31:0] z, x;
wire [63:0] d, e, f, g, h;
wire dLTe, dEQe;
wire [63:0] xrin, zrin;
wire [63:0] greg, hreg;

//d = a + b
Adder #(.DATAWIDTH(64)) Adder_0(a,b,d);


//e = a + c
Adder #(.DATAWIDTH(64)) Adder_1(a, c, e);

//f = a - b 
Subtractor #(.DATAWIDTH(64)) Subtractor_1(a, b, f);

//dEQe = d == e
Comparator #(.DATAWIDTH(64)) Comparator_1(.a(d), .b(e), .lt(dLTe), .eq(dEQe));

//dLTe = d < e
//Comparator #(.DATAWIDTH(2)) Comparator_2(d, e, 0, dLTe, 0);

//g = dLTe ? d : e 
Mux2To1 #(.DATAWIDTH(64)) Mux2To1_1(e, d, dLTe,g);
//h = dEQe ? g : f 
Mux2To1 #(.DATAWIDTH(64)) Mux2To1_2(f, g, dEQe,h);

//greg = g
Register #(.DATAWIDTH(64)) Register_1(g, clk, Rst, greg);
//hreg = h
Register #(.DATAWIDTH(64)) Register_2(h, clk, Rst, hreg);
//xrin = hreg << dLTe
shiftLeft #(.DATAWIDTH(64)) shiftLeft_1({63'b0, dLTe}, hreg, xrin);
//zrin = greg >> dEQe
shiftRight #(.DATAWIDTH(64)) shiftRight_1({63'b0, dEQe}, greg, zrin);
//x = xrin
Register #(.DATAWIDTH(64)) Register_3(xrin,clk, Rst, x);
//z = zrin
Register #(.DATAWIDTH(64)) Register_4(zrin,clk, Rst, z);



endmodule
