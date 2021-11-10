`timescale 10ps/1ps //`timescale <reference_time_unit>/<time_precision>
// Testbench del multiplexor 2x16
module TB_mux2to1();
// Inputs
    parameter DW = 4;
    reg[DW-1:0] I0, I1;
    //reg[3:0] b;
    reg Sel;
    integer s_gold, Num_errors;
    integer i, j, k; // i, j, k representan los operandos
// OutputS
    wire [DW-1:0] Data_out;
// Instanciacion del DUT

    mux2to1 UUT (.I0(I0),.I1(I1),.Sel(Sel),.Data_out(Data_out));

// Inicialización de las entradas
    `ifdef auto_init
        initial begin
            i = 0; j = 0;k = 0;
	    Sel=i; I0=j; I1=k;
	    #1;
        end
    `endif
initial #1000 $finish;
initial Num_errors = 0;

initial begin
for (i = 0; i < 2; i = i + 1) begin
for (j = 0; j < 2**DW; j = j + 1)begin
for (k = 0; k < 2**DW; k = k + 1)begin

	Sel=i; I0=j; I1=k;
	case (i)
	  0: begin
		s_gold <= k;
	     end
	  1: begin
		s_gold <= j;
             end
	endcase

	#1 

	if (Data_out ^ s_gold) begin  // Observe el tiempo de espera
	Num_errors = Num_errors + 1;
	$display ("Error: select = %b", i);
	$display ("Error: I0 = %d   I1 = %d  sel = %b", j, k, i);
	$display ("Error: Valor Esperado = %h  Valor obtenido = %h", s_gold, Data_out);
	end
end
end
end
	$display ("Num_errors = %d", Num_errors);
end	  // end el initial begin
endmodule

