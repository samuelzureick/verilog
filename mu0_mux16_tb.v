// MU0 16 bit, 2 to 1 MUX testbench
// P W Nutter (based on a design by Jeff Pepper)
// Date 2/9/2020
// 

// Do not touch the following line it is required for simulation 
`timescale 1ns/100ps 

// module header

module mu0_mux16_tb();

// Internal connections
reg  [15:0] A;
reg  [15:0] B;
reg         S;
wire [15:0] Q;



// Instantiate mu0_mux16 as dut (device under test)
// Uses explicit dot pins - safer than position substitution
mu0_mux16 dut(A, B, S, Q);


// Test vectors
initial
 begin
 // test connections
 #100 A=0; B=0; S=0;

 // test A mux 
 #100 A=1; B=5; S=0;
 
 // test B mux
 #100 A=1; B=5; S=1;

 #100 $finish;   // end the simulation
end
 
// Save results as VCD file 
// Do not change
initial
 begin
  $dumpfile("mu0_mux16_tb_results.vcd");  // Save simulation waveforms in this file
  $dumpvars; // Capture all simulation waveforms
 end

endmodule 
