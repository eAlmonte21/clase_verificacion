
module flipflopD (
// clock
input bit clock, 
input bit reset,
// Data to store
input logic    d_in,
// Stored data
output logic   d_out
);

`include "macro_ffD.def"
`include "macro_ST.def"

`MACRO_FFD(clock, "negedge", reset, d_in, d_out);
`ST_macro("Info");
endmodule