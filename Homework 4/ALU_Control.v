module ALU_Control
(
	inst_i,
	ALUOp_i,
	ALUCtrl_o
);

input  [31 : 0] inst_i;
input  [1 : 0]  ALUOp_i;
output [2 : 0]  ALUCtrl_o;

reg [2 : 0] ALUCtrl_reg;

assign ALUCtrl_o = ALUCtrl_reg;

always @(inst_i or ALUOp_i)
begin
	if (ALUOp_i == 2'b10)
	begin
		ALUCtrl_reg = 3'b001;
	end
	else if (inst_i[14 : 12] == 3'b000)
	begin
		if (inst_i[31 : 25] == 7'b0000000)
		begin
			ALUCtrl_reg = 3'b001;
		end
		else if (inst_i[31 : 25] == 7'b0100000)
		begin
			ALUCtrl_reg = 3'b010;
		end
		else if (inst_i[31 : 25] == 7'b0000001)
		begin
			ALUCtrl_reg = 3'b011;
		end
	end
	else if (inst_i[14 : 12] == 3'b111)
	begin
		ALUCtrl_reg = 3'b100;
	end
	else if (inst_i[14 : 12] == 3'b110)
	begin
		ALUCtrl_reg = 3'b101;
	end
end

endmodule
