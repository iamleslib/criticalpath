`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////


module circuit1#(parameter DATAWIDTH_TOP = 8)(a, b, c, x, z, clk, rst);
    input [DATAWIDTH_TOP - 1 : 0] a, b, c;
    input clk, rst;
    output [DATAWIDTH_TOP - 1 : 0] z;
    output [(DATAWIDTH_TOP * 2) - 1 : 0] x;
    
    wire [DATAWIDTH_TOP - 1 : 0] d, e;              //e.g. 8-bits wide.
    wire [(DATAWIDTH_TOP * 2) - 1 : 0] f, xwire;    //e.g. 16-bits wide.
    wire g;

    Adder #(.DATAWIDTH(DATAWIDTH_TOP)) add_a_and_b(a, b, d);        // d = a + b
    Adder #(.DATAWIDTH(DATAWIDTH_TOP)) add_a_and_c(a, c, e);        // e = a + c
    Comparator #(.DATAWIDTH(DATAWIDTH_TOP)) comp_d_gt_e(d, e, g);   // g = d > e
    //Note: I left the eq and lt output ports unconnected. ^^^^^^^ Don't need them.
    Mux2To1 #(.DATAWIDTH(DATAWIDTH_TOP)) mux_e_or_a(e, d, g, z);    // z = g ? d : e
    Multiplier #(.DATAWIDTH(DATAWIDTH_TOP)) mult_a_and_c(a, c, f);  // f = a * c
    Subtractor #(.DATAWIDTH(DATAWIDTH_TOP * 2)) sub_f_min_d(f, {{DATAWIDTH_TOP{1'b0}}, d}, xwire);// xwire = f - d
    //Note: Concatinated leading zeros to d, the 2nd input of the sub module ^^^^^^^^^^.
    Register #(.DATAWIDTH(DATAWIDTH_TOP * 2)) reg_x_eq_xwire(xwire, clk, rst, x);// x = xwire

endmodule
