module Lsf(input logic a,input logic [7:0]Grid, output logic [7:0]Grid_Shifted);


//8,6,5,4

//Grid_Shifted[0]=Grid[8]^Grid[6]^Grid[5]^Grid[4];

assign Grid_Shifted = {Grid[6:0],Grid[8]~^Grid[6]~^Grid[5]~^Grid[4]};



 endmodule   