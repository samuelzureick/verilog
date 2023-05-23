// MU0 12 bit register testbench
// P W Nutter (based on a design by Jeff Pepper)
// Date 2/9/2020
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps 

// module header

module mu0_reg12_tb();

// Internal connections
reg 	 	Clk;
reg 	 	Reset;
reg 		En;
reg  [11:0] D;
wire [11:0] Q;



// Instantiate mu0_reg12 as dut (device under test)
// Uses explicit dot pins - safer than position substitution

mu0_reg12 dut(Clk, Reset, En, D, Q);


// Set up the clock
initial Clk = 0;

always
	begin
		#50
		Clk = ~Clk;
	end


// Test vectors
initial
begin
	// test initial connections 
	// test connections
	#100 Clk = 0; Reset = 0; En = 0; D = 0;

	// test enable
	#100 Clk = 0; Reset = 0; En = 1; D = 1;

	// test data update
	#100 Clk = 0; Reset = 0; En = 1; D = 2;

	// test reset
	#100 Clk = 0; Reset = 1; En = 1; D = 5;



  #100 $finish;      // end the simulation
end
 
// Save results as VCD file 
// Do not change
initial
 begin
  $dumpfile("mu0_reg12_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule 
