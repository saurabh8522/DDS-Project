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
	This is Verilog Dataflow Modelling code. This whole code contains one main module
	(VerilogDM_152_246)(that's for 0-99 Counter) and 3 other modules.
	Other modules are:
	1. jk_flip_flop: this module is for JK Flip Flop
	2. seven_segment_decoder: this module is for a 7 Segment Decoder
	3. display: this module is for 7 Segment Display
*/

/*
Main module of 0-99 COUNTER
Dataflow Level Modelling
this module uses all other modules 
*/
module VerilogDM_152_246(clk, reset, counter1, counter2, decoder1, decoder2, out1, out2);
	input clk;  //input for clock pulse
	input reset; // input for reset signal
	output [3:0] counter1; // output of counter1
	output [3:0] counter2; // output of counter2
	output [0:6] decoder1; // output of 7 segment decoder1
	output [0:6] decoder2; // output of 7 segment decoder2
	output [3:0] out1; // display of output of 7 segment decoder1
	output [3:0] out2; // display of output of 7 segment decoder2
	//declaring wires for internal use
	wire [17:0] w; // wires
	wire clk1; // clock signal for counter2
	// assigning values of wires for internal use
	assign
		w[4] = counter1[0] & (~counter1[3]), // input of flipflop1 of counter1
		w[5] = counter1[0] & counter1[1], // input of flipflop2 of counter1
		w[6] = w[5] & counter1[2], // to get value wire w[8]
		w[7] = counter1[0] & counter1[3], //to get value wire w[8]
		w[8] = w[7] | w[6]; // input of flipflop3 of counter1
	// taking instances of other modules
	jk_flip_flop jk0(1'b1, 1'b1, clk, reset, counter1[0], w[0]); // flipflop0 of counter1
	jk_flip_flop jk1(w[4], w[4], clk, reset, counter1[1], w[1]); // flipflop1 of counter1
	jk_flip_flop jk2(w[5], w[5], clk, reset, counter1[2], w[2]); // flipflop2 of counter1
	jk_flip_flop jk3(w[8], w[8], clk, reset, counter1[3], w[3]); // flipflop3 of counter1
	seven_segment_decoder s1(counter1, decoder1); // 7 segment decoder for counter1
	display d1(decoder1, out1); // display of 7 segment decoder of counter1
	// clock pulse for counter2 is given as q_bar of flipflop3 of counter1
	assign
		clk1 = w[3]; // assigning clk1 as q_bar of flipflop3 of counter1
	// assigning values of wires for internal use
	assign
		w[9] = counter2[0] & (~counter2[3]), // input of flipflop1 of counter2
		w[10] = counter2[0] & counter2[1], // input of flipflop2 of counter2
		w[11] = w[10] & counter2[2], // to get value wire w[8]
		w[12] = counter2[0] & counter2[3], // to get value wire w[8]
		w[13] = w[11] | w[12]; // input of flipflop3 of counter2
	// taking instances of other modules
	jk_flip_flop jk4(1'b1, 1'b1,  clk1, reset, counter2[0], w[14]); // flipflop0 of counter2
	jk_flip_flop jk5(w[9], w[9], clk1, reset, counter2[1], w[15]); // flipflop1 of counter2
	jk_flip_flop jk6(w[10], w[10], clk1, reset, counter2[2], w[16]); // flipflop2 of counter2
	jk_flip_flop jk7(w[13], w[13],  clk1, reset, counter2[3], w[17]); // flipflop3 of counter2
	seven_segment_decoder s2(counter2, decoder2); // 7 segment decoder for counter2
	display d2(decoder2, out2); // display of 7 segment decoder of counter2
endmodule

/*
Module for JK Flip Flop with reset 
This is Behavioral Modelling of positive edge triggered JK Flip Flop 
*/
module jk_flip_flop(j, k, clk, reset, q, q_bar);
	input j; // J input of JK FF
	input k; // K input of JK FF
	input clk; // Clock pulse
	input reset; // input for resetting the state of flipflop
	output reg q; //output of flipflop
	output reg q_bar; // complement of q output
	//when reset = 1, reset the flipflop i.e. q = 0 and q_bar = 1
	always @(posedge reset)
	begin
		q = 1'b0; 
		q_bar = 1'b1;
	end
	// whenever positive edge comes, change the state of flipflop accordingly
	always @(posedge clk)
	begin
		if(j==0 & k==0 & reset==0) // when both J, K are zero i.e., J=K=0, memory state
		begin
			q <= q;
			q_bar <= q_bar;
		end
		else if(j==0 & k==1 & reset==0) //when J=0 and K=1, Reset the flipflop i.e. Q = 0
		begin
			q <= 1'b0; // q = 0
			q_bar <= 1'b1; // q' = 1
		end
		else if(j==1 & k==0 & reset==0) //when J=1 and K=0, Set the flipflop i.e. Q = 1
		begin 
			q <= 1'b1; // q = 1
			q_bar <= 1'b0; // q' = 0
		end
		else if(j==1 & k==1 & reset==0) //when J=K=1, toggle the flipflop
		begin
			q <= ~q; // toggle q
			q_bar <= ~q_bar; // toggle q'
		end
	end
endmodule

/*
Module for 7 Segment Decoder
Dataflow Level Modelling
This takes input in BCD form and gives output as 7 segment
*/
module seven_segment_decoder(i, out);
	input [3:0] i; // 4 bit input 
	output [0:6] out; // 7 bit output
	wire [9:1] w; //wires for internal use
	//assigning the values of wires and output
	assign
		w[1] = i[2] & i[0],
		w[2] = (~i[2]) & (~i[0]),
		w[3] = i[1] & i[0],
		w[4] = (~i[1]) & (~i[0]),
		w[5] = i[1] & (~i[0]),
		w[6] = (~i[2]) & i[1],
		w[8] = i[2] & (~i[1]),
		w[7] = i[0] & w[8],
		w[9] = i[2] & (~i[0]),
		out[0] = w[1] | w[2] | i[3] | i[1], // output a(upper bit of 7 segment display)
		out[1] = w[3] | w[4] | (~i[2]), // output b(right upper bit of 7 segment display)
		out[2] = i[2] | (~i[1]) | i[0], // output c(right down bit of 7 segment display)
		out[3] = w[2] | w[5] | w[6] | w[7] | i[3], // output d(down bit of 7 segment display)
		out[4] = w[2] | w[5], // output e(left down bit of 7 segment display)
		out[5] = w[4] | w[8] | w[9] | i[3], //output f(left upper bit of 7 segment display)
		out[6] = w[5] | w[8] | w[6] | i[3]; // output g(middle bit of 7 segment display)
endmodule

/*
Module for 7 Segment Display
Dataflow Level Modelling
This takes input as 7 segment and displays the output in Decimal
*/
module display(i, out);
	input [0:6] i; // 7 segment input
	output [3:0] out; // output
	// trinary operator assigns the value of out according to value of in
	// if the condition is true then first value(before ':' sign) assigned else second value
	//(after ':' sign)
	assign out = (i==7'b1111110)? 0: // output as 0
				 (i==7'b0110000)? 1: // output as 1
				 (i==7'b1101101)? 2: // output as 2
				 (i==7'b1111001)? 3: // output as 3
				 (i==7'b0110011)? 4: // output as 4
				 (i==7'b1011011)? 5: // output as 5
				 (i==7'b1011111)? 6: // output as 6
				 (i==7'b1110000)? 7: // output as 7
				 (i==7'b1111111)? 8: // output as 8
				 (i==7'b1111011)? 9: // output as 9
				 4'b1111; // output for invalid input
endmodule