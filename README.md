# DDS Project
This is my mini project for Digital Design of Systems

## Title: 0-99 COUNTER
<p align="center">
   <img style="center" src="https://github.com/vichitr/DDS-Project/blob/master/Images/99%20counter.png" width="100" height="100" />
</p>
## TEAM MEMBERS
  1. [Vichitr](https://github.com/vichitr)
  2. [Shashank Kumar](https://github.com/sknitk)
  
 ### OBJECTIVES
 
- This project aims to simulate the working of display of a 0-99 Counter. 
- The counter starts counting from 0 and counts till 99 then again it resets to 0.  
- We have used flip-flops to count upto 9. 
- BCD Up counter is implemented using 4 flip-flops and logic gates and such 2 BCD Up Counters are used. 
- When second up-counter reaches state 9 then it again goes to 0 and first counter increases its state by 1. 
- When first counter also counts upto 9 then resets to 0. 
- The output of these BCD up counters is sent to 7 segment decoders.   
- 7 Segment Decoder is implemented using basic gates.
- This project covers the concepts of Number Systems, Boolean Algebra (K-Maps simplification of Boolean equations), Combinational - Circuits and Sequential Circuits.
- From this mini-project, we intend to learn the working of synchronous counters and their application in daily life digital logic circuits.

### APPLICATIONS
- This circuit can be used in various projects where we require the counting. Like in doctors’ clinic or hospitals, in restaurants, in customer care offices where long queue is there and we want to stop the rush at the counter. This system is very effective where man power is less. In this you have to provide a token to the person and the person has to wait for its turn which can be displayed on the 7-segment display. With the help of this counter circuit we can maintain the silence and the person will also be informed about their turn.
- This circuit can be used in Digital Clock, Timer, Stopwatch.

### COMPONENTS REQUIRED
- J K Flipflops
- Basic Gates(AND, OR, NOT)
- Clock
- 7 Segment Display
- Constant Source

### REFERENCES
- Digital Design, Fourth Edition, M. Morris Mano & Michael D. Ciletti
- [Electronics Tutorials](http://www.electronics-tutorials.ws/counter/bcd-counter-circuit.html)
- [Electronics Hub](http://www.electronicshub.org/decade-counterbcd-counter/)
- [Wikipedia](https://en.wikipedia.org/wiki/Ring_counter)
- [More on Wiki](https://en.wikipedia.org/wiki/Seven-segment_display)
