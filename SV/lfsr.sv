module lfsr(seed, clk, reset, shift_seed);
input logic [7:0]seed;
logic clk;
input logic reset;
output logic [7:0]shift_seed;

typedef enum 	logic [9:0] {S0, S1} statetype;
   statetype state, nextstate;
   
   always_ff @(posedge clk, posedge reset)begin
     if (reset)  shift_seed <= seed;
     else       shift_seed <= {shift_seed[6:0],shift_seed[8]~^shift_seed[6]~^shift_seed[5]~^shift_seed[4]};
   end
   

/*
input  logic             clk, reset,
  input  logic [WIDTH-1:0] d, 
  output logic [WIDTH-1:0] q);

*/
//perhaps 8 or 16 bits

//your implementation of the LFSR.  Remember that this 
//implementation has memory so it should be done 
//with some form of a flip-flop based register

endmodule

module lfsr64 (seed, clk, reset, shift_seed);
//inputs and outputs for the full seed size (64 bits)

//either build a 64 bit version using your smaller implementation above
//or use the same methods from the xilinx document to build a full
//64 bit version

endmodule