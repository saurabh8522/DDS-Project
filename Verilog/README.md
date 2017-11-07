# 0-99 COUNTER
This folder contains Verilog HDL codes for 0-99 Counter

## How to run Verilog programs
### Installing 
- Download and install the latest version of Verilog. Link is [here](https://sourceforge.net/projects/iverilog/files/latest/download).
- Download and install the latest version of GTKWave. Link is [here](https://sourceforge.net/projects/gtkwave/files/latest/download).
- After finishing installing, set the environment variables for both iverilog and gtkwave.

### Running the files

### To test Behavioral Level Modelling 
  1. Open Verilog-152-246.v file and change module instance as VerilogBM_152_246 v1(...) in line 36 and also dumpfile name as`VerilogBM-152-246.vcd` in line 48.
	2. Open cmd/terminal in the folder containing both VerilogBM-152-246.v and Verilog-152-246.v
	3. Now type the following command in terminal/cmd:  
	 `iverilog -o a VerilogBM-152-246.v Verilog-152-246.v`
	4. After successful compilation, run `vvp a` command.
	5. This will show the output and create VerilogBM-152-246.vcd file.
	6. To run .vcd file type the following command:  
		`gtkwave VerilogBM-152-246.vcd`  
	   This will open .vcd file. Check the waveforms. 
### To test Dataflow Level Modelling
- Follow all the steps as in Behavioral Modelling replacing `VerilogBM` with `VerilogDM` everywhere.
