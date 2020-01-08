module Instruction_Memory
(
	addr_i, 
	inst_o
);

// Interface.
input  [31 : 0] addr_i;
output [31 : 0] inst_o;

// Instruction memory.
reg [31 : 0] memory [0 : 255];

assign inst_o = memory[addr_i >> 2];  

endmodule
