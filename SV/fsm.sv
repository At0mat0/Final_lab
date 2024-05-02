module fsm(clk, reset, a, active);
input logic clk;
input logic reset;
input logic [1:0]a;
output logic [1:0]active;
typedef enum 	logic [1:0] {S0,S1,S2,S3} statetype;
   statetype state, nextstate;

   always_ff @(posedge clk, posedge reset)
     if (reset) state <= S3;
    else       state <= nextstate;
  always_comb
     case (state)
       S0: begin
           if(a==2'b01)begin
          nextstate<=S2;
        end

        else if(a==2'b11)begin
        nextstate<=S1;
        end 
     
        else if(a==2'b00)begin
          //grid
        active<=2'b00;
        nextstate<=S0;
        end
        else
            nextstate<=S0;
    end
        S1:begin
          //lfsr
            active<=2'b11;
             if(a==2'b11)begin
        nextstate<=S1;
          end 
          else
            nextstate<=S0;
        end
      S2:begin
        //gird Evolved
        active<=2'b01;
            if(a==2'b01)begin
          nextstate<=S2;
        end
        else
          nextstate<=S0;
      end
      S3:begin
           active<=2'b00;
        nextstate<=S0;
      end
  
     endcase
endmodule