module Sign_Extend
(
	inst_i,
	imm_o
);

input  [31 : 0] inst_i;
output [31 : 0] imm_o;

assign imm_o[11 : 0] = inst_i[31 : 20];
assign imm_o[31 : 12] = (inst_i[31] == 1'b0)? {20{1'b0}} : {20{1'b1}};

endmodule
