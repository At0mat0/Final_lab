`timescale 1ns/1ps
module stimulus;

   

   logic 	 clk;
   logic [63:0]Grid;
   logic reset;
   logic a;
   logic [63:0]Grid_Evolved;
   assign Grid = 64'h0412_6424_0034_3C28;
   assign lf= 8'b00110010;
   logic [7:0]lf_out;
    //Grid, clk, reset, a, Grid_Evolved
   
   integer 	 handle3;
   integer 	 desc3;
   integer 	 i;  
   integer       j;
    

   // 1 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #5 clk = ~clk;
     end

    data dut(Grid,clk,reset,a,Grid_Evolved);
//Grid, clk, reset, a, Grid_Evolved

   initial
     begin
	handle3 = $fopen("Game.out");
	desc3 = handle3;
     end


/*
	 Grid_Evolved[0:7];
       Grid_Evolved[8:15];
       Grid_Evolved[16:23];
       Grid_Evolved[24:31];
       Grid_Evolved[32:39];
       Grid_Evolved[40:47];
       Grid_Evolved[48:55];
  
       Grid_Evolved[56:63];
       */
         always @(negedge  clk)
       begin

       $fdisplay(desc3, " %b\n %b\n %b\n %b\n %b\n %b\n %b\n %b\n" ,  Grid_Evolved[7:0], Grid_Evolved[15:8],
       Grid_Evolved[23:16],
       Grid_Evolved[31:24],
       Grid_Evolved[39:32],
       Grid_Evolved[47:40],
       Grid_Evolved[55:48],
       Grid_Evolved[63:56]);
	



      
    end


   initial 
     begin   
      		#0   reset = 1'b1;

	#0   a = 1'b0;
   #15   reset = 1'b0;
    #15  a = 1'b1;



     end



endmodule // stimulus