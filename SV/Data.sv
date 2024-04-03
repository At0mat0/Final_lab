module rca (Grid,active,Grid_Evolved);
input logic [63:0]Grid
input logic active;
output logic [63:0]Grid_Evolved;

input logic Regi;

  Grid=64'h0412_6424_0034_3C28;

 fsm dut(Grid,Grid_Evolved);
typedef enum 	logic [63:0] {S0,S1} statetype;
   statetype state, nextstate;

   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
  always_comb
     case (state)
       S0: begin
        state<=S0;
    if(active)
    nextstate<=S1;
    end

S1:begin
mux2 dut(Grid,Regi,active);
if(active){
    datapath dut1(Regi,Grid_Evolved);
}
else
    datapath dut2(Grid,Grid_Evolved);
    active=b'0;
    next_state<=S0;

end

endmodule
