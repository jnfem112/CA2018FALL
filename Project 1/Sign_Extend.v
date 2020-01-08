module Sign_Extend
(
	inst_i,
	imm_o
);

input  [31 : 0] inst_i;
output [31 : 0] imm_o;

reg [11 : 0] imm_reg;

assign imm_o = {{20{imm_reg[11]}} , imm_reg[11 : 0]};

always @(inst_i)
begin
	if (inst_i[6 : 0] == 7'b0010011 || inst_i[6 : 0] == 7'b0000011)
	begin
		imm_reg[11 : 0] = inst_i[31 : 20];
	end
	else if (inst_i[6 : 0] == 7'b0100011)
	begin
		imm_reg[4 : 0] = inst_i[11 : 7];
		imm_reg[11 : 5] = inst_i[31 : 25];
	end
	else if (inst_i[6 : 0] == 7'b1100011)
	begin
		imm_reg[3 : 0] = inst_i[11 : 8];
		imm_reg[9 : 4] = inst_i[30 : 25];
		imm_reg[10] = inst_i[7];
		imm_reg[11] = inst_i[31];
	end
end

endmodule
