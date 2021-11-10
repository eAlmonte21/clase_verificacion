module mux2to1
   #(parameter DW=4)
	
(
	 input logic [DW-1:0] I0,I1,
    input logic Sel,
    output logic [DW-1:0] Data_out
	 
);
	  
	 assign Data_out = Sel ? I0:I1;
	 
endmodule
