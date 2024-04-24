module lfsr(seed, clk, reset, shift_seed);
input logic [7:0]seed;
input logic clk;
input logic reset;
output logic [7:0]shift_seed;

typedef enum 	logic [7:0] {S0, S1} statetype;
   statetype state, nextstate;
   
   always_ff @(posedge clk, posedge reset)begin
     if (reset)  shift_seed <= seed;
     else       shift_seed <= {shift_seed[6:0],shift_seed[7]~^shift_seed[5]~^shift_seed[4]~^shift_seed[3]};
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
input logic [63:0]seed;
input logic clk;
input logic reset;
output logic [63:0]shift_seed;

typedef enum 	logic [63:0] {S0, S1} statetype;
   statetype state, nextstate;
   
   always_ff @(posedge clk, posedge reset)begin
     if (reset)  shift_seed <= seed;
     
     else
     
        shift_seed <= {shift_seed[62:0],shift_seed[63]~^shift_seed[62]~^shift_seed[60]~^shift_seed[59]};
   end
   

endmodule