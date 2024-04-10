module fsm(clk, reset, a, active);
input logic clk;
input logic reset;
input logic a;
output logic active;
typedef enum 	logic [1:0] {S0,S1} statetype;
   statetype state, nextstate;

   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
  always_comb
     case (state)
       S0: begin
        if(a)begin
        nextstate<=S1;

        end 
        else begin
        active<='b0;
        nextstate<=S0;
        end
    end
        S1:begin
            active<='b1;
            nextstate<=S0;
        end
     endcase


endmodule