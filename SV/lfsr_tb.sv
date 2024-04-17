// testbench to prove maximal LFSR
module tb ();

     logic 	 clk;
   logic reset;
   logic [7:0]lf;
   assign lf= 8'b00110010;
   logic [7:0]lf_out;
   //logic variables to route input and output to DUT
   


   integer 	 handle3;
   integer 	 desc3;
   integer 	 i;  
   integer       j;

    initial
     begin
	handle3 = $fopen("lsf.out");
	desc3 = handle3;
     end
//module lfsr(seed, clk, reset, shift_seed);

   // instantiate device under test (small LFSR)
  lfsr dut(lf,clk,reset,lf_out);

   //set up a clock signal
   always     
     begin
	clk = 1; #1; clk = 0; #1;
     end
   
   initial
     begin
	//set up output file
        $fdisplay(desc3, "  ");
	//set up any book keeping variables you may want to use
   $fdisplay(desc3, " %b\n " ,lf_out[7:0]);
	//set up a starting seed.  What happens with all 0s?
	//reset your DUT
	//save the initial output of your DUT to compare with current output
	//and see whenb you repeat
     end

   always @(posedge clk)
     begin
		//output your results to a file
     end

   // check results on falling edge of clk
   always @(negedge clk) begin
		if(~reset) begin
		//check if your output equals the initial output 
		//if so, report how many iterations it took to repeat
		//this should be (2^n) - 1
		//if the output never repeats for 2^n iterations, report that
		end
	end
   
endmodule // tb

