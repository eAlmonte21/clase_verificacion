
module macro_ffD(d, clock, data_out, reset);

	parameter WORD_LENGTH = 4;

	input logic [WORD_LENGTH-1:0] d;
	input logic clock, reset;
	output logic [WORD_LENGTH-1:0] data_out;

`ifdef positive_reset
	always @(posedge clock or posedge reset)
	begin
	if(reset)
		data_out = 0;
	else		
		data_out <= d;
	end	
		
		
`else
	always @(posedge clock or negedge reset)
		begin 
		if(!reset)
			data_out = 0;
		else		
			data_out <= d;
		end


`endif

endmodule 
