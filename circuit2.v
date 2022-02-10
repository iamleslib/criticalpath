`timescale 1ns / 1ps

module circuit2(a, b, c, x, z, clk, rst);
    input [31:0] a, b, c;
    input clk, rst;
    output [31:0] x, z;
    
    wire [31:0] d, e, f, g, h;
    wire dLTe, dEQe;
    wire [31:0] zwire, xwire;
    
    Adder #(.DATAWIDTH(32)) add_a_b(a, b, d);                           // d = a + b
    Adder #(.DATAWIDTH(32)) add_a_c(a, c, e);                           // e = a + c
    Subtractor #(.DATAWIDTH(32)) sub_a_min_b(a, b, f);                  // f = a - b
    Comparator #(.DATAWIDTH(32)) comp_d_eq_e(.a(d), .b(e), .eq(dEQe));  // dEQe = d == e
    Comparator #(.DATAWIDTH(32)) comp_d_lt_e(.a(d), .b(e), .lt(dLTe));  // dLTe = d < e
    Mux2To1 #(.DATAWIDTH(32)) mux_e_or_d(e, d, dLTe, g);                // g = dLTe ? d : e 
    Mux2To1 #(.DATAWIDTH(32)) mux_f_or_g(f, g, dEQe, h);                // h = dEQe ? g : f 
    shiftLeft #(.DATAWIDTH(32)) shL_g_by_dLTe({0,dLTe}, g, xwire);      // xwire = g << dLTe
    shiftRight #(.DATAWIDTH(32)) shR_h_by_dEQe({0,dEQe}, h, zwire);     // zwire = h >> dEQe
    Register #(.DATAWIDTH(32)) reg_x_eq_xwire(xwire, clk, rst, x);      // x = xwire
    Register #(.DATAWIDTH(32)) reg_z_eq_zwire(zwire, clk, rst, z);      // z = zwire
    
endmodule
