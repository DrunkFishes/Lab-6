`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    15:53:56 11/04/2017 
// Design Name: 
// Module Name:    lab6_toplevel 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module lab6_toplevel(clk, reset, clk_reg, S_Sel, W_Adr, R_Adr, S_Adr, Alu_Op,
                     An, a, b, c, d, e, f, g);
    input clk, reset, clk_reg, S_Sel;
    input [2:0] W_Adr, R_Adr, S_Adr;
    input [3:0] Alu_Op;
    output a, b, c, d, e, f, g;
    output [7:0] An;
    
    wire clk500_out, dbclk_reg, C, N, Z;
    wire [15:0] Reg_Out, Alu_Out;
    
    //clk_500Hz(clk_in, reset, clk_out)
    clk_500Hz   clk500(clk, reset, clk500_out);
    
    //one_shot(D_in, clk_in, reset, D_out)
    one_shot    db(clk_reg, clk500_out, reset, dbclk_reg); 
    
    /*integer_datapath(clk, reset, W_En, S_Sel, W_Adr, R_Adr, S_Adr, Alu_Op, DS, 
                       C, N, Z, Reg_Out, Alu_Out)*/
    integer_datapath    dp(dbclk_reg, reset, 1'b1, S_Sel, W_Adr, R_Adr, S_Adr, Alu_Op, 16'hAA55, C, N, Z, Reg_Out, Alu_Out);
    
    
    //display_controller(clk, reset, An, D, a, b, c, d, e, f, g)
    display_controller  display(clk, reset, An, {Reg_Out, Alu_Out}, a, b, c, d, e, f, g);
    

endmodule
