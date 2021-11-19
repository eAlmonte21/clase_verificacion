`timescale 1ns/1ps;

module tb_ffD();

logic d_in;
logic d_out;
bit clock, reset;
logic gold;

flipflopD TEST (.d_in(d_in), .clock(clock), .d_out(d_out), .reset(reset));

always begin
#8 clock = 1'b0;
#8 clock = 1'b1;
end


initial begin 
 reset <= 0;
 d_in = 1'b1;
 clock <= 0;
 gold <= 1'b0;
 
#15 reset <= 1;
#20 d_in <= 1'b1; gold <= d_in;
#15 reset <= 0;
#20 d_in <= 1'b0; gold <= d_in;
#15 reset <= 0;
#20 d_in <= 1'b1; gold <= d_in;
#15 reset <= 1;
#20 d_in <= 1'b1; gold <= d_in;
#15 reset <= 1;
#20 d_in <= 1'b1; gold <= d_in;
#15 reset <= 0;
#20 d_in <= 1'b0; gold <= d_in;
end

endmodule 		
		