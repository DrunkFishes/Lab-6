`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:07:23 11/04/2017
// Design Name:   alu16
// Module Name:   D:/CECS 301 labs/lab_6/alu16_tb.v
// Project Name:  lab_6
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: alu16
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module alu16_tb;

	// Inputs
	reg [15:0] R;
	reg [15:0] S;
	reg [3:0] Alu_op;

	// Outputs
	wire [15:0] Y;
	wire N;
	wire Z;
	wire C;

	// Instantiate the Unit Under Test (UUT)
	alu16 uut (
		.R(R), 
		.S(S), 
		.Alu_op(Alu_op), 
		.Y(Y), 
		.N(N), 
		.Z(Z), 
		.C(C)
	);

	initial begin
		// Initialize Inputs
		R = 0;
		S = 0;
		Alu_op = 0;

		// Pass S
	
			R = 16'hAAAA; 
			S = 16'h0001;
			Alu_op = 4'h0;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Pass R	

			R = 16'hAAAA; 
			S = 16'h1004;
			Alu_op = 4'h1;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Increament S	

			R = 16'hFFFE; 
			S = 16'h1234;
			Alu_op = 4'h2;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Decrement S	

			R = 16'hFFFF; 
			S = 16'h1421;
			Alu_op = 4'h3;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Add R and S

			R = 16'hBBBB; 
			S = 16'hAAAA;
			Alu_op = 4'h4;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Subtract R and S

			R = 16'hFFFF; 
			S = 16'h3333;
			Alu_op = 4'h5;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Right Shift S	

			R = 16'h0000; 
			S = 16'h1011;
			Alu_op = 4'h6;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Lift Shift S	

			R = 16'hAAC5; 
			S = 16'hAAAA;
			Alu_op = 4'h7;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// AND

			R = 16'h1001; 
			S = 16'h1001;
			Alu_op = 4'h8;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// OR	

			R = 16'hABC3; 
			S = 16'h1011;
			Alu_op = 4'h9;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		//  XOR
			R = 16'hAAA4; 
			S = 16'hEEEE;
			Alu_op = 4'hA;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// 1's complement of S
			R = 16'hAAA5; 
			S = 16'h01CD;
			Alu_op = 4'hB;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// 2's complement of S
			R = 16'hAAA6; 
			S = 16'hAABB;
			Alu_op = 4'hC;	
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
						  
	end


endmodule
