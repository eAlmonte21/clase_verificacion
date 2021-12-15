interface fifo_if(
    input clk   [1:0];
    input reset [1:0];
);

import fifo_pkg::*;

    ///write 
    logic      push;
    logic          full;
    logic      data_in;

    ///read
    logic         pop;
    logic         empty;
    logic     data_out;

modport fifo(
    input        push,
    output       full,
    input     data_in,
    input         pop,
    output      empty,
    output   data_out,
    input clk     [0], //clk_write
    input clk     [1], //clk_read
    input reset   [0], //reset_write
    input reset   [1]  //reset_read
);

modport dvr (
    output      push,
    input       full,
    output   data_in,
    output       pop,
    input      empty,
    input    data_out,
    output clk     [0], //clk_write
    output clk     [1], //clk_read
    output reset   [0], //reset_write
    output reset   [1]  //reset_read
);

endinterface