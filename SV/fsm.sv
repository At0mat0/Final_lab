module fsm(clk, reset, a, active);
input logic clk;
input logic reset;
input logic [1:0]a;
output logic [1:0]active;
typedef enum 	logic [1:0] {S0,S1,S2} statetype;
   statetype state, nextstate;

   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S0;
     else       state <= nextstate;
  always_comb
     case (state)
       S0: begin
           if(a==2'b10)begin
          nextstate<=S2;
        end

        if(a==2'b01)begin
        nextstate<=S1;
        end 
     
        else begin
        active<=2'b00;
        nextstate<=S0;
        end
    end
        S1:begin
            active<=2'b01;
            nextstate<=S0;
        end
      S2:begin

        active<=2'b10;
          nextstate<=S0;
      end
     endcase


endmodule