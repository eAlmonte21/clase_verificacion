`ifndef MUX_PARAM_SV			
    `define MUX_PARAM_SV		
	 
module mux_param				
#( 								
parameter		  WIDTH	 = 8,
parameter 		  SEL = 2 	
)
(											
output  	[WIDTH-1:0] 			out,		
input  	[SEL-1:0]		sel,			
input  	[WIDTH-1:0]				in[2**SEL] 

);

assign out = in[sel];

endmodule
`endif