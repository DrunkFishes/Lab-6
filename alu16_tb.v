`timescale 1ns / 1ps
 /***************************************************************************
 * Author:   Steven Phan
 * Email:    1anh21@gmail.com
 * Filename: alu16_tb.v
 * Date:     November 5, 2017
 * Version:  1.3
 * Purpose:  Test bench for alu16.v module. Sets values for R and S and then
 *           calls an ALU operator. Wait 1 nanosecond to display value. Tests
 *           all 13 operators of the ALU.
 *					
 * Notes:    		
 **************************************************************************/
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
        // R=AAAA   S=0001  Y=0001  N=0 Z=0 C=0
	
			R = 16'hAAAA; 
			S = 16'h0001;
			Alu_op = 4'h0;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Pass R
        // R=AAAA   S=1004  Y=AAAA  N=1 Z=0 C=0

			R = 16'hAAAA; 
			S = 16'h1004;
			Alu_op = 4'h1;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Increament S	
        // R=FFFE   S=1234  Y=1235  N=0 Z=0 C=0

			R = 16'hFFFE; 
			S = 16'h1234;
			Alu_op = 4'h2;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Decrement S	
        // R=FFFF   S=1421  Y=1420  N=0 Z=0 C=0

			R = 16'hFFFF; 
			S = 16'h1421;
			Alu_op = 4'h3;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Add R and S
        // R=BBBB   S=AAAA  Y=6665  N=0 Z=0 C=1

			R = 16'hBBBB; 
			S = 16'hAAAA;
			Alu_op = 4'h4;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Subtract R and S
        // R=FFFF   S=3333  Y=CCCC  N=1 Z=0 C=0

			R = 16'hFFFF; 
			S = 16'h3333;
			Alu_op = 4'h5;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Right Shift S	
        // R=0000   S=1011  Y=0808  N=0 Z=0 C=1

			R = 16'h0000; 
			S = 16'h1011;
			Alu_op = 4'h6;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// Lift Shift S	
        // R=AAC5   S=AAAA  Y=5554  N=0 Z=0 C=0

			R = 16'hAAC5; 
			S = 16'hAAAA;
			Alu_op = 4'h7;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// AND
        // R=1001   S=1001  Y=1001  N=0 Z=0 C=0

			R = 16'h1001; 
			S = 16'h1001;
			Alu_op = 4'h8;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// OR	
        // R=ABC3   S=1011  Y=BBD3  N=1 Z=0 C=0

			R = 16'hABC3; 
			S = 16'h1011;
			Alu_op = 4'h9;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		//  XOR
        // R=AAA4   S=EEEE  Y=444A  N=0 Z=0 C=0
        
			R = 16'hAAA4; 
			S = 16'hEEEE;
			Alu_op = 4'hA;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// 1's complement of S
        // R=AAA5   S=01CD  Y=FE32  N=1 Z=0 C=0
        
			R = 16'hAAA5; 
			S = 16'h01CD;
			Alu_op = 4'hB;
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
		// 2's complement of S
        // R=AAA6   S=AABB  Y=5545  N=0 Z=0 C=1
        
			R = 16'hAAA6; 
			S = 16'hAABB;
			Alu_op = 4'hC;	
			#1 $display ("Alu_op=%b || R=%h ||S_=%h || Y=%h || N=%b || Z=%b || C=%b",
						  Alu_op, R, S, Y, N, Z, C);
						  
	end


endmodule
