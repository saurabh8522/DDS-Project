/*
Title of the mini project: 0-99 COUNTER
Reg. No.: 16CO152, 16CO246
Abstract - 
	This project aims to simulate the working of display of a 0-99 Counter.
	The counter starts counting from 0 and counts till 99 then again it resets to 0.
Functionalities: 
	1. Simulates working of Synchronous BCD Up Counter
	2. Covers the concept of Combinational and Sequential Circuits
	3. Intend to learn working of 0-99 Counter
Brief description on code:
	This is Test Bench for 0-99 Counter. This code contains one module Verilog_152_246.
	We use this test bench file for checking both Dataflow and Behavioral Modelling files of 
	our project. 
	To compile Dataflow/Behavioral, change module names in line 29. 
	i.e. for Dataflow, VerilogDM-152-246 and for Behavioral, VerilogBM-152-246
	Also change name of dumpfile accordingly. i.e. for Dataflow, VerilogDM-152-246.vcd
	and for Behavioral, VerilogBM-152-246.vcd in line 41.
*/

/*
Main module for test bench file 
This module is used for testing of our 0-99 Counter's main file
this is same for both Dataflow and Behavioral Modelling
*/
module Verilog_152_246;
	reg clk; // input for clock pulse
	reg reset; // input for reset signal
	wire [3:0] counter1; // output of decade counter1
	wire [3:0] counter2; // output of decade counter2
	wire [0:6] decoder1; // output of 7 segment decoder1
	wire [0:6] decoder2; // output of 7 segment decoder2
	wire [3:0] out1; // display of output of 7 segment decoder1
	wire [3:0] out2; // display of output of 7 segment decoder2
	//taking instance of main module for checking the output
	VerilogBM_152_246 v1(clk, reset, counter1, counter2, decoder1, decoder2, out1, out2);
	// initializing clock and reset signal
	initial begin
		clk = 1'b1; //initialize clk to 1
		reset = 1'b1; // initialize reset to 1
	end
	// triggering the clock after every 10 unit time
	always begin
		#10 clk = ~clk;
	end
	// creating dumpfile and showing the output
	initial begin
		$dumpfile("VerilogBM-152-246.vcd"); // for creating dumpfile i.e., .vcd file
		$dumpvars(0, Verilog_152_246); // passing the dump variables as Verilog_152_246
		$display("clk counter2 counter1 decoder2 decoder1 display"); // labelling of output
		#5 reset = 1'b0; // set reset signal to 0 after clearing the states of all FF's
		// showing the output whenever clock signal changes
		$monitor(" %b    %4b     %4b   %7b  %7b   %d%d", clk, counter2, counter1, decoder2, decoder1, out2, out1);
		#2010 $finish; // finish the simulation after efficient time
	end
endmodule