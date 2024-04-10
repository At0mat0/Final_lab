/*module rca (Grid,active,Grid_Evolved);
input logic [63:0]Grid
input logic active;
output logic [63:0]Grid_Evolved;

input logic [63:0]comb;

i
  Grid=64'h0412_6424_0034_3C28;

 fsm dut(Grid,Grid_Evolved);
typedef enum 	logic [63:0] {S0,S1,S2} statetype;
   statetype state, nextstate;

   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
  always_comb
     case (state)
       S0: begin
        state<=S0;
mux2 dut(Grid,Grid_Evolved,active,comb);
  if(active){
        nextstate<=S1;
  }
  else if(!active){
        nextstate<=S2;
  }
  else{
      nextstate<=S0;
}
    end

S1:begin
    datapath dut1(comb,Grid_Evolved);
end
S2:begin
flop dut(clk,comb,Grid)
end

endmodule
*/
module data(Grid, clk, reset, a, Grid_Evolved);
input logic [63:0]Grid;
input logic clk;
input logic reset;
input logic a;
output logic [63:0]Grid_Evolved;


mux2 dut(Grid,Grid_Evolved,active,comb);
datapath dut1(comb, comb_evol);
flop dut2(clk, comb_evol, Grid_Evolved);
fsm dut3(clk,reset, a ,active);




endmodule