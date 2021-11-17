`timescale 1ns/1ps;

module tb_ffD(d, clock, data_out, reset);

parameter WORD_LENGTH = 4;

input logic [WORD_LENGTH-1:0] d;
input logic clock, reset;
output logic [WORD_LENGTH-1:0] data_out;

macro_ffD #(WORD_LENGTH) DUT (.d(d), .clock(clock), .data_out(data_out), .reset(reset));

initial begin 
	
	clock = 0;		
	forever #10 clock = ~clock;
	
end



initial begin 
 reset=0;
 d = 4'b0101;
 if(reset)
	data_out = 0;
 else
	data_out <= d;
 #100
 reset = 0;
 d = 4'b0001;
 if(reset)
	data_out = 0;
 else
	data_out <= d;
 #100
 reset = 1;
 d = 4'b0011;
 if(!reset)
	data_out = 0;
 else
	data_out <= d;
 #100
 reset = 0;
 d = 4'b0001;
 if(!reset)
	data_out = 0;
 else
	data_out <= d;
end

endmodule 		
		