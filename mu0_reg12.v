// MU0 12 bit register design - behavioural style
// P W Nutter (based on a design by Jeff Pepper)
// Date 2/9/2020
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps

// for simulation purposes, do not delete
`default_nettype none

// module header

module mu0_reg12(input  wire        Clk, 
	             input  wire        Reset,     
			     input  wire        En, 
			     input  wire [11:0] D, 
			     output reg  [11:0] Q);

// behavioural code - clock driven
always @ (*)
	begin
		if (Reset == 1) Q = 0;
	end

always @ (posedge Clk)
	begin
		if (En == 1)
			begin
				if (Reset == 0) Q <= D;
			end
	end


endmodule 

// for simulation purposes, do not delete
`default_nettype wire
