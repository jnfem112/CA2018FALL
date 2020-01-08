module Control
(
	Op_i,
	ALUOp_o,
	ALUSrc_o,
	RegWrite_o
);

input  [6 : 0] Op_i;
output [1 : 0] ALUOp_o;
output         ALUSrc_o;
output         RegWrite_o;

assign ALUOp_o = (Op_i == 7'b0110011)? 2'b01 : 2'b10;
assign ALUSrc_o = (Op_i == 7'b0110011)? 1'b0 : 1'b1;
assign RegWrite_o = 1'b1;

endmodule
