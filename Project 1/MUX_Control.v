module MUX_Control
(
	select_i,
	ALUOp_i,
	ALUOp_o,
	ALUSrc_i,
	ALUSrc_o,
	Branch_i,
	Branch_o,
	MemRead_i,
	MemRead_o,
	MemWrite_i,
	MemWrite_o,
	RegWrite_i,
	RegWrite_o,
	MemtoReg_i,
	MemtoReg_o
);

input          select_i;
input  [1 : 0] ALUOp_i;
output [1 : 0] ALUOp_o;
input          ALUSrc_i;
output         ALUSrc_o;
input          Branch_i;
output         Branch_o;
input          MemRead_i;
output         MemRead_o;
input          MemWrite_i;
output         MemWrite_o;
input          RegWrite_i;
output         RegWrite_o;
input          MemtoReg_i;
output         MemtoReg_o;

assign ALUOp_o = (select_i == 1'b0)? ALUOp_i : 2'b00;
assign ALUSrc_o = (select_i == 1'b0)? ALUSrc_i : 1'b0;
assign Branch_o = (select_i == 1'b0)? Branch_i : 1'b0;
assign MemRead_o = (select_i == 1'b0)? MemRead_i : 1'b0;
assign MemWrite_o = (select_i == 1'b0)? MemWrite_i : 1'b0;
assign RegWrite_o = (select_i == 1'b0)? RegWrite_i : 1'b0;
assign MemtoReg_o = (select_i == 1'b0)? MemtoReg_i : 1'b0;

endmodule
